use strict;
use warnings;
use Test::More;

use lib 't/lib';
use CLIHelper;

############################################################################
# Check whether importing and immediately exporting a string yields the same
# string back. These doesn't need to make sense, as the program is not
# validating them at this stage
############################################################################

for my $case (
	'-1',
	'0',
	'0.1',
	'1.001250142E-299',
	'vvariable',
	'vo',
	'ov#vo#vo',
	'o+#2#2',
	'o*#va#vb#o-#3',
) {
	is run_good('-i', $case, '-e'), $case, "$case export/import ok";
}

for my $case (
	'0,0',
	'notavar',
	'+#5#5',
	'5##5',
) {
	note run_bad('-i', $case, '-e');
}

done_testing;
