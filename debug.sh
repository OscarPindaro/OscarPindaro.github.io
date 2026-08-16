#!/bin/bash
# Initialize rbenv for this session
if command -v rbenv &> /dev/null; then
    eval "$(rbenv init - bash)"
fi
bundle exec jekyll serve --livereload
