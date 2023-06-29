# Open file and count the total and individual words

# Use regex to count occurence of a words: cat, catz, dog

# Write a script that reads a file and counts the number of lines, words, and characters.
# Similar to the Unix 'wc' command.

# Given a server log file, write a script that identifies and prints the most common IP address.



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

        # Open the file
        open(my $fh, '<', 'file.txt') or die "Could not open file 'file.txt' $!";
        
        my $count_cat = 0;
        my $count_dog = 0;
        
        # Read through the file line by line
        while (my $line = <$fh>) {
            # Count occurrences of 'cat' and 'dog'
            while ($line =~ m/\b(catz?|dog)\b/gi) {
                if ($1 =~ m/\bcatz?\b/gi) {
                    $count_cat++;
                } elsif ($1 =~ m/\bdog\b/gi) {
                    $count_dog++;
                }
            }
        }
        
        print "Count of 'cat' or 'catz': $count_cat\n";
        print "Count of 'dog': $count_dog\n";
        
        # Don't forget to close the file
        close($fh);




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















































