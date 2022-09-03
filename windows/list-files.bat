
for %f in (*.mp4);do echo file '%f' >> filelist.txt

REM     for %f in (N:\xy\*);do echo file '%f' >> .\list.txt
REM     ffmpeg.exe -f concat -safe 0 -i list.txt -c copy output.mp4
REM     ffmpeg.exe -f concat -safe 0 -i list.txt -c copy 2022-07-24_complete.mp4