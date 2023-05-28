# Open file and count the total and individual words

my $total_words;
my %num_per_words;

open(my $wd, '<', 'log_syn1.txt') or die "no good with, $1";

while (my $line = <$wd>) {
	chomp $line;
	my @words = split /\s+/, $line;
	$total_words += scalar @words;
	foreach my $w (@words) {
		$num_per_words{$w}++;
	}
}

close($wd);

foreach my $key (keys %num_per_words) {
    print "Key: $key, Value: $hashmap{$key}\n";
}

print "$total_words";

# Use regex to count occurence of a word
