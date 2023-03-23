FactoryBot.define do
  factory  :student, :class=>Student do
      name{'aashish'}
      age{22}
      roll_no{14}
      # school_id{7}
      # association :school
      school_id { FactoryBot.create(:school).id}
  end
end