# Use regex to count occurence of a words: cat, catz, dog
# and output to a new file named 'petz.txt'

# Write a script that reads a file and counts the number of lines, words, and characters.
# Similar to the Unix 'wc' command.

# Given a server log file, write a script that identifies and prints the most common IP address.

# Script to traverse file system and look for files with duplicate content (files could have the
# same name tho)

# Script to deploy app on multiple servers with diff os, ensure dependecies are all there


# Open file and count the total and individual words
 #!/usr/bin/perl
        use strict;
        use warnings;
        
        # The name of the file to open
        my $filename = 'myfile.txt';
        
        # Open the file or exit with error message
        open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
        
        # Initialize counters
        my $total_count = 0;
        my %word_counts;
        
        # Read the file line by line
        while (my $row = <$fh>) {
            chomp $row;
            
            # Split the line into words
            my @words = split /\s+/, $row;
            
            # Increase the total count by the number of words on this line
            $total_count += @words;
        
            # Increase the individual word counts
            for my $word (@words) {
                $word_counts{$word}++;
            }
        }
        
        # Close the file
        close $fh;
        
        # Print the total word count
        print "Total words: $total_count\n";
        
        # Print the counts for each individual word
        for my $word (sort keys %word_counts) {
            print "$word: $word_counts{$word}\n";
        }


# Use regex to count occurence of a words: cat, catz, dog

	#!/usr/bin/perl
	use strict;
	use warnings;

	my %pm;
	my $results = 'petz.txt';

	# Open the file for reading
	open(my $rf, '<', 'animals.txt') or die "Could not open animals.txt: $!";

	# Open the file for writing
	open(my $wf, '>', $results) or die "Could not open $results: $!";

	# Read lines from the file
	while (my $line = <$rf>) {
	    chomp $line;
	    # Search for occurrences of cat, dog, or catz
	    while ($line =~ m/\b(cat|dog|catz)\b/g) {
		$pm{$1}++;
	    }
	}

	# Write the results to the output file
	foreach my $key (keys %pm) {
	    print $wf "$key: $pm{$key}\n";
	}

	# Close the file handles
	close $rf;
	close $wf;




# Write a script that reads a file and counts the number of lines, words, and characters.
# Similar to the Unix 'wc' command.

# Given a server log file, write a script that identifies and prints the most common IP address.
# This involves parsing and processing a potentially large text file.

#!/usr/bin/perl
use strict;
use warnings;

# We'll use a hash to count occurrences of each IP address
my %ip_hash;

# Open the file
my $file_path = '~/learning_repos/perl/parse_me_files/ip_logs.txt';
open(my $fh, '<', $file_path) or die "Could not open file '$file_path' $!";

# Loop over each line in the file
while (my $line = <$fh>) {
    chomp $line;
    
    # Find IP addresses in the line and increment their count in the hash
    while ($line =~ m/\b(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\b/g) {
        $ip_hash{$1}++;
    }
}

# Close the file
close($fh);

# Identify and print the most common IP address
my $most_common_ip;
my $most_common_ip_count = 0;
while (my ($ip, $count) = each %ip_hash) {
    if ($count > $most_common_ip_count) {
        $most_common_ip_count = $count;
        $most_common_ip = $ip;
    }
}

if (defined $most_common_ip) {
    print "Most common IP address is $most_common_ip with $most_common_ip_count occurrences\n";
} else {
    print "No IP addresses found\n";
}

# comparing contents of files

#!/usr/bin/perl
use strict;
use warnings;
use Digest::MD5;
use File::Find;

my %files;
my $start_dir = '/path/to/start/dir';  # Change this to your starting directory

find(sub {
    return if -d;   # Skip directories

    open my $fh, '<', $_ or return;
    binmode $fh;
    
    my $digest = Digest::MD5->new->addfile($fh)->hexdigest;
    push @{$files{$digest}}, $File::Find::name;

}, $start_dir);

foreach my $digest (keys %files) {
    if (@{$files{$digest}} > 1) {
        print "Duplicates files for $digest found:\n";
        print "$_\n" for @{$files{$digest}};
    }
}












































