# -*- encoding : utf-8 -*-

require 'spec_helper'

describe Post do
  context 'validations' do
    it { should_not have_valid(:title).when('', nil) }
    it { should have_valid(:title).when('Algum título') }
  end
end

