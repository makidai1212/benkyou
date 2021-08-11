class RegistrationsController < ApplicationController
  def first_step
    @form = Registrations::FirstStepUsecase.new(first_step_params).execute
    if @form.errors.empty?
      render json: []
    else
      render 'first_step_errors', formats: 'json', handlders: 'jbuilder'
    end
  end

  private

  def first_step_params
    params.require(:registrations).permit(:first_name, :family_name, :nickname, :phone_number)
  end
end
