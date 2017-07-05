# Pachelbel

*Quick and dirty Canonical N-Triples for your RDF files, on the command-line.*

## Description

Pachelbel takes and RDF file as input, and outputs the RDF graph in its [Canonical N-Triples](https://www.w3.org/TR/n-triples/#canonical-ntriples) form. This can be useful if you want to `diff` two graphs, or if you want to [digitaly sign](http://www.hpl.hp.com/techreports/2003/HPL-2003-142.pdf) an RDF graph.

Pachelbel is a simple wrapper around a few [RDF::Trine](https://metacpan.org/pod/RDF::Trine) functions; as such it can parse all RDF serialisation formats with a corresponding [RDF::Trine::Parser](https://metacpan.org/pod/RDF::Trine::Parser). At the time of writing, this means pretty much all common and uncommon RDF serialisations except for JSON-LD.

## Usage

`pachelbel.pl filename.rdf` converts your RDF data to its canonical N-Triples serialisation, output to `filename-canonical.nt` (where `.rdf` is a file extension appropriate to the serialisation format you happen to be using).

## About

This script exists mostly to scratch an itch: I needed to serialise some RDF as Canonical N-Triples, and to my surprise could not find a simple command-line utility that would do this for me. [`rdfpipe`](https://rdflib.readthedocs.io/en/stable/apidocs/rdflib.tools.html#module-rdflib.tools.rdfpipe) does not seem to do it; I *know* that [Apache Jena](https://jena.apache.org/) *can* do it, because I seem to recall that that's part of [the method its `rdfcompare` tool uses](http://blog.datagraph.org/2010/03/rdf-isomorphism) to determine graph isomorphism – but the documentation of the Jena command-line tools is so poor that I gave up trying to work out how to do it using `arq` or any of the other tools, and wrote this instead. If anyone knows of a better, faster solution, please let me know! I'm sure there is one, I've just not been able to find it!
