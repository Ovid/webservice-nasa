# Contributing

Contributors are very welcome!

# Bug Fixes and Typos

For minor fixes, you can [open an
issue](https://github.com/Ovid/webservice-nasa/issues), but a pull request
(with tests, if appropriate) is very welcome.

I do not accept patches. I've found them too much of a pain to apply.

# New Features

If you would like a feature added, please [open an
issue](https://github.com/Ovid/moosex-extended/issues) first so we can discuss
it.

# Changes

To add a new API, add it to `nasa/openapi.yaml` and run
`script/regenerate_code.pl` to rebuild everything. Any parameters, either query
or path, should have an C<example:> key to be written to the generated test
file. This is a bug that should be fixed. Feel free to contact the author
for assistance. Opening a ticket is the best way to do this.

Please add an entry to the `Changes` file for anything you do.

Also, do not edit the `Makefile.pl`. It's auto-generated from the `dist.ini`
file and your changes will be overwritten.
