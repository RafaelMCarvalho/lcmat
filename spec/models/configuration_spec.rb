# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Configuration do
  context 'validations' do
    context 'email' do
      it { should_not have_valid(:email).when('') }
      it { should_not have_valid(:email).when(nil) }
      it { should_not have_valid(:email).when('contato@empresa') }
      it { should have_valid(:email).when('contato@empresa.com') }
    end
  end
end

