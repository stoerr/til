# Notes about AEM Live Copies

## Manually attaching live copies

- create an appropriate node jcr:content/cq:LiveSyncConfig on the top level page:

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

Caution: this way all components in the page are viewed as new and will be replaced on rollout and cannot be 
cancelled. So you will likely want to add the cq:LiveRelationship mixin to all nodes in the page (except internal 
stuff starting with cq: or rep:) to make them inherit.

## Additional comments

- If a page is deleted it's excluded from the livecopy. To be recreated this exclusion has to be removed (root page
  properties at Live Copy tab).
- CAUTION: The rolled out components a live copy page also have a cq:LiveRelationship mixin. -> more is necessary

## Internal structure

JCR Queries:
`/jcr:root/content//gfps//element(cq:LiveSyncConfig,cq:LiveSyncConfig)` ,
`/jcr:root/content//gfps//element(cq:BlueprintSyncConfig,cq:BlueprintSyncConfig)`

- jcr:content/cq:BlueprintSyncConfig in blueprint:
  - cq:rolloutConfigs : 
- jcr:content/cq:LiveSyncConfig in live copy:

## References

https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/sites/administering/reusing-content/msm/live-copy-sync-config
referencesUpdate This synchronization action updates references on the Live Copy.
It searches for paths in the Live Copy pages that point to a resource within the blueprint. When found, it updates the
path to point to the related resource inside the Live Copy. References that have targets outside the blueprint are not
changed.

https://github.com/AdobeDocs/experience-manager-65.en/blob/main/help/sites-administering/msm.md

https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/sites/administering/reusing-content/msm/live-copy-sync-config
Blueprint page properties: When a Live Copy is based on a blueprint, and the Live Copy page is not configured with a
rollout configuration, the rollout configuration that is associated with the blueprint source page is used.

