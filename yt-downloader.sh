#!/bin/bash

VIDEO_ID="$1"

yt-dlp -f "bv[ext=mp4][vcodec!=av01][height<=1080]+ba[ext=m4a]/best[ext=mp4][vcodec!=av01][height<=1080]" \
  --write-auto-subs --sub-lang en --embed-subs --merge-output-format mp4 \
  "https://www.youtube.com/watch?v=${VIDEO_ID}"

