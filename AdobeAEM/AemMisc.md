# Unsorted helpful information about Adobe AEM

## Documentation within the product

In the JCR you find various .rst files, which document 
many components etc.  In .jsp files there are comments like

    <%--###
    ...
    ###--%>

that give a nice documentation of the component. Many of the Javascript files are also nicely commented, so it pays 
to look at the source.

## Bugs, weird stuff

### Releasing with 

The AEM archetype has in ui.all an auto-clean execution of the maven-clean-plugin for some reason. When doing a 
`mvn release:prepare` this leads to a weird
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-gpg-plugin:3.0.1:sign (sign-artifacts) on project ui-ai. all: The project artifact has not been assembled yet. Please do not invoke this goal before the lifecycle phase "package". 
