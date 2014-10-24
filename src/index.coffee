{Transform} = require 'stream'
debug       = require('debug')('chunk')

class chunk extends Transform
    constructor: ->
        super
    _transform: (chunk, encoding, done)->
        switch typeof chunk
            when 'string'
                @buff = ''
                trans = (chunk, dummy, done)->
                    @buff += chunk
                    do done
            when 'object'
                if chunk instanceof Buffer
                    @buff = new Buffer(0)
                    trans = (chunk, dummy, done)->
                        @buff = Buffer.concat [@buff, chunk]
                        do done

        trans.apply @, [chunk, encoding, done]
        @_transform = trans
    _flush: (done)->
        @push @buff
        do done

module.exports = chunk
