# RoRdit [![Build Status](https://travis-ci.com/mertbulan/RoRdit.svg?token=xywiVTqoo2jXbFx9CPwW&branch=master)](https://travis-ci.com/mertbulan/RoRdit)

RoRdit is a link aggregation web application like Reddit and Hacker News. 

It uses number of technologies: [Ruby on Rails](https://github.com/rails/rails) for the back-end,
[VueJS](https://github.com/vuejs/vue) for the front-end, [PostgreSQL](https://github.com/postgres/postgres) for database management, 
[Elasticsearch](https://github.com/elastic/elasticsearch) for search engine.

With Rordit app, you can share link, make comment or give a point to link or comment after register
the application.

You can test it here: https://rordit.herokuapp.com

### Installation

1. First of all we need to database management system. 
Install PostgreSQL with this command:

    `$ brew install postgresql`

2. After the installation we need to run PostgreSQL with this command:

    `$ pg_ctl -D /usr/local/var/postgres start`

    > PS: If you want, you can use [Postgres](http://postgresapp.com/documentation/install.html) app for starting and stopping PosgreSQL easily.

3. Now we need to RoRdit application. You can clone this repo with:

    `$ git clone git@github.com:mertbulan/RoRdit.git`

4. After the cloning process we need to install gems which are required for this application:

    `$ cd RoRdit && bundle`

5. Now, we need to create database and create some settings. You have two options:

    - If you want create database and seed this database (with creating 1 admin user, 50 users, 50 links from Hacker News, 100 points, 100 comments):

        `$ rake db:setup`

    - Or you can create database and  add only necessary site settings in Rails console:

        `$ rake db:create`

        `$ rails c`
        ```ruby 
        AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
        SiteSetting.create(title: "RoRdit", slogan: "Slogan is here.")
        ```

        > PS: If you don't want to do this job in rails console, you can just run settings task:

         `$ rake settings:create`

6. After creating database and seeding with settings, we need to install elasticsearch.
For that you have two options:

    - If you want to use Heroku, there is a good add-on for that called Bonsai. You only need to create an account 
    for Bonsai and install Bonsai to your Heroku app. There is a guide for that at [here.](https://docs.bonsai.io/docs/bonsai-elasticsearch-dashboard)
    
    - If you want to run elasticsearch on your local server;
   
        1. First, we need to install elasticsearch: 
            
            `$ brew install elasticsearch`
            
        2. Then, delete `bonsai-elasticsearch-rails` gem
            and add `elasticsearch-model` and `elasticsearch-rails` gems to Gemfile.
     
         ```ruby 
             gem 'elasticsearch-model'
             gem 'elasticsearch-rails'
         ``` 
         
        3. Finally, we need to run elasticsearch with this command:
        
            `$ elasticsearch`
7. After the installation of elastichsarch we have one step for configuration the elasticsearch.
In Rails console, we need to create index and import our Link model.

    `$ rails c`
    
    ```ruby 
       Link.create_index!
       Link.import
    ```

8. After the all steps, now, we can run the server with this command:

    `$ rails s`

If you want you can change your site title, slogan and logo at admin panel page: `localhost:3000/admin`

:exclamation: Don't forget to add SMTP settings at admin panel. Otherwise password recovery feature does not work.

