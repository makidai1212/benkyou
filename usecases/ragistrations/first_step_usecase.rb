module Registrations
  class FirstStepUsecase
    attr_reader :param, :form
    def initialize(param)
      @param = param
      @form = Registrations::FirstStepForm.new(User.new)
    end

    def execute
      return form unless form.validate(param)
      form
    end
  end
end
