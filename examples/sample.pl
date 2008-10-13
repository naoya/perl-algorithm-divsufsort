#!/usr/bin/env perl
use strict;
use warnings;
use FindBin::libs;
use blib;

use Perl6::Say;
use Algorithm::DivSufSort qw/divsufsort/;

my $text = shift or die "usage: $0 <text>";
my $sa = divsufsort($text);

for (my $i = 0; $i < @$sa; $i++) {
    say sprintf (
        "sa[%2d] = %2d, substr(text, %2d) = %s",
        $i,
        $sa->[$i],
        $sa->[$i],
        substr($text, $sa->[$i]),
    );
}

