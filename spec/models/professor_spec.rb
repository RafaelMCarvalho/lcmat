# -*- encoding : utf-8 -*-

require 'spec_helper'

describe Professor do
  context 'relationship' do
    it { should have_one(:user) }
    it { should have_one(:own_course).class_name('Course') }
    it { should belong_to(:course) }
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
    context 'lattes_link' do
      it { should_not have_valid(:lattes_link).when('foo') }
      it { should have_valid(:lattes_link).when('foo.com') }
    end
    context 'linkedin_link' do
      it { should_not have_valid(:linkedin_link).when('foo') }
      it { should have_valid(:linkedin_link).when('foo.com') }
    end
  end
end

