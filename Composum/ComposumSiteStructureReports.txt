# Composum Site Structure

Created 15-08-2023, last change 22-08-2023

This is just the result of some reports according to [AnalyzeSite](../AdobeAEM/AnalyzeSite.md) on some sample sites.

## Report of primary types and resource types etc.

Primtypes:
cpp:Container	1151
cpp:Element	2002
cpp:Page	105
cpp:PageContent	105
cpp:SiteConfiguration	1
nt:file	139
nt:folder	3
nt:resource	140
nt:unstructured	471
sling:Folder	27
sling:OrderedFolder	8


Mixins:
mix:versionable	140


sling:resourceType sorted by key:
	845
/libs/composum/pages/components/navigation/siblings	1
composum/pages/components/composed/accordion	3
composum/pages/components/composed/accordion/item	8
composum/pages/components/composed/carousel	7
composum/pages/components/composed/illustration	9
composum/pages/components/composed/illustration/annotation	23
composum/pages/components/composed/list	4
composum/pages/components/composed/table	27
composum/pages/components/composed/table/cell	485
composum/pages/components/composed/table/row	167
composum/pages/components/container/iparsys	76
composum/pages/components/container/parsys	179
composum/pages/components/container/row	175
composum/pages/components/container/row/column	277
composum/pages/components/container/section	178
composum/pages/components/element/codeblock	106
composum/pages/components/element/iframe	1
composum/pages/components/element/image	93
composum/pages/components/element/image/background	1
composum/pages/components/element/link	63
composum/pages/components/element/link/set	30
composum/pages/components/element/reference	4
composum/pages/components/element/teaser	60
composum/pages/components/element/text	605
composum/pages/components/element/textimage	43
composum/pages/components/element/title	143
composum/pages/components/element/video	2
composum/pages/components/navigation/sitemap	1
composum/pages/components/page	85
composum/pages/components/page/home	2
composum/pages/components/page/sitemap	1
composum/pages/components/search/field	1
composum/pages/components/search/result	1
composum/pages/components/time/event/page	1
composum/pages/options/blog/components/collection/search	1
composum/pages/options/blog/components/page/article	10
composum/pages/options/blog/components/page/blog	1
composum/pages/options/blog/components/page/sequence	5
composum/pages/options/wiki/components/markup	7
composum/pages/stage/edit/site	1
ist/composum/components/documentation/servlet	7
ist/composum/components/documentation/servlet/example	14
ist/composum/components/documentation/servlet/examples	14
ist/composum/components/documentation/servlet/parameter	17
ist/composum/components/documentation/servlet/parameters	11
ist/composum/components/documentation/servlet/selector	29
ist/composum/components/documentation/servlet/selectors	11
ist/composum/components/documentation/taglib	4
ist/composum/components/documentation/taglib/tag	33
ist/composum/components/documentation/taglib/tag/attribute	220
ist/composum/components/documentation/taglib/tag/attributes	29
ist/composum/components/documentation/taglib/tag/example	15
ist/composum/components/documentation/taglib/tag/examples	10
ist/composum/components/documentation/taglib/tags	6


sling:resourceType sorted by count:
	845
composum/pages/components/element/text	605
composum/pages/components/composed/table/cell	485
composum/pages/components/container/row/column	277
ist/composum/components/documentation/taglib/tag/attribute	220
composum/pages/components/container/parsys	179
composum/pages/components/container/section	178
composum/pages/components/container/row	175
composum/pages/components/composed/table/row	167
composum/pages/components/element/title	143
composum/pages/components/element/codeblock	106
composum/pages/components/element/image	93
composum/pages/components/page	85
composum/pages/components/container/iparsys	76
composum/pages/components/element/link	63
composum/pages/components/element/teaser	60
composum/pages/components/element/textimage	43
ist/composum/components/documentation/taglib/tag	33
composum/pages/components/element/link/set	30
ist/composum/components/documentation/servlet/selector	29
ist/composum/components/documentation/taglib/tag/attributes	29
composum/pages/components/composed/table	27
composum/pages/components/composed/illustration/annotation	23
ist/composum/components/documentation/servlet/parameter	17
ist/composum/components/documentation/taglib/tag/example	15
ist/composum/components/documentation/servlet/example	14
ist/composum/components/documentation/servlet/examples	14
ist/composum/components/documentation/servlet/parameters	11
ist/composum/components/documentation/servlet/selectors	11
composum/pages/options/blog/components/page/article	10
ist/composum/components/documentation/taglib/tag/examples	10
composum/pages/components/composed/illustration	9
composum/pages/components/composed/accordion/item	8
composum/pages/components/composed/carousel	7
composum/pages/options/wiki/components/markup	7
ist/composum/components/documentation/servlet	7
ist/composum/components/documentation/taglib/tags	6
composum/pages/options/blog/components/page/sequence	5
composum/pages/components/composed/list	4
composum/pages/components/element/reference	4
ist/composum/components/documentation/taglib	4
composum/pages/components/composed/accordion	3
composum/pages/components/element/video	2
composum/pages/components/page/home	2
/libs/composum/pages/components/navigation/siblings	1
composum/pages/components/element/iframe	1
composum/pages/components/element/image/background	1
composum/pages/components/navigation/sitemap	1
composum/pages/components/page/sitemap	1
composum/pages/components/search/field	1
composum/pages/components/search/result	1
composum/pages/components/time/event/page	1
composum/pages/options/blog/components/collection/search	1
composum/pages/options/blog/components/page/blog	1
composum/pages/stage/edit/site	1

## Component structure

This includes also various system components, which I halfheartedly tried to remove. That's much more than what's 
actually used for sites.

