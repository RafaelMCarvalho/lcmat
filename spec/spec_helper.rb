# -*- encoding : utf-8 -*-
require 'rubygems'
require 'spork'

Spork.prefork do
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'capybara/poltergeist'
  require 'valid_attribute'
  require 'cancan/matchers'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  Capybara.javascript_driver = :poltergeist

  RSpec.configure do |config|
    config.mock_with :rspec

    config.use_transactional_fixtures = true

    config.after { DatabaseCleaner.clean }
  end

  def login(email, password)
    visit '/admin'
    fill_in('E-mail', :with => email)
    fill_in('Senha', :with => password)
    click_button 'Entrar'
  end
end

Spork.each_run do
  require File.expand_path("../../config/routes", __FILE__)
end

