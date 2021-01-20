#!/usr/bin/env bash

chrome="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

for week in $(seq -f "%02g" $1 $2); do
  url="http://localhost:8081/#/?week=$week"
  echo "Creating PDF for week $week..."
  "$chrome" --headless --print-to-pdf="./weeks/week-$week.pdf" --no-margins $url
done

echo "Done"
