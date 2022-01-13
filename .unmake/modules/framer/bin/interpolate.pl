#!/usr/bin/env perl

use strict;
use warnings;
use YAML::XS;
use Data::Dumper;
use HTML::Template;
use File::Basename;

my $htmlFile  = $ARGV[0] || './fragments/top-bar.tmp.html';
my $indexFile = $ARGV[1] || './index/footer.json';

my $index = YAML::XS::LoadFile($indexFile);
my $html  = HTML::Template->new(filename => $htmlFile, die_on_bad_params => 0);

my $indexBaseName = basename $indexFile;
my $indexName = $indexBaseName;

$indexName =~ s/\.\w+$//;

foreach my $page (@{$index})
{
	my $yaml = '';

	my $basename = basename $page->{'article'};

	$page->{'external'} = 0;

	if($basename =~ /\.url$/)
	{
		$page->{'external'} = 1;
	}

	$basename =~ s/\.\w+$//;

	$page->{'url'}   = $basename . '.html';
	$page->{'title'} = $page->{'title'} || $page->{'article'};

	$page->{'short_title'} = $page->{'title'};

	open my $PAGE, '<', $page->{'article'};

	my $ymlEnd = 0;

	while(my $line = <$PAGE>)
	{
		$line =~ s/\t/  /g;

		if($ymlEnd && !$page->{'external'})
		{
			last;
		}

		if($ymlEnd && $page->{'external'})
		{
			chomp $line;
			$page->{'url'} = $line;
			last;
		}

		if($line =~ /^\.\.\.$/)
		{
			$ymlEnd = 1;
		}

		$yaml .= $line;
	}

	my $meta = YAML::XS::Load($yaml);


	$page->{'title'}  = $meta->{'title'}  || $page->{'title'};
	$page->{'weight'} = 0;

	foreach my $indexMeta (@{$meta->{'index'}})
	{
		if($indexMeta->{'name'} eq $indexName)
		{
			$page->{'weight'} = $indexMeta->{'weight'};
		}
	}

	$page->{'short_title'} = $meta->{'short_title'} || $meta->{'title'} || $page->{'short_title'};
}

my @pages = sort {$a->{'weight'} <=> $b->{'weight'}} @{$index};

$html->param('pages', \@pages);

print $html->output;