```mermaid
graph LR
_libs_composum_platform_tenant_manager_dialogs_host["/libs/composum/platform/tenant/manager/dialogs/host"]
_libs_composum_platform_tenant_manager_dialogs_site["/libs/composum/platform/tenant/manager/dialogs/site"]
_libs_composum_platform_tenant_manager_dialogs_user["/libs/composum/platform/tenant/manager/dialogs/user"]
composum_assets_asset_meta["composum/assets/asset/meta"]
composum_assets_asset_rendition["composum/assets/asset/rendition"]
composum_assets_asset_variation["composum/assets/asset/variation"]
composum_assets_commons_dialogs_config_change["composum/assets/commons/dialogs/config/change"]
composum_assets_commons_dialogs_config_create["composum/assets/commons/dialogs/config/create"]
composum_assets_commons_dialogs_config_create_rendition["composum/assets/commons/dialogs/config/create/rendition"]
composum_assets_commons_dialogs_config_create_variation["composum/assets/commons/dialogs/config/create/variation"]
composum_assets_commons_dialogs_config_delete["composum/assets/commons/dialogs/config/delete"]
composum_assets_commons_dialogs_config_delete_rendition["composum/assets/commons/dialogs/config/delete/rendition"]
composum_assets_commons_dialogs_config_delete_variation["composum/assets/commons/dialogs/config/delete/variation"]
composum_assets_commons_widget_config["composum/assets/commons/widget/config"]
composum_assets_commons_widget_config_form["composum/assets/commons/widget/config/form"]
composum_assets_commons_widget_demo_asset_select["composum/assets/commons/widget/demo/asset/select"]
composum_assets_commons_widget_demo_page["composum/assets/commons/widget/demo/page"]
composum_assets_commons_widget_navigator_browse["composum/assets/commons/widget/navigator/browse"]
composum_assets_commons_widget_preview_binary["composum/assets/commons/widget/preview/binary"]
composum_assets_commons_widget_preview_file["composum/assets/commons/widget/preview/file"]
composum_assets_config["composum/assets/config"]
composum_assets_config_rendition["composum/assets/config/rendition"]
composum_assets_config_variation["composum/assets/config/variation"]
composum_assets_manager_asset_meta["composum/assets/manager/asset/meta"]
composum_assets_manager_asset_rendition["composum/assets/manager/asset/rendition"]
composum_assets_manager_asset_variation["composum/assets/manager/asset/variation"]
composum_assets_manager_console_browser_view_asset["composum/assets/manager/console/browser/view/asset"]
composum_assets_manager_console_browser_view_asset_tab["composum/assets/manager/console/browser/view/asset/tab"]
composum_assets_manager_console_description["composum/assets/manager/console/description"]
composum_assets_manager_tabs_asset_config["composum/assets/manager/tabs/asset/config"]
composum_assets_manager_tabs_config["composum/assets/manager/tabs/config"]
composum_assets_manager_tabs_folder["composum/assets/manager/tabs/folder"]
composum_assets_manager_tabs_folder_config["composum/assets/manager/tabs/folder/config"]
composum_assets_manager_tabs_folder_general["composum/assets/manager/tabs/folder/general"]
composum_nodes_browser_description["composum/nodes/browser/description"]
composum_nodes_browser_view_generic["composum/nodes/browser/view/generic"]
composum_nodes_browser_view_generic_tab["composum/nodes/browser/view/generic/tab"]
composum_nodes_console_page_description["composum/nodes/console/page/description"]
composum_nodes_console_tools["composum/nodes/console/tools"]
composum_nodes_console_tools_page["composum/nodes/console/tools/page"]
composum_nodes_pckgmgr_description["composum/nodes/pckgmgr/description"]
composum_nodes_system_tools_description["composum/nodes/system/tools/description"]
composum_nodes_system_tools_osgi_bundles["composum/nodes/system/tools/osgi/bundles"]
composum_nodes_system_tools_runtime_files["composum/nodes/system/tools/runtime/files"]
composum_nodes_system_tools_runtime_settings["composum/nodes/system/tools/runtime/settings"]
composum_nodes_system_tools_webconsole["composum/nodes/system/tools/webconsole"]
composum_nodes_system_tools_webconsole_description["composum/nodes/system/tools/webconsole/description"]
composum_nodes_usermgnt_description["composum/nodes/usermgnt/description"]
composum_pages_commons_default_component_dialog["composum/pages/commons/default/component/dialog"]
composum_pages_commons_template_component_edit_context_actions["composum/pages/commons/template/component/edit/context/actions"]
composum_pages_commons_template_component_edit_context_elements["composum/pages/commons/template/component/edit/context/elements"]
composum_pages_commons_template_component_edit_dialog["composum/pages/commons/template/component/edit/dialog"]
composum_pages_commons_template_component_edit_dialog_create["composum/pages/commons/template/component/edit/dialog/create"]
composum_pages_commons_template_component_edit_dialog_delete["composum/pages/commons/template/component/edit/dialog/delete"]
composum_pages_commons_template_component_edit_thumbnail["composum/pages/commons/template/component/edit/thumbnail"]
composum_pages_commons_template_component_edit_toolbar["composum/pages/commons/template/component/edit/toolbar"]
composum_pages_commons_template_component_edit_tree["composum/pages/commons/template/component/edit/tree"]
composum_pages_commons_widget["composum/pages/commons/widget"]
composum_pages_commons_widget_assetfield["composum/pages/commons/widget/assetfield"]
composum_pages_commons_widget_checkbox["composum/pages/commons/widget/checkbox"]
composum_pages_commons_widget_checkselect["composum/pages/commons/widget/checkselect"]
composum_pages_commons_widget_codearea["composum/pages/commons/widget/codearea"]
composum_pages_commons_widget_combobox["composum/pages/commons/widget/combobox"]
composum_pages_commons_widget_datefield["composum/pages/commons/widget/datefield"]
composum_pages_commons_widget_datetimefield["composum/pages/commons/widget/datetimefield"]
composum_pages_commons_widget_dimension["composum/pages/commons/widget/dimension"]
composum_pages_commons_widget_email["composum/pages/commons/widget/email"]
composum_pages_commons_widget_fileupload["composum/pages/commons/widget/fileupload"]
composum_pages_commons_widget_hidden["composum/pages/commons/widget/hidden"]
composum_pages_commons_widget_iconcombobox["composum/pages/commons/widget/iconcombobox"]
composum_pages_commons_widget_imagefield["composum/pages/commons/widget/imagefield"]
composum_pages_commons_widget_linkfield["composum/pages/commons/widget/linkfield"]
composum_pages_commons_widget_multicheck["composum/pages/commons/widget/multicheck"]
composum_pages_commons_widget_multiselect["composum/pages/commons/widget/multiselect"]
composum_pages_commons_widget_multiwidget["composum/pages/commons/widget/multiwidget"]
composum_pages_commons_widget_numberfield["composum/pages/commons/widget/numberfield"]
composum_pages_commons_widget_pathfield["composum/pages/commons/widget/pathfield"]
composum_pages_commons_widget_position["composum/pages/commons/widget/position"]
composum_pages_commons_widget_radio["composum/pages/commons/widget/radio"]
composum_pages_commons_widget_radiolist["composum/pages/commons/widget/radiolist"]
composum_pages_commons_widget_richtext["composum/pages/commons/widget/richtext"]
composum_pages_commons_widget_select["composum/pages/commons/widget/select"]
composum_pages_commons_widget_slider["composum/pages/commons/widget/slider"]
composum_pages_commons_widget_static["composum/pages/commons/widget/static"]
composum_pages_commons_widget_textarea["composum/pages/commons/widget/textarea"]
composum_pages_commons_widget_textfield["composum/pages/commons/widget/textfield"]
composum_pages_commons_widget_timefield["composum/pages/commons/widget/timefield"]
composum_pages_commons_widget_videofield["composum/pages/commons/widget/videofield"]
composum_pages_components_composed["composum/pages/components/composed"]
composum_pages_components_composed_accordion["composum/pages/components/composed/accordion"]
composum_pages_components_composed_accordion_item["composum/pages/components/composed/accordion/item"]
composum_pages_components_composed_carousel["composum/pages/components/composed/carousel"]
composum_pages_components_composed_decorator["composum/pages/components/composed/decorator"]
composum_pages_components_composed_illustration["composum/pages/components/composed/illustration"]
composum_pages_components_composed_illustration_annotation["composum/pages/components/composed/illustration/annotation"]
composum_pages_components_composed_list["composum/pages/components/composed/list"]
composum_pages_components_composed_overlay["composum/pages/components/composed/overlay"]
composum_pages_components_composed_overlay_background["composum/pages/components/composed/overlay/background"]
composum_pages_components_composed_overlay_foreground["composum/pages/components/composed/overlay/foreground"]
composum_pages_components_composed_overlay_item["composum/pages/components/composed/overlay/item"]
composum_pages_components_composed_table["composum/pages/components/composed/table"]
composum_pages_components_composed_table_cell["composum/pages/components/composed/table/cell"]
composum_pages_components_composed_table_cell_edit_dialog["composum/pages/components/composed/table/cell/edit/dialog"]
composum_pages_components_composed_table_row["composum/pages/components/composed/table/row"]
composum_pages_components_container["composum/pages/components/container"]
composum_pages_components_container_iparsys["composum/pages/components/container/iparsys"]
composum_pages_components_container_parsys["composum/pages/components/container/parsys"]
composum_pages_components_container_row["composum/pages/components/container/row"]
composum_pages_components_container_row_column["composum/pages/components/container/row/column"]
composum_pages_components_container_section["composum/pages/components/container/section"]
composum_pages_components_element["composum/pages/components/element"]
composum_pages_components_element_asset["composum/pages/components/element/asset"]
composum_pages_components_element_asset_edit_dialog["composum/pages/components/element/asset/edit/dialog"]
composum_pages_components_element_codeblock["composum/pages/components/element/codeblock"]
composum_pages_components_element_iframe["composum/pages/components/element/iframe"]
composum_pages_components_element_image["composum/pages/components/element/image"]
composum_pages_components_element_image_background["composum/pages/components/element/image/background"]
composum_pages_components_element_image_edit_dialog["composum/pages/components/element/image/edit/dialog"]
composum_pages_components_element_link["composum/pages/components/element/link"]
composum_pages_components_element_link_set["composum/pages/components/element/link/set"]
composum_pages_components_element_map_google["composum/pages/components/element/map/google"]
composum_pages_components_element_map_here["composum/pages/components/element/map/here"]
composum_pages_components_element_popover["composum/pages/components/element/popover"]
composum_pages_components_element_popover_edit_dialog["composum/pages/components/element/popover/edit/dialog"]
composum_pages_components_element_reference["composum/pages/components/element/reference"]
composum_pages_components_element_teaser["composum/pages/components/element/teaser"]
composum_pages_components_element_text["composum/pages/components/element/text"]
composum_pages_components_element_text_edit_dialog["composum/pages/components/element/text/edit/dialog"]
composum_pages_components_element_textimage["composum/pages/components/element/textimage"]
composum_pages_components_element_textimage_edit_dialog["composum/pages/components/element/textimage/edit/dialog"]
composum_pages_components_element_title["composum/pages/components/element/title"]
composum_pages_components_element_video["composum/pages/components/element/video"]
composum_pages_components_element_video_background["composum/pages/components/element/video/background"]
composum_pages_components_element_video_background_edit_dialog["composum/pages/components/element/video/background/edit/dialog"]
composum_pages_components_element_video_edit_dialog["composum/pages/components/element/video/edit/dialog"]
composum_pages_components_embedded["composum/pages/components/embedded"]
composum_pages_components_navigation_navbar["composum/pages/components/navigation/navbar"]
composum_pages_components_navigation_siblings["composum/pages/components/navigation/siblings"]
composum_pages_components_page["composum/pages/components/page"]
composum_pages_components_page_edit_dialog["composum/pages/components/page/edit/dialog"]
composum_pages_components_page_errorpage["composum/pages/components/page/errorpage"]
composum_pages_components_page_home["composum/pages/components/page/home"]
composum_pages_components_page_home_edit_dialog["composum/pages/components/page/home/edit/dialog"]
composum_pages_components_page_redirect["composum/pages/components/page/redirect"]
composum_pages_components_page_redirect_edit_dialog["composum/pages/components/page/redirect/edit/dialog"]
composum_pages_components_page_scene["composum/pages/components/page/scene"]
composum_pages_components_page_single["composum/pages/components/page/single"]
composum_pages_components_page_single_edit_dialog["composum/pages/components/page/single/edit/dialog"]
composum_pages_components_page_single_navbar["composum/pages/components/page/single/navbar"]
composum_pages_components_page_sitemap["composum/pages/components/page/sitemap"]
composum_pages_components_page_sitemap_edit_dialog["composum/pages/components/page/sitemap/edit/dialog"]
composum_pages_components_page_subsite["composum/pages/components/page/subsite"]
composum_pages_components_page_subsite_navbar["composum/pages/components/page/subsite/navbar"]
composum_pages_components_page_subsite_redirect["composum/pages/components/page/subsite/redirect"]
composum_pages_components_page_subsite_root["composum/pages/components/page/subsite/root"]
composum_pages_components_page_subsite_root_edit_dialog["composum/pages/components/page/subsite/root/edit/dialog"]
composum_pages_components_search_field["composum/pages/components/search/field"]
composum_pages_components_search_field_edit_dialog["composum/pages/components/search/field/edit/dialog"]
composum_pages_components_search_result["composum/pages/components/search/result"]
composum_pages_components_search_result_edit_dialog["composum/pages/components/search/result/edit/dialog"]
composum_pages_components_test["composum/pages/components/test"]
composum_pages_components_test_properties["composum/pages/components/test/properties"]
composum_pages_components_themes_book_components_page["composum/pages/components/themes/book/components/page"]
composum_pages_components_time_calendar["composum/pages/components/time/calendar"]
composum_pages_components_time_calendar_edit_dialog["composum/pages/components/time/calendar/edit/dialog"]
composum_pages_components_time_current["composum/pages/components/time/current"]
composum_pages_components_time_event_page["composum/pages/components/time/event/page"]
composum_pages_components_time_event_page_edit_dialog["composum/pages/components/time/event/page/edit/dialog"]
composum_pages_components_time_event_teaser["composum/pages/components/time/event/teaser"]
composum_pages_components_time_navigator["composum/pages/components/time/navigator"]
composum_pages_components_time_navigator_edit_dialog["composum/pages/components/time/navigator/edit/dialog"]
composum_pages_components_time_news_page["composum/pages/components/time/news/page"]
composum_pages_components_time_news_page_edit_dialog["composum/pages/components/time/news/page/edit/dialog"]
composum_pages_components_time_news_teaser["composum/pages/components/time/news/teaser"]
composum_pages_options_ai_dialogs_categorize["composum/pages/options/ai/dialogs/categorize"]
composum_pages_options_ai_dialogs_common["composum/pages/options/ai/dialogs/common"]
composum_pages_options_ai_dialogs_create["composum/pages/options/ai/dialogs/create"]
composum_pages_options_ai_dialogs_translate["composum/pages/options/ai/dialogs/translate"]
composum_pages_options_ai_tools_sidebar["composum/pages/options/ai/tools/sidebar"]
composum_pages_options_assets_image_adaptive["composum/pages/options/assets/image/adaptive"]
composum_pages_options_blog_components_collection_newest["composum/pages/options/blog/components/collection/newest"]
composum_pages_options_blog_components_collection_search["composum/pages/options/blog/components/collection/search"]
composum_pages_options_blog_components_page_article["composum/pages/options/blog/components/page/article"]
composum_pages_options_blog_components_page_article_edit_dialog["composum/pages/options/blog/components/page/article/edit/dialog"]
composum_pages_options_blog_components_page_blog["composum/pages/options/blog/components/page/blog"]
composum_pages_options_blog_components_page_blog_edit_dialog["composum/pages/options/blog/components/page/blog/edit/dialog"]
composum_pages_options_blog_components_page_sequence["composum/pages/options/blog/components/page/sequence"]
composum_pages_options_blog_components_page_sequence_edit_dialog["composum/pages/options/blog/components/page/sequence/edit/dialog"]
composum_pages_options_blog_components_static_intro["composum/pages/options/blog/components/static/intro"]
composum_pages_options_microsite_page_edit_dialog["composum/pages/options/microsite/page/edit/dialog"]
composum_pages_options_microsite_page_edit_tree["composum/pages/options/microsite/page/edit/tree"]
composum_pages_options_microsite_page_metadata["composum/pages/options/microsite/page/metadata"]
composum_pages_options_wiki_components_markup["composum/pages/options/wiki/components/markup"]
composum_pages_stage_edit_console_description["composum/pages/stage/edit/console/description"]
composum_pages_stage_edit_default_container_thumbnail["composum/pages/stage/edit/default/container/thumbnail"]
composum_pages_stage_edit_default_element_context_actions["composum/pages/stage/edit/default/element/context/actions"]
composum_pages_stage_edit_default_element_context_elements["composum/pages/stage/edit/default/element/context/elements"]
composum_pages_stage_edit_default_element_dialog["composum/pages/stage/edit/default/element/dialog"]
composum_pages_stage_edit_default_element_dialog_delete["composum/pages/stage/edit/default/element/dialog/delete"]
composum_pages_stage_edit_default_element_thumbnail["composum/pages/stage/edit/default/element/thumbnail"]
composum_pages_stage_edit_default_element_toolbar["composum/pages/stage/edit/default/element/toolbar"]
composum_pages_stage_edit_default_element_tree["composum/pages/stage/edit/default/element/tree"]
composum_pages_stage_edit_default_file_preview["composum/pages/stage/edit/default/file/preview"]
composum_pages_stage_edit_default_page_dialog["composum/pages/stage/edit/default/page/dialog"]
composum_pages_stage_edit_default_page_thumbnail["composum/pages/stage/edit/default/page/thumbnail"]
composum_pages_stage_edit_default_page_tree["composum/pages/stage/edit/default/page/tree"]
composum_pages_stage_edit_default_preview_page["composum/pages/stage/edit/default/preview/page"]
composum_pages_stage_edit_default_site_preview["composum/pages/stage/edit/default/site/preview"]
composum_pages_stage_edit_sidebar["composum/pages/stage/edit/sidebar"]
composum_pages_stage_edit_sidebar_context["composum/pages/stage/edit/sidebar/context"]
composum_pages_stage_edit_sidebar_navigation["composum/pages/stage/edit/sidebar/navigation"]
composum_pages_stage_edit_sidebar_standalone["composum/pages/stage/edit/sidebar/standalone"]
composum_pages_stage_edit_sidebar_standalone_context["composum/pages/stage/edit/sidebar/standalone/context"]
composum_pages_stage_edit_sidebar_standalone_static["composum/pages/stage/edit/sidebar/standalone/static"]
composum_pages_stage_edit_site["composum/pages/stage/edit/site"]
composum_pages_stage_edit_site_languages["composum/pages/stage/edit/site/languages"]
composum_pages_stage_edit_site_release["composum/pages/stage/edit/site/release"]
composum_pages_stage_edit_site_releases_publish["composum/pages/stage/edit/site/releases/publish"]
composum_pages_stage_edit_tools_component_help_parsys["composum/pages/stage/edit/tools/component/help/parsys"]
composum_pages_stage_home["composum/pages/stage/home"]
composum_pages_stage_widget_element_type_select["composum/pages/stage/widget/element/type/select"]
composum_pages_stage_widget_page_references["composum/pages/stage/widget/page/references"]
composum_pages_stage_widget_page_referrers["composum/pages/stage/widget/page/referrers"]
composum_pages_stage_widget_page_template["composum/pages/stage/widget/page/template"]
composum_pages_stage_widget_site_select["composum/pages/stage/widget/site/select"]
composum_pages_stage_widget_site_template["composum/pages/stage/widget/site/template"]
composum_pages_themes_business_casual_components_element_teaser["composum/pages/themes/business-casual/components/element/teaser"]
composum_pages_themes_business_casual_components_element_text["composum/pages/themes/business-casual/components/element/text"]
composum_pages_themes_business_casual_components_element_text_edit_dialog["composum/pages/themes/business-casual/components/element/text/edit/dialog"]
composum_pages_themes_business_casual_components_element_textimage["composum/pages/themes/business-casual/components/element/textimage"]
composum_pages_themes_business_casual_components_element_textimage_edit_dialog["composum/pages/themes/business-casual/components/element/textimage/edit/dialog"]
composum_pages_themes_business_casual_components_element_title["composum/pages/themes/business-casual/components/element/title"]
composum_pages_themes_business_casual_components_page["composum/pages/themes/business-casual/components/page"]
composum_pages_themes_business_casual_components_page_edit_dialog["composum/pages/themes/business-casual/components/page/edit/dialog"]
composum_platform_home_page["composum/platform/home/page"]
composum_platform_public_login["composum/platform/public/login"]
composum_platform_public_page["composum/platform/public/page"]
composum_platform_services_replication_dialog["composum/platform/services/replication/dialog"]
composum_prototype_pages_documentation_page["composum/prototype/pages/documentation/page"]
composum_prototype_pages_documentation_page_logo["composum/prototype/pages/documentation/page/logo"]
composum_prototype_platform_htl_components_search_field_edit_dialog["composum/prototype/platform/htl/components/search/field/edit/dialog"]
composum_prototype_platform_htl_components_search_result_edit_dialog["composum/prototype/platform/htl/components/search/result/edit/dialog"]
composum_prototype_themes_solid_page["composum/prototype/themes/solid/page"]
composum_prototype_themes_solid_page_home["composum/prototype/themes/solid/page/home"]
composum_prototype_themes_solid_page_portfolio["composum/prototype/themes/solid/page/portfolio"]
ist_composum_components_documentation_servlet["ist/composum/components/documentation/servlet"]
ist_composum_components_documentation_servlet_edit_dialog["ist/composum/components/documentation/servlet/edit/dialog"]
ist_composum_components_documentation_servlet_example["ist/composum/components/documentation/servlet/example"]
ist_composum_components_documentation_servlet_example_edit_dialog["ist/composum/components/documentation/servlet/example/edit/dialog"]
ist_composum_components_documentation_servlet_examples["ist/composum/components/documentation/servlet/examples"]
ist_composum_components_documentation_servlet_parameter["ist/composum/components/documentation/servlet/parameter"]
ist_composum_components_documentation_servlet_parameter_edit_dialog["ist/composum/components/documentation/servlet/parameter/edit/dialog"]
ist_composum_components_documentation_servlet_parameters["ist/composum/components/documentation/servlet/parameters"]
ist_composum_components_documentation_servlet_selector["ist/composum/components/documentation/servlet/selector"]
ist_composum_components_documentation_servlet_selector_edit_dialog["ist/composum/components/documentation/servlet/selector/edit/dialog"]
ist_composum_components_documentation_servlet_selectors["ist/composum/components/documentation/servlet/selectors"]
ist_composum_components_documentation_taglib["ist/composum/components/documentation/taglib"]
ist_composum_components_documentation_taglib_edit_dialog["ist/composum/components/documentation/taglib/edit/dialog"]
ist_composum_components_documentation_taglib_tag["ist/composum/components/documentation/taglib/tag"]
ist_composum_components_documentation_taglib_tag_attribute["ist/composum/components/documentation/taglib/tag/attribute"]
ist_composum_components_documentation_taglib_tag_attribute_edit_dialog["ist/composum/components/documentation/taglib/tag/attribute/edit/dialog"]
ist_composum_components_documentation_taglib_tag_attributes["ist/composum/components/documentation/taglib/tag/attributes"]
ist_composum_components_documentation_taglib_tag_edit_dialog["ist/composum/components/documentation/taglib/tag/edit/dialog"]
ist_composum_components_documentation_taglib_tag_example["ist/composum/components/documentation/taglib/tag/example"]
ist_composum_components_documentation_taglib_tag_example_edit_dialog["ist/composum/components/documentation/taglib/tag/example/edit/dialog"]
ist_composum_components_documentation_taglib_tag_examples["ist/composum/components/documentation/taglib/tag/examples"]
ist_composum_components_documentation_taglib_tags["ist/composum/components/documentation/taglib/tags"]
ist_composum_themes_book_components_page["ist/composum/themes/book/components/page"]
composum_nodes_browser_description --> composum_nodes_console_page_description
composum_nodes_console_tools --> composum_nodes_console_tools_page
composum_nodes_pckgmgr_description --> composum_nodes_console_page_description
composum_nodes_system_tools_description --> composum_nodes_console_page_description
composum_nodes_system_tools_osgi_bundles --> composum_nodes_console_tools_page
composum_nodes_system_tools_runtime_files --> composum_nodes_console_tools_page
composum_nodes_system_tools_runtime_settings --> composum_nodes_console_tools_page
composum_nodes_system_tools_webconsole --> composum_nodes_console_tools_page
composum_nodes_system_tools_webconsole_description --> composum_nodes_console_page_description
composum_nodes_usermgnt_description --> composum_nodes_console_page_description
composum_pages_commons_template_component_edit_context_actions --> composum_pages_stage_edit_default_element_context_actions
composum_pages_commons_template_component_edit_context_elements --> composum_pages_stage_edit_default_element_context_elements
composum_pages_commons_template_component_edit_dialog --> composum_pages_stage_edit_default_element_dialog
composum_pages_commons_template_component_edit_dialog_create --> composum_pages_stage_edit_default_element_dialog
composum_pages_commons_template_component_edit_dialog_delete --> composum_pages_stage_edit_default_element_dialog_delete
composum_pages_commons_template_component_edit_thumbnail --> composum_pages_stage_edit_default_element_thumbnail
composum_pages_commons_template_component_edit_toolbar --> composum_pages_stage_edit_default_element_toolbar
composum_pages_commons_template_component_edit_tree --> composum_pages_stage_edit_default_element_tree
composum_pages_commons_widget_assetfield --> composum_pages_commons_widget
composum_pages_commons_widget_checkbox --> composum_pages_commons_widget
composum_pages_commons_widget_checkselect --> composum_pages_commons_widget_checkbox
composum_pages_commons_widget_codearea --> composum_pages_commons_widget
composum_pages_commons_widget_combobox --> composum_pages_commons_widget
composum_pages_commons_widget_datefield --> composum_pages_commons_widget_datetimefield
composum_pages_commons_widget_datetimefield --> composum_pages_commons_widget
composum_pages_commons_widget_dimension --> composum_pages_commons_widget
composum_pages_commons_widget_email --> composum_pages_commons_widget_textfield
composum_pages_commons_widget_fileupload --> composum_pages_commons_widget
composum_pages_commons_widget_hidden --> composum_pages_commons_widget
composum_pages_commons_widget_iconcombobox --> composum_pages_commons_widget_combobox
composum_pages_commons_widget_imagefield --> composum_pages_commons_widget
composum_pages_commons_widget_linkfield --> composum_pages_commons_widget
composum_pages_commons_widget_multicheck --> composum_pages_commons_widget
composum_pages_commons_widget_multiselect --> composum_pages_commons_widget
composum_pages_commons_widget_multiwidget --> composum_pages_commons_widget
composum_pages_commons_widget_numberfield --> composum_pages_commons_widget
composum_pages_commons_widget_pathfield --> composum_pages_commons_widget
composum_pages_commons_widget_position --> composum_pages_commons_widget
composum_pages_commons_widget_radio --> composum_pages_commons_widget
composum_pages_commons_widget_radiolist --> composum_pages_commons_widget
composum_pages_commons_widget_richtext --> composum_pages_commons_widget
composum_pages_commons_widget_select --> composum_pages_commons_widget
composum_pages_commons_widget_slider --> composum_pages_commons_widget
composum_pages_commons_widget_static --> composum_pages_commons_widget
composum_pages_commons_widget_textarea --> composum_pages_commons_widget
composum_pages_commons_widget_textfield --> composum_pages_commons_widget
composum_pages_commons_widget_timefield --> composum_pages_commons_widget_datetimefield
composum_pages_commons_widget_videofield --> composum_pages_commons_widget
composum_pages_components_composed --> composum_pages_components_container
composum_pages_components_composed_accordion --> composum_pages_components_composed
composum_pages_components_composed_accordion_item --> composum_pages_components_container_parsys
composum_pages_components_composed_carousel --> composum_pages_components_composed
composum_pages_components_composed_decorator --> composum_pages_components_composed
composum_pages_components_composed_illustration --> composum_pages_components_composed
composum_pages_components_composed_illustration_annotation --> composum_pages_components_embedded
composum_pages_components_composed_list --> composum_pages_components_composed
composum_pages_components_composed_overlay --> composum_pages_components_composed
composum_pages_components_composed_overlay_background --> composum_pages_components_container
composum_pages_components_composed_overlay_foreground --> composum_pages_components_container
composum_pages_components_composed_overlay_item --> composum_pages_components_container_parsys
composum_pages_components_composed_table --> composum_pages_components_composed
composum_pages_components_composed_table_cell --> composum_pages_components_element
composum_pages_components_composed_table_cell_edit_dialog --> composum_pages_components_element_text_edit_dialog
composum_pages_components_composed_table_row --> composum_pages_components_composed
composum_pages_components_container_iparsys --> composum_pages_components_container_parsys
composum_pages_components_container_parsys --> composum_pages_components_container
composum_pages_components_container_row --> composum_pages_components_container
composum_pages_components_container_row_column --> composum_pages_components_container
composum_pages_components_container_section --> composum_pages_components_container
composum_pages_components_element_asset --> composum_pages_components_element
composum_pages_components_element_codeblock --> composum_pages_components_element
composum_pages_components_element_iframe --> composum_pages_components_element
composum_pages_components_element_image --> composum_pages_components_element_asset
composum_pages_components_element_image_background --> composum_pages_components_element_image
composum_pages_components_element_image_edit_dialog --> composum_pages_components_element_asset_edit_dialog
composum_pages_components_element_link --> composum_pages_components_element
composum_pages_components_element_link_set --> composum_pages_components_composed_list
composum_pages_components_element_map_google --> composum_pages_components_element
composum_pages_components_element_map_here --> composum_pages_components_element
composum_pages_components_element_popover --> composum_pages_components_element_text
composum_pages_components_element_popover_edit_dialog --> composum_pages_components_element_text_edit_dialog
composum_pages_components_element_reference --> composum_pages_components_element
composum_pages_components_element_teaser --> composum_pages_components_element
composum_pages_components_element_text --> composum_pages_components_element
composum_pages_components_element_textimage --> composum_pages_components_element_text
composum_pages_components_element_textimage_edit_dialog --> composum_pages_components_element_text_edit_dialog
composum_pages_components_element_title --> composum_pages_components_element
composum_pages_components_element_video --> composum_pages_components_element_asset
composum_pages_components_element_video_background --> composum_pages_components_element_video
composum_pages_components_element_video_background_edit_dialog --> composum_pages_components_element_asset_edit_dialog
composum_pages_components_element_video_edit_dialog --> composum_pages_components_element_asset_edit_dialog
composum_pages_components_embedded --> composum_pages_components_element
composum_pages_components_navigation_siblings --> composum_pages_components_element
composum_pages_components_page_edit_dialog --> composum_pages_stage_edit_default_page_dialog
composum_pages_components_page_errorpage --> composum_pages_components_page
composum_pages_components_page_home --> composum_pages_components_page
composum_pages_components_page_home_edit_dialog --> composum_pages_components_page_edit_dialog
composum_pages_components_page_redirect --> composum_pages_components_page
composum_pages_components_page_redirect_edit_dialog --> composum_pages_components_page_edit_dialog
composum_pages_components_page_scene --> composum_pages_components_page
composum_pages_components_page_single --> composum_pages_components_page
composum_pages_components_page_single_edit_dialog --> composum_pages_components_page_edit_dialog
composum_pages_components_page_single_navbar --> composum_pages_components_navigation_navbar
composum_pages_components_page_sitemap --> composum_pages_components_page
composum_pages_components_page_sitemap_edit_dialog --> composum_pages_stage_edit_default_page_dialog
composum_pages_components_page_subsite --> composum_pages_components_page
composum_pages_components_page_subsite_navbar --> composum_pages_components_navigation_navbar
composum_pages_components_page_subsite_redirect --> composum_pages_components_page_redirect
composum_pages_components_page_subsite_root --> composum_pages_components_page_subsite_redirect
composum_pages_components_page_subsite_root_edit_dialog --> composum_pages_components_page_redirect_edit_dialog
composum_pages_components_search_field --> composum_pages_components_element
composum_pages_components_search_field_edit_dialog --> composum_pages_components_page_edit_dialog
composum_pages_components_search_result --> composum_pages_components_element
composum_pages_components_search_result_edit_dialog --> composum_pages_components_page_edit_dialog
composum_pages_components_test --> composum_pages_components_page
composum_pages_components_test_properties --> composum_pages_components_element
composum_pages_components_themes_book_components_page --> composum_pages_components_page
composum_pages_components_time_calendar --> composum_pages_components_element
composum_pages_components_time_calendar_edit_dialog --> composum_pages_components_time_navigator_edit_dialog
composum_pages_components_time_current --> composum_pages_components_time_navigator
composum_pages_components_time_event_page --> composum_pages_components_page
composum_pages_components_time_event_page_edit_dialog --> composum_pages_components_page_edit_dialog
composum_pages_components_time_event_teaser --> composum_pages_components_element
composum_pages_components_time_navigator --> composum_pages_components_element
composum_pages_components_time_news_page --> composum_pages_components_page
composum_pages_components_time_news_page_edit_dialog --> composum_pages_components_page_edit_dialog
composum_pages_components_time_news_teaser --> composum_pages_components_element
composum_pages_options_ai_dialogs_categorize --> composum_pages_options_ai_dialogs_common
composum_pages_options_ai_dialogs_create --> composum_pages_options_ai_dialogs_common
composum_pages_options_ai_dialogs_translate --> composum_pages_options_ai_dialogs_common
composum_pages_options_ai_tools_sidebar --> composum_pages_options_ai_dialogs_common
composum_pages_options_assets_image_adaptive --> composum_pages_components_element_image
composum_pages_options_blog_components_collection_newest --> composum_pages_components_element
composum_pages_options_blog_components_collection_search --> composum_pages_options_blog_components_collection_newest
composum_pages_options_blog_components_page_article --> composum_pages_components_page
composum_pages_options_blog_components_page_article_edit_dialog --> composum_pages_components_page_edit_dialog
composum_pages_options_blog_components_page_blog --> composum_pages_components_page
composum_pages_options_blog_components_page_blog_edit_dialog --> composum_pages_components_page_edit_dialog
composum_pages_options_blog_components_page_sequence --> composum_pages_components_page
composum_pages_options_blog_components_page_sequence_edit_dialog --> composum_pages_components_page_edit_dialog
composum_pages_options_blog_components_static_intro --> composum_pages_components_element
composum_pages_options_microsite_page_edit_dialog --> composum_pages_components_page_edit_dialog
composum_pages_options_microsite_page_edit_tree --> composum_pages_stage_edit_default_page_tree
composum_pages_options_microsite_page_metadata --> composum_pages_components_page
composum_pages_options_wiki_components_markup --> composum_pages_components_element
composum_pages_stage_edit_console_description --> composum_nodes_console_page_description
composum_pages_stage_edit_default_container_thumbnail --> composum_pages_stage_edit_default_element_thumbnail
composum_pages_stage_edit_default_file_preview --> composum_pages_stage_edit_default_preview_page
composum_pages_stage_edit_default_page_thumbnail --> composum_pages_stage_edit_default_element_thumbnail
composum_pages_stage_edit_default_site_preview --> composum_pages_stage_edit_default_preview_page
composum_pages_stage_edit_sidebar_context --> composum_pages_stage_edit_sidebar
composum_pages_stage_edit_sidebar_navigation --> composum_pages_stage_edit_sidebar
composum_pages_stage_edit_sidebar_standalone --> composum_pages_stage_edit_sidebar_context
composum_pages_stage_edit_sidebar_standalone_context --> composum_pages_stage_edit_sidebar_standalone
composum_pages_stage_edit_sidebar_standalone_static --> composum_pages_stage_edit_sidebar_standalone
composum_pages_stage_edit_site_languages --> composum_pages_components_container
composum_pages_stage_edit_site_release --> composum_pages_stage_edit_site
composum_pages_stage_edit_site_releases_publish --> composum_platform_services_replication_dialog
composum_pages_stage_edit_tools_component_help_parsys --> composum_pages_components_container
composum_pages_stage_home --> composum_platform_public_page
composum_pages_stage_widget_element_type_select --> composum_pages_commons_widget
composum_pages_stage_widget_page_references --> composum_pages_commons_widget
composum_pages_stage_widget_page_referrers --> composum_pages_commons_widget
composum_pages_stage_widget_page_template --> composum_pages_commons_widget
composum_pages_stage_widget_site_select --> composum_pages_commons_widget
composum_pages_stage_widget_site_template --> composum_pages_commons_widget
composum_pages_themes_business_casual_components_element_teaser --> composum_pages_components_element_teaser
composum_pages_themes_business_casual_components_element_text --> composum_pages_components_element_text
composum_pages_themes_business_casual_components_element_text_edit_dialog --> composum_pages_components_element_text_edit_dialog
composum_pages_themes_business_casual_components_element_textimage --> composum_pages_components_element_textimage
composum_pages_themes_business_casual_components_element_textimage_edit_dialog --> composum_pages_components_element_textimage_edit_dialog
composum_pages_themes_business_casual_components_element_title --> composum_pages_components_element_title
composum_pages_themes_business_casual_components_page --> composum_pages_components_page
composum_pages_themes_business_casual_components_page_edit_dialog --> composum_pages_components_page_edit_dialog
composum_platform_home_page --> composum_platform_public_page
composum_platform_public_login --> composum_platform_public_page
composum_platform_replication_inplace --> composum_platform_replication_node
composum_platform_replication_remote --> composum_platform_replication_node
composum_prototype_pages_documentation_page --> composum_pages_components_page
composum_prototype_pages_documentation_page_logo --> composum_pages_components_element_image
composum_prototype_platform_htl_components_search_field_edit_dialog --> composum_pages_components_page_edit_dialog
composum_prototype_platform_htl_components_search_result_edit_dialog --> composum_pages_components_page_edit_dialog
composum_prototype_themes_solid_page_home --> composum_prototype_themes_solid_page
composum_prototype_themes_solid_page_portfolio --> composum_prototype_themes_solid_page
ist_composum_components_documentation_servlet --> composum_pages_components_container
ist_composum_components_documentation_servlet_edit_dialog --> composum_pages_commons_default_component_dialog
ist_composum_components_documentation_servlet_example --> composum_pages_components_element
ist_composum_components_documentation_servlet_example_edit_dialog --> composum_pages_commons_default_component_dialog
ist_composum_components_documentation_servlet_examples --> composum_pages_components_container
ist_composum_components_documentation_servlet_parameter --> composum_pages_components_element
ist_composum_components_documentation_servlet_parameter_edit_dialog --> composum_pages_commons_default_component_dialog
ist_composum_components_documentation_servlet_parameters --> composum_pages_components_container
ist_composum_components_documentation_servlet_selector --> composum_pages_components_element
ist_composum_components_documentation_servlet_selector_edit_dialog --> composum_pages_commons_default_component_dialog
ist_composum_components_documentation_servlet_selectors --> composum_pages_components_container_row_column
ist_composum_components_documentation_taglib --> composum_pages_components_container_row
ist_composum_components_documentation_taglib_edit_dialog --> composum_pages_commons_default_component_dialog
ist_composum_components_documentation_taglib_tag --> composum_pages_components_container
ist_composum_components_documentation_taglib_tag_attribute --> composum_pages_components_element
ist_composum_components_documentation_taglib_tag_attribute_edit_dialog --> composum_pages_commons_default_component_dialog
ist_composum_components_documentation_taglib_tag_attributes --> composum_pages_components_container
ist_composum_components_documentation_taglib_tag_edit_dialog --> composum_pages_commons_default_component_dialog
ist_composum_components_documentation_taglib_tag_example --> composum_pages_components_element
ist_composum_components_documentation_taglib_tag_example_edit_dialog --> composum_pages_commons_default_component_dialog
ist_composum_components_documentation_taglib_tag_examples --> composum_pages_components_container
ist_composum_components_documentation_taglib_tags --> composum_pages_components_container_row_column
ist_composum_themes_book_components_page --> composum_pages_components_themes_book_components_page
```

