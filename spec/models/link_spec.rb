# -*- encoding : utf-8 -*-

require 'spec_helper'

describe Link do
  context 'relationship' do
    it { should belong_to(:professor) }
  end

  context 'validations' do
    context 'title' do
      it { should_not have_valid(:title).when('', nil) }
      it { should have_valid(:title).when('Algum Nome') }
    end
    context 'url' do
      it { should_not have_valid(:url).when('foo') }
      it { should have_valid(:url).when('foo.com') }
    end
  end
end

