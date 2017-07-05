#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use 5.016;
use autodie qw(:file);
use open qw(:utf8 :std);
use RDF::Trine;

# Pachelbel: Quick and dirty Canonical N-Triples for your RDF files, on the command-line.

say q{Usage: `pachelbel.pl filename.rdf` converts your RDF data to its canonical N-Triples serialisation, output to `filename-canonical.nt` (where `.rdf` is a file extension appropriate to the serialisation format you happen to be using).} and exit unless ($ARGV[0] and $ARGV[0] ne '-h' and $ARGV[0] ne '--help');

# Get the name of our input file:
my $input = shift;

# Create a temporary in-memory triplestore:
my $model = RDF::Trine::Model->new(RDF::Trine::Store->new('Memory'));

# Read in the file data to our store, using an appropriate parser:
open (my $infile, '<', $input);
RDF::Trine::Parser->guess_parser_by_filename($input)->new()->parse_file_into_model(undef, $infile, $model);
close $infile;

# Dump out the whole graph:
open (my $outfile, '>', $input =~ s/\.?[^\.]+$/-canonical.nt/r);
RDF::Trine::Serializer::NTriples::Canonical->new(onfail => 'truncate')->serialize_model_to_file($outfile, $model);
close $outfile;

# Dum da-da-dum da-da da-da da-da-da-da-da-da…
