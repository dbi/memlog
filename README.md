Memlog
======
Memlog is a simple gem to track down memory leaks in your Rails application.

Usage
-----

Just include the Memlog module in a rails controller

    class ApplicationController < ActionController::Base

      include Memlog

      # ...

    end

And it will log the following output on each request

    2011-12-27 08:42:47	Memory: +1009 KB	Now: 311948 KB	PID:25430	GET http://publish.mynewsdesk.com/se/edit/pressrelease

Notes
-----

Grep for requests that increate memory consumption drastically

    $ grep 'Memory: +[0-9]\{6\}' log/production.log
