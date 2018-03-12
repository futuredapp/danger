# Danger rules at The Funtasty

These are the rules we use for checking our pull requests by Danger optimized for mobile app development:

- Only `release/` branches can point to master.
- Branch name should have `release/`, `hotfix/`, `fix/`, `housekeep/` or `feature/` prefix.
- Title should be `JIRA-ID Some descriptive name` for `feature/` and `fix/` branches.
- Should not be work in progress `[WIP]`.
- Should not be over 500 lines.
- Commit names should start with a large letter and should not be too long.
- iOS specific:
  - Swiftlint should not produce any warnings.
  - Xcode build should not produce any warnings.
  
Examples of pretty branch names:

- `feature/JIRA-00-chat-screen`
- `fix/JIRA-00-sending-messages`
- `release/v0.0.0-0`
- `housekeep/dependencies`
- `hotfix/JIRA-00-crash-on-launch`

## Installation

We want to run Danger on CI, so the configuration here is focusing on it.

First, we need to get the GitHub API token for the bot account, which will be commeting our pull requests and set it as an environment variable.

```
export DANGER_GITHUB_API_TOKEN=XXXXX
```

Second, if we use another Ruby tools and gems, we need to add the rules gem to our Gemfile and update the bundle.

```
bundle add thefuntasty_danger
```

And then if we sometimes need to update our rules, we only need to call:

```
bundle update
```

If we do not use any gems (is usually true for Android and react Native projects) then we can run this short script to install everything we need (if of course Ruby and bundler are installed):

```
#!/usr/bin/env bash
echo "source 'https://rubygems.org'; gem 'thefuntasty_danger'" > Gemfile
bundle install
echo "danger.import_dangerfile(gem: 'thefuntasty_danger')" > Dangerfile
bundle exec danger
```

## Deployment

For deploying to RubyGems run these commands:

```
gem build thefuntasty_danger
gem push thefuntasty_danger-X.X.X.gem
```

## Support

If you have any questions or ideas contact the maintainer of the repo at matej.jirasek@thefuntasty.com.
