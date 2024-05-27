# Ruby + AI Hacking Fest project
*forked repository in order to participate in the hacking fest.

Rails app with implemention [openlm-research/open_llama_7b](https://huggingface.co/openlm-research/open_llama_7b). LLaMA (Large Language Model) works by taking a sequence of words as an input and predicts a next word to recursively generate text.

# Getting started

Before we start you must be sure that **at least 35G** of memory are avalable and you have installed:

- [Ruby 3.3.1](https://gist.github.com/pboksz/4649025)
- [Python3](https://www.python.org/downloads/)
- [Ruby on Rais 7+ version](https://guides.rubyonrails.org/v5.1/getting_started.html)
- [PostgreSQL](https://www.postgresql.org/docs/current/tutorial-install.html)
- [Npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- [Yarn](https://classic.yarnpkg.com/lang/en/docs/install/#debian-stablehttps://classic.yarnpkg.com/lang/en/docs/install/#debian-stable)

## Installation
You can clone an existing repository from GitHub.com to your local computer, or to a codespace:

```sh
   $ brew install git-lfs
   $ git lfs install
   $ git clone -b ai-ground git@github.com:DariaAres/hacking-fest-ruby-ai.git
```

## Configure

- ### Configure [llama.cpp](https://github.com/yoshoku/llama_cpp.rb?tab=MIT-1-ov-file)

    1. Installing dependencies:

        ```sh
        $ cd llama.cpp/models
        $ git clone https://huggingface.co/openlm-research/open_llama_7b
        ```

    1. Then you will prepare the model, prepare the necessary binaries to work with the model, and quantize the model, which reduces the size of the model and/or speeds up its execution while maintaining an acceptable level of accuracy:

        ```sh
        $ cd ../
        $ python3 convert.py models/open_llama_7b
        $ make
        $ ./quantize ./models/open_llama_7b/open_llama_7b-7B-F16.gguf ./models/open_llama_7b/pytorch_model-00001-of-00002.bin q4_0
        ```

- ### Configure ai-ground application

    1. Installing dependencies:

        ```sh
        $ cd ../ai-ground
        $ bundle install
        $ rails assets:precompile
        ```

    1. You can go to `.sample_env`, rename it to `.env` and write following values:

        ```sh
        $ POSTGRES_USER=username
        $ POSTGRES_PASSWORD=password
        ```

    1. Then you should create the databases defined in the current environment and run pending migrations:

        ```sh
        $ rails db:create db:migrate
        ```

## Usage

- ### Start the web server locally

    This command launches a Puma web server:

    ```sh
    $ cd ai-ground
    $ rails s
    ```
    You'll use this any time you want to access your application through a web browser.

    Run with `--help` or `-h` for options.
