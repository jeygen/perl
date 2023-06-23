#!/usr/bin/perl

use strict;
use warnings;
use JSON;

my $log_syn_path = 'log_syn1.txt';
my %map;

open(my $log_syn, '<', $log_syn_path) or die "Opening failed: $!";

while (my $line = <$log_syn>) {
	chomp $line; # removes \n
	$line =~ s/^\s+|\s+$//g; # rm ws before and after string
	
	# (capture group) . is anything but \n
	if ($line =~ /(INFO)./) {
		$map{$1}++;
	}
	if ($line =~ /(WARNING)./) {
		$map{$1}++;
	}
	if ($line =~ /(ERROR)./) {
		$map{$1}++;
	}
}

#print %map;	

#  \ is pass by ref i think
my $json_string = encode_json(\%map);
print "$json_string\n";
