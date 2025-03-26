using System.Reflection;
using VDS.RDF.Shacl;
using VDS.RDF;
using VDS.RDF.Parsing;
using VDS.RDF.Writing;
using VDS.RDF.Writing.Formatting;
using System.Diagnostics;
using VDS.RDF.Query;
using System.ComponentModel.DataAnnotations;
using System.Drawing;

namespace dotnet_rdf;

class Program
{
    static int Main(string[] args) {

        if (args.Length < 3)
        {
            Console.WriteLine($"DotNetRDF cli SHACL validator\n");
            Console.WriteLine("Description:");
            Console.WriteLine("  RDF data validation against SHACL shapes.\n");
            Console.WriteLine("Usage:");
            Console.WriteLine("  dotnet run <data> <shapes> <report>\n");
            Console.WriteLine("Positional arguments:");
            Console.WriteLine("  <data>    RDF data");
            Console.WriteLine("  <shapes>  SHACL shapes");
            Console.WriteLine("  <report>  Validation report");
            return 1;
        }
        else
        {
            validate(args[0], args[1], args[2]);
            return 1;
        }
    }

    static void validate(string DATA, string SHAPES, string REPORT) {
    
        var dataGraph = new Graph();
        
        var loadTimer = new Stopwatch();
        loadTimer.Start();
        FileLoader.Load(dataGraph, DATA);
        loadTimer.Stop();
        TimeSpan loadTimeTaken = loadTimer.Elapsed;
        string loadTimeElapsed = "Load time: " + loadTimeTaken.TotalSeconds.ToString();
        Console.WriteLine("Data graph size: " + dataGraph.Triples.Count) ; 
        Console.WriteLine(loadTimeElapsed);

        var shapesGraph = new Graph(); 
        FileLoader.Load(shapesGraph, SHAPES);
        Console.WriteLine("Shapes graph size: " + shapesGraph.Triples.Count) ; 

        var processor = new ShapesGraph(shapesGraph); 

        var timer = new Stopwatch();
        timer.Start();
        var report = processor.Validate(dataGraph); 
        timer.Stop();
        TimeSpan timeTaken = timer.Elapsed;
        string timeElapsed = "Validation time: " + timeTaken.TotalSeconds.ToString(); 
        Console.WriteLine(timeElapsed);

        CompressingTurtleWriter turtlewriter = new CompressingTurtleWriter();
        String reportData = VDS.RDF.Writing.StringWriter.Write(report.Graph, turtlewriter);
        using(StreamWriter writeReport = new StreamWriter(REPORT))
        {
            writeReport.WriteLine(reportData);
        }
        // Console.WriteLine(dataGraph.Triples.Count.ToString() + ", " + shapesGraph.Triples.Count.ToString() + ", " + loadTimeTaken.TotalSeconds + ", " + timeTaken.TotalSeconds);
    }
}