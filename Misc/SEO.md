# SEO woes

Since Google has been basically ignoring me (indexing new pages always took many months despite me serving a
pre-digested sitemap.xml), I have trying to improve SEO for my site www.stoerr.net once in a while. Here are some random
things I've learned.

- Using HTTPS is probably pretty important. (I've been running www.stoerr.net from my DSL contract, and 1&1 didn't
  support HTTPS. In the end I moved to a small IONOS virtual server that costs me 1€/month, and the domain there
  absurdly costs 2€/month.)
- the [robots.txt](www.stoerr.net/robots.txt) has a syntax for sitemaps
- Some nice sites to analyze your site are https://pagespeed.web.dev/ , https://observatory.mozilla.org/analyze
- Nice link checkers are e.g. https://www.brokenlinkcheck.com/broken-links.php , https://validator.w3.org/checklink - it
  seems important to have no broken links, too.
- don't use camel case in URLs, use dashes to separate words instead (kebab-case :-) , because bing is seriously
  braindead about that - it just lowercases the URLs, and generates broken links.
- canonical meta-tags might be useful, but you have to make sure they are correct, or the page might not be indexed at
  all.
