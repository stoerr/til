# Some hints for screencasts destined for Youtube using iMovie

## Screen Recording

The MacOS screenshot app is nice to record, but produces HUGE files. I didn't see any difference in quality after
recoding it with

    for fil in *.mov; do ffmpeg -i $fil -c:v libx264 -preset slow -crf 23 -c:a copy ${fil%%.mov}.mp4; done ;
    find . -name "*.mov" -exec sh -c 'touch -r "$0" "${0%.*}".mp4' {} \;

at about 1/20th of the size. Do that before importing into iMovie, or it wastes truckloads of diskspace.
You might also save space by switching off outdoor recording if you are doing a voiceover later, anyway.

Since the best resolution at least my version of iMovie can export is 1080p, and it's restricted to a fixed aspect
ratio, it's probably best to set the recording area to exactly 1920x1080.

## Fixing aspect ratio

If you recorded it differently, you can rescale + pad it to 1080p to fit iMovie limitations before importing it:

    ffmpeg -i input.mov -vf "scale=-1:1080,setsar=1:1,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black" -c:v libx264 -preset slow -crf 23 -c:a copy output.mp4

Or: let iMovie export at 1080p (set Cropping to "Fit" in iMovie); since the iMovie export is motherhuge and has to be
recoded, anyway, you can use ffmpeg to remove the black bars again afterwards. That looses some quality, though.
We ask ChatGPT for the ffmpeg command since that depends on your original aspect ratio. Prompt:

> I cut and exported a video originally at 1436x1266 video with iMovie at 1080p, so that it's now 1920x1080 with black
> bars on each sides. I want to recode the exported file to H264 and remove the black bars, so that I get basically the
> same format as originally but scaled down to 1080 height. Please give a ffmpeg command line. No scaling is needed -
> just
> cropping to remove the black bars, since it is already the 1080 height. Calculate the width as that changes with the
> downscaling.

    ffmpeg -i input.mp4 -vf "crop=1225:1080" -c:v libx264 -preset slow -crf 23 -c:a copy output.mp4

## Background removing

Zoom has that feature, but lets you record just 5 clips and doesn't work too well. Slack has that feature, too, but
doesn't work too well, either.
https://www.fotor.com/blog/video-background-removers/ mentions https://www.unscreen.com/ but that didn't work better
than that for me, either. But in the end I didn't do that, since it looks weird.

## Making a talking head

Record your face with QuickTime, cut out central part e.g. with

    ffmpeg -i CoDevIntro.mov -vf "crop=in_w/3:in_h*2/3:in_w*3/8:in_h/6" output.mov

Make an overlay with iMovie, set it to green screen / blue screen and use as clean up the polygon to cut out an area
around the face, and make sure the face is before a pleasant enough background. 

## Misc

Always stay at the same distance from the microphone or the sound changes.