## Report for attributes and child nodes depending on primary type and sling resource type

cpp:Element composum/pages/components/element/text: (605 times)
- text (98%)
- textAlignment (27%)
- title (20%)
- variation (0%)
+ nt:unstructured null (1%)
+ cpp:Container composum/pages/components/element/link/set (0%)

cpp:Element composum/pages/components/composed/table/cell: (485 times)
- text (94%)
- head (35%)
- colspan (1%)
- level (1%)
- width (0%)
- rowspan (0%)
+ nt:unstructured null (2%)

nt:unstructured null: (423 times)
- imageRef (22%)
- title (18%)
- position.x (5%)
- position.y (5%)
- type (4%)
- icon (4%)
- level (4%)
- text (3%)
- size.width (2%)
- theme (2%)
- author (2%)
- date (2%)
- isNavRoot (2%)
- label (2%)
- offset (2%)
- align (1%)
- placement (1%)
- behavior (1%)
- hideInNav (1%)
- jcr:title (1%)
- buttonSymbol (0%)
- key (0%)
- searchResultPath (0%)
- subtitle (0%)
- autoplay (0%)
- category.edit (0%)
- category.theme (0%)
- category.view (0%)
- description (0%)
- ignoreInSearch (0%)
- jcr:description (0%)
- location (0%)
- loop (0%)
- muted (0%)
- parentInheritanceCancelled (0%)
- themeFilter (0%)
- videoRef (0%)
+ nt:unstructured null (14%)
+ cpp:Element composum/pages/components/element/title (1%)
+ cpp:Element composum/pages/components/element/text (1%)
+ cpp:Container composum/pages/components/container/row (0%)
+ cpp:Element composum/pages/components/element/codeblock (0%)
+ nt:unstructured composum/pages/components/element/image (0%)

