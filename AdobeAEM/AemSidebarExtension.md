# How to extend the AEM Side Panel

Created 24-09-2023, last change 24-09-2023

For [Composum AI](https://github.com/ist-dresden/composum-AI) I needed to add a new tab to the AEM side panel (or side
rail) in the editor.

The declaration of the existing side panels is in
/libs/wcm/core/content/editor/jcr:content/sidepanels/edit/items
That means it could be extended by overlaying that, but this might be a little intrusive. It's also possible to
extend it via Javascript, as it's a
[Coral Tabview](https://developer.adobe.com/experience-manager/reference-materials/6-5/coral-ui/coralui3/Coral.
TabView.html) with id SidePanel.

A nice idea is to create a .hidden component with a dialog copied froom the .../sidepanels/edit and then reworked to
show the actual dialog. It can then be included with JavaScript. Done in Composum AI.

Adding the side panel e.g. with Javascript:

    channel.on("foundation-contentloaded", function (e) {
        Coral.commons.ready(channel, function (component) {
            loadSidebarPanelDialog();
        });
    });

                const tabView = $('#SidePanel coral-tabview')[0];
                tabView.tabList.items.add(tab[0]);
                tabView.panelStack.items.add(panel[0]);

The [0] unwraps the coral objects from jquery - `tab` is the coral-tab , `panel` is the coral-panel, I retrieved
that from a normal dialog rendering. Compare the Composum AI code.
