require 'rails_helper'

RSpec.describe School, :type => :model do

 describe 'has many association' do
    it { should have_many(:students).class_name(:Student) }
  end
end