cpp:Container composum/pages/components/container/row/column: (277 times)
+ cpp:Element composum/pages/components/element/text (91%)
+ cpp:Container composum/pages/components/container/section (50%)
+ cpp:Element composum/pages/components/element/title (21%)
+ cpp:Element composum/pages/components/element/teaser (15%)
+ cpp:Element composum/pages/components/element/codeblock (13%)
+ cpp:Element composum/pages/components/element/textimage (8%)
+ cpp:Element composum/pages/components/composed/table (7%)
+ cpp:Element composum/pages/components/element/image (3%)
+ cpp:Container composum/pages/components/composed/illustration (2%)
+ cpp:Container composum/pages/components/composed/table (2%)
+ cpp:Container composum/pages/components/element/link/set (2%)
+ cpp:Container composum/pages/components/element/teaser (1%)
+ cpp:Element composum/pages/components/element/reference (1%)
+ cpp:Container composum/pages/components/composed/list (0%)
+ cpp:Container ist/composum/components/documentation/servlet (0%)
+ cpp:Container ist/composum/components/documentation/taglib (0%)
+ cpp:Element composum/pages/components/composed/illustration (0%)

cpp:Element ist/composum/components/documentation/taglib/tag/attribute: (220 times)
- jcr:title (100%)
- valueType (100%)
- jcr:description (78%)
- defaultValue (7%)
- mandatory (3%)

