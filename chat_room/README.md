# Chat Room Application

This application is used to demonstrate work with Rails channels and using `emotion_text` gem.

## Installation

Before running the application, you need to add correct environment variables adding them into `.env` file.

```bash
HUGGINGFACE_API_KEY
HUGGINGFACE_TWITTER_ROBERTA_URL
PG_HOST
PG_USERNAME
PG_PASSWORD
```

after that run `rails db:create` and `rails db:migrate`. Before run the server you need to install `nodejs` and run `yarn install` to install packages.

After that run `rails s` to start server.