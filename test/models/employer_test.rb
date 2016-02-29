require 'test_helper'

class EmployerTest < ActiveSupport::TestCase
  describe Employer do
    it 'is invalid without a name ' do
      employer = Employer.new
      employer.should_not be_valid

    end

  end
end