cpp:Container composum/pages/components/container/parsys: (179 times)
- parentInheritanceCancelled (26%)
- path (1%)
- withSpacing (1%)
+ cpp:Container composum/pages/components/container/row (97%)
+ cpp:Element composum/pages/components/element/title (31%)
+ cpp:Container composum/pages/components/container/section (13%)
+ cpp:Element composum/pages/components/element/text (13%)
+ nt:unstructured composum/pages/components/element/title (10%)
+ cpp:Element composum/pages/components/element/image (8%)
+ cpp:Container ist/composum/components/documentation/servlet (3%)
+ cpp:Container ist/composum/components/documentation/taglib (2%)
+ cpp:Element composum/pages/options/wiki/components/markup (1%)
+ cpp:Element composum/pages/components/element/codeblock (1%)
+ cpp:Element composum/pages/options/blog/components/collection/search (1%)

cpp:Container composum/pages/components/container/section: (178 times)
- jcr:title (90%)
- icon (8%)
- level (4%)
- anchor (2%)
- title (1%)
- hideTitle (1%)
- subtitle (1%)
+ cpp:Element composum/pages/components/element/text (171%)
+ cpp:Element composum/pages/components/element/codeblock (38%)
+ cpp:Element composum/pages/components/element/image (11%)
+ cpp:Element composum/pages/components/element/textimage (11%)
+ cpp:Container composum/pages/components/container/section (7%)
+ cpp:Container composum/pages/components/element/link/set (3%)
+ cpp:Element composum/pages/components/element/teaser (3%)
+ cpp:Element composum/pages/components/element/title (3%)
+ cpp:Element composum/pages/options/wiki/components/markup (3%)
+ cpp:Container composum/pages/components/composed/carousel (2%)
+ cpp:Container composum/pages/components/composed/accordion (2%)
+ cpp:Container composum/pages/components/composed/list (2%)
+ nt:unstructured null (2%)
+ cpp:Container composum/pages/components/composed/illustration (1%)
+ cpp:Container composum/pages/components/composed/table (1%)
+ cpp:Element composum/pages/components/element/reference (1%)
+ cpp:Container composum/pages/components/container/row (1%)
+ cpp:Element composum/pages/components/composed/illustration (1%)
+ cpp:Element composum/pages/components/composed/table (1%)
+ cpp:Element composum/pages/components/element/iframe (1%)
+ nt:unstructured composum/pages/components/search/field (1%)
+ nt:unstructured composum/pages/components/search/result (1%)

