#!/usr/bin/perl

use strict;
use warnings;

sub compare_current_changes_with_diff2 {
    my $p4 = shift;
    my $changelist = shift;

    # Get the current client workspace directory
    my $workspace = `p4 client -o | grep 'Root'`;
    $workspace =~ s/Root:\s+//;

    # Run p4 diff2 command to compare changes
    my $diff2_command = "p4 diff2 //...@=default //...\@$changelist";
    my @diff2_result = `$diff2_command`;

    # Iterate over the result and display the differences
    foreach my $diff (@diff2_result) {
        chomp $diff;
        my ($depot_path, $local_path, $status) = split(/\t/, $diff);

        if ($status eq 'deleted') {
            print "Deleted: " . $local_path . "\n";
        }
        elsif ($status eq 'added') {
            print "Added: " . $local_path . "\n";
        }
        else {
            print "Modified: " . $local_path . "\n";
        }
    }
}

# Specify the changelist to compare against
my $changelist = '12345';  # Replace with the desired changelist number

# Create the Perforce object
my $p4 = new P4;

# Run the p4 commands
$p4->SetProg('p4');
$p4->RunLogin();
$p4->Connect() or die("Failed to connect to Perforce server: " . $p4->Errors());

# Compare current changes with diff2 changes
compare_current_changes_with_diff2($p4, $changelist);

# Disconnect from the Perforce server
$p4->Disconnect();

######################################################################################

# Better Starting Point

sub compare_opened_changes_with_diff2 {
    my $p4 = P4->new();
    $p4->SetProg('p4');

    eval {
        $p4->Connect() or die("Failed to connect to Perforce server: " . $p4->Errors());

        my $workspace = `p4 client -o | grep 'Root'`;
        $workspace =~ s/Root:\s+//;

        my @opened_files = $p4->RunOpened();

        my $no_diff = 1; # Flag to keep track if any difference was found
        my $no_file_match = 1; # Flag to keep track if any file match was found

        foreach my $opened_file (@opened_files) {
            my $depot_file = $opened_file->{'depotFile'};
            my $change = $opened_file->{'change'};
            # fancy way to spilt into array then take the last element
            my $file_name = (split('/', $depot_file))[-1]; 

            my $diff2_command = "p4 diff2 //depot/.../$file_name //...@$change";
            my @diff2_result = `$diff2_command`;

            # Check for files with no match in depot
            # Checks most recent system error, $? special char
            if ($? != 0) {
                print "No match for $depot_file in depot.\n";
                next;
            }
            else {
                $no_file_match = 0; # At least one file matched
            }

            if (@diff2_result) {
                print "Differences for $depot_file in changelist $change:\n";
                foreach my $diff (@diff2_result) {
                    print $diff;
                }
                print "\n";
                $no_diff = 0; # A difference was found
            }
        }

        # Print "perfect match" if no differences were found
        if ($no_diff && !$no_file_match) {
            print "Perfect match.\n";
        }
    };

    if ($@) {
        print "An error occurred: $@\n";
    }

    $p4->Disconnect();
}

### No message version #####

sub compare_opened_changes_with_diff2 {
    my $p4 = P4->new();
    $p4->SetProg('p4');

    eval {
        $p4->Connect() or die("Failed to connect to Perforce server: " . $p4->Errors());

        my $workspace = `p4 client -o | grep 'Root'`;
        $workspace =~ s/Root:\s+//;

        my @opened_files = $p4->RunOpened();

        foreach my $opened_file (@opened_files) {
            my $depot_file = $opened_file->{'depotFile'};
            my $change = $opened_file->{'change'};
            my $file_name = (split('/', $depot_file))[-1]; 

            my $diff2_command = "p4 diff2 //depot/.../$file_name //...@$change";
            my @diff2_result = `$diff2_command`;

            # If there was a system error, skip this file
            next if ($? != 0);

            if (@diff2_result) {
                print "Differences for $depot_file in changelist $change:\n";
                foreach my $diff (@diff2_result) {
                    print $diff;
                }
                print "\n";
            }
        }
    };

    if ($@) {
        print "An error occurred: $@\n";
    }

    $p4->Disconnect();
}

################### I think this what would actually work ########

sub compare_opened_changes_with_diff2 {
    my $p4 = P4->new();
    $p4->SetProg('p4');

    # List of specific files to compare
    my @specific_files = ('file1', 'file2', 'file3', 'file4', 'file5');

    eval {
        $p4->Connect() or die("Failed to connect to Perforce server: " . $p4->Errors());

        my $client = $p4->GetClient(); # Get the client name

        foreach my $file_name (@specific_files) {
            # Assume the change list is the latest for each file
            my $change = "latest";

            # Get the content of the file from the other depot
            my $print_command = "p4 print -q //other_depot/.../$file_name@$change";
            my $other_content = `$print_command`;

            # Get the local path of the file in your workspace
            my $local_path = "//path/to/your/workspace/$file_name";

            # Use a standard diff tool to compare the content
            open my $fh, '<', $local_path or die "Can't open $local_path: $!";
            my $local_content = do { local $/; <$fh> };
            close $fh;

            my $diff = Text::Diff::diff(\$other_content, \$local_content);
            if ($diff ne '') {
                print "Differences for $file_name in changelist $change:\n$diff\n";
            }
        }
    };

    if ($@) {
        print "An error occurred: $@\n";
    }
    

    
    

    $p4->Disconnect();
}

    #### this is faster ###

sub compare_opened_changes_with_diff2 {
    my $p4 = P4->new();
    $p4->SetProg('p4');

    # List of specific files to compare
    my @specific_files = ('file1', 'file2', 'file3', 'file4', 'file5');

    eval {
        $p4->Connect() or die("Failed to connect to Perforce server: " . $p4->Errors());

        my $client = $p4->GetClient(); # Get the client name

        foreach my $file_name (@specific_files) {
            # Assume the change list is the latest for each file
            my $change = "latest";

            # Get the content of the file from the other depot
            my $print_command = "p4 print -o temp.txt //other_depot/.../$file_name@$change";
            system($print_command);

            # Get the local path of the file in your workspace
            my $local_path = "//path/to/your/workspace/$file_name";

            # Use an external diff tool to compare the content
            my $diff_command = "diff temp.txt $local_path";
            my $diff = `$diff_command`;

            if ($diff ne '') {
                print "Differences for $file_name in changelist $change:\n$diff\n";
            }

            # Delete the temporary file
            unlink "temp.txt";
        }
    };

    if ($@) {
        print "An error occurred: $@\n";
    }

    $p4->Disconnect();
}

