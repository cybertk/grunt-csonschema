csonschema = require 'csonschema'

module.exports = (grunt) ->
  grunt.registerMultiTask 'csonschema', 'Compile csonschema files to jsonschema', ->
    options = @options()
    {rootObject} = options
    rootObject ?= false

    @files.forEach ({src, dest}) ->
      grunt.log.debug("Compiling #{src} to #{dest}")

      [source] = src
      obj = csonschema.parseSync source

      grunt.log.debug("Parsed #{src}")

      json = JSON.stringify(obj, null, 2)
      grunt.file.write(dest, json)
      grunt.log.writeln("File #{dest.cyan} created.")

    fileCount = @files.length
    grunt.log.ok("#{fileCount} #{grunt.util.pluralize(fileCount, 'file/files')} compiled to jsonschema.")
