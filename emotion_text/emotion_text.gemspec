# frozen_string_literal: true

require_relative 'lib/emotion_text/version'

Gem::Specification.new do |spec|
  spec.name = 'emotion_text'
  spec.version = EmotionText::VERSION
  spec.authors = ['Alexandr Kalinka']
  spec.email = ['alex.kalinoff@gmail.com']

  spec.summary = 'Gem for evaluate emotion in text'
  spec.description = 'This gem for evaluate emotion in text'
  spec.homepage = 'https://github.com/hunk13/emotion_text'
  spec.required_ruby_version = '>= 3.3.0'

  spec.metadata['allowed_push_host'] = 'https://github.com/hunk13/emotion_text'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/hunk13/emotion_text'
  spec.metadata['changelog_uri'] = 'https://github.com/hunk13/emotion_text'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency 'dotenv'
  spec.add_dependency 'json'
  spec.add_dependency 'rest-client'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
