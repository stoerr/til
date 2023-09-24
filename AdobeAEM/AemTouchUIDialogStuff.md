# Some relevant info about TouchUI Dialog Creation in Adobe AEM

Editing: probably best done with IntelliJ IDEA Live Templates, or a Scala DSL.
Remember to look at the comments in the JSPs of the granite etc. components - they contain documentation.
CAUTION: granite/ui/components/foundation/xxx vs. granite/ui/components/coral/foundation :  

## Links

- [Dialog Documentation](https://experienceleague.adobe.com/docs/experience-manager-65/developing/components/components-basics.html?lang=en)
- [Granite UI Foundation Server-side](https://developer.adobe.com/experience-manager/reference-materials/6-5/granite-ui/api/jcr_root/libs/granite/ui/components/coral/foundation/server.html)
- [Coral UI](https://developer.adobe.com/experience-manager/reference-materials/6-5/coral-ui/coralui3/index.html)
- [Gist with many samples](https://gist.github.com/salomao-santos/0cd0240b9824b52a5fdf777ab712cfe2)

## interesting cq:dialog attributes

helpPath (URL) , extraClientlibs

## Misc

Dialog only fullscreen: _cq_editConfig.xml in component with
<jcr:root xmlns:cq="http://www.day.com/jcr/cq/1.0" xmlns:jcr="http://www.jcp.org/jcr/1.0"
jcr:primaryType="cq:EditConfig" dialogLayout="fullscreen"> </jcr:root>

## [Richtext field](https://experienceleague.adobe.com/docs/experience-manager-65/administering/operations/rich-text-editor.html)

<content jcr:primaryType="nt:unstructured" sling:resourceType="cq/gui/components/authoring/dialog/richtext"
fieldLabel="Content" name="./content" useFixedInlineToolbar="{Boolean}true" />
Javascript: CUI.rte...

## [xmlns:granite="http://www.adobe.com/jcr/granite/1.0"](https://developer.adobe.com/experience-manager/reference-materials/6-5/granite-ui/api/jcr_root/libs/granite/ui/docs/server/commonattrs.html)

- attribute granite:class - additional CSS class
- subnode granite:data - additional data
  attributes , [expression language](https://developer.adobe.com/experience-manager/reference-materials/6-5/granite-ui/api/jcr_root/libs/granite/ui/docs/server/el.html)
  possible
- granite:id , granite:rel , granite:hidden see doc.

## Extending dialogs

For extending component dialogs with Javascript, the clientlib 'cq.authoring.editor.sites.page.hook' is appropriate. 
Also work: cq.authoring.editor.sites.page (doesn't work for page properties) , cq.authoring.dialog (works for page 
properties), does not work: cq.authoring.page

### Stacking dialogs

If you create a dialog from a dialog, it seems both get closed. I solved that for Composum AI by event.preventDefault(),
event.stopPropagation() and removing the dialog HTML. (But I guess there is a better way I don't know yet.)
