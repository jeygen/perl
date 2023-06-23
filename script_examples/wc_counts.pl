#!/usr/bin/perl

use strict;
use warnings;

my $file = 'input.txt';  # Specify the input file

open(my $fh, '<', $file) or die "Cannot open file '$file': $!";

my %word_counts;

while (my $line = <$fh>) {
    chomp $line;
    my @words = split /\s+/, $line;
    # how to iterate through array
    foreach my $word (@words) {
        $word_counts{$word}++;
    }
}

close $fh;

my $total_words = 0;

# hot to itereate through hashmap
foreach my $word (keys %word_counts) {
    my $count = $word_counts{$word};
    $total_words += $count;
    print "$word: $count\n";
}

print "Total words: $total_words\n";

# my style

my $total_words;
my %num_per_words;

open(my $wd, '<', 'log_syn1.txt') or die "no good with, $1";

while (my $line = <$wd>) {
    chomp $line;
    my @words = split /\s+/, $line;
    $total_words += scalar @words;
    foreach my $w (@words) {
		# [] for char class, [:punct:] special group
        $w =~ s/[[:punct:]]//g; # This line removes punctuation
        $num_per_words{$w}++;
    }
}

close($wd);

foreach my $key (keys %num_per_words) {
    print "Key: $key, Value: $num_per_words{$key}\n";  
}

print "$total_words\n";

