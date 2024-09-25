# Notes about AEM Live Copies

Created 24-09-2024, last change 24-09-2024

## Manually attaching live copies

- create an appropriate node /jcr:content/cq:LiveSyncConfig on the top level page:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<jcr:root xmlns:cq="http://www.day.com/jcr/cq/1.0"
          xmlns:jcr="http://www.jcp.org/jcr/1.0"
          jcr:primaryType="cq:LiveCopy"
          cq:isDeep="{Boolean}true"
          cq:master="/content/gfps/com/en"
          cq:rolloutConfigs="[/libs/msm/wcm/rolloutconfigs/default,/apps/msm/composum-ai/rolloutconfigs/composumAiAutotranslate]">
</jcr:root>
```

- add mixin cq:LiveRelationship to each page

```groovy
dryRun = false;
def statement = "/jcr:root/content/site/com/de//element(*, cq:Page)/jcr:content[not(@jcr:mixinTypes='cq:LiveRelationship')]";
final def result = session.workspace.queryManager.createQuery(statement, 'xpath').execute();
result.nodes.each { node ->
    println("Processing node: " + node.path); // Log the current node path.
    node.addMixin("cq:LiveRelationship");
}
if (dryRun == false) {
    session.save();
} else {
    println("Dry run completed. No changes were saved.");
}
```

## Additional comments

- If a page is deleted it's excluded from the livecopy. To be recreated this exclusion has to be removed (root page
  properties at Live Copy tab).
