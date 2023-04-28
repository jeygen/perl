#!/usr/bin/perl

use strict;
use warnings;
use IPC::Run qw(run timeout);

# Define a function that compiles a C++ program and returns the output and exit code
sub compile_cpp_file {
  my $file_name = shift;

  my ($stdout, $stderr);
  my $exit_code = run(["g++", "$file_name.cpp", "-o", "$file_name"], \undef, \$stdout, \$stderr, timeout(30));

  # return a hash containing the output and exit code
  return { stdout => $stdout, stderr => $stderr, exit_code => $exit_code };
}

# Define a function that runs a C++ program and returns the output and exit code
sub run_cpp_file {
  my ($file_name, $input) = @_;

  my ($stdout, $stderr);
  my $exit_code = run(["./$file_name"], \$input, \$stdout, \$stderr, timeout(30));

  # return a hash containing the output and exit code
  return { stdout => $stdout, stderr => $stderr, exit_code => $exit_code };
}

# Define a function that tests a C++ program with a given input and expected output
sub test_cpp_file {
  my ($file_name, $input, $expected_output) = @_;

  my $compile_result = compile_cpp_file($file_name); # compile the C++ file

  if ($compile_result->{exit_code} != 0) { # check if the compilation was successful
    print "Compilation error: $compile_result->{stderr}\n"; # print the error message to the console
    return 0; # return false to indicate that the test failed
  }

  my $run_result = run_cpp_file($file_name, $input); # run the C++ program with the input

  if ($run_result->{exit_code} != 0) { # check if the program executed successfully
    print "Execution error: $run_result->{stderr}\n"; # print the error message to the console
    return 0; # return false to indicate that the test failed
  }

  if ($run_result->{stdout} !~ /^$expected_output\s*$/m) { # compare the program output with the expected output
    print "Test failed: Expected '$expected_output', but got '$run_result->{stdout}'\n"; # print the error message to the console
    return 0; # return false to indicate that the test failed
  }

  return 1; # return true to indicate that the test passed
}

# Example usage: test a C++ program that calculates the sum of two numbers
my $file_name = "sum";
my $input = "3 4\n"; # two numbers separated by a space
my $expected_output = "7\n"; # the sum of the two numbers

my $result = test_cpp_file($file_name, $input, $expected_output); # run the test

if ($result) { # check if the test passed
  print "Test passed!\n"; # print a success message to the console
} else {
  print "Test failed.\n"; # print an error message to the console
}
