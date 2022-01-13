#!/usr/bin/env perl

use strict;
use warnings;
use YAML::XS;
use Data::Dumper;
use HTML::Template;
use File::Basename;

my $indexFile = $ARGV[0] || './index/footer.json';
my $htmlFile  = $ARGV[1] || './fragments/top-bar.tmp.html';

my $index = YAML::XS::LoadFile($indexFile);
my $html  = HTML::Template->new(filename => $htmlFile, die_on_bad_params => 0);

foreach my $page (@{$index})
{
	my $yaml = '';

	open my $PAGE, '<', $page->{'article'};

	my $htmlUrl = basename $page->{'article'};

	$htmlUrl =~ s/\.\w+$/.html/;

	$page->{'url'}   = $htmlUrl;
	$page->{'title'} = $page->{'title'} || $page->{'article'};

	$page->{'short_title'} = $page->{'title'};

	while(my $line = <$PAGE>)
	{
		$line =~ s/\t/  /g;

		last if($line =~ /^\.\.\.$/);

		$yaml .= $line;
	}

	my $meta = YAML::XS::Load($yaml);

	$page->{'title'} = $meta->{'title'} || $page->{'title'};

	$page->{'short_title'} = $meta->{'short_title'} || $meta->{'title'} || $page->{'short_title'};

}

$html->param('pages', $index);

print $html->output;
