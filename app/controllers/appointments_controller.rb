class AppointmentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_appointment, only: [:show, :edit, :update, :destroy]   

    def index
    @student = current_user.students.find_by_id(params[:student_id])
    @tutor = Tutor.find_by_id(params[:tutor_id])
    if @student
        @appointments = @student.appointments
    elsif @tutor
        @appointments = current_user.appointments.by_tutor(@tutor)
    else
        @appointments = current_user.appointments
        end
        filter_options
    end

    def show
        
    end

    def new
        @li = current_user.students.find_by_id(params[:student_id]) || @li = Tutor.find_by_id(params[:tutor_id])
        if @li
           @appointment = @li.appointments.build
        else
        @appointment = Appointment.new
        end
    end

    def create
        @appointment = Appointment.new(appointment_params)
        if @appointment.save
            redirect_to appointment_path(@appointment)
        else
            render :new
        end
    end
    
    def edit

    end

    def update
        if @appointment.update(appointment_params)
            redirect_to appointment_path(@appointment)
        else 
            render :edit
        end
    end

    def destroy
        @appointment.destroy
        redirect_to appointments_path
    end

    private
    
    def set_appointment
       @appointment = current_user.appointments.find(params[:id]) 
    end
    
    #using the scopes to filter the appointments
    def filter_options 
        if params[:filter_by_time] == "upcoming"
          @appointments = @appointments.upcoming
        elsif params[:filter_by_time] == "past"
          @appointments = @appointments.past
        end
        if params[:sort] == "most_recent"
          @appointments = @appointments.most_recent
        elsif params[:sort] == "longest_ago" 
          @appointments = @appointments.longest_ago
        end
    end

    def appointment_params
        params.require(:appointment).permit(:location, :start_time, :end_time, :tutor_id, :student_id)
    end
end
