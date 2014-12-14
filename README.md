# Ruby project

Night courses management plateform for HETIC webschool, Paris.

### Team
- Pierre Guilhou - Lead developer & project manager
- Thibaut Haenlin - Developer
- Guillaume Barluet de Beauchesne - Developer
- Emeric Garnier - UI/UX designer

### Requirements
- Having Git and Rails installed, obviously
- Having a Postgres running

### Steps
- `$ git clone https://github.com/Pygocentrus/ruby-project.git`
- `$ cd ruby-project`
- `$ bundle install`
- `$ bundle exec rake db:create` (if the DB doesn't exist yet)
- `$ bundle exec rake db:migrate`
- `$ bundle exec rake db:seed` (optional)
- `$ rails s`
- That's it, basically!
