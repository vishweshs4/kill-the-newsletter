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

This is a pretty standard [Ruby on Rails][ruby-on-rails] application. The proper
[Ruby][ruby] version and dependencies to run are listed on the `Gemfile`.

The e-mail receiving part of the application works by using the
[Griddler][griddler] gem and the service provided by [Mandrill][mandrill] to
parse incoming e-mails.

For that reason, in order to test on your local machine, you need to make your
server visible to the world. This is easy to achieve with [ngrok][ngrok].

You also need an account on [Mandrill][mandrill]. Accounts for developers are
free and you most certainly are not going to exceed the free quota.

For more detailed instructions, read the [deployment](#deployment) section. Be
sure to specify the address to your local server on [Mandrill][mandrill]'s
Inbound Mailbox Route Webhook. If you're using [ngrok][ngrok] to expose your
local server to the world, the address is going to be something like
`https://<some-random-characters>.ngrok.com/email_processor`.

Deployment
----------

This service is currently hosted on [Heroku][heroku] - including their
[Postgres service][heroku-postgres] - and [Mandrill][mandrill]. This is the
setup I'm going to describe here and you should feel free to deploy your own
instance. You probably can make some adaptations to fit your needs.

Start by buying a domain and setting up MX records that points to the
[Mandrill][mandrill] servers. I recommend using [CloudFlare][cloudflare] as
nameserver, so you get [free TLS support on Heroku][free-tls-heroku].

Then, add the domain as an Inbound Domain on [Mandrill][mandrill]. Add a
catch-all Mailbox Route for the domain so that when the receiving e-mail address
matches `*`, [Mandrill][mandrill] POSTs to
`https://<your-domain>/email_processor`.

Deploy this application as you would any other [Ruby on Rails][ruby-on-rails]
application. Remember to run the migrations with `heroku run bin/rake
db:migrate`.

Then enjoy the rest of your day.


[kill-the-newsletter]: https://www.kill-the-newsletter.com
[ruby-on-rails]: https://rubyonrails.org
[ruby]: https://ruby-lang.org
[griddler]: http://griddler.io/
[mandrill]: http://www.mandrill.com/
[ngrok]: https://ngrok.com/
[heroku]: https://heroku.com
[heroku-postgres]: https://postgres.heroku.com
[cloudflare]: https://www.cloudflare.com/
[free-tls-heroku]: https://robots.thoughtbot.com/set-up-cloudflare-free-ssl-on-heroku
