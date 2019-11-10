class TreatmentsController < ApplicationController
  before_action :set_patient
  before_action :set_patient_treatment, only: %i[show update destroy]

  def index
    json_response(@patient.treatments)
  end

  def show
    json_response(@treatment)
  end

  def create
    @patient.treatments.create!(treatment_params)
    json_response(@patient, :created)
  end

  def update
    @treatment.update(treatment_params)
    head :no_content
  end
  
  def destroy
    @treatment.destroy
    head :no_content
  end

  private

  def treatment_params
    params.permit(:display_name, :coding, :code, :covered_by_insurance)
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_patient_treatment
    @treatment = @patient.treatments.find_by!(id: params[:id]) if @patient
  end
end
