package oeg.shacl.validator;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import org.eclipse.rdf4j.common.exception.ValidationException;
import org.eclipse.rdf4j.common.transaction.IsolationLevels;
import org.eclipse.rdf4j.model.Model;
import org.eclipse.rdf4j.model.impl.LinkedHashModel;
import org.eclipse.rdf4j.model.vocabulary.RDF4J;
import org.eclipse.rdf4j.model.vocabulary.SHACL;
import org.eclipse.rdf4j.repository.RepositoryException;
import org.eclipse.rdf4j.repository.sail.SailRepository;
import org.eclipse.rdf4j.repository.sail.SailRepositoryConnection;
import org.eclipse.rdf4j.rio.RDFFormat;
import org.eclipse.rdf4j.rio.Rio;
import org.eclipse.rdf4j.rio.WriterConfig;
import org.eclipse.rdf4j.rio.helpers.BasicWriterSettings;
import org.eclipse.rdf4j.sail.memory.MemoryStore;
import org.eclipse.rdf4j.sail.shacl.ShaclSail;
import org.slf4j.LoggerFactory;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

public class Rdf4jValidator {

	public static void validate(String DATA, String SHAPES, String REPORT) throws IOException {

		Logger root = (Logger) LoggerFactory.getLogger(org.slf4j.Logger.ROOT_LOGGER_NAME);
		root.setLevel(Level.INFO);


		ShaclSail shaclSail = new ShaclSail(new MemoryStore());
		shaclSail.setValidationResultsLimitTotal(-1);
		shaclSail.setValidationResultsLimitPerConstraint(-1);

		SailRepository sailRepository = new SailRepository(shaclSail);
		sailRepository.init();

		try (SailRepositoryConnection connection = sailRepository.getConnection()) {

			connection.begin(IsolationLevels.NONE, ShaclSail.TransactionSettings.ValidationApproach.Disabled);

			try (InputStream input = new BufferedInputStream(new FileInputStream(DATA))) {
				// add the RDF data from the inputstream directly to our database
				long startLoadTime = System.nanoTime();
				connection.add(input, "", RDFFormat.TURTLE);
				long estimatedLoadTime = System.nanoTime() - startLoadTime;
				System.out.println("Data graph size: " + connection.size());
				System.out.println("Load time: " + TimeUnit.NANOSECONDS.toMillis(estimatedLoadTime) / 1000.0);
			}

			connection.commit();

			connection.begin(IsolationLevels.NONE);
			try (InputStream inputShapes = new FileInputStream(SHAPES)) {
				// add the RDF data from the inputstream directly to our database
				connection.add(inputShapes, "", RDFFormat.TURTLE, RDF4J.SHACL_SHAPE_GRAPH);
				Model statementsCollector = new LinkedHashModel(connection.getStatements(null, null, null, RDF4J.SHACL_SHAPE_GRAPH)
						.stream()
						.collect(Collectors.toList()));
				System.out.println("Shapes graph size: " + statementsCollector.size());
			}

			Model validationReportModel = new LinkedHashModel();
			long startTime = System.nanoTime();
			try {
				connection.commit();
			} catch (RepositoryException exception) {
				Throwable cause = exception.getCause();
				if (cause instanceof ValidationException) {
					validationReportModel = ((ValidationException) cause).validationReportAsModel();
				}
				// throw exception;
			}
			long estimatedTime = System.nanoTime() - startTime;

			// TODO: Remove this section when running the actual benchmark
			{
				long count_SPARQL_CONSTRAINT_COMPONENT = validationReportModel.filter(null, null, SHACL.SPARQL_CONSTRAINT_COMPONENT).stream().count();
				long count_VALIDATION_RESULT = validationReportModel.filter(null, null, SHACL.VALIDATION_RESULT).stream().count();
				System.out.println("Validation report SPARQL_CONSTRAINT_COMPONENT: " + count_SPARQL_CONSTRAINT_COMPONENT);
				System.out.println("Validation report VALIDATION_RESULT: " + count_VALIDATION_RESULT);
			}

			WriterConfig writerConfig = new WriterConfig()
					.set(BasicWriterSettings.INLINE_BLANK_NODES, true)
					.set(BasicWriterSettings.XSD_STRING_TO_PLAIN_LITERAL, true)
					.set(BasicWriterSettings.PRETTY_PRINT, true);
			System.out.println("Report graph size: " + validationReportModel.size());

			File reportFile = new File(REPORT);
			try (FileOutputStream out = new FileOutputStream(reportFile)) {
				Rio.write(validationReportModel, out, RDFFormat.TURTLE, writerConfig);
			}

			System.out.println("Validation time: " + TimeUnit.NANOSECONDS.toMillis(estimatedTime) / 1000.0);
		}
	}
}
