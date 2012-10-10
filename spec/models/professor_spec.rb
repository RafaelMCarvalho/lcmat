# -*- encoding : utf-8 -*-

require 'spec_helper'

describe Professor do
  context 'relationship' do
    it { should have_one(:user) }
  end

  context 'validations' do
    context 'name' do
      it { should_not have_valid(:name).when('', nil) }
      it { should have_valid(:name).when('Algum Nome') }
    end
    context 'curriculum' do
      it { should_not have_valid(:curriculum).when('', nil) }
      it { should have_valid(:curriculum).when('Algum Currículo') }
    end
    context 'dropbox_link' do
      it { should_not have_valid(:dropbox_link).when('foo') }
      it { should have_valid(:dropbox_link).when('foo.com') }
    end
  end
end

