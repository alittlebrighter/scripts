#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = weather
# -TAGS- = weather,darksky,http-api
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Fetches the current weather from the DarkSky API.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
function split {
  s=$str$delimiter
  array=();
  while [[ $s ]]; do
      array+=( "${s%%"$delimiter"*}" );
      s=${s#*"$delimiter"};
  done;

  echo "${array[$output]}"
}

str=$(curl -sbX GET "https://api.darksky.net/forecast/${WEATHER_API_KEY}/40.440625,-79.995886,$(date +%s)?exclude=currently,minutely,hourly,alerts,flags")
delimiter="</html>"
output=1

str=$(split)
delimiter="<!DOCTYPE"
output=0

DEG=$'\xc2\xb0'

SUMMARY=$(echo $(split) | jq '.daily.data | .[0].summary')
PRECIP_PROB=$(echo $(split) | jq '.daily.data | .[0].precipProbability')
TEMP_HIGH=$(echo $(split) | jq '.daily.data | .[0].temperatureHigh')
TEMP_LOW=$(echo $(split) | jq '.daily.data | .[0].temperatureLow')

echo "             Summary: $SUMMARY"
echo "Precipitation Chance: ${PRECIP_PROB:2}%"
echo "         Temp. Range: ${TEMP_LOW}${DEG}F - ${TEMP_HIGH}${DEG}F"
