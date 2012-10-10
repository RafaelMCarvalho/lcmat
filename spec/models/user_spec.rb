# -*- encoding : utf-8 -*-
require 'spec_helper'

describe User do
  context 'relationship' do
    it { should belong_to(:professor) }
  end
end