cpp:Container composum/pages/components/container/row: (175 times)
- columns (100%)
- title (34%)
- anchor (1%)
+ cpp:Container composum/pages/components/container/row/column (158%)
+ nt:unstructured null (1%)

nt:resource null: (140 times)
- jcr:baseVersion (100%)
- jcr:data (100%)
- jcr:isCheckedOut (100%)
- jcr:mimeType (100%)
- jcr:mixinTypes (100%)
- jcr:predecessors (100%)
- jcr:uuid (100%)
- jcr:versionHistory (100%)

nt:file null: (139 times)
+ nt:resource null (100%)

cpp:Element composum/pages/components/element/title: (125 times)
- title (82%)
- textAlignment (45%)
- subtitle (38%)
- path (1%)
+ nt:unstructured null (102%)

cpp:Element composum/pages/components/element/codeblock: (106 times)
- language (83%)
- code (76%)
- bordered (61%)
- title (55%)
- collapsed (44%)
- collapsible (43%)
- showLanguage (42%)
- codeRef (24%)
- copyright (22%)
- wrapLines (12%)
- serviceUri (8%)
- serviceParams (2%)

cpp:Page null: (105 times)
+ cpp:Page null (81%)
+ cpp:PageContent composum/pages/components/page (81%)
+ cpp:PageContent composum/pages/options/blog/components/page/article (10%)
+ cpp:PageContent composum/pages/options/blog/components/page/sequence (5%)
+ sling:OrderedFolder null (3%)
+ cpp:PageContent composum/pages/components/page/home (2%)
+ cpp:PageContent composum/pages/components/page/sitemap (1%)
+ cpp:PageContent composum/pages/components/time/event/page (1%)
+ cpp:PageContent composum/pages/options/blog/components/page/blog (1%)
+ nt:unstructured composum/pages/components/navigation/sitemap (1%)

