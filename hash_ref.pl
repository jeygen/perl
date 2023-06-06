#    Pass Hashes to Subroutines: 
#		By passing a hash reference as an argument to a subroutine, 
#		you can avoid making a copy of the entire hash, 
#		which can be more efficient for large data structures.
#
#    Share Data Structures: 
#		Hash references enable multiple parts of your program to 
#		access and modify the same underlying hash. This can be 
#		helpful when you need to share and synchronize data between 
#		different components or modules.
#
#    Store Hashes in Arrays or Other Hashes: 
#		Hash references can be stored as elements in arrays or as 
#		values within other hashes. This allows you to build more 
#		complex and nested data structures.

# Creating a hash reference
my %person = (
    name => "John",
    age => 30,
    occupation => "Engineer"
);

my $person_ref = \%person;  # Creating a hash reference using \%person

# Accessing values from the hash reference
my $name = $person_ref->{name};
my $age = $person_ref->{age};
my $occupation = $person_ref->{occupation};

print "Name: $name\n";
print "Age: $age\n";
print "Occupation: $occupation\n";

# Modifying values through the hash reference
$person_ref->{age} = 31;
$person_ref->{occupation} = "Software Developer";

print "Modified Age: $age\n";  # The value is also modified in the hash
print "Modified Occupation: $occupation\n";  # The value is also modified in the hash

# Iterating over the keys and values of the hash reference
foreach my $key (keys %$person_ref) {
    my $value = $person_ref->{$key};
    print "$key: $value\n";
}

