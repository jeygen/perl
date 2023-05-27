use strict;
use warnings;

# For Loop
print "For Loop:\n";
for (my $i = 1; $i <= 5; $i++) {
    print "$i ";
}
print "\n\n";

# While Loop
# see diamond.pl for special loop
print "While Loop:\n";
my $j = 1;
while ($j <= 5) {
    print "$j ";
    $j++;
}
print "\n\n";

# Until Loop
print "Until Loop:\n";
my $k = 1;
until ($k > 5) {
    print "$k ";
    $k++;
}
print "\n\n";

# Foreach Loop
print "Foreach Loop:\n";
my @numbers = (1, 2, 3, 4, 5);
foreach my $num (@numbers) {
    print "$num ";
}
print "\n\n";

# Do-While Loop
print "Do-While Loop:\n";
my $l = 1;
do {
    print "$l ";
    $l++;
} while ($l <= 5);
print "\n\n";

# Do-Until Loop
print "Do-Until Loop:\n";
my $m = 1;
do {
    print "$m ";
    $m++;
} until ($m > 5);
print "\n\n";

