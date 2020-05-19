# Quran Api

Ruby on Rails application initialized with [Hix on Rails][hixonrails].

## System dependencies

- Ruby version: 2.7.1
- Rails version: 6.0.3
- Database: PostgreSQL

## Configuration

Copy an existing sample environment file. Run:
```bash
$ cp .env.sample .env
```

and edit newly created `.env` file. The minimum you are going to need are
credentials to your local PostgreSQL database.

Then, install all the necessary gems:
```bash
bundle install
```

## Database creation

In order to create the database with all the necessary seed data, run:
```bash
$ rails db:create db:schema:load db:seed
```

## How to start the app

Start the Ruby on Rails server with:
```bash
rails server
```

## How to run the test suite

In order to run the whole test suite, run:

```bash
$ bundle exec rspec
```

## Code quality checks

The application provides the following code quality analysis tools:

- [Brakeman][brakeman]
- [Fasterer][fasterer]
- [RuboCop][rubocop] with [RuboCop RSpec][rubocop-rspec], [RuboCop Performance][rubocop-performance] and [RuboCop Rails][rubocop-rails]
- [Rails Best Practices][rails-best-practices]

To run them locally:

```bash
$ bundle exec brakeman
$ bundle exec fasterer
$ bundle exec rubocop
$ bundle exec rails_best_practices
```

[hixonrails]: https://hixonrails.com
[brakeman]: https://github.com/presidentbeef/brakeman
[rubocop]: https://github.com/rubocop-hq/rubocop
[rubocop-performance]: https://github.com/rubocop-hq/rubocop-performance
[rubocop-rspec]: https://github.com/rubocop-hq/rubocop-rspec
[rubocop-rails]: https://github.com/rubocop-hq/rubocop-rails
[fasterer]: https://github.com/DamirSvrtan/fasterer
[rails-best-practices]: https://github.com/flyerhzm/rails_best_practices
