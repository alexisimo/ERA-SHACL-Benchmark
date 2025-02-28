package oeg.shacl.validator.commands;

//import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import picocli.CommandLine.Option;

import java.io.IOException;

import oeg.shacl.validator.Rdf4jValidator;

@Command(name = "Validator",
		version = "1.0.0",
		description = "RDF data validation against SHACL shapes",
		mixinStandardHelpOptions = true,
		requiredOptionMarker = '*',
		header = "RDF data SHACL validator",
		optionListHeading = "%nOptions are:%n"
		)
public class ValidatorCommand implements Runnable {
	
	@Parameters(index = "0", description = "RDF data")
	private String data;
	
	@Parameters(index = "1", description = "SHACL shapes")
	private String shapes;
	
	@Parameters(index = "2", description = "Validation report")
	private String report;
	
	@Option(names = {"-h", "--help"}, description = "Display this help", usageHelp = true)
	private Boolean help;
	
//	public static void main(String[] args) {
//		new CommandLine(new ValidatorCommand()).execute(args);
//	}
	
	@Override
	public void run() {
		System.out.println("Data: " + data + "\nShapes: " + shapes + "\nReport: " + report);
		try {
			Rdf4jValidator.validate(data, shapes, report);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}