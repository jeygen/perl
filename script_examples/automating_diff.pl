#!/usr/bin/perl
use strict; # forces declaration of variables with 'my' or 'our'
use warnings; # enables warnings

=pod
The p4 diff command is designed to compare two versions of the same file in a client workspace.

If you want to compare files across different depots, or different workspaces, you might want to 
use the p4 diff2 command, which compares two depot files. The syntax is p4 diff2 file1@revision 
file2@revision.

Keep in mind that you can use the p4 diff2 command to compare different revisions of the same file, 
different files, or files in different depots. Also, you do not need to have the files in your client 
workspace to use p4 diff2.

In the Perl script, you would replace the p4 diff command with p4 diff2 and adjust your file naming 
accordingly to include depot path and optional revision number.

    #none refers to the absence of the file.
    #head refers to the most recent revision.
    #change refers to the most recent revision on the current client.
    @change refers to the most recent revision submitted to the depot at the specified changelist number.
    #revision refers to the specified revision number of the file.
    
if using #change and #revision
my $output = `p4 diff2 "file1#change" "file2#10"`;

=cut

# Arrays to hold your file names. Replace with your actual file names.
my @files1 = ("file1_a", "file2_a", "file3_a", "file4_a", "file5_a"); 
my @files2 = ("file1_b", "file2_b", "file3_b", "file4_b", "file5_b"); 

# Looping over each index from 0 to the last index of @files1
# Here, $#files1 gives the index of the last element in @files1.
for my $i (0..$#files1) {

    # Assigning file names to variables for easier reference
    my $file1 = $files1[$i];
    my $file2 = $files2[$i];

    # Check if each file exists (-e checks for file existence)
    if (! -e $file1) {
        print "File $file1 does not exist!\n"; # Print a warning message if the file does not exist
        next; # Skip to the next iteration
    }
    if (! -e $file2) {
        print "File $file2 does not exist!\n"; # Print a warning message if the file does not exist
        next; # Skip to the next iteration
    }

    # Use Perl's backticks (`) to execute system command and capture its output.
    # Here we're running 'p4 diff' command on two files.
    my $output = `p4 diff $file1 $file2`;

    # Check the output of the command.
    # If files are identical, the command will output nothing (an empty string in Perl),
    # thus this condition will evaluate to false and the else branch will be executed.
    # If there are differences, the command outputs those differences,
    # so this condition will evaluate to true and the if branch will be executed.
    if ($output) {
        print "Differences found between $file1 and $file2:\n$output\n"; # Print the differences
    } else {
        print "No differences found between $file1 and $file2. Good!\n"; # Print "Good" if no differences were found
    }
}
