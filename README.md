`<w3c-heading>`
================

Custom heading element intended to replace `<h1>` to `<h6>` with a single heading element (yup just like [XHTML <h> promised land](http://www.w3.org/TR/xhtml2/mod-structural.html#sec_8.5.)) and the [promise of the HTML5 outline](http://blog.paciellogroup.com/2013/10/html5-document-outline/).

Try the [demo page](http://thepaciellogroup.github.io/w3c-heading/).

What it does
-------------

When a `<w3c-heading>` element is used, the element is automatically styled as per [HTML5 UA style sheet](http://www.w3.org/html/wg/drafts/html/master/rendering.html#sections-and-headings) advice, is given an ARIA [role=heading](http://www.w3.org/TR/wai-aria/roles#heading), and `level` and [aria-level](http://www.w3.org/TR/wai-aria/states_and_properties#aria-level) attributes to reflect its HTML5 [document outline depth](http://www.w3.org/html/wg/drafts/html/master/sections.html#outline-depth).

This means that it works out its heading level automatically and is accessible to people who use Assistive Technologies (ATs) "out of the box".

This can be seen in action by viewing the [demo page](http://thepaciellogroup.github.io/w3c-heading/) source code (using "View Page Source") and generated code (using DOM inspection tools).

### HTML

Your source code:

```html
. . .
<body>
  <!-- heading scoped to body = level 1 -->
  <w3c-heading>Main Heading</w3c-heading>
  <article>
    <!-- heading nested body → article = level 2 -->
    <w3c-heading>Sub-heading</w3c-heading>
. . .
```

Generated code:

```html
. . .
<body>
  <w3c-heading role="heading" level="1" aria-level="1">Main Heading</w3c-heading>
  <article>
    <w3c-heading role="heading" level="2" aria-level="2">Sub-heading</w3c-heading>
. . .
```

The first `<w3c-heading>` is styled as if it were a `<h1>` and the second `<w3c-heading>` element is styled as if it were a `<h2>`.

### Styling

The way we style `<h1>` to `<h6>` elements:

```css
h1 { ... }
h2 { ... }
```

The `<w3c-heading>` equivalent:

```css
w3c-heading[level="1"] { ... }  /* all level 1 <w3c-heading>s */
w3c-heading[level="2"] { ... }  /* all level 2 <w3c-heading>s */
```

The `level` attribute allows `<w3c-heading>` to be used by people with no knowledge of [aria-level](http://www.w3.org/TR/wai-aria/states_and_properties#aria-level) (though `aria-level` can be used for this also).

You can also style according to how it is nested within elements (this ties the styling to the exact document structure, rather than heading level):

```css
w3c-heading { ... }                  /* level 1 */
section w3c-heading { ... }          /* level 2 */
section section w3c-heading { ... }  /* level 3 */
article section w3c-heading { ... }  /* a different level 3 */
```

### Manually specifiying a heading level

If you are using `<w3c-heading>` with HTML5 [sectioning content](http://www.w3.org/TR/html5/dom.html#sectioning-content) (as above) it is **strongly recommended to *not* manually set the `level` attribute**.

If you do manually set the `level` attribute in your HTML (to a non-zero positive integer, e.g. "4" or "2") then the `<w3c-heading>` will take that level (and that level will be reported to Assistive Technologies (ATs)).  You would need to do this when making use of `<w3c-heading>` outside of HTML5 [sectioning content](http://www.w3.org/TR/html5/dom.html#sectioning-content) (e.g. if you are using nested `<div>`s instead of those sectioning elements).

You may also want to read our [micro-spec for how the `level` attribute behaves](https://github.com/ThePacielloGroup/w3c-heading/issues/16).

Development status
-------------------

Currently done:

* Implemented styling (heading size based on `<section>`/`<nav>`/`<article>`/`<aside>` nesting level).
* `<w3c-heading>` elements are given `role="heading"` and a `level` and `aria-level` set to heading outline depth.

To do:

* Create spec document.
* Tons of other things...
