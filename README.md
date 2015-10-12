# Hubot for Ingress

This is a clone of a Hubot installed on Slack. Feel free to fork/clone for your own group's usage. We run ours on a [https://github.com/progrium/dokku](dokku) instance.


## Setup

### Slack Integration

1. Log into your Slack instance.
2. Go to the integrations page (in the web interface, click the team name for admin things and choose integrations).
3. Scrolling through the list, find Hubot. Add that one.
4. Selet a username for your bot. Ours has gone through several name changes (hubot, xm-bot, groot). You must also give the robot a "full name". You can also set an avatar.
5. At the end, you'll get an API token. You'll need it for later.

#### Things to note for later:

B. The API token


### Hubot Codebase

1. Clone this repo to your local machine: `git clone git@github.com:impleri/another-ingress-hubot.git`
2. Deploy it to your server (depends on setup)
3. Configure the necessary environment variables:
    - HEROKU_URL=https://[app-name].[domain-name.com]
    - HUBOT_CYCLE_TZ_NAME (from hubot-ingress). America/Chicago is US/Central.
    - HUBOT_SLACK_TOKEN (token from above)
    - HUBOT_SLACK_INVITE_TOKEN (from hubot-invite-slack)
    - HUBOT_YOUTUBE_API_KEY (from hubot-youtube)
    - HUBOT_AUTH_ADMIN (from hubot-auth*)
    - REDIS_URL (from hubot-redis-brain)
5. Restart your robot for good measure: `heroku ps:restart`


* This is a comma-separated list of user ids that get robot taming powers. To get the user ids for HUBOT_AUTH_ADMIN, go to https://api.slack.com/methods/users.list/test (you may need to generate an API token for your account) and get the list of users. Search for a user by username and get the `"id"` field about the username.


### Test in Slack

1. Invite your tame robot to a chat room. It should join automatically.
2. Ping your robot: `[hubot-name] doge me`. It should repond with a Doge meme.
3. Check the cycle times are correct: `[hubot-name] cp`. This should provide the next septicycle checkpoint time localized to your timezone. If it isn't correct, ensure the timezone is correct: `[hubot-name] cycle offset`.
4. Ensure meme generation works: `[hubot-name] need help why not zoidberg?` should generate a Zoidberg meme.
