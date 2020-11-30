class StudentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_student, only: [:show, :edit, :update, :destroy]    
    def index
        if params["Search Student"]
            @students = current_user.students.search_student(params["Search Student"])
        #render students close to input name
        else
        @students = current_user.students
        end
    end

    def show
        
    end

    def new
        @student = Student.new
    end

    def create
        @student = current_user.students.build(student_params)
        if @student.save
            redirect_to student_path(@student)
        else
            render :new
        end
    end
    
    def edit

    end

    def update
        if @student.update(student_params)
            redirect_to student_path(@student)
        else 
            render :edit
        end
    end

    def destroy
        @student.destroy
        redirect_to students_path
    end

    private
    
    def set_student
       @student = current_user.students.find(params[:id]) 
    end
    # this is why my params were nt being saved properly myurutgnrtgjnrtjnthn
    def student_params
        params.require(:student).permit(:name, :grade, :help_post, :location, :search_student )
    end
end
