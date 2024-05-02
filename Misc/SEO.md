# SEO woes

Created 29-12-2023, last change 01-05-2024

Since Google has been basically ignoring me (indexing new pages always took many months despite me serving a
pre-digested sitemap.xml), I have trying to improve SEO for my site www.stoerr.net once in a while. Here are some random
things I've learned.

- Using HTTPS is probably pretty important. (I've been running www.stoerr.net from my DSL contract, and 1&1 didn't
  support HTTPS. In the end I moved to a small IONOS virtual server that costs me 1€/month, and the domain there
  absurdly costs 2€/month.) Install a HTTP to HTTPS 301 redirect, too.
- the [robots.txt](https://www.stoerr.net/robots.txt) has a syntax for sitemaps. Actually having a robots.txt seems to
  be pretty
  important, too - at least for ChartGPT.
- Some nice sites to analyze your site are https://pagespeed.web.dev/ , https://observatory.mozilla.org/analyze
- Nice link checkers are e.g. https://www.brokenlinkcheck.com/broken-links.php , https://validator.w3.org/checklink - it
  seems important to have no broken links, too.
- don't use camel case in URLs, use dashes to separate words instead (kebab-case :-) , because bing is seriously
  braindead about that - it just lowercases the URLs, and generates broken links.
- canonical meta-tags might be useful, but you have to make sure they are correct, or the page might not be indexed at
  all.
- https://www.bing.com/webmasters/ and https://search.google.com/search-console/ are pretty helpful to find out part of
  what they want - but only a part of it. Asking ChatGPT about general tips is always helpful, too.
- https://seorch.de/ - very interesting SEO check

At least it was worth the effort. After Google has been ignoring new pages for months, it has indexed the missing new
pages within 2 weeks. I guess that was mostly because of the introduction of HTTPS, but I did some improvements for the
mobile view, too, which the [Google search console](https://search.google.com/search-console/) complained about.

## Social Media Banners

Not quite SEO, but important: the different formats of social media banners for sharing your site are seriously
annoying. After googling around I suppose 1200x600 is a good format, though you should expect some pixels being 
cropped from all sides, depending on the platform. For LinkedIn it seems 1200x627 is perfect without cropping.
There should be meta-tags og:title, og:description, og:image,
if you want to be thorough also og:image:alt, og:image:width, og:image:height, og:image:type, og:locale ,
if you want being twitter optimized there are also the twitter: pendants , though they 
[fall back to og](https://developer.twitter.com/en/docs/twitter-for-websites/cards/overview/)
[Probably](https://sproutsocial.com/insights/twitter-cards/)
<meta name=”twitter:card” content=”summary” /> 
is right for that image format, if you use the same image.

[opengraph.xyz](https://www.opengraph.xyz/) is not only a validator but also generates suggestions for the tags. 
