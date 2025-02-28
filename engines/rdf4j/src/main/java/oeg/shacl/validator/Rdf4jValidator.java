package oeg.shacl.validator;

import java.io.File;
import java.io.FileInputStream;
import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import org.eclipse.rdf4j.common.exception.ValidationException;
import org.eclipse.rdf4j.model.Model;
import org.eclipse.rdf4j.model.impl.LinkedHashModel;
import org.eclipse.rdf4j.model.vocabulary.RDF4J;
import org.eclipse.rdf4j.repository.RepositoryException;
import org.eclipse.rdf4j.repository.sail.SailRepository;
import org.eclipse.rdf4j.repository.sail.SailRepositoryConnection;
import org.eclipse.rdf4j.rio.RDFFormat;
import org.eclipse.rdf4j.rio.Rio;
import org.eclipse.rdf4j.rio.WriterConfig;
import org.eclipse.rdf4j.rio.helpers.BasicWriterSettings;
import org.eclipse.rdf4j.sail.memory.MemoryStore;
import org.eclipse.rdf4j.sail.shacl.ShaclSail;

public class Rdf4jValidator {

    public static void validate(String DATA, String SHAPES, String REPORT) throws IOException {

        ShaclSail shaclSail = new ShaclSail(new MemoryStore());
        
        SailRepository sailRepository = new SailRepository(shaclSail);
        sailRepository.init();
        
        try (SailRepositoryConnection connection = sailRepository.getConnection()) {

            connection.begin();
            
            try (InputStream input = new BufferedInputStream(new FileInputStream(DATA))) {
            // add the RDF data from the inputstream directly to our database
                long startLoadTime = System.nanoTime();
            	connection.add(input,"", RDFFormat.TURTLE);
        		long estimatedLoadTime = System.nanoTime() - startLoadTime;
            	System.out.println("Data graph size: "+connection.size());
        		System.out.println("Estimated load time: " + TimeUnit.NANOSECONDS.toMillis(estimatedLoadTime)/1000.0 );
            }

            connection.commit();

            connection.begin();
            try (InputStream inputShapes = new FileInputStream(SHAPES)) {
            // add the RDF data from the inputstream directly to our database
            	connection.add(inputShapes,"", RDFFormat.TURTLE, RDF4J.SHACL_SHAPE_GRAPH);
            	Model statementsCollector = new LinkedHashModel(connection.getStatements(null, null, null, RDF4J.SHACL_SHAPE_GRAPH)
            			.stream()
            	        .collect(Collectors.toList()));
            	System.out.println("Shapes graph size: "+statementsCollector.size());
            } 

            long startTime = System.nanoTime();
            try {
                connection.commit();
            } catch (RepositoryException exception) {
                Throwable cause = exception.getCause();
                if (cause instanceof ValidationException) {
                    Model validationReportModel = ((ValidationException) cause).validationReportAsModel();
            
                    long wstartTime = System.nanoTime();
                    WriterConfig writerConfig = new WriterConfig()
                        .set(BasicWriterSettings.INLINE_BLANK_NODES, true)
                        .set(BasicWriterSettings.XSD_STRING_TO_PLAIN_LITERAL, true)
                        .set(BasicWriterSettings.PRETTY_PRINT, true);
                	System.out.println("Report graph size: "+validationReportModel.size());                    
                    
                    File reportFile = new File(REPORT);
                    try (FileOutputStream out = new FileOutputStream(reportFile)) {
                        Rio.write(validationReportModel, out, RDFFormat.TURTLE, writerConfig);
                    }
                    
                    long westimatedTime = System.nanoTime() - wstartTime;
                    System.out.println("Estimated writting time: " + TimeUnit.NANOSECONDS.toMillis(westimatedTime)/1000.0);
                }
                // throw exception;
            }
            long estimatedTime = System.nanoTime() - startTime;
            System.out.println("Estimated validation and writting time: " + TimeUnit.NANOSECONDS.toMillis(estimatedTime)/1000.0);
        }
    }
}
