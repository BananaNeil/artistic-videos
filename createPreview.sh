project=`ls ~/artistic-videos/inProgress -t | head -1`
dir=~/artistic-videos/inProgress/${project}
outDir=$dir/`ls $dir/ -t | grep ${project} | head -1`
echo $outDir
ffmpeg -i $outDir/out-%04d.png -loglevel 'error'  -pix_fmt yuv420p -framerate 30 /tmp/preview.mov
