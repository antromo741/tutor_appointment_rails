class Tutor::AppointmentsController < ApplicationController
    before_action :authenticate_tutor!
    
    def index
        @appointments = current_tutor.appointments
    end

end
