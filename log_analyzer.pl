#!/usr/bin/perl

# hash tables: %
# scalars: $
# arrays: @
# my restricts scope to delcared block
# < is read, > is write, >> append, +< read/write, +> r/w truncate 
# die kills program with $! os warning
# <blah> means read line by line
# chomp removes \n 
# =~ is regex operator
# $1 captures value from regex operator

use strict;
use warnings;

my $filename = "log_syn1.txt";

open(my $file, "<", $filename) or die "Failed to open file: $!";

my %count;
my $number_of_words = 0;

# diamond or angle operator means iterate through
while (my $line = <$file>) {
    chomp $line;
	# s is substitute / is delim, pairs with /g for global ie all occurences
	# ^ and $ are for start and end of string
	# | is or
	# \s+ is whitespace 1 or more chars
	# / sub with / but // so sub with nothing
	# this removes space before and after string
    $line =~ s/^\s+|\s+$//g;  # Remove leading and trailing whitespace

    # Count INFO, WARNING, ERROR
    if ($line =~ /(INFO|WARNING|ERROR)/) {
        $count{$1}++; 
		# $1 $2 capture vars/backrefs are the indexed results wrt to regex
    }

    # Display lines with "<number> ns" format
    if ($line =~ /\b\d+\s+ns\b/) {
        print "$line\n";
    }

    # Count number of words
    # syntax split(/\s+/, $line) is cool
    my @words = split /\s+/, $line;
    # scalar @ is for length of array
    $number_of_words += scalar @words;
}

close $file;

# Display counts of INFO, WARNING, ERROR
foreach my $type (qw(INFO WARNING ERROR)) {
    my $count = $count{$type} // 0;
    print "Count of $type: $count\n";
}

# Display total number of words
print "Number of words: $number_of_words\n";


