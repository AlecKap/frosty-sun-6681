require 'rails_helper'

RSpec.describe 'patients index page' do
  before :each do
    test_data
    visit patients_path
  end

  describe 'As a visitor, when I visit the patient index page' do
    it ' I see the names of all adult patients (age greater than 18) 
      in ascending alphabetical order' do
      save_and_open_page
      within "#adult_patients" do
        expect(@patient2.name).to appear_before(@patient1.name) 
        expect(@patient1.name).to appear_before(@patient3.name)  
        expect(page).to_not have_content(@patient4.name)
      end
      
      within "#non_adult_patients" do  
        expect(page).to have_content(@patient4.name)
        expect(page).to_not have_content(@patient1.name)
        expect(page).to_not have_content(@patient2.name)
        expect(page).to_not have_content(@patient3.name)
      end
    end
  end
end