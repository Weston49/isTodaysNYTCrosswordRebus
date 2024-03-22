date=$(date +%m | awk '{x=$0+0;print x}')"/"$(date +%d | awk '{x=$0+0;print x}')"/"$(date +%Y | awk '{x=$0+0;print x}')
if [[ $# -eq 1 ]] ; then
  date=$1
fi
r=$(curl -s "https://www.xwordinfo.com/Rebus" | grep data-date=\"$date\" | wc | awk '{print $1}')
if [[ $r -eq 0 ]] ; then
  echo "No"
else
  echo "Yes"
fi
