outfiles=$(find ~/artistic-videos/inProgress/ -name 'out*.png' | sed 's/[a-z0-9\.\-]*$//g' | uniq)

echo $(date)
nvidia-smi |grep "%\|="

i=1
for outDir in $outfiles; do
  echo $outDir
  frames=$(exec ls $outDir | sed 's/[^0-9]*\([0-9]\+\).*/\1/g'  | sort -n | tail -1)
  echo "preview-$i frames: $frames"

  i=$(($i+1))
done
