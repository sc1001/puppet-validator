#!/bin/bash

echo "Enter directory name where Puppet code is located. Leave blank to check all directories: "

read directory

if [ -z "$directory" ];
then
	echo "Validating all directories"
	echo "Puppet Parses Validation..."
	find . -name "*.pp" | xargs -n 1 puppet parser validate --verbose

	echo "Puppet Lint..."
	find . -type f -name "*.pp" | xargs -n 1 puppet-lint --no-autoloader_layout-check --no-80chars-check --with-filename --error-level error

	echo "Ruby syntax checking..."
	find . -type f -name "*.erb" | xargs -n 1 -I \{\} erb -P -x -T '-' \{\} | ruby -c
else
	echo ""
	echo "Validating $directory directory"
	echo "Puppet Parses Validation..."
        find $directory -name "*.pp" | xargs -n 1 puppet parser validate --verbose

        echo "Puppet Lint..."
        find $directory -type f -name "*.pp" | xargs -n 1 puppet-lint --no-autoloader_layout-check --no-80chars-check --with-filename --error-level error

        echo "Ruby syntax checking..."
        find $directory -type f -name "*.erb" | xargs -n 1 -I \{\} erb -P -x -T '-' \{\} | ruby -c
fi
