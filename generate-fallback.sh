#!/bin/bash
# Generate the fallback version of html5-h that extends h1 from the main version
SRC=html5-h.html
OUT=fallback/html5-h.html
cat $SRC | \
	sed 's/components\/polymer/..\/components\/polymer/' | \
	sed 's/attributes="level"/attributes="level" extends="h1"/' | \
	sed "/'role', 'heading'/d" \
	> $OUT && \
diff -u $SRC $OUT
