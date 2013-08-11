fs = require 'fs'
ytdl = require 'ytdl'
ffmpeg = require 'fluent-ffmpeg'

url = 'http://www.youtube.com/watch?v=v8bOTvg-iaU'
mp4 = './video.mp4'
mp3 = './audio.mp3'

#ytdl(url).pipe(fs.createWriteStream(mp4))

proc = new ffmpeg({source:mp4})
proc.setFfmpegPath('/Applications/ffmpeg')
proc.saveToFile(mp3, (stdout, stderr)->
			return console.log stderr if err?
			return console.log 'done'
		)
