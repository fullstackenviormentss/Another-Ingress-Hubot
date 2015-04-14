# Hubot for Ingress

This is a clone of a Hubot installed on Slack. Feel free to fork/clone for your own group's usage. It runs on an Heroku instance with Redis.


## Setup

### Hosting Platform

1. Sign up for an account on Heroku: https://signup.heroku.com
    - Pro-tip: Do this twice -- once with an email address for your local group and once with your personal email. Give the group's login details to others within the group.
    - You'll want to setup the app with the group's account, but then give your personal email access. That way, if you fall off the grid, rage quit the game, etc, someone in the group can take over without needing to hunt you down.
2. Create a new app. Name isn't necessary, but helpful in identifying the app in a list.
3. Heroku will give you instructions on installing the Heroku toolbelt, connecting your local git repo.
4. Under the "Access" tab, give your personal account access.

#### Things to note for later:

A. The git repository endpoint commands. Will look like `heroku git:remote -a [app-name]`. You'll need the app-name portion.


### Slack Integration

1. Log into your Slack instance.
2. Go to the integrations page (in the web interface, click the team name for admin things and choose integrations).
3. Scrolling through the list, find Hubot. Add that one.
4. Selet a username for your bot. Ours has gone through several name changes (hubot, xm-bot, groot). You must also give the robot a "full name". You can also set an avatar.
5. At the end, you'll get an API token. You'll need it for later.

#### Things to note for later:

B. The API token


### Memegen Integration

1. Visit http://memegenerator.net/
2. Sign up for an account (access via login popup).

#### Things to note for later:

C. Username and password for the account.


### Hubot Codebase

1. Clone this repo to your local machine: `git clone git@github.com:impleri/another-ingress-hubot.git`
2. Log into Heroku via the CLI: `heroku login`
2. Add the remote heroku repo for syncing: `heroku git:remote -a [app-name]` (from above)
3. Push the code to the heroku remote: `git push heroku master`
4. Provision the web stack: `heroku ps scale web=1`
5. Provision addons: `heroku addons:add [name]`
    - At a minumum, you must add Redis. `redistogo:nano` is free and quite enough for Hubot. You should get a URL to use for the Redis instance.
    - Feel free to add a logging addon (`papertrail`, `logentries:tryit`)
4. Configure the necessary environment variables: `heroku config:set [key]=[value]`.
    - HUBOT_CYCLE_TZ_NAME (from hubot-ingress). America/Chicago is US/Central.
    - HUBOT_MEMEGENERATOR_PASSWORD (from above)
    - HUBOT_MEMEGENERATOR_USERNAME (from above)
    - HUBOT_MEMEGEN_PASSWORD (from above)
    - HUBOT_MEMEGEN_USERNAME (from above)
    - HUBOT_SLACK_TOKEN (token from above)
    - REDISTOGO_URL (provided from registring the addon)
5. Restart your robot for good measure: `heroku ps:restart`


### Test in Slack

1. Invite your tame robot to a chat room. It should join automatically.
2. Ping your robot: `[hubot-name] ping`. It should repond with "PONG" automatically.
3. Check the cycle times are correct: `[hubot-name] cp`. This should provide the next septicycle checkpoint time localized to your timezone. If it isn't correct, ensure the timezone is correct: `[hubot-name] cycle offset`.
4. Ensure futurama meme generation works: `Need help why not zoidberg?` should generate a Zoidberg meme.
5. Ensure meme generation works: `[hubot-name] one does not simple walk into mordor` should generate a Boromir meme.
