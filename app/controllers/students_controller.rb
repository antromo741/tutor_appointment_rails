class StudentsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @students = current_user.students
    end

    def show
        @student = current_user.students.find(params[:id]) 
    end

    private
    
    def set_student
       @student = current_user.students.find(params[:id]) 
    end
end
