require 'rails_helper'

RSpec.describe 'doctors show page' do
  before :each do
    test_data
    visit doctor_path(@doc1)
  end
  
  describe "As a visitor when I visit a doctor's show page" do
    it 'I see all of that doctors information including, name, 
      specialty, and the university they attended' do

      save_and_open_page
      within "#doctor_info" do
        expect(page).to have_content("Name: #{@doc1.name}")
        expect(page).to have_content("Specialty: #{@doc1.specialty}")
        expect(page).to have_content("University Attended: #{@doc1.university}")
        expect(page).to_not have_content("Name: #{@doc2.name}")
        expect(page).to_not have_content("Specialty: #{@doc2.specialty}")
        expect(page).to_not have_content("University Attended: #{@doc4.university}")
      end
    end

    it 'I see the name of the hospital where this doctor works' do
      within "#doc_hospital_info" do
        expect(page).to have_content("Works at: #{@hospital1.name}")
        expect(page).to_not have_content("Works at: #{@hospital2.name}")
      end
    end

    it 'I see the names of all of the patients this doctor has' do
      within "#doc_patient_info" do
        expect(page).to have_content(@patient1.name)
        expect(page).to have_content(@patient3.name)
        expect(page).to_not have_content(@patient2.name)
        expect(page).to_not have_content(@patient4.name)
      end
    end
  end
end