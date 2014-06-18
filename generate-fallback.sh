#!/bin/bash
# Generate the fallback version of w3c-h that extends h1 from the main version
SRC=w3c-h.html
OUT=fallback/w3c-h.html
cat $SRC | \
	sed 's/components\/polymer/..\/components\/polymer/' | \
	sed 's/attributes="level"/attributes="level" extends="h1"/' | \
	sed "/'role', 'heading'/d" \
	> $OUT && \
diff -u $SRC $OUT
