`<html5-h>`
============

Custom heading element intended to replace `<h1>` to `<h6>` with a single heading element (yup just like [XHTML <h> promised land](https://www.w3.org/TR/xhtml2/mod-structural.html#sec_8.5.)) and the [promise of the HTML5 outline](https://blog.paciellogroup.com/2013/10/html5-document-outline/).

Try the [demo page](https://thepaciellogroup.github.io/html5-h/).

What it does
-------------

When a `<html5-h>` element is used, the element is automatically styled as per [HTML5 UA style sheet](http://www.w3.org/html/wg/drafts/html/master/rendering.html#sections-and-headings) advice, is given an ARIA [role=heading](http://www.w3.org/TR/wai-aria/roles#heading), and `level` and [aria-level](http://www.w3.org/TR/wai-aria/states_and_properties#aria-level) attributes to reflect its HTML5 [document outline depth](http://www.w3.org/html/wg/drafts/html/master/sections.html#outline-depth).

This means that it works out its heading level automatically and is accessible to people who use Assistive Technologies (ATs) "out of the box".

This can be seen in action by viewing the [demo page](https://thepaciellogroup.github.io/html5-h/) source code (using "View Page Source") and generated code (using DOM inspection tools).

### HTML

Your source code:

```html
. . .
<body>
  <!-- heading scoped to body = level 1 -->
  <html5-h>Main Heading</html5-h>
  <article>
    <!-- heading nested body → article = level 2 -->
    <html5-h>Sub-heading</html5-h>
. . .
```

Generated code:

```html
. . .
<body>
  <html5-h role="heading" level="1" aria-level="1">Main Heading</html5-h>
  <article>
    <html5-h role="heading" level="2" aria-level="2">Sub-heading</html5-h>
. . .
```

By default, the first `<html5-h>` is styled as if it were a `<h1>` and the second `<html5-h>` element is styled as if it were a `<h2>`.

### Styling

The way we style `<h1>` to `<h6>` elements:

```css
h1 { ... }
h2 { ... }
```

The `<html5-h>` equivalent:

```css
html5-h[level="1"] { ... }  /* all level 1 <html5-h>s */
html5-h[level="2"] { ... }  /* all level 2 <html5-h>s */
```

The `level` attribute (set automatically for you) allows `<html5-h>` to be used by people with no knowledge of [aria-level](http://www.w3.org/TR/wai-aria/states_and_properties#aria-level) (though `aria-level` can be used for this also).

You can also style according to how it is nested within elements (this ties the styling to the exact document structure, rather than heading level):

```css
html5-h { ... }                  /* level 1 */
section html5-h { ... }          /* level 2 */
section section html5-h { ... }  /* level 3 */
article section html5-h { ... }  /* a different level 3 */
```

### Manually specifiying a heading level

If you are using `<html5-h>` with HTML5 [sectioning content](https://www.w3.org/TR/html5/dom.html#sectioning-content) (as above) it is **strongly recommended to *not* manually set the `level` attribute**, as the level will be computed for you.

If you do manually set the `level` attribute in your HTML (to a non-zero positive integer, e.g. "4" or "2") then the `<html5-h>` will take that level (and that level will be reported to Assistive Technologies (ATs)).  You would need to do this when making use of `<html5-h>` outside of HTML5 [sectioning content](https://www.w3.org/TR/html5/dom.html#sectioning-content) (e.g. if you are using nested `<div>`s instead of those sectioning elements).

You may also want to read our [micro-spec for how the `level` attribute behaves](https://github.com/ThePacielloGroup/html5-h/issues/16).

### Stand-alone and fallback versions

We recommend using the stand-alone `<html5-h>` element described above, as long as:

 * You are using HTML5 and doing sectioning entirely with HTML5 [sectioning content](https://www.w3.org/TR/html5/dom.html#sectioning-content).
 * JavaScript will be available.

Even if you're not using HTML5 sectioning elements exclusively, you can still use the stand-alone `<html5-h>`, but you'll need to set the `level` attribute manually for headings outside of HTML5 sectioning elements. (Note that you can ignore `<header>` elements, as they're not considered sectioning contnet the automatically-computed level will still be correct.)

Alternatively, or if JavaScript may be unavailable, you should consider using the fallback version of `<html5-h>` that extends `<h1>` instead.

Using the fallback has the advantage that a genuine heading element will be apparent in the browser, even when JavaScript is unavailable.  However, all headings will be `<h1>`s, so accessibility wouldn't be ideal---but would be better than no headings at all.

Both the stand-alone and fallback versions can be used directly from this repository.  The `generate-fallback.sh` script is simply a development tool that can be run on UNIX systems to update the fallback version's code when the stand-alone code changes.

There is a [demo page for the fallback version](https://thepaciellogroup.github.io/html5-h/demo-fallback.html).

Development status
-------------------

Currently done:

* Implemented styling (heading size based on `<section>`/`<nav>`/`<article>`/`<aside>` nesting level).
* `<html5-h>` elements are given `role="heading"` and a `level` and `aria-level` set to heading outline depth.

To do:

* Create spec document.
* Tons of other things...
