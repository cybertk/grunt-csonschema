module.exports = (grunt) ->

  require('time-grunt') grunt

  ###
  Dynamically load npm tasks
  ###
  require('jit-grunt') grunt

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-mocha-test'

  # Actually load this plugin's task(s).
  grunt.loadTasks('tasks');

  grunt.initConfig

    # Watching changes files *.js,
    watch:
      all:
        files: [
          "Gruntfile.coffee"
          "src/**/*.coffee"
          "test/**/*.coffee"
        ]
        tasks: [
          "test"
        ]
        options:
          nospawn: true

    coffee:
      compile:
        expand: true
        flatten: true
        src: ['src/*.coffee']
        dest: 'tasks/'
        ext: '.js'

    mochaTest:
      test:
        options:
          reporter: 'spec'
          require: 'coffee-script/register'
        src: ['test/**/*.coffee']

    # Before generating any new files, remove any previously-created files.
    clean:
      tests: ['schemas']

    # Configuration to be run (and then tested).
    csonschema:
      compileDefault:
        options:
          $_: 'test/fixtures/extend.type'
        expand: true
        flatten: true
        src: [
          'test/fixtures/sample1.schema'
          'test/fixtures/sample2.schema'
        ]
        dest: 'schemas/'
        ext: '.json'

  grunt.registerTask "default", [
    "watch"
  ]

  grunt.registerTask "test", [
    "clean"
    # "coffee", coffee task should invoke before `grunt test`
    "csonschema"
    "mochaTest"
  ]

  return
