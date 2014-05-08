w3c-heading
============

Custom heading element intended to replace `<h1>` to `<h6>` with a single heading element (yup just like [XHTML <h> promised land](http://www.w3.org/TR/xhtml2/mod-structural.html#sec_8.5.)) and the [promise of the HTML outline](http://blog.paciellogroup.com/2013/10/html5-document-outline/).

Try the [demo page](http://thepaciellogroup.github.io/w3c-heading/).

##under the hood
When author uses a &lt;w3c-heading> element the element is styled, has an ARIA [role=heading](http://www.w3.org/TR/wai-aria/roles#heading), and an [aria-level](http://www.w3.org/TR/wai-aria/states_and_properties#aria-level) assigned to reflect its [HTML5](http://www.w3.org/html/wg/drafts/html/master/) [outline depth](http://www.w3.org/html/wg/drafts/html/master/sections.html#outline-depth).

Example:

*source code:*

`&lt;body>` 
`&lt;w3c-heading>this heading has an outline depth of 1&lt;/w3c-heading>`

 `&lt;article>`
 
  `&lt;w3c-heading>this heading has an outline depth of 2&lt;/w3c-heading>`

*generated code:*

`&lt;body>`

`&lt;w3c-heading role="heading" aria-level="1">this heading has an outline depth of 1&lt;/w3c-heading>`

 `&lt;article>`
 
  `&lt;w3c-heading role="heading" aria-level="2">this heading has an outline depth of 2&lt;/w3c-heading>`
   
   `...`

##Currently done:

* Implemented styling (heading size based on `<section>`/`<nav>`/`<article>`/`<aside>` nesting level).
* `<w3c-heading>` elements are given `role="heading"` and an `aria-level` set to heading outline depth.

To do:

* Create spec document.
* Tons of other things...
