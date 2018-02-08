# Changelog

All notable changes to this project will be documented in this file.

For more information about changelogs, check
[Keep a Changelog](http://keepachangelog.com) and
[Vandamme](http://tech-angels.github.io/vandamme).

## Unreleased

**How to upgrade**

If your code calls `Yt::Annotation::Featured` object, you should not use it because it is removed.

* [REMOVAL] Remove Yt::Annotation::Featured annotation because YouTube removed it (as of 12-14-2017).
https://developers.google.com/youtube/v3/revision_history?id=november-27-2017
* [BUGFIX] Do not raise errors from end screens with different URL format
* [ENHANCEMENT] Fetch 'promotion' type annotation without errors.

## 1.4.2 - 2017.05.24

* [BUGFIX] Do not raise errors from endscreens with different title format

## 1.4.1 - 2017.03.31

* [BUGFIX] Change `EndScreen` according to its endpoint change on YouTube

## 1.4.0 - 2017.01.13

* [FEATURE] Add End Screens

## 1.3.2 - 2016.09.08

* [BUGFIX] Do not raise errors from videos with 'speech' style

## 1.3.1 - 2016.09.07

* [ENHANCEMENT] Fetch 'pause' annotation without errors.

## 1.3.0 - 2016.07.11

* [BUGFIX] Bump Ruby version to 2.2.2 to make it work with ActiveSupport 5

## 1.2.3 - 2016.06.09

* [BUGFIX] Don't raise errors on `Yt::Annotations.for` for some videos in Barbie channel

## 1.2.2 - 2016.05.16

* [BUGFIX] Do not raise errors from videos with info cards.

## 1.2.1 - 2016.02.05

* [ENHANCEMENT] Update homepage on rubygems.org

## 1.2.0 - 2015.12.02

* [ENHANCEMENT] Parse new 'simple' card type (which YouTube now uses instead of 'merch', 'fundraising', 'associated').

## 1.1.0 - 2015.11.12

* [FEATURE] Fetches annotations and cards of YouTube videos.
