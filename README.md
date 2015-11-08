# Puppet Validator

A simple script for validating Puppet code. Three types of validation are run against the Puppet code:

1. Puppet Parser
2. Puppet Lint
3. Ruby Syntax checking

Please note. The script only only checks syntax of Puppet code, it will not pickup spelling mistakes in variable names etc.
 
I use it locally to make sure I haven't made any silly mistakes in my syntax before pushing puppet code to a repository where automated tests should be run to more thoroughly check your code for errors before the code is deployed to a Puppet Master or directly to servers.

## Installation

Place script in the location where your Puppet repositories / folders are stored.

## Usage
There are two options for validating Puppet code:

1. Validate a specific directory:

    ```
    $ ./puppet-validator.sh
    $ Enter directory name where Puppet code is located. Leave blank to check all directories: directory_name
    $ Validating directory_name directory
    ```

2. Validate all directories:

    ```
    $ ./puppet-validator.sh
    $ Enter directory name where Puppet code is located. Leave blank to check all directories:
    $ Validating all directories
    ```

## License

See the [LICENSE](LICENSE) file (MIT).
