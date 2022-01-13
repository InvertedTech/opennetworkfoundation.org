#!/usr/bin/env perl

use strict;
use warnings;
use YAML::XS;
use Data::Dumper;
use HTML::Template;
use File::Basename;

my $htmlFile = $ARGV[0] || './fragments/layout.frag.html';
my $bodyFile = $ARGV[1] || 0;

my $html = HTML::Template->new(filename => $htmlFile, die_on_bad_params => 0);

if($bodyFile)
{
	open my $BODY, '<', $bodyFile;

	my @bodyLines = <$BODY>;

	if($bodyLines[0] eq "---\n")
	{
		while($bodyLines[0] ne "...\n")
		{
			shift @bodyLines;
		}

		shift @bodyLines;
	}

	$html->param('body', join "", @bodyLines);
}

print $html->output;

my $time = time;
