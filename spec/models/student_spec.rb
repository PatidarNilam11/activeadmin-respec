require 'rails_helper'

RSpec.describe Student, :type => :model do
  describe 'validation of name' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:roll_no)}
  end

  describe 'association' do
    it { should belong_to(:school).class_name(:School) }
  end
 
  describe 'callback' do
    it { is_expected.to callback(:student_saved).before(:save) }
   end
  
end