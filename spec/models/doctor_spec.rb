require 'rails_helper'

RSpec.describe Doctor do
  it {should belong_to :hospital}
  it {should have_many :doctor_patients}
  it {should have_many(:patients).through(:doctor_patients)}

  describe 'number_of_patients' do
    before :each do
      test_data
    end

    it 'returns an array of doctors ordered by number of patients' do
      @patient5 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient6 = Patient.create!(name: "Katie Bryce", age: 24)
      
      @doc_pt_1 = DoctorPatient.create!(patient: @patient5, doctor: @doc2)
      @doc_pt_1 = DoctorPatient.create!(patient: @patient6, doctor: @doc1)
      @doc_pt_1 = DoctorPatient.create!(patient: @patient6, doctor: @doc2)
      expect(@doc1.number_of_patients).to eq(3)
      expect(@doc2.number_of_patients).to eq(4)
    end
  end
end
