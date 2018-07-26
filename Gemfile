source 'https://rubygems.org'
ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2'
gem 'sqlite3'
gem 'puma'
gem 'bcrypt'
gem 'uglifier'
gem 'draper'

group :development, :test do
  gem 'rspec-rails'
  gem 'listen'
  gem 'pry-byebug'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :test do
  gem 'shoulda-matchers'
  gem 'rspec-its'
  gem 'rspec-activemodel-mocks'
  gem 'shoulda-callback-matchers'
  gem 'rails-controller-testing'
end
