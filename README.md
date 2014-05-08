w3c-heading
============

Custom heading element intended to replace `<h1>` to `<h6>` with a single heading element (yup just like [XHTML <h> promised land](http://www.w3.org/TR/xhtml2/mod-structural.html#sec_8.5.)) and the [promise of the HTML outline](http://blog.paciellogroup.com/2013/10/html5-document-outline/).

Try the [demo page](http://thepaciellogroup.github.io/w3c-heading/).

##under the hood
When a `<w3c-heading>` element is used  the element is styled as per [HTML5 UA style sheet](http://www.w3.org/html/wg/drafts/html/master/rendering.html#sections-and-headings) advice, has an ARIA [role=heading](http://www.w3.org/TR/wai-aria/roles#heading), and an [aria-level](http://www.w3.org/TR/wai-aria/states_and_properties#aria-level) assigned to reflect its [HTML5](http://www.w3.org/html/wg/drafts/html/master/) [outline depth](http://www.w3.org/html/wg/drafts/html/master/sections.html#outline-depth).  

###Example:

This can be seen in action by viewing the [demo page](http://thepaciellogroup.github.io/w3c-heading/) source code (view source) and generated code (using firebug for example)

*source code:*

`<body>`  
`<!-- heading scoped to body = level 1 -->`  
`<w3c-heading>this heading has an outline depth of 1</w3c-heading>`  
`<article>` 
`<!-- heading nested body → article = level 2 -->`  
`<w3c-heading>this heading has an outline depth of 2</w3c-heading>`  
`...`

*generated code:*

`<body>`  
`<w3c-heading role="heading" aria-level="1">this heading has an outline depth of 1</w3c-heading>`  
`and a default style of a <h1>`  
`<article>`  
`<w3c-heading role="heading" aria-level="2">this heading has an outline depth of 2</w3c-heading>`  
`and a default style of a <h2>`  
`...`

##Currently done:

* Implemented styling (heading size based on `<section>`/`<nav>`/`<article>`/`<aside>` nesting level).
* `<w3c-heading>` elements are given `role="heading"` and an `aria-level` set to heading outline depth.

To do:

* Create spec document.
* Tons of other things...
