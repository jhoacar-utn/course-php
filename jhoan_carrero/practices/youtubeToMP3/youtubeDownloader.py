#!/usr/bin/python

import sys
import os
import pytube
import moviepy.editor as mp

currentFile = __file__  
realPath = os.path.realpath(currentFile)  
dirPath = os.path.dirname(realPath)

temporalVideo = dirPath+"/tmp"
folderSongs = dirPath+"/songs/"
extensionSong = ".mp3"

def main(link):
    yt = pytube.YouTube(link)

    titleVideo = yt.title

    stream = yt.streams.first()
    stream.download(output_path='.', filename=temporalVideo)

    clip = mp.VideoFileClip(temporalVideo)
    clip.audio.write_audiofile(folderSongs+titleVideo+extensionSong)

    if os.path.isfile(temporalVideo):
        os.remove(temporalVideo)


if __name__ == "__main__":
    if len(sys.argv) > 1:
        main(sys.argv[1])
    else:
        print("A url is required")
        sys.exit(1)