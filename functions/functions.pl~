#!/usr/bin/perl
use strict;
use warnings;

sub sum {
    my $first = shift;
    my $second = shift;
    return $first + $second;
}

print sum(3, 4);  # Prints 7

sub sum {
    my ($first, $second) = @_;
    return $first + $second;
}

print sum(3, 4);  # Prints 7


# This is a basic subroutine that prints a greeting.
# Note: In Perl, arguments to a subroutine are passed via the special array @_
sub greet {
    my $name = shift;  # shift function removes the first element from array and returns it
    print "Hello, $name!\n";
}

# Call the subroutine
greet("World");

# Subroutine that calculates the sum of an array of numbers
sub sum {
    my @numbers = @_;
    my $sum = 0;
    $sum += $_ for @numbers;  # $_ is a special variable that refers to each item in @numbers in the loop
    return $sum;  # Return the sum
}

my @array = (1, 2, 3, 4, 5);
my $result = sum(@array);
print "The sum of @array is $result\n";

# Subroutine with default argument values
sub greet_with_default {
    my $name = shift // 'Guest';  # The // operator is used to specify a default value if the argument is undefined
    print "Hello, $name!\n";
}

greet_with_default("John");
greet_with_default();  # This will use the default value

# Subroutine that returns multiple values
sub min_max {
    my @numbers = @_;
    @numbers = sort { $a <=> $b } @numbers;  # Sort the numbers in ascending order
    return $numbers[0], $numbers[-1];  # Return the first (minimum) and last (maximum) numbers
}

my @values = (5, 9, 2, 8, 1);
my ($min, $max) = min_max(@values);
print "The minimum and maximum of @values are $min and $max, respectively\n";

