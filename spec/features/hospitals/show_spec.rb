require 'rails_helper'

RSpec.describe 'hospital show page' do
  before :each do
    test_data
    visit hospital_path(@hospital1)
  end
  
  describe 'As a visitor, when I visit a hospitals show page' do
    it 'I see the hospitals name and I see the names 
    of all doctors that work at this hospital' do
      expect(page).to have_content(@hospital1.name)
      expect(page).to have_content(@doc1.name)
      expect(page).to have_content(@doc2.name)
    end

    it 'next to each doctor I see the number of patients associated with the doctor' do
      @patient5 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient6 = Patient.create!(name: "Katie Bryce", age: 24)
      
      @doc_pt_1 = DoctorPatient.create!(patient: @patient5, doctor: @doc2)
      @doc_pt_1 = DoctorPatient.create!(patient: @patient6, doctor: @doc1)
      @doc_pt_1 = DoctorPatient.create!(patient: @patient6, doctor: @doc2)
      
      within "#doctor_#{@doc1.id}" do
        expect(page).to have_content("Number of Patients: 3")
      end
      
      within "#doctor_#{@doc2.id}" do
        expect(page).to have_content("Number of Patients: 4")
      end
    end

    it 'I see the list of doctors is ordered from most 
      number of patients to least number of patients' do
      expect(@doc1.name).to appear_before(@doc2.name)
    end
  end
end