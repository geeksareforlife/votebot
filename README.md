[![Build Status](https://travis-ci.org/openpolitics/votebot.png?branch=master)](https://travis-ci.org/openpolitics/votebot) [![Coverage Status](https://coveralls.io/repos/github/openpolitics/votebot/badge.svg?branch=master)](https://coveralls.io/github/openpolitics/votebot?branch=master) [![Dependency Status](https://gemnasium.com/badges/github.com/openpolitics/votebot.svg)](https://gemnasium.com/github.com/openpolitics/votebot) [![Code Climate](https://codeclimate.com/github/openpolitics/votebot/badges/gpa.svg)](https://codeclimate.com/github/openpolitics/votebot)


# Votebot

An app which monitors manifesto PRs, and decides if consensus has been reached.

## Usage

### Voting rules

## Get your own!

This isn't a simple process, unfortunately, but we'll help you through as best we can...

### Set up a GitHub repository for your content

You can use Votebot to edit any GitHub repository you like, but we've set up a template site using GitHub Pages and Jekyll to get you started. 

[Click here to create your very own copy, ready to go.](https://github.com/openpolitics/template/fork)

Then visit the cloned repository's settings page, and:

* rename it to something more useful than `template`
* enable GitHub pages on the `master` branch

Your new site will be visible at `https://{{your-username}}.github.io/{{repository-name}}`. If you've set up a CNAME on your user site, the URL will be different, but you're advanced enough to work that out yourself.

### Create a GitHub API token

Visit the [Personal Access Tokens page](https://github.com/settings/tokens) on your GitHub account to create a token for accessing the API. Generate a new token. You'll need to allow the following permissions:

* public_repo
* repo:status
* user:email 
* write:repo_hook

Keep hold of the generated token - you'll need it in a minute.

### Create a GitHub OAuth application

Visit the [Developer applications page](https://github.com/settings/developers) on your GitHub account to set up user login via GitHub. Register a new application; in the homepage and callback URLs enter the URL of the application you are about to deploy. Yes, that's slightly tricky. It will be something like `https://your-unique-votebot-app-name.herokuapp.com`. Make up the `your-unique-votebot-app-name` part. The name of your project will probably do.

Again, keep hold of the client ID and secret. You'll need them in the next step.

### Deploy the code to Heroku

Hit this big deploy button here: 

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

Then, enter all the relevant details. Use the same app name you did in the step above, `your-unique-votebot-app-name`. If it's taken, don't worry, you can go back and edit the GitHub application settings later.

Enter the personal access token, client ID, and secret from the previous stage. Enter the repository path of your cloned template site - it should be something like `your-username/repository-name`.

### Set up the GitHub webhook

Go back to the GitHub setting tab for your repository and click on `webhooks`, then `Add a webhook`.

Enter the Payload URL `https://your-unique-votebot-app-name.herokuapp.com/webhook`, changing the root URL to be the one you're using for your deployed votebot.

Leave the rest of the settings on default except for "which events would you like to trigger this webhook?". Select "Let me select individual events" and then choose just:

* Issue comment
* Pull request

Save the webhook. It will probably complain with the test payload, but should work for the real thing. We'll fix this soon.

### Configure the editor link on your site

Go to the `_config.yml` file in your site's GitHub repository, and add the URL of your deployed Heroku app to the `votebot_url` setting. It will be the same as what you put in above for the GitHub application homepage, i.e. `https://your-unique-votebot-app-name.herokuapp.com`

### Enable the nightly update task