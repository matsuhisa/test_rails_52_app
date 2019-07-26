require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module TestRails52App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.i18n.default_locale = :ja

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # config.action_view.field_error_proc = Proc.new { |html_tag, _instance| %Q(#{html_tag}).html_safe }

    config.action_view.field_error_proc = Proc.new do |html_tag, _instance| 
      # Nokogiri::HTML.fragment(html_tag).search('input', 'textarea', 'select').add_class('is-error').to_html.html_safe
      html_field = Nokogiri::HTML::DocumentFragment.parse(html_tag).children.attribute("aria-invalid", true)
      html_field.to_s.html_safe
    end

  end
end
