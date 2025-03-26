package oeg.shacl.validator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.apache.jena.geosparql.configuration.GeoSPARQLConfig;
import org.apache.jena.graph.Graph;
import org.apache.jena.query.Dataset;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.riot.Lang;
import org.apache.jena.riot.RDFDataMgr;
import org.apache.jena.shacl.ShaclValidator;
import org.apache.jena.shacl.Shapes;
import org.apache.jena.shacl.ValidationReport;
//import org.apache.jena.shacl.lib.ShLib;

public class JenaValidator {

    public static void validate(String DATA, String SHAPES, String REPORT) throws IOException {

        long startLoadTime = System.nanoTime();
        Graph dataGraph = RDFDataMgr.loadGraph(DATA);
        long estimatedLoadTime = System.nanoTime() - startLoadTime;
        int dataGraphSize = dataGraph.size() ;
        System.out.println("Data graph size: " + dataGraphSize);
		System.out.println("Load time: " + TimeUnit.NANOSECONDS.toMillis(estimatedLoadTime)/1000.0 );

        Graph shapesGraph = RDFDataMgr.loadGraph(SHAPES);
        int shapesGraphSize = shapesGraph.size() ;
        System.out.println("Shapes graph size: " + shapesGraphSize);
        
        GeoSPARQLConfig.setupMemoryIndex();          

        Shapes shapes = Shapes.parse(shapesGraph);
        
        
        long startTime = System.nanoTime();    
        ValidationReport report = ShaclValidator.get().validate(shapes, dataGraph);
        long estimatedTime = System.nanoTime() - startTime;
        int reportGraphSize = report.getGraph().size() ;
        System.out.println("Report graph size: " + reportGraphSize);

        System.out.println("Validation time: " + TimeUnit.NANOSECONDS.toMillis(estimatedTime)/1000.0);
        
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
