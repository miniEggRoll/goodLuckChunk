[![Build Status](https://travis-ci.org/mrsquid0126/goodLuckChunk.svg)](https://travis-ci.org/mrsquid0126/goodLuckChunk)

goodLuckChunk
=============

concat node stream chunks into a buffer and return it


# example

- for string

```
chunk = require 'goodLuckChunk'

fs.createReadStream 'sample.txt', {encoding: 'utf8'}
.pipe new chunk()
.on 'data', (data)->
    console.log data

```

- for buffer

```
fs.createReadStream 'sample.txt'
.pipe new chunk()
.on 'data', (data)->
    console.log data.toString('utf8')

```

- for object mode

```
fs.createReadStream 'sample.json'
.pipe parse
.pipe new chunk()
.on 'data', (data)->
    console.log data
```
