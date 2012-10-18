require 'spec_helper'

describe CourseFile do
  describe 'relationships' do
    it { should belong_to(:course) }
  end
end
