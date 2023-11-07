# Unsorted helpful information about Adobe AEM

## Documentation within the product

In the JCR you find various .rst files, which document
many components etc. In .jsp files there are comments like

    <%--###
    ...
    ###--%>

that give a nice documentation of the component. Many of the Javascript files are also nicely commented, so it pays
to look at the source.

## Sling Context Aware Configuration

[Mini tutorial video](https://www.youtube.com/watch?v=0rlpPOxLyW4) incl. [editor](https://wcm.io/caconfig/editor/)
Don't forget to put the new template into cq:allowedTemplates in the site; sling:configRef properties have to be
added by hand. Or perhaps just add page(s) referring [a cfg template](https://wcm.io/caconfig/editor/usage.html):

<?xml version="1.0" encoding="UTF-8"?>
<jcr:root xmlns:cq="http://www.day.com/jcr/cq/1.0" xmlns:jcr="http://www.jcp.org/jcr/1.0"
xmlns:sling="http://sling.apache.org/jcr/sling/1.0"
jcr:primaryType="cq:Page">
<jcr:content jcr:primaryType="cq:PageContent" sling:resourceType="wcm-io/caconfig/editor/components/page/editor"
cq:template="/conf/wknd/settings/wcm/templates/caconfigurations" jcr:title="configurations"/>
</jcr:root>

## Bugs, weird stuff

### Releasing with

The AEM archetype has in ui.all an auto-clean execution of the maven-clean-plugin for some reason. When doing a
`mvn release:prepare` this leads to a weird
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-gpg-plugin:3.0.1:sign (sign-artifacts) on project ui-ai.
all: The project artifact has not been assembled yet. Please do not invoke this goal before the lifecycle phase "
package". 
