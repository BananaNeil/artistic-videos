project=`ls ~/artistic-videos/inProgress -t | grep -v laststate.txt | head -1`
dir=~/artistic-videos/inProgress/${project}
outDir=$dir/`ls $dir/ -t | grep ${project} | head -1`
echo $outDir
rm /tmp/preview.mov
ffmpeg -i $outDir/out-%04d.png -loglevel 'error'  -pix_fmt yuv420p -framerate 30 /tmp/preview.mov
