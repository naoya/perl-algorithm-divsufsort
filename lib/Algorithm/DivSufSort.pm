package Algorithm::DivSufSort;
use strict;
use warnings;

our $VERSION = '0.01';

use Exporter::Lite;

our @EXPORT = qw/divsufsort/;
our @EXPORT_OK = @EXPORT;

require XSLoader;
XSLoader::load('Algorithm::DivSufSort', $VERSION);

sub divsufsort ($) {
    my $text = shift;
    my $SA = [];

    my $st = xs_divsufsort($text, $SA, length $text);
    if ($st != 0) {
        die "divsufsort failed (%d)", $st;
    }

    return $SA;
}

1;
__END__

=head1 NAME

Algorithm::DivSufSort - Perl interface to libdivsufsort

=head1 SYNOPSIS

  use Algorithm::DivSufSort qw/divsufsort/;

  my $suffix_array = divsufsort("abracadabra");

  for (my $i = 0; $i < @$sa; $i++) {
      say sprintf (
          "sa[%2d] = %2d, substr(text, %2d) = %s",
          $i,
          $sa->[$i],
          $sa->[$i],
          substr($text, $sa->[$i]),
      );
  }

  ## Results
  sa[ 0] = 10, substr(text, 10) = a
  sa[ 1] =  7, substr(text,  7) = abra
  sa[ 2] =  0, substr(text,  0) = abracadabra
  sa[ 3] =  3, substr(text,  3) = acadabra
  sa[ 4] =  5, substr(text,  5) = adabra
  sa[ 5] =  8, substr(text,  8) = bra
  sa[ 6] =  1, substr(text,  1) = bracadabra
  sa[ 7] =  4, substr(text,  4) = cadabra
  sa[ 8] =  6, substr(text,  6) = dabra
  sa[ 9] =  9, substr(text,  9) = ra
  sa[10] =  2, substr(text,  2) = racadabra

=head1 DESCRIPTION

The libdivsufsort project provides a fast, lightweight, and robust C
API library to construct the suffix array.

This module provides interface to divsufsort() API.

=head1 SEE ALSO

L<http://code.google.com/p/libdivsufsort/>

=head1 TODO

Supports other APIs - divbwt(), bw_transform(),
inverse_bw_transform(), sufcheck(), sa_search(), sa_simplesearch()

=head1 ACKNOWLEDGEMENTS

The libdivsufsort library is developed by Yuta Mori.

=head1 AUTHOR

Naoya Ito, E<lt>naoya at bloghackers.netE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Naoya Ito

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.

=cut
