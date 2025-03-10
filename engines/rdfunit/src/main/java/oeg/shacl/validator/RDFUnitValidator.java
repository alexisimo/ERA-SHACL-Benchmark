package oeg.shacl.validator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.aksw.rdfunit.enums.TestCaseExecutionType;
import org.aksw.rdfunit.model.interfaces.results.TestExecution;
import org.aksw.rdfunit.model.writers.results.TestExecutionWriter;
import org.aksw.rdfunit.validate.wrappers.RDFUnitStaticValidator;
import org.aksw.rdfunit.validate.wrappers.RDFUnitTestSuiteGenerator;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.riot.Lang;
import org.apache.jena.riot.RDFDataMgr;

import org.aksw.rdfunit.io.reader.RdfModelReader;
import org.aksw.rdfunit.io.reader.RdfReader;
import org.aksw.rdfunit.io.reader.RdfReaderException;
import org.aksw.rdfunit.io.reader.RdfReaderFactory;

public class RDFUnitValidator {

    public static void validate(String DATA, String SHAPES, String REPORT) throws IOException {
		try {

        long startLoadTime = System.nanoTime();
		Model dataModel = RdfReaderFactory.createResourceReader(DATA).read();
		long estimatedLoadTime = System.nanoTime() - startLoadTime;

		// Model shapesModel = RDFDataMgr.loadModel(SHAPES, Lang.TTL) ;
		int dataGraphSize = dataModel.getGraph().size() ;
		// int shapesGraphSize = shapesModel.getGraph().size() ;
		System.out.println("Data graph size: " + dataGraphSize);
		System.out.println("Estimated load time: " + TimeUnit.NANOSECONDS.toMillis(estimatedLoadTime)/1000.0 );
		// System.out.println("Shapes graph size: " + shapesGraphSize);
		
		RDFUnitStaticValidator.initWrapper(
				new RDFUnitTestSuiteGenerator.Builder()
				.addSchemaURI("local-shacl", SHAPES)
	            .build()
	    );
        long startTime = System.nanoTime();
		TestExecution validation = RDFUnitStaticValidator.validate(dataModel, TestCaseExecutionType.shaclTestCaseResult);
        long estimatedTime = System.nanoTime() - startTime;
        System.out.println("Estimated validation time: " + TimeUnit.NANOSECONDS.toMillis(estimatedTime)/1000.0);
		
		System.out.println("Individual errors: "+validation.getDatasetOverviewResults().getIndividualErrors());
		
	    Model resultsModel = ModelFactory.createDefaultModel();
	    TestExecutionWriter.create(validation).write(resultsModel);
	    System.out.println("Report graph size: " + resultsModel.size());

		try {
            File file = new File(REPORT);
            FileOutputStream outputStream = new FileOutputStream(file, false);
            RDFDataMgr.write(outputStream, resultsModel, Lang.TTL);
            
            outputStream.flush();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
				} catch (RdfReaderException e){
			e.printStackTrace();
		}

    
	}
}
