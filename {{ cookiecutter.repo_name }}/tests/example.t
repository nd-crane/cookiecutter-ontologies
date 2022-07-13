#!/bin/sh

test_description="Example Ontology Design Pattern"


: "${SHARNESS_TEST_SRCDIR:=.}"

. "$SHARNESS_TEST_SRCDIR/sharness.sh"


TESTDIR="$SHARNESS_TEST_DIRECTORY/example"
MODULEDIR="$SHARNESS_TEST_DIRECTORY/../modules/common"
ONTDIR="$SHARNESS_TEST_DIRECTORY/../"

test_expect_failure "Test event pattern failure nodes " "
    pdm run pyshacl -m -i both -e '$MODULEDIR/example-module.ttl' -s '$MODULEDIR/example.shacl.ttl' '$TESTDIR/example.invalid.ttl'
"

test_expect_success "Test event ontology pattern " "
    pdm run pyshacl -m -i both -e '$MODULEDIR/example-module.ttl' -s '$MODULEDIR/event.example.ttl' '$TESTDIR/event.example.ttl'
"


test_done