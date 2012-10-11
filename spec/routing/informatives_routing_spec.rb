require 'spec_helper'

describe InformativesController do
  it 'routes to #index' do
    get('/informativos').should route_to(controller: 'informatives', action: 'index')
  end
end