# -*- encoding : utf-8 -*-
require "spec_helper"

describe SiteController do
  it 'index page' do
    { :get => '/' }.should route_to(:controller => 'site', :action => 'index')
  end

  it 'contact page' do
    { :get => '/contact' }.should route_to(:controller => 'site', :action => 'contact')
  end

  it 'send contact message action' do
    { :post => '/contact' }.should route_to(:controller => 'site', :action => 'send_contact')
  end
end

