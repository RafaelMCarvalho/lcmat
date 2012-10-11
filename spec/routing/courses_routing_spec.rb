require 'spec_helper'

describe CoursesController do
  it 'routes to #index' do
    get('/cursos').should route_to(controller: 'courses', action: 'index')
  end
end