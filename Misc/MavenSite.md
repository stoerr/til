# Creating Maven Sites

## Links

Description at
https://maven.apache.org/plugins/maven-site-plugin

Available skins discussed at https://maven.apache.org/skins/index.html ;
https://maven.apache.org/skins/maven-fluido-skin/ looks nice, obviously well supported, but looks very maven.

mkdocs variant of this looks nice:
https://stevecrox.github.io/maven-site-bootstrap-skin/bootstrap-site-skin-example-parent/boostrap-site-skin-mkdocs/index.html
but this seems not very well supported. (I love the cerulean bootswatch theme, though. :-)

Very impressive alternative https://devacfr.github.io/reflow-maven-skin/ , but is a bit of work to use.

Super list of examples using many many reports : https://wiverson.github.io/maven-site-docs-example/

## Inheritance

I'm not sure whether this is "normal" but I had the problem that all menus in the submodules vanished once I put a
site.xml in. The only way I found to put it back was putting into the `<body>` there:

    <menu ref="parent" inherit="bottom" inheritAsRef="false"/>
    <menu ref="modules" inherit="bottom" inheritAsRef="false"/>
    <menu ref="reports" inherit="bottom" inheritAsRef="false"/>

## Detailed configuration

https://maven.apache.org/plugins/maven-site-plugin/examples/sitedescriptor.html

## Markdown pecularities

The [site archetype](https://maven.apache.org/archetypes/maven-archetype-site/summary.html) had the following
interesting macro - [there are others](https://maven.apache.org/doxia/macros/index.html), too, probably the most
useful is [snippet](https://maven.apache.org/doxia/macros/index.html#Snippet_Macro) .

    <!-- MACRO{toc|fromDepth=1|toDepth=2} -->
