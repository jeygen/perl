# Diamond operator also called an angle operator

# Open a file for reading
open my $fh, '<', 'filename.txt' or die "Cannot open file: $!";

# Read lines from the file
# the $ tracks the line number
while (my $line = <$fh>) {
    chomp $line;  # Remove newline character
    # Process the line
    print "Line: $line\n";
}

# Close the file
close $fh;

# Read lines from standard input
print "Enter lines of input (Ctrl+D or Ctrl+Z to exit):\n";
while (my $input = <STDIN>) {
    chomp $input;  # Remove newline character
    # Process the input
    print "Input: $input\n";
}

# Read lines from files specified as command-line arguments
while (my $line = <ARGV>) {
    chomp $line;  # Remove newline character
    # Process the line
    print "Line: $line\n";
}

