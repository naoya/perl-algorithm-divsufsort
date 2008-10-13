use 5.008001;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Algorithm::DivSufSort',
    VERSION_FROM      => 'lib/Algorithm/DivSufSort.pm',
    PREREQ_PM         => {},

    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (
          ABSTRACT_FROM  => 'lib/Algorithm/DivSufSort.pm', # retrieve abstract from module
          AUTHOR         => 'Naoya Ito <naoya@bloghackers.net>')
          : ()
      ),

    LIBS              => ['-ldivsufsort'], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
);
