#!/bin/bash

if [ "$TRAVIS_BRANCH" = "master" ]; then
  export PUBLISH_VERIFICATION_RESULTS=true
fi

bundle exec rake pact:verify
