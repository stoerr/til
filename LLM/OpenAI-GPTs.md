# Some experimental results about OpenAI GPTs

I've been doing two [OpenAI GPTs](https://openai.com/blog/introducing-gpts).
[Co-Developer GPT Engine](https://codevelopergptengine.stoerr.net/) and
[JCR Actions for GPTs](https://github.com/stoerr/JCRActionsForGPT), and some more tests. These are some experiences with
that.

## Actions

The OpenAPI descriptions that worked for ChatGPT plugins work immediately with the GPTs. You just have to move the
information that was in the ai-plugin.json into the GPT configuration itself. The GPT Builder assistant gives you a good
shot at it when you just paste in the ai-plugin.json. Possibly it's best to configure the actions per hand before doing
that.

Returning JSON and text files as response is fine. Returning images
[so far not](https://community.openai.com/t/gpt-using-vision-capabilities-for-images-returned-from-actions/578434) .

## Knowledge

The files uploaded as knowledge can be used two ways.

### Using knowledge with the code interpreter

If you upload a zip or individual files and enable the code interpreter, the GPT can use that. Likely you can include
python programs to execute (didn't try that yet), but the GPT can create python programs to use the files, though it
seems to make sense to give it specific instructions. Probably it makes much sense to include python programs to search
for stuff etc. to speed up things. It can show images but as of 1/24 I couldn't get it to use its visual capabilities
on them.

### Using the knowledge directly (RAG style)

If you don't enable the code interpreter, the GPT can use the files directly. I tried .md, .txt, .png and
.html and .zip files - as of 1/24 it could deal only with .txt and .html files but could easily answer questions
from the contained text. I suppose it's best to include the information you want the GPT to use into one or a few
.txt files in markdown format, or perhaps as HTML if that's what you have (probably that's more difficult for the GPT).

## Implementation guidelines for actions

### Error handling

Remember: a GPT is also just a (well, not quite) human. Give it a good error message, so that it can either recover from
the error and retry, or at least tell the user what went wrong. Examples are:

- "Give exactly one of the fileName or fileRegex parameters."
- "I couldn't find the file you asked for. Please check the file name and try again. You could retry giving a regex
  pattern for the file name. These files are similar, perhaps you meant one of : {list of files}"
- "The parameter fileRegex has to be a Java flavor regular expression, but: {error message describing the error}"
- "The file {filename} is too long: it has {linecount} lines - please give a line range or do a regex search instead."
