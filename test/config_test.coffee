assert = require('assert')
config = require('../lib/conjur/config')

describe 'config', ()->
  describe 'env = development', ->
    env = 'development'
    describe 'stack = ci', ->
      stack = 'ci'
      describe 'account = test', ->
        account = 'test'
        it 'authn matches expectation', ->
          assert.equal config.authnUrl(env, stack, account), 'http://localhost:5000'
        it 'authz matches expectation', ->
          assert.equal config.authzUrl(env, stack, account), 'http://localhost:5100'
   
  describe 'env = production', ->
    env = 'production'
    describe 'stack = ci', ->
      stack = 'ci'
      describe 'account = test', ->
        account = 'test'
        it 'authn matches expectation', ->
          assert.equal config.authnUrl(env, stack, account), 'https://authn-test-conjur.herokuapp.com'
        it 'authz matches expectation', ->
          assert.equal config.authzUrl(env, stack, account), 'https://authz-ci-conjur.herokuapp.com'
  
