# frozen_string_literal: true

require "bundler/setup"
require "omniauth-logikura"
require "./app"

use Rack::Session::Cookie, secret: "omniauth-logikura"

use OmniAuth::Builder do
  provider :logikura, ENV["LOGIKURA_APP_ID"], ENV["LOGIKURA_SECRET"], scope: "read write"
end

run Sinatra::Application
