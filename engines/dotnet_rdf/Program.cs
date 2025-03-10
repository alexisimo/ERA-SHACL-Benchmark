using System.Reflection;
using System.CommandLine;
using System.CommandLine.NamingConventionBinder;
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

        if (args.Length == 0)
        {
            Console.WriteLine($"DotNetRDF cli SHACL validator");
            Console.WriteLine("  --help  Show help and usage information");
            return 1;
        }

        var rootCommand = new RootCommand
        {
        new Option<string>("--data", "RDF data"),
        new Option<string>("--shapes", "SHACL shapes"),
        new Option<string>("--report", "Validation report")
        };

        rootCommand.Description = "RDF data validation against SHACL shapes.";

        rootCommand.Handler = CommandHandler.Create<string, string, string>((data, shapes, report) =>
        {
        validate(data, shapes, report);
        });

        return rootCommand.Invoke(args);

    }

    static void validate(string DATA, string SHAPES, string REPORT) {
    
        var dataGraph = new Graph();
        
        var loadTimer = new Stopwatch();
        loadTimer.Start();
        FileLoader.Load(dataGraph, DATA);
        loadTimer.Stop();
        TimeSpan loadTimeTaken = loadTimer.Elapsed;
        string loadTimeElapsed = "Estimated load time: " + loadTimeTaken.TotalSeconds.ToString();
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
        string timeElapsed = "Estimated validation time: " + timeTaken.TotalSeconds.ToString(); 
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