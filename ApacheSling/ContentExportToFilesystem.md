# Exporting the JCR content to the filesystem

If you like to export some content from the JCR to the filesystem, it is possible to create a content package, but 
that can be troublesome if you want to export much content because that creates a package as large as the content in 
the JCR. Fortunately, there are several alternatives to that, which just export the content by creating packages on 
the fly.

## Use the Composum Browser

If the [Composum Nodes Browser](https://www.composum.com/home/nodes/browser.html) is installed, there are buttons to 
download the subtree below a node as content package or as a zip file, which do not create a package in the JCR. 
These can just be triggered from the browser. Since the browser as a REST API, it can also be used from scripts, 
[such as these](https://github.com/ist-dresden/composum-nodes/tree/develop/tools/bin).

## Composum Nodes Debugutils

The [Composum Nodes Debugutils](https://github.com/ist-dresden/composum-nodes/tree/develop/xtracts/debugutil) is an 
OSGI bundle that can be deployed independently from Composum Nodes. It contains a 
[DownloadJcrTreeAsPackageServlet](https://github.com/ist-dresden/composum-nodes/blob/develop/xtracts/debugutil/src/main/java/com/composum/nodes/debugutil/DownloadJcrTreeAsPackageServlet.java)
that can be used to download a JCR tree - if needed even on a AEMaaCS (development!) publisher.

## WebDAV

Since the JCR can be made accessible via WebDAV, any WebDAV tools might also be used to copy the content. If you use 
IntelliJ, [that can be used for this purpose](https://www.composum.com/home/blog/nodes/contentSyncForDevelopment.html).

Example configuration in IntelliJ:
Web server URL: http://localhost:9090/server/default/jcr%3aroot/
Mapping: Local path: /Users/hps/dev/composum/nodes/pckgmgr/src/main/resources/root/libs/composum/nodes/pckgmgr
Deployment path: /libs/composum/nodes/pckgmgr/
Web path: libs/composum/nodes/pckgmgr
