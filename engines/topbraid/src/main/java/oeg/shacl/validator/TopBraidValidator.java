package oeg.shacl.validator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.riot.Lang;
import org.apache.jena.riot.RDFDataMgr;
import org.apache.jena.util.FileUtils;
import org.topbraid.jenax.util.JenaUtil;
import org.topbraid.shacl.validation.ValidationUtil;

public class TopBraidValidator {

    public static void validate(String DATA, String SHAPES, String REPORT) throws IOException {

    //   String SHAPES = "test_shacl.ttl";
    //   String DATA = "test_data.ttl";
    //   String REPORT = "report.ttl";

		// Load the main data model
        long startLoadTime = System.nanoTime();
		Model dataModel = JenaUtil.createMemoryModel(); 
        dataModel.read(DATA, FileUtils.langTurtle);
        long estimatedLoadTime = System.nanoTime() - startLoadTime;
		System.out.println("Data graph size: " + dataModel.size() );
		System.out.println("Estimated load time: " + TimeUnit.NANOSECONDS.toMillis(estimatedLoadTime)/1000.0 );

		// Load the shapes model
		Model shapesModel = JenaUtil.createMemoryModel();
		shapesModel.read(SHAPES, FileUtils.langTurtle);
		System.out.println("Shapes graph size: " + shapesModel.size() );

		// Perform the validation of everything, using the data model
		// also as the shapes model - you may have them separated
      long startTime = System.nanoTime();    
		Resource report = ValidationUtil.validateModel(dataModel, shapesModel, true);
      long estimatedTime = System.nanoTime() - startTime;
		System.out.println("Report graph size: " + report.getModel().size() );

      System.out.println("Estimated validation time: " + TimeUnit.NANOSECONDS.toMillis(estimatedTime)/1000.0);

      try {
          File file = new File(REPORT);
          FileOutputStream outputStream = new FileOutputStream(file, false);
          RDFDataMgr.write(outputStream, report.getModel(), Lang.TTL);
          
          outputStream.flush();
      } catch (FileNotFoundException e) {
          e.printStackTrace();
      }
	}

}
