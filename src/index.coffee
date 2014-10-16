{Transform} = require 'stream'

class chunk extends Transform
    constructor: ->
        super
    _transform: (chunk, encoding, done)->
        switch typeof chunk
            when 'Buffer'
                @buff = new Buffer(0)
                @_transform = (chunk, dummy, done)->
                    @buff = Buffer.concat [@buff, chunk]
                    do done
            when 'string'
                @buff = ''
                @_transform = (chunk, dummy, done)->
                    @buff += chunk
                    do done
            when 'object'
                @buff = []
                @_transform = (chunk, dummy, done)->
                    @buff.push chunk
                    do done
        do done
    _flush: (done)->
        @push @buff
        do done

exports.chunk = chunk
