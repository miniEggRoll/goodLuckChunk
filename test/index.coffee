{chunk}     = require "#{__dirname}/../src/index"
{assert}    = require 'chai'
fs          = require 'fs'

it 'convert stream into buffer', (done)->
    filename = "#{__dirname}/testfile.txt"
    fs.createReadStream filename
    .pipe new chunk()
    .on 'data', (data)->
        content = data.toString()
        fs.readFile filename, {encoding: 'utf8'}, (err, data)->
            assert.strictEqual content, data
            do done
