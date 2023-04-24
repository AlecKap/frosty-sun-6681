# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  DoctorPatient.destroy_all
  Doctor.destroy_all


  @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
  @hospital2 = Hospital.create!(name: "Seaside Health & Wellness Center")

  @doc1 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital: @hospital1)
  @doc2 = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University", hospital: @hospital1)
  @doc3 = Doctor.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital: @hospital2)
  @doc4 = Doctor.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania", hospital: @hospital2)

  @patient1 = Patient.create!(name: "Katie Bryce", age: 24)
  @patient2 = Patient.create!(name: "Denny Duquette", age: 39)
  @patient3 = Patient.create!(name: "Rebecca Pope", age: 32)
  @patient4 = Patient.create!(name: "Zola Shepherd", age: 2)

  @doc_pt_1 = DoctorPatient.create!(patient: @patient1, doctor: @doc1)
  @doc_pt_2 = DoctorPatient.create!(patient: @patient1, doctor: @doc2)
  @doc_pt_3 = DoctorPatient.create!(patient: @patient2, doctor: @doc3)
  @doc_pt_4 = DoctorPatient.create!(patient: @patient2, doctor: @doc4)
  @doc_pt_5 = DoctorPatient.create!(patient: @patient3, doctor: @doc1)
  @doc_pt_6 = DoctorPatient.create!(patient: @patient3, doctor: @doc2)
  @doc_pt_7 = DoctorPatient.create!(patient: @patient4, doctor: @doc3)
  @doc_pt_8 = DoctorPatient.create!(patient: @patient4, doctor: @doc4)
