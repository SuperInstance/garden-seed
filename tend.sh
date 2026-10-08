#!/bin/bash
# tend.sh <dir> — health report for a family of repos.
NOW=$(date +%s)
for d in "$1"/*/; do
  [ -d "$d/.git" ] || continue
  NAME=$(basename "$d")
  LAST=$(git -C "$d" log -1 --format=%ct 2>/dev/null) || LAST=0
  AGE=$(( (NOW - LAST) / 86400 ))
  if [ "$LAST" = 0 ]; then STATUS="never-born";
  elif [ "$AGE" -le 7 ]; then STATUS="alive 🌱";
  elif [ "$AGE" -le 30 ]; then STATUS="sleeping 😴";
  else STATUS="dead 💀"; fi
  echo "$STATUS  $NAME  (${AGE}d since commit)"
done | sort
