class PatientsController < ApplicationController
  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @patient = @doctor.patients.find(params[:id])
    @patient.doctors.delete(@doctor)
    redirect_to doctor_path(@doctor)
  end

  def index
    @patients = Patient.all
  end
end