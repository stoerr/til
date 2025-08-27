# Creating Javascript Bookmarklets

An interesting option for performing small actions in the browser is to write a Javascript bookmarklet - which are a 
bookmark that does not open a new URL but contains a small piece of Javascript code that is executed on the 
currently shown page instead. The most interesting example I've seen so far is probably the Printliminator, which 
allows you to selectively remove stuff from the page before printing it from the browser, and, of course, my ChatGPT 
bookmarklet. :-) More examples are below. But a bit of the how first.

Creating a bookmarklet is easy: open the inspector / debugger in the browser, develop a bit of Javascript code that 
does what you want, url-encode that, put `javascript:` in front of it and then make a bookmark with 
that URL and you're done. Still too complicated? Here is my 
[bookmarklet maker](https://chatgpttools.stoerr.net/bookmarkletmaker/bookmarkletmaker.html) 
that lets you input the name of 
the bookmark and the Javascript code and then shows a link which you can just drag into your bookmark bar. If you've 
treated yourself to an OpenAI API key you can even just type in a description what it should do and then let ChatGPT 
create the Javascript code for you.

If you're creating bookmarklets programmatically you can also include the function that should be executed verbatim
into the Javascript file and use toString() of that function to create the actual bookmarklet. That trick is e.g.
used in my [ChatGPT Tools bookmarklets](https://chatgpttools.stoerr.net/) (see
[the source](https://github.com/stoerr/chatGPTtools/blob/develop/docs/index.html) ).
