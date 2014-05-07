w3c-heading
============

Custom heading element intended to replace `<h1>` to `<h6>` with a single heading element (yup just like [XHTML &lt;h> promised land](http://www.w3.org/TR/xhtml2/mod-structural.html#sec_8.5.)) and the [promise of the HTML outline](http://blog.paciellogroup.com/2013/10/html5-document-outline/).

Currently done:

* Implemented styling (heading size based on `<section>`/`<nav>`/`<article>`/`<aside>` nesting level) using -moz/-webkit properties. Try the [demo page](http://thepaciellogroup.github.io/w3c-heading/) in Firefox, Chrome or Safari.
* `<w3c-heading>` elements are given `role="heading"` and an `aria-level` set to heading outline depth.

To do:

* Get styling to work in IE (now works in chrome/webkit/firefox)
* Create spec document.
* Tons of other things am sure...
