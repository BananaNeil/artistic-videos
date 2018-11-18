# find artistic-videos/inProgress/ -name 'out*.png' | tar -cvjf progress.tar.gz --files-from -


outfiles=$(find ~/artistic-videos/inProgress/ -name 'out*.png' | sed 's/[a-z0-9\.\-]*$//g' | uniq)


mkdir /tmp/previews
i=1
for outDir in $outfiles; do
  echo "preview-$i frames: $(exec ls $outDir | sed 's/[^0-9]*\([0-9]\+\).*/\1/g'  | sort -n | tail -1)"
  ffmpeg -i $outDir/out-%04d.png -loglevel 'error'  -pix_fmt yuv420p -framerate 30 /tmp/previews/preview-$i.mov
  i=$(($i+1))
done
tar -cvjf /tmp/previews.tar.gz /tmp/previews


