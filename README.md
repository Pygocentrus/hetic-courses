# Ruby project

Night courses management plateform for HETIC webschool, Paris.

### Team
- Pierre Guilhou - Lead developer & project manager  
- Thibaut Haenlin - Developer  
- Guillaume Barluet de Beauchesne - Developer  
- Tanguy Gereec - UI/UX designer  

### Requirements
- Having Git, Rails, Node, Bower & Gulp installed  
- Having a Postgres running  

### Steps
- `$ git clone https://github.com/Pygocentrus/ruby-project.git`  
- `$ cd ruby-project`  
- `$ npm install`  
- `$ bower install`  
- Edit the `gulp/conf.js` file  
- `$ gulp`  
- `$ cd api`  
- `$ bundle install`  
- `$ bundle exec rake db:create` (if the DB doesn't exist yet)  
- `$ bundle exec rake db:migrate`  
- `$ bundle exec rake db:seed` (optional)  
- `$ rails s`  
- That's it, basically!  
