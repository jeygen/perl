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

