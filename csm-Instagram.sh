#!/bin/bash
if [ $1 = "" ]; then
echo "Collection Social Media - Instagram by:Alt3r3ad1"
echo "Install requirements: xargs sudo apt-get install < requirements.txt"
echo "Method for use: csm-Instagram.sh 'link.profile(@)'"
else
target=$(echo $1 | sed 's/\@//g');
script=$(date +%F_%R)"_Script_"$target
scriptLog=$(date +%F_%R)"_Script.log"
mkdir ./$script
echo $(date +%F_%R)"---------- Start Script";
echo $(date +%F_%R)"---------- Start Script" > ./$script/$scriptLog;
while
lynx --dump "https://imginn.com/$target" | grep "10\." | sed 's/10\.//g' | sed 's/ //g' > $script/csm.txt;
if [ ! -f $script/csm.log ]; then
        echo "NothingExists" > $script/csm.log;
fi
if [ -s $script/csm.txt ]; then
        if [ $(cat $script/csm.txt) != $(cat $script/csm.log) ]; then
	firefox $(lynx --dump "https://imginn.com/$target" | grep "10\." | sed 's/10\.//g' | sed 's/ //g' | sed 's/imginn/instagram/g');
        curl $(lynx --dump "https://imginn.com/$target" | grep "11\." | sed 's/11\.//g' | sed 's/ //g') -o $script/$(date +%F_%R)'_'$target'_post.png';
        $(scrot -b -u -d 4 $script/'%Y:%m:%d:%H:%M:%S_'$target'.png' -e 'mv $f ./'$script);
        echo $(date +%F_%R)"---------- New Post!";
        echo $(date +%F_%R)"---------- New Post!" >> ./$script/$scriptLog;
        else
        echo $(date +%F_%R)"---------- No New Post";
        echo $(date +%F_%R)"---------- No New Post" >> ./$script/$scriptLog;
fi
fi
mv $script/csm.txt $script/csm.log;
if [ -s $script/csm.txt ]; then
rm -r $script/csm.txt;
fi;
do sleep 60;
done
fi
