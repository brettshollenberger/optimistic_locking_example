require 'spec_helper'

describe Timesheet do
  
  before(:each) do
    @timesheet  = Timesheet.create()
    @timesheet2 = Timesheet.find(@timesheet.id)
  end

  it "locks optimistically" do
    @timesheet.rate  = 200
    @timesheet2.rate = 175

    expect(@timesheet.save).to be_true
    expect {@timesheet2.save}.to raise_error(ActiveRecord::StaleObjectError)
  end
end
