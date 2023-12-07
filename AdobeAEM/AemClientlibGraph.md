# Print AEM Clientlib Graph

A servlet for printing the AEM clientlib graph. The problem is that it's a bit hard to find a tool that displays the
graph, so probably only useful for subtrees. Usable e.g. as
/apps/composum/hps/clientlibgraph/clientlibgraph.GET.java
with self referring resource type.

```java
package apps.composum.hps.clientlibgraph;

import static java.util.stream.Collectors.toList;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.TreeMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.ServletException;

import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.resource.ValueMap;
import org.apache.sling.api.servlets.SlingSafeMethodsServlet;

public class clientlibgraph_GET extends SlingSafeMethodsServlet {

    @Override
    protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        try {
            ResourceResolver resolver = request.getResourceResolver();
            Set<String> clientlibCategories = new TreeSet<>();
            Map<String, Set<String>> clientlibDependencies = new TreeMap<>();
            List<Resource> found = search(resolver, "/jcr:root/(libs|apps)", "element(*,cq:ClientLibraryFolder)");
            for (Resource clientlib : found) {
                ValueMap vm = clientlib.getValueMap();
                String[] categories = vm.get("categories", String[].class);
                categories = categories == null ? new String[0] : categories;
                clientlibCategories.addAll(List.of(categories).stream().map(String::trim).collect(toList()));
                String[] dependencies = vm.get("dependencies", String[].class);
                dependencies = dependencies == null ? new String[0] : dependencies;
                for (String category : categories) {
                    for (String dependency : dependencies) {
                        Set<String> deps = clientlibDependencies.get(category.trim());
                        if (deps == null) {
                            deps = new TreeSet<>();
                            clientlibDependencies.put(category.trim(), deps);
                        }
                        deps.add(dependency.trim());
                    }
                }
            }
            if (0 == 1) {
                out.println("Number of categories: " + clientlibCategories.size());
                out.println("Number of dependencies: " + clientlibDependencies.size());
                out.println("Clientlib categories:");
                for (String category : clientlibCategories) {
                    out.println("  " + category);
                }
                out.println("Clientlib dependencies:");
                for (Map.Entry<String, Set<String>> entry : clientlibDependencies.entrySet()) {
                    out.println("  " + entry.getKey() + ":");
                    for (String dependency : entry.getValue()) {
                        out.println("    " + dependency);
                    }
                }
            }
            Set<String> clientlibCategoriesWithoutDependency = new TreeSet<>(clientlibCategories);
            clientlibCategoriesWithoutDependency.removeAll(clientlibDependencies.keySet());
            // remove categories that are not dependencies of something else, too
            for (String category : clientlibCategoriesWithoutDependency) {
                if (clientlibDependencies.values().stream().noneMatch(deps -> deps.contains(category))) {
                    clientlibCategories.remove(category);
                }
            }

            // print mermaid diagram of clientlibDependencies, but make sure there are nodes for all clientlibCategories
            out.println("graph TD");
            if (1 == 1) {
                for (String category : clientlibCategoriesWithoutDependency) {
                    out.println("  " + category + "(\"" + category + "\")");
                }
            }
            for (Map.Entry<String, Set<String>> entry : clientlibDependencies.entrySet()) {
                for (String dependency : entry.getValue()) {
                    out.println("  " + entry.getKey() + "-->" + dependency);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }

    protected List<Resource> search(ResourceResolver resolver, String queryStart, String queryElement) {
        List<Resource> result = new ArrayList<>();
        result.addAll(search(resolver, queryStart + '/' + queryElement));
        for (Resource queryHead : search(resolver, queryStart + "/*")) {
            result.addAll(search(resolver, "/jcr:root" + queryHead.getPath() + '/' + queryElement));
        }
        for (Resource querySubHead : search(resolver, queryStart + "/*/*")) {
            result.addAll(search(resolver, "/jcr:root" + querySubHead.getPath() + "//" + queryElement));
        }
        return result;
    }

    protected List<Resource> search(ResourceResolver resolver, String query) {
        Iterator<Resource> iterator = resolver.findResources(query, "xpath");
        List<Resource> result = new ArrayList<>();
        while (iterator.hasNext()) {
            result.add(iterator.next());
        }
        return result;
    }
}
```
