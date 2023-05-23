#!/usr/bin/perl

use strict;
use warnings;

my @array = (1, 2, 3);

# shift - Removes and returns the first element from the array
my $first_element = shift @array;
print "First element: $first_element\n";
print "Remaining elements: @array\n";

# unshift - Inserts elements at the beginning of the array
unshift @array, 0;
print "Array after unshift: @array\n";

# push - Appends elements at the end of the array
push @array, 4, 5;
print "Array after push: @array\n";

# pop - Removes and returns the last element from the array
my $last_element = pop @array;
print "Last element: $last_element\n";
print "Array after pop: @array\n";

# Accessing array elements
print "Second element: $array[1]\n";

# Assigning array slice
my @slice = @array[1..2];
print "Slice: @slice\n";

# Modifying array element
$array[2] = 6;
print "Modified array: @array\n";

# Array length
my $length = scalar @array;
print "Array length: $length\n";

# Checking if array is empty
if (@array) {
    print "Array is not empty\n";
} else {
    print "Array is empty\n";
}

# Joining array elements into a string
my $string = join(", ", @array);
print "Joined string: $string\n";
