date=$(date +%m | awk '{x=$0+0;print x}')"/"$(date +%d | awk '{x=$0+0;print x}')"/"$(date +%Y | awk '{x=$0+0;print x}')
if [ $# -eq 1 ] ; then
  date=$1
fi
r=$(curl -s "https://www.xwordinfo.com/Rebus" | grep data-date=\"$date\" | wc | awk '{print $1}')
if [ $r -eq 0 ] ; then
  cat index.html | head -n 10 > tmp.txt
  echo "<p>No</p>" >> tmp.txt
  cat index.html | tail -n 3 >> tmp.txt
  cat tmp.txt > index.html
else
  cat index.html | head -n 10 > tmp.txt
  echo "<p>Yes</p>" >> tmp.txt
  cat index.html | tail -n 3 >> tmp.txt
  cat tmp.txt > index.html
fi
echo $date > date.txt
git -C /home/wagreda/Documents/isTodaysNYTCrosswordRebus commit -a -m $date
git -C /home/wagreda/Documents/isTodaysNYTCrosswordRebus push

