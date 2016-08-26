# README

To generate a new application from scratch:
```
rails new base-app --database postgresql
rails g devise:install
rails g controller home
```
### Docker Setup
```
docker run -it -d --name base-app -e POSTGRES_USER=base_app_dba -e POSTGRES_PASSWORD=p2ssw0rd -e POSTGRES_DB=base_app -p 5432:5432 postgres:latest
```

### Devise Setup
```
rails g devise:install

rails g devise User
```
Some setup you must do manually if you haven't yet:

* Ensure you have defined default url options in your environments files. Here
is an example of default_url_options appropriate for a development environment
in config/environments/development.rb:

```
       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```
In production, :host should be set to the actual host of your application.

* Ensure you have defined root_url to *something* in your config/routes.rb.
For example:
```
root to: "home#index"
```

* Ensure you have flash messages in app/views/layouts/application.html.erb.
For example:

```
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
```

* If you are deploying on Heroku with Rails 3.2 only, you may want to set:

```
config.assets.initialize_on_precompile = false
```
    
On config/application.rb forcing your application to not access the DB
or load models when precompiling your assets.

* You can copy Devise views (for customization) to your app by running:
```
rails g devise:views
```