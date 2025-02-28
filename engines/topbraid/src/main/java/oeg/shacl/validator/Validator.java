package oeg.shacl.validator;

import oeg.shacl.validator.commands.ValidatorCommand;
import picocli.CommandLine;

public class Validator {
	public static void main(String[] args) {
		new CommandLine(new ValidatorCommand()).execute(args);
	}
}
