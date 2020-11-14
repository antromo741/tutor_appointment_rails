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
    end

    def show
        
    end

    def new
        @student = current_user.students.find_by_id(params[:student_id])
        @tutor = Tutor.find_by_id(params[:tutor_id])
        if @student
           @appointment = @student.appointments.build
        elsif @tutor
            @appointment = @tutor.appointments.build
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

    def appointment_params
        params.require(:appointment).permit(:location, :start_time, :end_time, :tutor_id, :student_id)
    end
end
