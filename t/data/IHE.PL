#!/usr/bin/env perl

use File::Copy;
use File::Glob;
use FindBin qw($Bin);

my $src  = "$Bin/../../books/www.dreamsongs.com/IHE/plain";
-d $src || die "Can't access IHE test data source at '$src': $!";

my $dest = $ARGV[0] || "t/data/IHE";
$dest = "$Bin/../../$dest";

-d $dest
   || mkdir($dest)
   || die "Can't create IHE test data directory at '$dest': $!";

foreach ( <$src/*> ) {
    copy($_, $dest) || die "Can't copy from '$_' to '$dest': $!";
}

print "IHE books copied to '$dest'\n";
