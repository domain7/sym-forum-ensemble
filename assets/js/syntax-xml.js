jQuery(function() {
  /*

  This function loops through all <pre> elements in the document, applying syntax
  highlighting for XML-like languages. Feel free to reuse/repurpose it!

  -> created by Scott Hughes on 2009/04/30
  -> last updated 2009/05/26
  -> released under the terms of the MIT Licence: http://www.opensource.org/licenses/mit-license.php

  */

  var COMMENT = '<span class="comment">&lt;',
      CDATA   = '<span class="cdata">&lt;',
      DOCTYPE = '<span class="doctype">&lt;',
      ELEMENT = '&lt;',
      ATTR_A  = '<span class="attribute">',
      ATTR_B  = '</span><span class="attribute-data">',
      TEXT    = '<span class="text">',
      END     = '</span>',
      PARSER  = /<([?!](?:--(?:[^-]*-)+?(-)|\[CDATA\[(?:[^\]]*])+?(])|[^>]*)>)(\s*)|(?:<([^\s<>&]*)|(\s+)([^\s/<>&=]+=?)("[^"]*"|'[^']*'|[^\s/<>]*))(\s*\/?>\s*|)|[^<]+/g;

  var m = document.getElementsByTagName('pre'),
      i = 0;

  (function next() {
    if (m.length === i) {
      return;
    }

    var o = m[i++],
        d = trim(o.textContent || o.innerText);

    if (d.charAt(0) !== '<' || d.charAt(d.length - 1) !== '>') { // I guess it's not XML.
      next();
      return;
    }

    var a = [],
        p = o.cloneNode(false);

    (function replace() {
      var $,
          t = +new Date + 100; // If the following takes more than .1s, sleep for a moment to let the main thread catch up, then resume.

      do {
        if ($ = PARSER.exec(d)) {
          if ($[5]) {
            a.push(ELEMENT, $[5], $[9]);
          } else if ($[6]) {
            a.push($[6], ATTR_A, $[7], ATTR_B, encode($[8]), END, $[9]);
          } else if ($[2]) {
            a.push(COMMENT, encode($[1]), END, $[4]);
          } else if ($[3]) {
            a.push(CDATA, encode($[1]), END, $[4]);
          } else if ($[1]) {
            a.push(DOCTYPE, encode($[1]), END, $[4]);
          } else {
            a.push(TEXT, encode($[0]), END);
          }
        } else {
          p.innerHTML = a.join('');
          p.className = 'element';

          o.parentNode.replaceChild(p, o);
          setTimeout(next, 20);

          return;
        }
      } while (+new Date < t);

      setTimeout(replace, 20);
    })();
  })();

  function trim(s) {
    for (var i = s.length; /\s/.test(s.charAt(--i)););

    return s.slice(s.search(/\S/), i + 1);
  }

  function encode(data) {
    return data.replace(/&/g, '&amp;').replace(/</g, '&lt;');
  }
});