cpp:Element composum/pages/components/composed/table/row: (96 times)
+ cpp:Element composum/pages/components/composed/table/cell (319%)

cpp:PageContent composum/pages/components/page: (85 times)
- jcr:baseVersion (100%)
- jcr:isCheckedOut (100%)
- jcr:predecessors (100%)
- jcr:uuid (100%)
- jcr:versionHistory (100%)
- template (100%)
- jcr:title (99%)
- jcr:description (72%)
- subtitle (2%)
+ cpp:Container composum/pages/components/container/parsys (193%)
+ nt:unstructured null (100%)
+ cpp:Container composum/pages/components/container/iparsys (42%)
+ cpp:Container composum/pages/components/composed/carousel (1%)

cpp:Container composum/pages/components/container/iparsys: (76 times)
- childInheritanceCancelled (1%)
- parentInheritanceCancelled (1%)
+ cpp:Element /libs/composum/pages/components/navigation/siblings (1%)
+ cpp:Element composum/pages/components/element/text (1%)
+ cpp:Element composum/pages/components/element/title (1%)

cpp:Container composum/pages/components/composed/table/row: (71 times)
- head (44%)
- text (1%)
+ cpp:Element composum/pages/components/composed/table/cell (252%)

cpp:Element composum/pages/components/element/image: (66 times)
- imageRef (94%)
- alt (3%)
- title (3%)

cpp:Element composum/pages/components/element/link: (63 times)
- link (98%)
- title (90%)
- linkTitle (14%)
- linkTarget (11%)

cpp:Element composum/pages/components/element/teaser: (56 times)
- title (100%)
- text (93%)
- link (89%)
- subtitle (46%)
- icon (41%)
- variation (27%)
- linkTitle (9%)
+ cpp:Container composum/pages/components/element/link/set (27%)
+ nt:unstructured null (20%)
+ cpp:Element composum/pages/components/element/image (18%)
+ nt:unstructured composum/pages/components/element/image (11%)
+ cpp:Element composum/pages/components/element/video (4%)

cpp:Element composum/pages/components/element/textimage: (43 times)
- text (81%)
- imagePosition (49%)
- textAlignment (30%)
- title (19%)
- floatingText (5%)
+ nt:unstructured null (63%)
+ cpp:Element composum/pages/components/element/image (26%)

cpp:Container ist/composum/components/documentation/taglib/tag: (33 times)
- jcr:description (100%)
- jcr:title (100%)
- footer (6%)
+ cpp:Container ist/composum/components/documentation/taglib/tag/attributes (88%)
+ cpp:Container ist/composum/components/documentation/taglib/tag/examples (30%)

cpp:Container composum/pages/components/element/link/set: (30 times)
- listType (3%)
+ cpp:Element composum/pages/components/element/link (210%)

cpp:Container ist/composum/components/documentation/taglib/tag/attributes: (29 times)
+ cpp:Element ist/composum/components/documentation/taglib/tag/attribute (759%)

cpp:Element ist/composum/components/documentation/servlet/selector: (29 times)
- extension (100%)
- jcr:title (100%)
- method (100%)
- selector (100%)
- jcr:description (69%)
+ cpp:Container ist/composum/components/documentation/servlet/examples (48%)
+ cpp:Container ist/composum/components/documentation/servlet/parameters (38%)

nt:unstructured composum/pages/components/element/image: (27 times)
- imageRef (100%)
+ nt:unstructured null (4%)

sling:Folder null: (27 times)
- jcr:title (7%)
- jcr:description (4%)
- license (4%)
- licenseUrl (4%)
- showCopyright (4%)
+ nt:file null (452%)
+ sling:Folder null (78%)
+ cpp:Page null (11%)
+ nt:folder null (7%)

cpp:Element composum/pages/components/composed/illustration/annotation: (23 times)
- text (100%)
- title (91%)
- next (43%)
- visible (4%)
+ nt:unstructured null (143%)

cpp:Element composum/pages/components/composed/table: (20 times)
- bordered (100%)
- striped (100%)
- title (5%)
+ cpp:Element composum/pages/components/composed/table/row (480%)
+ cpp:Container composum/pages/components/composed/table/row (5%)

nt:unstructured composum/pages/components/element/title: (18 times)
- title (100%)
- subtitle (78%)
+ nt:unstructured composum/pages/components/element/image (100%)

cpp:Element ist/composum/components/documentation/servlet/parameter: (17 times)
- jcr:title (100%)
- jcr:description (94%)
- required (41%)
- defaultValue (6%)

cpp:Element ist/composum/components/documentation/taglib/tag/example: (15 times)
- exampleCode (100%)
- jcr:description (100%)

