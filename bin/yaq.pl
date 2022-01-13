#!/usr/bin/env perl

use strict;
use warnings;
use YAML::XS;
use Data::Dumper;

#Disable output buffering.
$| = 1;

# Die unless we've got a YML file.
$ARGV[0] or die 'No YAML file specified.';
open my $file, $ARGV[0];
my $yml = '';

# Find all the YML up to the "..." line.
# Exit if we don't find any
while(<$file>)
{
	exit if $_ !~ m/---/ && !$yml;
	last if $_ =~ m/^\.\.\.$/;
	$yml .= $_;
}

my $front = YAML::XS::Load($yml);

sub lookup
{
	my $current = $front;
	my @crumbs  = ();

	for(@_)
	{
		my $type = ref $current;

		if($type eq 'HASH')
		{
			if(exists $current->{ $_ })
			{
				$current = $current->{ $_ };
			}
			else
			{
				$current = '';
			}

			push @crumbs, $_;
		}
		elsif($type eq 'ARRAY')
		{
			if($_ eq '#')
			{
				for(my $i = 0; $i < @$current; $i++)
				{
					lookup(@crumbs, $i, @_[2+$#crumbs..$#_]);
				}
				return;
			}
			elsif(exists $current->[ $_ ])
			{
				$current = $current->[ $_ ];
			}
			else
			{
				$current = '';
			}

			push @crumbs, $_;
		}
		else
		{
			my $keyString = join(' ', @crumbs);
			warn "\e[033m$keyString\e[0m is a scalar (\"$current\"), cannot traverse.";
			return;
		}
	}

	print "$current\n";
}

while(<STDIN>)
{
	chomp;
	last unless $_;
	lookup(split(' ', $_));
}

1;
