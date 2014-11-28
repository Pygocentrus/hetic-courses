# Ruby project

### Requirements
- Having Git and Rails installed, obviously
- Having a Postgres running

### Steps
- `$ git clone https://github.com/Pygocentrus/ruby-project.git`
- `$ cd ruby-project`
- `$ bundle install`
- `$ bundle exec rake db:create` (if the DB doesn't exist)
- `$ bundle exec rake db:migrate`
- `$ rails s`