cpp:Container ist/composum/components/documentation/servlet/examples: (14 times)
+ cpp:Element ist/composum/components/documentation/servlet/example (100%)

cpp:Element ist/composum/components/documentation/servlet/example: (14 times)
- exampleCode (100%)
- exampleResult (100%)
- jcr:description (79%)

cpp:Container ist/composum/components/documentation/servlet/parameters: (11 times)
+ cpp:Element ist/composum/components/documentation/servlet/parameter (155%)

cpp:Container ist/composum/components/documentation/servlet/selectors: (11 times)
+ cpp:Element ist/composum/components/documentation/servlet/selector (264%)

cpp:Container ist/composum/components/documentation/taglib/tag/examples: (10 times)
+ cpp:Element ist/composum/components/documentation/taglib/tag/example (150%)

cpp:PageContent composum/pages/options/blog/components/page/article: (10 times)
- jcr:baseVersion (100%)
- jcr:description (100%)
- jcr:isCheckedOut (100%)
- jcr:predecessors (100%)
- jcr:title (100%)
- jcr:uuid (100%)
- jcr:versionHistory (100%)
- template (100%)
- path (60%)
- category (20%)
- subtitle (20%)
+ cpp:Container composum/pages/components/container/iparsys (280%)
+ nt:unstructured null (210%)
+ cpp:Container composum/pages/components/container/parsys (100%)

cpp:Container composum/pages/components/composed/accordion/item: (8 times)
- title (100%)
- initialOpen (63%)
+ cpp:Element composum/pages/components/element/text (138%)
+ cpp:Container composum/pages/components/element/link/set (38%)
+ cpp:Element composum/pages/components/element/codeblock (13%)
+ cpp:Element composum/pages/components/element/image (13%)

sling:OrderedFolder null: (8 times)
- jcr:description (25%)
- jcr:title (25%)
+ cpp:Page null (188%)
+ sling:OrderedFolder null (50%)
+ nt:resource null (13%)

cpp:Container composum/pages/components/composed/carousel: (7 times)
- showIndicators (57%)
- useControls (57%)
- autoStart (43%)
- interval (43%)
+ cpp:Element composum/pages/components/element/teaser (143%)
+ cpp:Element composum/pages/components/element/image (29%)

cpp:Container composum/pages/components/composed/illustration: (7 times)
+ cpp:Element composum/pages/components/composed/illustration/annotation (171%)
+ nt:unstructured null (129%)

cpp:Container composum/pages/components/composed/table: (7 times)
- striped (100%)
- bordered (86%)
- title (29%)
- condensed (14%)
- copyright (14%)
- hover (14%)
+ cpp:Container composum/pages/components/composed/table/row (1000%)

cpp:Container ist/composum/components/documentation/servlet: (7 times)
- className (100%)
- jcr:title (100%)
- jcr:description (86%)
- path (86%)
- suffix (71%)
- resourceType (29%)
+ cpp:Container ist/composum/components/documentation/servlet/selectors (157%)

cpp:Element composum/pages/options/wiki/components/markup: (7 times)
- wikiCode (100%)
- wikiType (100%)

cpp:Container ist/composum/components/documentation/taglib/tags: (6 times)
+ cpp:Container ist/composum/components/documentation/taglib/tag (550%)

cpp:PageContent composum/pages/options/blog/components/page/sequence: (5 times)
- jcr:baseVersion (100%)
- jcr:isCheckedOut (100%)
- jcr:predecessors (100%)
- jcr:title (100%)
- jcr:uuid (100%)
- jcr:versionHistory (100%)
- template (100%)
- jcr:description (20%)
+ cpp:Container composum/pages/components/container/iparsys (140%)
+ nt:unstructured null (140%)
+ cpp:Container composum/pages/components/container/parsys (20%)

cpp:Container composum/pages/components/composed/list: (4 times)
- listType (50%)
+ cpp:Element composum/pages/components/element/text (175%)
+ cpp:Container composum/pages/components/container/section (75%)

cpp:Container composum/pages/components/element/teaser: (4 times)
- icon (100%)
- link (100%)
- text (100%)
- title (100%)
- elementType (25%)

cpp:Container ist/composum/components/documentation/taglib: (4 times)
- jcr:title (100%)
- key (75%)
- jcr:description (50%)
+ cpp:Container ist/composum/components/documentation/taglib/tags (150%)
+ nt:unstructured null (25%)

cpp:Element composum/pages/components/element/reference: (4 times)
- contentReference (100%)

cpp:Container composum/pages/components/composed/accordion: (3 times)
- behavior (67%)
+ cpp:Container composum/pages/components/composed/accordion/item (267%)

nt:folder null: (3 times)
+ nt:file null (567%)
+ sling:Folder null (133%)
+ nt:folder null (33%)

cpp:Element composum/pages/components/composed/illustration: (2 times)
+ cpp:Element composum/pages/components/composed/illustration/annotation (550%)
+ nt:unstructured null (300%)

cpp:Element composum/pages/components/element/video: (2 times)
- autoplay (50%)
- controls (50%)
- loop (50%)
- videoRef (50%)

cpp:PageContent composum/pages/components/page/home: (2 times)
- jcr:baseVersion (100%)
- jcr:description (100%)
- jcr:isCheckedOut (100%)
- jcr:predecessors (100%)
- jcr:title (100%)
- jcr:uuid (100%)
- jcr:versionHistory (100%)
- template (100%)
- pageLanguages (50%)
+ nt:unstructured null (200%)
+ cpp:Container composum/pages/components/composed/carousel (100%)
+ cpp:Container composum/pages/components/container/parsys (100%)
+ cpp:Container composum/pages/components/container/iparsys (50%)
+ nt:unstructured composum/pages/components/element/image (50%)

cpp:Element /libs/composum/pages/components/navigation/siblings: (1 times)

cpp:Element composum/pages/components/element/iframe: (1 times)
- copyright (100%)
- mode (100%)
- serviceUri (100%)
- src (100%)
- style (100%)

cpp:Element composum/pages/components/element/image/background: (1 times)
- imageRef (100%)

cpp:Element composum/pages/options/blog/components/collection/search: (1 times)
- period (100%)

cpp:PageContent composum/pages/components/page/sitemap: (1 times)
- jcr:baseVersion (100%)
- jcr:isCheckedOut (100%)
- jcr:predecessors (100%)
- jcr:uuid (100%)
- jcr:versionHistory (100%)
- template (100%)
+ nt:unstructured null (200%)

cpp:PageContent composum/pages/components/time/event/page: (1 times)
- date (100%)
- dateEnd (100%)
- jcr:baseVersion (100%)
- jcr:description (100%)
- jcr:isCheckedOut (100%)
- jcr:predecessors (100%)
- jcr:title (100%)
- jcr:uuid (100%)
- jcr:versionHistory (100%)
- link (100%)
- linkTitle (100%)
- subtitle (100%)
- template (100%)
+ nt:unstructured null (400%)
+ cpp:Container composum/pages/components/container/iparsys (100%)
+ cpp:Container composum/pages/components/container/parsys (100%)
+ cpp:Element composum/pages/components/element/image/background (100%)

cpp:PageContent composum/pages/options/blog/components/page/blog: (1 times)
- jcr:baseVersion (100%)
- jcr:isCheckedOut (100%)
- jcr:predecessors (100%)
- jcr:uuid (100%)
- jcr:versionHistory (100%)
- path (100%)
- template (100%)
+ cpp:Container composum/pages/components/container/iparsys (300%)
+ nt:unstructured null (200%)
+ cpp:Container composum/pages/components/container/parsys (100%)

cpp:SiteConfiguration composum/pages/stage/edit/site: (1 times)
- cpl:last-publicMode (100%)
- jcr:baseVersion (100%)
- jcr:description (100%)
- jcr:isCheckedOut (100%)
- jcr:predecessors (100%)
- jcr:title (100%)
- jcr:uuid (100%)
- jcr:versionHistory (100%)
- template (100%)
+ nt:unstructured null (400%)
+ nt:unstructured composum/pages/components/element/image (100%)

nt:unstructured composum/pages/components/navigation/sitemap: (1 times)

nt:unstructured composum/pages/components/search/field: (1 times)
+ nt:unstructured null (100%)

nt:unstructured composum/pages/components/search/result: (1 times)
- title (100%)
+ nt:unstructured null (100%)
