# frozen_string_literal: true

require "spec_helper"

RSpec.describe OmniAuth::Strategies::Logikura do
  let(:custom_options) { {} }
  subject do
    described_class.new(nil, custom_options)
  end

  before { subject.setup_phase }

  describe "Client options" do
    context "when sandbox option true" do
      let(:custom_options) { { sandbox: true } }
      let(:options) { subject.options.client_options }

      it "has correct site" do
        expect(options.site).to eq "https://logikura.com"
      end

      it "has correct authorize url" do
        expect(options.authorize_path).to eq "/oauth/authorize"
      end
    end
  end

  describe "callback_url" do
    it "has the collect callback url" do
      allow(subject).to receive(:full_host).and_return("https://example.com")
      allow(subject).to receive(:script_name).and_return("/sub_uri")
      allow(subject).to receive(:callback_path).and_return("/callback")

      expect(subject.callback_url).to eq("https://example.com/sub_uri/callback")
    end
  end
end
