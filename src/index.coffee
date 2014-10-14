{Transform} = require 'stream'

class chuck extends Transform
    constructor: ->
        @buff = new Buffer(0)
    _transform: (chunk)->
        Buffer.concat [@buff, chunk], 2
    _flush: ->
        @push @buff
