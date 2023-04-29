#!/usr/bin/perl

# This is a comment in Perl. It starts with a '#' character and continues until the end of the line.

# Variables in Perl are denoted by a '$' sign, followed by the name of the variable. Perl is a dynamically typed language,
# which means that you don't need to specify the data type of a variable when you declare it.

# Here, we are declaring a variable called $name and assigning it a string value of "Alice".
$name = "Alice";

# You can print the value of a variable using the 'print' statement. In Perl, you don't need to use a semicolon at the end of
# each statement, but it's good practice to do so.
print "Hello, $name!\n";

# You can also concatenate strings using the '.' operator.
print "The length of the name is " . length($name) . " characters.\n";

# You can change the value of a variable by assigning a new value to it.
$name = "Bob";

# You can use the value of a variable in an expression. Here, we are using the '.' operator to concatenate strings.
print "Hello, " . $name . "!\n";

# Arrays and hashes in Perl
@fruits = ("apple", "banana", "orange");
%ages = ("Alice", 25, "Bob", 30, "Charlie", 35);

# Variable scope in Perl
sub my_function {
    my $local_variable = "This is a local variable.";
	$no_my_is_global = "global";
    print "Inside the function: $local_variable\n";
}

$global_variable = "This is a global variable.";

# Variable interpolation, like fstrings style kinda 
$name = "Alice";
print "Hello, ${name}!\n";

# Variable assignment, can do multiple vars at once 
($x, $y) = (10, 20);
print "x = $x, y = $y\n";

# Variable references, they are pointers
$x = 10;
$ref = \$x;
print "The value of x is ${$ref}.\n";

# Special variables in Perl
# @ARGV can be treated as @ARGV[] 
# 
print "The command-line arguments are: @ARGV\n";
print "The current working directory is: $ENV{PWD}\n";

# Accessing array and hash elements in Perl
print "The first fruit is $fruits[0].\n";
print "Alice is $ages{'Alice'} years old.\n";

# Calling a function in Perl
my_function();

# Accessing global variables in Perl
print "Outside the function: $global_variable\n";

