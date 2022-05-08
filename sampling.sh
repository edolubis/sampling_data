#!/usr/bin/bash

# download 
wget -P ./data https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

# convert
FILE=/home/edolubis/sampling_data/data/weather_data.xlsx

in2csv $FILE --sheet "weather_2014" > /home/edolubis/sampling_data/data/weather_2014.csv
in2csv $FILE --sheet "weather_2015" > /home/edolubis/sampling_data/data/weather_2015.csv

# gabungkan data
FILE_1=/home/edolubis/sampling_data/data/weather_2014.csv
FILE_2=/home/edolubis/sampling_data/data/weather_2015.csv

csvstack $FILE_1 $FILE_2 > /home/edolubis/sampling_data/data/weather.csv

# sampling file weather
FILE_3=/home/edolubis/sampling_data/data/weather.csv

cat $FILE_3 | sample -r 0.3 > /home/edolubis/sampling_data/data/sample_weather.csv

