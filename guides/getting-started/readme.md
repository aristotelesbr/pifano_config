# Getting Started

This guide show you how to use the pífano config.

## Intallation

Add the gem to your project:

```bash
$ gem add pifano_config
```

## Usage

### Creating a configuration file

To create a configuration file, you need to create a class and include the `PifanoConfig::Mixin` module.

```ruby
require 'pifano_config'

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
```

### Using a configuration file

After creating your configuration class, you can use it to access your configuration options.

```rb
MyAppConfig.config.environment(:development)[:my_option] # => 'pifano dev'
```

### Setting the environment

You can set the environment using a environment variable:

```bash
$ APP_ENV=development irb

irb(main):001:0> MyApp.config.environment(APP_ENV).my_option
=> 'pifano dev'

irb(main):002:0> MyApp.config.environment(APP_ENV).database[:adapter]
=> 'sqlite3'
```

Done! Now you can use the pífano config in your project. :smile:
