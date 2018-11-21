project=`ls ~/artistic-videos/inProgress -t | grep -v laststate.txt | head -1`
dir=~/artistic-videos/inProgress/${project}
outDir=$dir/`ls $dir/ -t | grep ${project} | head -1`
totalFrames=$(exec ls $dir | grep frame | sed 's/[^0-9]*\([0-9]\+\).*/\1/g'  | sort -n | tail -1)
currentFrame=$(exec ls $outDir | sed 's/[^0-9]*\([0-9]\+\).*/\1/g'  | sort -n | tail -1)

echo $(date)
echo $outDir
nvidia-smi |grep "%\|="
echo "Exported $currentFrame/$totalFrames frames"


rm /tmp/preview-*.mov
ffmpeg -i $outDir/out-%04d.png -loglevel 'error'  -pix_fmt yuv420p -framerate 30 /tmp/preview-$currentFrame.mov
