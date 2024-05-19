# 🤖 Ruby + AI Hacking Fest 🤖

This repository contains the source code for the Ruby + AI Hacking Fest. In folder `emotion_text` you can find the code for the gem for evuating emotion score of text. In folder `chat_room` you can find the code for the chat room that uses this gem. All instructions are in [README.md](README.md) of each project.

## Using AI Model

This gem uses the [Twitter-roBERTa-base](https://huggingface.co/cardiffnlp/twitter-roberta-base-sentiment) AI model to evaluate the emotion score of text from positive `0` to negative `1`. This gem adds the method `emo_eval` to `String` class. That means you can use it as `string.emo_eval`. For example:

```ruby
require 'emotion_text'

text = "I am happy"
text.emo_eval
# => 0.011329314555041492
```

That means the emotion score of `text` is `0.011329314555041492`, this text is positive.

In chat application you can use `text.emo_eval` to get the emotion score of the text. The score is between `0` and `1` and the higher the score the more positive the text is. In chat this score is shown in the chat message using emojis - `🙋` for positive, `😐` for neutral and `😎` for negative near the user message.
