use strict;
use warnings;
use Test::More;
use FindBin qw/$Bin/;
use lib "$Bin/lib";

use TestDataStore { no_unlink => 1 };

use aliased 'App::Kaizendo::DataStore::Project';
use aliased 'App::Kaizendo::DataStore::Comment';

my $store = getTestDataStore();
ok $store;

my $s = $store->new_scope;

my $doc = Project->new(name => 'Foo');
ok $doc;

ok $store->store($doc);

my $comment = Comment->new( document => $doc, text => 'A comment' );
ok $comment;

ok $store->store($comment);

done_testing;
