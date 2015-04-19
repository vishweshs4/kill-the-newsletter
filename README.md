TODO: Review links.

Kill the newsletter!
====================

[Kill the newsletter!][kill-the-newsletter] is a service that transforms
newsletters into RSS feeds.

To understand the features and rationale, refer to the
[service webpage][kill-the-newsletter]. This is a technical documentation
directed to people that want to [contribute to the project](#contributing) or
[deploy their own instance](#deployment).

Contributing
------------

This is a regular [Ruby on Rails][ruby-on-rails] application. The proper
[Ruby][ruby] version and dependencies to run are listed on the `Gemfile`.

The e-mail receiving part of the application works by using the
[Griddler][griddler] gem and the service provided by [Mandrill][mandrill] to
parse incoming e-mails.

For that reason, in order to test on your local machine, you need to make your
server visible to the world. This is easy to achieve with [ngrok][ngrok].

You also need an account on [Mandrill][mandrill]. Accounts for developers are
free and you're most certainly not going to exceed the free quota.

Deployment
----------

1. Buy domain.
2. Heroku.


[kill-the-newsletter]: https://www.kill-the-newsletter.com
[ruby-on-rails]: https://rubyonrails.org
[ruby]: https://ruby-lang.org
[griddler]: http://griddler.io/
[mandrill]: http://www.mandrill.com/
[ngrok]: https://ngrok.com/
