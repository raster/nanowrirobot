#!/usr/bin/perl -w
#
############################################################################
#
#          Name: nanowrirobot.pl
#        Author: Pete Prodoehl
#  Author-Email: pete@rasterweb.net
#    Author-URL: http://rasterweb.net/raster/
#
############################################################################

############################################################################
#
# run with
# perl nanowrirobot.pl /usr/share/dict/words 
# or
# perl nanowrirobot.pl text-file.txt
# where text-file.txt is a text file containing one word per line.

# set some numbers for how many words are in a sentence and how 
# many sentences are in a paragraph.
$wisbase = 5;
$sipbase = 12; 

# add some random number to those numbers so there is a little 
# bit of variance between the sentences and paragraphs.
$wisrand = 5;
$siprand = 6;

$wis = ($wisbase + int(rand($wisrand)));
$sip = ($sipbase + int(rand($siprand)));

# sets how many words you want in your novel. 50,000 at least!
$wordcount = 50000;


my @words;
my $totalwords = 0;

while (<>) {
	chomp($_);
	push (@words, $_);
}

$max = @words;

while ($totalwords < $wordcount) {

	print "\t";
	
	for ($j = 0; $j < $sip; $j++) {
		
		$sentence = "";
		
		for ($i = 0; $i < $wis; $i++) {
			$sentence = $sentence . $words[int(rand($max))] . " ";
			$totalwords++;
		}
		
		$sentence = ucfirst ($sentence);
		$sentence =~ s/\s$/\. /;
		
		print $sentence . " ";
	
	}
	
	print "\n\n";

}

# uncomment if you want it to tell you how many words are in your novel
# print "TOTAL WORD COUNT ---> $totalwords\n\n";




__END__


=head1 NAME

nanowrirobot.pl

=head1 DESCRIPTION

This scripts writes a novel for you. You do the hard part of assembling a word 
list and it does the easy work of putting all the words together into a novel.

=head1 AUTHOR

Pete Prodoehl E<lt>pete@rasterweb.netE<gt>

=head1 LICENSE

This program is free software; you can redistribute it and/or modify it 
under the terms of the GNU General Public License as published by the Free 
Software Foundation.

=cut




