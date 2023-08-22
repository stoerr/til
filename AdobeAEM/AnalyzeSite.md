# Analyze a site

Some ideas how to get an overview over the structure of a site.

## Structure of components

Deploy from https://github.com/ist-dresden/composum-nodes the xtracts/debugutil , see 
javadoc of [ComponentDerivationTreeServlet](https://github.com/ist-dresden/composum-nodes/blob/develop/xtracts/debugutil/src/main/java/com/composum/nodes/debugutil/ComponentDerivationTreeServlet.java)
Mermaid for Github Markdown: http://localhost:4502/bin/cpm/nodes/debug/componenttree.mermaid?regex=wknd

## Report of primary types and resource types etc.

```groovy
import org.apache.sling.api.resource.Resource;

void checkPath(String path) {
    Map<String, Integer> primtypes = new TreeMap();
    Map<String, Integer> mixins = new TreeMap();
    Map<String, Integer> restypes = new TreeMap();

    resourceResolver.findResources(
            "/jcr:root" + path + "//*",
            "xpath"
    ).each { Resource r ->
        String primtype = r.getValueMap().get("jcr:primaryType")
        primtypes.put(primtype, primtypes.getOrDefault(primtype, 0) + 1)

        String[] mix = r.getValueMap().get("jcr:mixinTypes", new String[0])
        mix.each {m ->
            mixins.put(m, mixins.getOrDefault(m, 0) + 1)
        }

        String restype = r.getValueMap().get("sling:resourceType", "")
        restypes.put(restype, restypes.getOrDefault(restype, 0) + 1)
    }

    println "\n\nPrimtypes:"
    primtypes.entrySet().each {entry ->
        println entry.getKey() + "\t" + entry.getValue()
    }

    println "\n\nMixins:"
    mixins.entrySet().each {entry ->
        println entry.getKey() + "\t" + entry.getValue()
    }

    println "\n\nsling:resourceType sorted by key:"
    restypes.entrySet().each {entry ->
        println entry.getKey() + "\t" + entry.getValue()
    }

    println "\n\nsling:resourceType sorted by count:"
    restypes.entrySet().sort { a, b -> b.getValue() <=> a.getValue() }.each {entry ->
        println entry.getKey() + "\t" + entry.getValue()
    }
}

checkPath("/content/wknd")
```

## Report for attributes and child nodes depending on primary type and sling resource type

Traverse resource tree and report for each pair of "jcr:primaryType" and "sling:resourceType" all attribute names 
and child node names with their "jcr:primaryType" and "sling:resourceType" that are present on nodes with that pair,
including percentage of nodes that contain them, sorted by percentage. For example:

nt:unstructured wknd/components/page:
- jcr:primaryType (100%)
- jcr:mixinTypes (50%)
+ root nt:unstructured wknd/components/container (100%)

Lines starting with '-' are attributes, lines starting with '+' are subnodes.

```groovy
import org.apache.commons.lang3.tuple.Pair
import org.apache.sling.api.resource.Resource

void checkPath(String path) {
    checkQuery("/jcr:root" + path + "//*")
}

void checkQuery(String query) {
    Map<Pair<String, String>, Integer> nodecount = new TreeMap();
    Map<Pair<String, String>, Map<String, Integer>> attrcount = new TreeMap();
    Map<Pair<String, String>, Map<Pair<String, String>, Integer>> childcount = new TreeMap();

    resourceResolver.findResources(query, "xpath").each { Resource r ->
        String primtype = r.getValueMap().get("jcr:primaryType")
        String restype = r.getValueMap().get("sling:resourceType")
        Pair<String, String> key = Pair.of(primtype, restype)

        nodecount.put(key, nodecount.getOrDefault(key, 0) + 1)
        attrcount.putIfAbsent(key, new TreeMap())
        childcount.putIfAbsent(key, new TreeMap())

        r.getValueMap().entrySet().each { Map.Entry<String, Object> entry ->
            attrcount.get(key).put(entry.key, attrcount.get(key).getOrDefault(entry.key, 0) + 1)
        }
        r.getChildren().each { Resource child ->
            Pair<String, String> childkey = Pair.of(child.getValueMap().get("jcr:primaryType"), child.getValueMap().get("sling:resourceType"))
            childcount.get(key).put(childkey, childcount.get(key).getOrDefault(childkey, 0) + 1)
        }
    }
    
    def excludePattern = ~/(jcr:primaryType|sling:resourceType|cq:lastRolledout(By)?|jcr:lastModified(By)?|jcr:created(By)?)/

    nodecount.entrySet().toList().sort { a, b -> b.value <=> a.value }.each { Map.Entry<Pair<String, String>, Integer> entry ->
        println(entry.key.left + " " + entry.key.right + ": (" + entry.value + " times)")

        attrcount.getOrDefault(entry.key, Collections.emptyMap()).entrySet().toList().sort { a, b -> b.value <=> a.value }.each { Map.Entry<String, Integer> attr ->
            if (!attr.key.matches(excludePattern)) {
                println("- " + attr.key + " (" + Math.round(attr.value * 100.0 / entry.value) + "%)")
            }
        }

        childcount.getOrDefault(entry.key, Collections.emptyMap()).entrySet().toList().sort { a, b -> b.value <=> a.value }.each { Map.Entry<Pair<String, String>, Integer> child ->
            println("+ " + child.key.left + " " + child.key.right + " (" + Math.round(child.value * 100.0 / entry.value) + "%)")
        }

        println()
    }
}

checkPath("/content/wknd")
```
