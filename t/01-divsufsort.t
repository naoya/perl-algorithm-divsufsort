use strict;
use warnings;

use Test::More qw/no_plan/;
use Algorithm::DivSufSort qw/divsufsort/;

is_deeply divsufsort("abc"), [0, 1, 2];
is_deeply divsufsort("abra"), [3, 0, 1, 2];
is_deeply divsufsort("abracadabra"), [10, 7, 0, 3, 5, 8, 1, 4, 6, 9, 2];
