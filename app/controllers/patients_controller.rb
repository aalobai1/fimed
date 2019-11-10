# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :set_patient, only: %i[show update destroy]

  def index
    @patients = Patient.all
    json_response(@patients)
  end

  def show
    json_response(@patient)
  end

  def update
    @patient.update(patient_params)
    head :no_content
  end

  def destroy
    @patient.destroy
    head :no_content
  end

  private

  def patient_params
    params.permit(:given_name, :family_name, :race, :gender)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
