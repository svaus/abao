chai = require 'chai'
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
proxyquire = require('proxyquire').noCallThru()

Test = require '../../lib/test'
ramlParserStub = require 'raml-parser'
addTestsStub = require '../../lib/add-tests'
addHooksStub = require '../../lib/add-hooks'
runnerStub = require '../../lib/test-runner'
hooksStub = require '../../lib/hooks'

Abao = proxyquire '../../', {
  'raml-parser': ramlParserStub,
  './add-tests': addTestsStub,
  './add-hooks': addHooksStub,
  './test-runner': runnerStub,
  './hooks': hooksStub
}

should = chai.should()
chai.use(sinonChai)


describe 'Abao', () ->
  'use strict'

  describe '#constructor', () ->

    describe 'with default config', () ->

      it 'should create a new instance', () ->
        abao = new Abao()
        abao.should.not.be.null


  describe '#run', () ->

    abao = ''
    callback = undefined
    before (done) ->
      abao = new Abao()
      callback = sinon.stub()
      callback.returns done()
      abao.run callback

    it 'should invoke callback', () ->
      callback.should.be.called

