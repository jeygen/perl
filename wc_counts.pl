#!/usr/bin/perl

use strict;
use warnings;

my $file = 'input.txt';  # Specify the input file

open(my $fh, '<', $file) or die "Cannot open file '$file': $!";

my %word_counts;

while (my $line = <$fh>) {
    chomp $line;
    my @words = split /\s+/, $line;
    foreach my $word (@words) {
        $word_counts{$word}++;
    }
}

close $fh;

my $total_words = 0;

foreach my $word (keys %word_counts) {
    my $count = $word_counts{$word};
    $total_words += $count;
    print "$word: $count\n";
}

print "Total words: $total_words\n";
