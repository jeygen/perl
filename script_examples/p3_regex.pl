# Use regex to count occurrence of words: 'cat' and 'dog'

use strict;
use warnings;

# Open the file
open(my $fh, '<', 'file.txt') or die "Could not open file 'file.txt' $!";

my $count_cat = 0;
my $count_dog = 0;

# Read through the file line by line
while (my $line = <$fh>) {
    # Count occurrences of 'cat' and 'dog'
    while ($line =~ m/\b(catz?|dog)\b/gi) {
        if ($1 =~ m/\bcatz?\b/gi) {
            $count_cat++;
        } elsif ($1 =~ m/\bdog\b/gi) {
            $count_dog++;
        }
    }
}

print "Count of 'cat' or 'catz': $count_cat\n";
print "Count of 'dog': $count_dog\n";

# Don't forget to close the file
close($fh);

