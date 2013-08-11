id = 'vUQPLAlU0Sw'
youtube_dl = spawn './youtube-dl', ['--extract-audio', '--audio-format', 'mp3', "http://www.youtube.com/watch?v=#{id}"]

# Let's echo the output of the child to see what's going on
youtube_dl.stdout.on 'data', (data) ->
  console.log data.toString()
  # Incase something bad happens, we should write that out too.
  youtube_dl.stderr.on 'data', (data) ->
    process.stderr.write data
    # when we're done, let's send back the output
  youtube_dl.on 'exit', ->
    readFile "./#{id}.mp3", (err, data) ->
    # We set our content type so consumers of our API know what they are getting
    res.send data, { 'Content-Type': 'audio/mpeg3' }