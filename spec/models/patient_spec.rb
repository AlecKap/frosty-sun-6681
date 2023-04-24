require 'rails_helper'

RSpec.describe Patient do
  it {should have_many :doctor_patients}
  it {should have_many(:doctors).through(:doctor_patients)}

  describe 'class methods' do
    before :each do
      test_data
    end

    it '.adult_patients' do
      expect(Patient.adult_patients).to eq([@patient2, @patient1, @patient3])
    end

    it '.non_adult_patients' do
      expect(Patient.non_adult_patients).to eq([@patient4])
    end
  end
end