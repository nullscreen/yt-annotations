A Ruby gem to fetch YouTube annotations
=======================================

Yt::Annotations is a Ruby library to fetch annotations, cards and end screens of YouTube videos.

The **source code** is available on [GitHub](https://github.com/fullscreen/yt-annotations) and the **documentation** on [RubyDoc](http://www.rubydoc.info/github/fullscreen/yt-annotations/Yt/Annotations).

[![Build Status](http://img.shields.io/travis/Fullscreen/yt-annotations/master.svg)](https://travis-ci.org/Fullscreen/yt-annotations)
[![Coverage Status](https://coveralls.io/repos/github/Fullscreen/yt-annotations/badge.svg?branch=master)](https://coveralls.io/github/Fullscreen/yt-annotations?branch=master)
[![Dependency Status](http://img.shields.io/gemnasium/Fullscreen/yt-annotations.svg)](https://gemnasium.com/Fullscreen/yt-annotations)
[![Maintainability](https://api.codeclimate.com/v1/badges/b186efaae14e521ca51d/maintainability)](https://codeclimate.com/github/Fullscreen/yt-annotations/maintainability)
[![Online docs](http://img.shields.io/badge/docs-✓-green.svg)](http://www.rubydoc.info/gems/yt-annotations/Yt/Annotations)
[![Gem Version](http://img.shields.io/gem/v/yt-annotations.svg)](http://rubygems.org/gems/yt-annotations)

How to use
==========

Simply call `Yt::Annotations.for` with the ID of a YouTube video:

```ruby
annotations = Yt::Annotations.for 'MESycYJytkU'
# => [#<Yt::Annotations::Featured …>]
annotations.first.text
# => "Suggested by Fullscreen: What is Fullscreen?"
annotations.first.starts_at
# => 76.0
annotations.first.ends_at
# => 86.0
annotations.first.link
# {url: "https://www.youtube.com/watch?v=NeMlqbX2Ifg", new_window: true, type: :video}
```

How to install
==============

Yt::Annotations requires **Ruby 2.2.2 or higher**.

To include in your project, add `gem 'yt-annotations', ~> '1.0'` to the `Gemfile` file of your Ruby project.


How to contribute
=================

Contribute to the code by forking the project, adding the missing code,
writing the appropriate tests and submitting a pull request.

In order for a PR to be approved, all the tests need to pass and all the public
methods need to be documented and listed in the guides. Remember:

- to run all tests locally: `bundle exec rspec`
- to generate the docs locally: `bundle exec yard`
- to list undocumented methods: `bundle exec yard stats --list-undoc`

