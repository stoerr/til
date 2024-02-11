# Some tipps and experiences with Github Markdown

Created 26-10-2023, last change 26-10-2023

Some things that took me a while to find out. You have to
[view the source](https://raw.githubusercontent.com/stoerr/til/develop/Github/GithubMarkdownTipps.md)
to find out how it's done.

## Images

![Alttext](image.png)

## Videos

The only way to directly include a video I've yet found was to use the editor on Github itself, which uploads the video
as an Github asset. Outcome e.g.:

    <video src="https://github.com/ist-dresden/composum-AI/assets/999184/18595f2a-e0b5-49f3-bc4c-65d6a8bc93f6" controls autoplay style="max-width: 730px;">
    [Quick demonstration of Composum AI features](../featurespecs/figures/ComposumAIinPagesQuickDemo.mp4)
    </video>

[See here for some otherwise unsuccessful tests](https://github.com/ist-dresden/composum-AI/blob/e7f3a0af1102506d1b25be440751094a3f6d857e/archive/investigations/VideoTest.md)

## Accordions

If you want to hide details on first glance:
<details>
  <summary><h3>basics </h3></summary>
  whatever
</details>

## Note box

| ⚠️ NOTE: | This is an emphasized note box |
|----------|--------------------------------|
