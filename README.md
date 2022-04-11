# OmniAuth Logikura

Logikura OAuth2 Strategy for OmniAuth.

Read the Logikura API documentation for more details: https://logikura.dev/api

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-logikura'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::Logikura` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :logikura, ENV['LOGIKURA_APP_ID'], ENV['LOGIKURA_SECRET'], scope: 'read'
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ntakanashi/omniauth-logikura


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
