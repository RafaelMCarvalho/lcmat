require 'spec_helper'

describe CoursesController do
  it 'routes to #index' do
    get('/cursos/1').should route_to(controller: 'courses', action: 'show', id: '1')
  end

  it 'routes to #professors' do
    get('/cursos/1/professores').should route_to(controller: 'courses', action: 'professors', id: '1')
  end

  it 'routes to #files' do
    get('/cursos/1/arquivos').should route_to(controller: 'courses', action: 'files', id: '1')
  end
end