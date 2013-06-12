Welcome to CCMTV - Contemporary Music Television
================================================

*A brief history:*

In the early 1990's, while I was a graduate student at UC San Diego's School of Music, I met a brilliant young composer named [Arun Bharali](http://en.wikipedia.org/wiki/Arun_Bharali). Arun (now known mononymously as Petrichor) approached me in Spring of 2011 with the idea of building a web site to catalog and showcase contemporary classical music performances. In his words:

"Being at the festival it struck me as a shame that there are so many talented composers whose works may only be performed once, and even if they manage to have it filmed or recorded, it's difficult for them to expose the results to a wider audience.  My idea would be to encourage music departments to video their new music performances then upload them to youtube and make a site that indexes and rates them.  The site would also be an index of new music performers, a bit like imdb is for actors."

I was interested in learning Ruby on Rails, and I thought working on this project would be a good way to improve my skills.

The project was started by @yakloinsteak, who did a great job getting the basic architecture set up. CCMTV has been simmering on the back burner for a long time. I've enjoyed tinkering with it on and off, but since it is completely unfunded, it's been taking a back seat to my day job, music projects, and family commitments. We are currently seeking developers to help us improve the site.

The code is basically functional, but there are many improvements to be made, and bugs to be fixed. I'm sorry to say that the rspec tests have not been kept up to date. The data entry process requires too many steps and needs to be streamlined. There is also a need to build out the moderation process for edits. Currently the "admin" role is granted to anyone who registers.

The general plan is to get the site 

It is hosted on Amazon EC2 using Bitnami, and available at http://ccmtv.cc.

Getting started
----------------

1. clone the project
2. `bundle install`
3. fire up mysql, and run the following commands:

	rake db:setup
	rake db:seed_fu
	
4. `rails s` to start the server
5. `rspec spec` to run the tests. (Many are broken. Help me fix 'em!)

The app uses the [devise](https://github.com/plataformatec/devise) gem for managing user accounts, and [cancan](https://github.com/ryanb/cancan) for handling authorization. 