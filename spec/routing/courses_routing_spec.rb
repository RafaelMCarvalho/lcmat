require 'spec_helper'

describe CoursesController do
  it 'routes to #show' do
    get('/cursos/1').should route_to(controller: 'courses', action: 'show', id: '1')
  end
end