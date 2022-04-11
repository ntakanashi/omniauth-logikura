# frozen_string_literal: true

require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Logikura < OmniAuth::Strategies::OAuth2
      option :name, "logikura"

      option :client_options,
             site: "https://logikura.com",
             api_site: "https://api.logikura.com",
             authorize_path: "/oauth/authorize"

      option :authorize_options, [:scope]

      uid { info["data"]["company"]["id"] }

      info { raw_info }

      def raw_info
        access_token.client.site = options.client_options[:api_site] # FIXME
        @raw_info ||= access_token.get("/api/v1/credentials").parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end

      def setup_phase
        options.client_options[:site] = ENV["LOGIKURA_URL"] if ENV["LOGIKURA_URL"]
        options.client_options[:api_site] = ENV["LOGIKURA_API_URL"] if ENV["LOGIKURA_API_URL"]
        super
      end

      def build_access_token
        client.auth_code.get_token(
          request.params["code"],
          {
            redirect_uri: callback_url
          }.merge(token_params.to_hash(symbolize_keys: true)), deep_symbolize(options.auth_token_params)
        )
      end
    end
  end
end
