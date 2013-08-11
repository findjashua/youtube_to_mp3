fs = require 'fs'
ytdl = require 'ytdl'
ffmpeg = require 'fluent-ffmpeg'

url = 'http://www.youtube.com/watch?v=v8bOTvg-iaU'
mp3 = '../audio.mp3'

stream = ytdl(url)

proc = new ffmpeg({source:stream})
proc.setFfmpegPath('/Applications/ffmpeg')
proc.saveToFile(mp3, (stdout, stderr)->
			return console.log stderr if err?
			return console.log 'done'
		)
