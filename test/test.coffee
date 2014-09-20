chai = require 'chai'

chai.should()

fs = require 'fs'

path = (filename) ->
  "#{__dirname}/../#{filename}"

# Actual test is started by `grunt csonschema`, here we only check the results of grunt task
describe 'csonschema task', ->

  before (done) ->
    # Actual test is started by `grunt csonschema`.
    done()

  describe 'compareDefault', ->

    it 'should compiles valid csonschema files to jsonschema', ->
      fs.existsSync(path 'schemas/sample1.json').should.be.ok
      fs.existsSync(path 'schemas/sample2.json').should.be.ok
