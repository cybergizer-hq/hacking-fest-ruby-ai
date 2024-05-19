# Emotion Text Gem

The `emotion_text` gem is a Ruby library that uses the Hugging Face API to analyze the emotional content of a text string. It evaluates the text and returns a score indicating the overall emotional tone of the text.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'emotion_text'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install emotion_text
```

## Usage

After installing the gem, you can use it in your Ruby code as follows:

```ruby
require 'emotion_text'

puts 'I am happy'.emo_eval
```

This will return a score indicating the emotional tone of the text.

## Environment Variables

The `emotion_text` gem requires the following environment variables to be set:

- `HUGGINGFACE_TWITTER_ROBERTA_URL`: The URL of the Hugging Face model used for sentiment analysis.
- `HUGGINGFACE_API_KEY`: Your Hugging Face API key.

You can set these variables in your environment, or use a `.env` file with the `dotenv` gem.

## Error Handling

The gem includes error handling for cases where the Hugging Face service returns a non-200 response code or an unexpected response format. If an error occurs, the `emo_eval` method will return a default value of `0.5` that indicates a neutral sentiment.

## Testing

The gem includes a suite of RSpec tests. To run the tests, first make sure you have the `rspec` gem installed. Then, from the root directory of the gem, run:

```bash
$ rspec
```

This will run all the tests and output the results.

## Contributing

Bug reports and pull requests are welcome on GitHub at [repo_url].