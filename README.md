# PifanoConfig

This is a simple configurable gem that allows you to easily create a configuration file for your gem or application.

## Installation

Add this line to your application's `Gemfile`:

    gem 'pifano_config'

And then execute:

    $ bundle

Or install it yourself as:
    
    $ gem install pifano_config

## Usage

### Creating a configuration file

To create a configuration file, you need to create a class and include the `PifanoConfig::Mixin` module.

~~~ruby

class MyAppConfig
  include Pifano::Mixin
  
  # Define your configuration options here
  config.on(:development) do |config|
    # Define your configuration options for the development environment here
    config[:my_option] = 'pifano dev'

    # You can also define nested configurations
    config[:database] = {
        adapter: 'sqlite3',
        database: 'db/development.sqlite3'
    }
  end

  config.on(:production) do |config|
    # Define your configuration options for the production environment here
    config[:my_option] = 'pifano prod'
    
    # You can also define nested configurations
    config[:database] = {
        adapter: 'postgresql',
        host: 'localhost',
        database: 'my_app_production',
        username: 'my_app',
    }
  end
end
~~~

### Using a configuration file

After creating your configuration class, you can use it to access your configuration options.

~~~ruby
# app/models/my_model.rb

class MyModel
  def self.adapter
    MyAppConfig.config.environment(APP_ENV).database[:adapter]
  end
end

MyModel.adapter
# => 'sqlite3' or 'postgresql' depends on the APP_ENV value
~~~

### Setting the environment

You can set the environment using the `APP_ENV` environment variable.

~~~bash

$ APP_ENV=development irb

irb(main):001:0> MyApp.config.environment(APP_ENV).my_option
=> 'pifano dev'

irb(main):002:0> MyApp.config.environment(APP_ENV).database[:adapter]

=> 'sqlite3'
~~~

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aristotelesbr/pifano_config.
