#!/usr/bin/perl

use strict;
use warnings;

# Create an array with unsorted values
my @unsorted = (9, 4, 6, 2, 1, 7, 3, 8, 5);

# Print the unsorted array
print "Unsorted array: @unsorted\n";

# Sort the array in ascending order using default sort
my @sorted_asc = sort @unsorted;

# Print the array after sorting in ascending order
print "Sorted array (ascending): @sorted_asc\n";

# Sort the array in descending order using a custom sort function
# Special perl syntax, <=> for numerical, cmp for strings
# $a is for 1st element, $b is for second element
my @sorted_desc = sort { $b <=> $a } @unsorted;

# Print the array after sorting in descending order
print "Sorted array (descending): @sorted_desc\n";



my %hash = (
    John   => 25,
    Alice  => 32,
    Mark   => 28,
    Emily  => 21,
    Daniel => 29
);

my @sorted_keys = sort keys %hash;

foreach my $key (@sorted_keys) {
    my $value = $hash{$key};
    print "$key: $value\n";
}



#!/usr/bin/perl

use strict;
use warnings;

# Create a hash of hashes with unsorted values
my %unsorted_hash = (
    John   => { age => 25, city => 'New York' },
    Alice  => { age => 32, city => 'London' },
    Mark   => { age => 28, city => 'Paris' },
    Emily  => { age => 21, city => 'Sydney' },
    Daniel => { age => 29, city => 'Tokyo' }
);

# Print the unsorted hash of hashes
print "Unsorted hash of hashes:\n";
print_hash_of_hashes(\%unsorted_hash);

# Sort the hash of hashes by age in ascending order
my @sorted_by_age_asc = sort { $unsorted_hash{$a}{age} <=> $unsorted_hash{$b}{age} } keys %unsorted_hash;

# Print the sorted hash of hashes by age in ascending order
print "\nSorted hash of hashes by age (ascending):\n";
print_hash_of_hashes(\%unsorted_hash, \@sorted_by_age_asc);

# Sort the hash of hashes by city in descending order
my @sorted_by_city_desc = sort { $unsorted_hash{$b}{city} cmp $unsorted_hash{$a}{city} } keys %unsorted_hash;

# Print the sorted hash of hashes by city in descending order
print "\nSorted hash of hashes by city (descending):\n";
print_hash_of_hashes(\%unsorted_hash, \@sorted_by_city_desc);

# Subroutine to print the hash of hashes
sub print_hash_of_hashes {
    my ($hashref, $order) = @_;
    foreach my $key (defined $order ? @$order : keys %$hashref) {
        print "$key: age = $hashref->{$key}{age}, city = $hashref->{$key}{city}\n";
    }
}

