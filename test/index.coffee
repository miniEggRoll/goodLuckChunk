chunk     = require "#{__dirname}/../src/index"
{assert}    = require 'chai'
fs          = require 'fs'

it 'convert binary stream into buffer', (done)->
    filename = "#{__dirname}/testfile.txt"
    fs.createReadStream filename
    .pipe new chunk()
    .on 'data', (data)->
        fs.readFile filename, (err, content)->
            assert.equal c, data[idx] for c, idx in content
            do done

it 'convert string stream into string', (done)->
    filename = "#{__dirname}/testfile.txt"
    fs.createReadStream filename
    .pipe new chunk()
    .on 'data', (data)->
        content = data.toString()
        fs.readFile filename, {encoding: 'utf8'}, (err, data)->
            assert.strictEqual content, data
            do done
