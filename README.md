# Rails 3.2.2 - devise-cancan-mongodb-omniauth #

This is a working example of combining Devise, Cancan, MongoDB, and OmniAuth together in a Rails 3.2.2 application.
It installs the 10gen MongoDB packages, since they are generally fresher than those in the Debian or Ubuntu repositories.


Usage:

## 1. Install MongoDB. ##

[From the 10gen MongoDB Guide - Installing Ubuntu and Debian Packages](http://www.mongodb.org/display/DOCS/Ubuntu+and+Debian+packages)
```shell
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
  sudo nano /etc/apt/sources.list
```
Add the line, then save the file
```shell
  deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen
  sudo apt-get update 
  sudo apt-get install mongodb-10gen
```

FOR UBUNTU EARLIER THAN 11.04

[Install mongodb according to this guide](http://www.mongodb.org/display/DOCS/Ubuntu+and+Debian+packages)
then
```shell
  apt-get install libxml2-dev libxslt-dev
```  

## 2. Create Initializers. ##
The next step is to go into the application's /config/initializers directory and create a new file. We'll call it omniauth.rb but the name isn't really important. In this file we'll add OmniAuth::Builder to our application's middleware and define the providers that our application will use to authenticate against.

See the example omniauth configuration file '/config/initializers/omniauth.rb.example'

```shell
   Rails.application.config.middleware.use OmniAuth::Builder do  
     provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'  
     provider :facebook, 'APP_ID', 'APP_SECRET'  
     provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'  
   end
```

## 3. Create your devise.rb file ##
```shell
   cp ./config/initializers/devise.rb.example ./config/initializers/devise.rb
```
Modify the file to your liking.

## 4. Install the bundle and set Up the database ##
```shell
  bundle install
  rake db:create
  rake db:migrate
```

