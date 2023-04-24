require 'rails_helper'

RSpec.describe Hospital do
  it {should have_many :doctors}

  describe 'instance methods' do
    before :each do
      test_data
    end

    describe 'ordered_docs' do
      it 'returns an array of doctors ordered by number of patients' do
        @patient5 = Patient.create!(name: "Katie Bryce", age: 24)
        @patient6 = Patient.create!(name: "Katie Bryce", age: 24)
        
        @doc_pt_1 = DoctorPatient.create!(patient: @patient5, doctor: @doc2)
        @doc_pt_1 = DoctorPatient.create!(patient: @patient6, doctor: @doc1)
        @doc_pt_1 = DoctorPatient.create!(patient: @patient6, doctor: @doc2)
        
        expect(@hospital1.ordered_docs).to eq([@doc2, @doc1])
      end
    end
  end
end
