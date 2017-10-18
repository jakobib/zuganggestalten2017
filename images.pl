#!/usr/bin/env perl
use v5.14;

use Pandoc;
use Pandoc::Elements;

my $doc = pandoc->file;
my $imgs = $doc->query('Header' => sub { $_->keyvals->{'data-background'} });

for (@$imgs) { 
    s{^https?://upload\.wikimedia\.org/wikipedia/commons/}{} or next;
    s{^(thumb/)?./../([^/]+)(/.+)?$}{$2};
    say "https://commons.wikimedia.org/wiki/File:$_";
}
