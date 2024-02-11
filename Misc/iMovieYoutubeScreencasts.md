# Some hints for screencasts destined for Youtube using iMovie

Created 13-01-2024, last change 03-02-2024

Some stuff I learned producing [this screencast](https://youtu.be/ubBhv2PUSEs).

## Screen Recording

The MacOS screenshot app is nice to record, but produces HUGE files. I didn't see any difference in quality after
recoding it with

    for fil in *.mov; do ffmpeg -i "$fil" -c:v libx264 -preset slow -crf 23 -c:a copy "${fil%%.mov}.mp4"; done ;
    find . -name "*.mov" -exec sh -c 'touch -r "$0" "${0%.*}".mp4' {} \;

at about 1/20th of the size. Do that before importing into iMovie, or it wastes truckloads of diskspace.
You might also save space by switching off outdoor recording if you are doing a voiceover later, anyway.

Since the best resolution at least my version of iMovie can export is 1080p, and it's restricted to a fixed aspect
ratio, it's probably best to set the recording area to exactly 1920x1080 (perhaps switch your screen resolution 
temporarily to that).

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

    ffmpeg -i input.mov -vf "crop=in_w/3:in_h*2/3:in_w*3/8:in_h/6" output.mov

Make an overlay with iMovie, set it to green screen / blue screen and use as clean up the polygon to cut out an area
around the face, and make sure the face is before a pleasant enough background.

## Circular talking head

If you want that nifty "talking head in a circle over a screen recording" you can make a video while taking care that
you head is in the dead center of the recording, and cut it out with ffmpeg with a green background to use GreenScreen
overlay function of iMovie. You'll have to experiment how to where exactly to hold your head, though.
Here's a script I fought out of ChatGPT:

```bash
#!/bin/bash

# Check if an input file was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <inputfile>"
    exit 1
fi

# Input file
INPUT_FILE=$1

# Output file (replace .mov with .mp4 in the input filename)
OUTPUT_FILE="${INPUT_FILE/.mov/.mp4}"

# Video dimensions
VIDEO_WIDTH=1436
VIDEO_HEIGHT=1266

# Circle dimensions
CIRCLE_DIAMETER=384
CIRCLE_RADIUS=$((CIRCLE_DIAMETER / 2))

# Distance from bottom and right
DISTANCE_BOTTOM=128
DISTANCE_RIGHT=128

# Calculate positions
POS_X=$((VIDEO_WIDTH - CIRCLE_DIAMETER - DISTANCE_RIGHT))
POS_Y=$((VIDEO_HEIGHT - CIRCLE_DIAMETER - DISTANCE_BOTTOM))

# Process the video
ffmpeg -i "$INPUT_FILE" -filter_complex \
"[0:v] crop=$CIRCLE_DIAMETER:$CIRCLE_DIAMETER:448:168, \
format=rgba, \
geq='r=if(lte(sqrt(pow(($CIRCLE_DIAMETER/2)-X,2)+pow(($CIRCLE_DIAMETER/2)-Y,2)),$CIRCLE_RADIUS),p(X,Y),0): \
g=if(lte(sqrt(pow(($CIRCLE_DIAMETER/2)-X,2)+pow(($CIRCLE_DIAMETER/2)-Y,2)),$CIRCLE_RADIUS),p(X,Y),255): \
b=if(lte(sqrt(pow(($CIRCLE_DIAMETER/2)-X,2)+pow(($CIRCLE_DIAMETER/2)-Y,2)),$CIRCLE_RADIUS),p(X,Y),0): \
a=if(lte(sqrt(pow(($CIRCLE_DIAMETER/2)-X,2)+pow(($CIRCLE_DIAMETER/2)-Y,2)),$CIRCLE_RADIUS),255,0)', \
pad=$VIDEO_WIDTH:$VIDEO_HEIGHT:$POS_X:$POS_Y:color=0x00FF00" \
-c:v libx264 -c:a copy "$OUTPUT_FILE"

echo "Processing complete. Output file is $OUTPUT_FILE"
```

## Misc Hints

Always stay at the same distance from the microphone or the sound changes.
Before recording switch to presentation mode and switch off any timers that could open windows.
Quicktime and screen recorder: for both it's possible to switch off the audio recording or not, depending on the way 
the presentation should be done.

## Downsizing after Exporting

If there is no cropping needed e.g. as follows, else see above.

    ffmpeg -i input.mp4 -c:v libx264 -preset slow -crf 23 -c:a copy output.mp4
