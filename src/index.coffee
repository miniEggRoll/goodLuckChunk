{Transform} = require 'stream'

class chunk extends Transform
    constructor: ->
        super
        @buff = new Buffer(0)
    _transform: (chunk, encoding, done)->
        @buff = Buffer.concat [@buff, chunk]
        do done
    _flush: (done)->
        @push @buff
        do done

exports.chunk = chunk
