package oeg.shacl.validator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import fr.inria.corese.core.Graph;
import fr.inria.corese.core.load.Load;
import fr.inria.corese.core.load.LoadException;
import fr.inria.corese.core.shacl.Shacl;
import fr.inria.corese.core.transform.Transformer;
import fr.inria.corese.sparql.exceptions.EngineException;

public class CoreseValidator {

    public static void validate(String DATA, String SHAPES, String REPORT) throws IOException {

		// Load data graph
		Graph dataGraph = Graph.create();
		Load ld= Load.create(dataGraph);
		try {
	        long startLoadTime = System.nanoTime();
			ld.parse(DATA);
			long estimatedLoadTime = System.nanoTime() - startLoadTime;
			System.out.println("Data graph size: " + dataGraph.size() );
			System.out.println("Load time: " + TimeUnit.NANOSECONDS.toMillis(estimatedLoadTime)/1000.0 );
		} catch (LoadException e) {
			e.printStackTrace();
		}
	
		// Load shape graph
		Graph shapeGraph = Graph.create();
		Load ld_shapes = Load.create(shapeGraph);
		try {
			ld_shapes.parse(SHAPES);
			System.out.println("Shapes graph size: " + shapeGraph.size() );
		} catch (LoadException e) {
			e.printStackTrace();
		}
	
		// Evaluation
		Shacl shacl = new Shacl(dataGraph, shapeGraph);
		Graph result;

		long startTime = System.nanoTime();

		try {
			result = shacl.eval();
	        long estimatedTime = System.nanoTime() - startTime;

			// print results
			Transformer transformer = Transformer.create(result, Transformer.TURTLE);
//			System.out.println(transformer.toString());
			System.out.println("Report graph size: " + result.size());
	        System.out.println("Validation time: " + TimeUnit.NANOSECONDS.toMillis(estimatedTime)/1000.0);	
            try {
	            File file = new File(REPORT);
	            FileOutputStream outputStream = new FileOutputStream(file, false);
	            transformer.write(outputStream);
	            
	            outputStream.flush();
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        }
		} catch (EngineException e) {
			e.printStackTrace();
		}

	 }

}
