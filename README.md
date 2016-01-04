A Ruby gem to fetch YouTube annotations
=======================================

Yt::Annotations is a Ruby library to fetch annotations and cards of YouTube videos.

The **source code** is available on [GitHub](https://github.com/claudiob/yt-annotations) and the **documentation** on [RubyDoc](http://www.rubydoc.info/github/claudiob/yt-annotations/Yt/Annotations).

[![Build Status](http://img.shields.io/travis/claudiob/yt-annotations/master.svg)](https://travis-ci.org/claudiob/yt-annotations)
[![Coverage Status](http://img.shields.io/coveralls/claudiob/yt-annotations/master.svg)](https://coveralls.io/r/claudiob/yt-annotations)
[![Dependency Status](http://img.shields.io/gemnasium/claudiob/yt-annotations.svg)](https://gemnasium.com/claudiob/yt-annotations)
[![Code Climate](http://img.shields.io/codeclimate/github/claudiob/yt-annotations.svg)](https://codeclimate.com/github/claudiob/yt-annotations)
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

Yt::Annotations requires **Ruby 2.0 or higher**.

To include in your project, add `gem 'yt-annotations', ~> '1.0'` to the `Gemfile` file of your Ruby project.

How to contribute
=================

If you’ve made it this far in the README… thanks! :v:
Feel free to try it the gem, explore the code, and send issues or pull requests.

All pull requests will have to make Travis and Code Climate happy in order to be accepted. :kissing_smiling_eyes:

You can also run the tests locally with `bundle exec rspec`.

Happy hacking!
