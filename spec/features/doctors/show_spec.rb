require 'rails_helper'

RSpec.describe 'doctor show page' do
  before :each do
    test_data
    visit doctor_path(@doc1)
  end
  
  describe "As a visitor when I visit a doctor's show page" do
    it 'I see all of that doctors information including, name, 
      specialty, and the university they attended' do
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

    it 'next to each patients name, I see a button to 
      remove that patient from that doctors caseload' do
        expect(page).to have_button("Remove #{@patient1.name}")
        expect(page).to have_button("Remove #{@patient3.name}")
    end

    it 'When I click that button for one patient 
      Im brought back to the Doctors show page
      and no longer see that patients name listed' do
      expect(current_path).to eq(doctor_path(@doc1))
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient3.name)
      
      click_button("Remove #{@patient1.name}")
      
      expect(current_path).to eq(doctor_path(@doc1))
      expect(page).to_not have_content(@patient1.name)
      expect(page).to have_content(@patient3.name)
    end

    it 'When I visit a different doctors show page that is caring for the same patient, 
      I see that the patient is still on the other doctors caseload' do
      visit doctor_path(@doc2)

      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient3.name)
    end
  end
end