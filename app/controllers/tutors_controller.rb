class TutorsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_tutor, only: [:show, :edit, :update, :destroy]    
    def index
        @tutors = Tutor.all
    end

    def show
        
    end

    def new
        @tutor = Tutor.new
    end

    def create
        @tutor = Tutor.new(tutor_params)
        if @tutor.save
            redirect_to tutor_path(@tutor)
        else
            render :new
        end
    end
    
    # def edit

    # end

    # def update
    #     if @tutor.update(tutor_params)
    #         redirect_to tutor_path(@tutor)
    #     else 
    #         render :edit
    #     end
    # end

    # def destroy
    #     @tutor.destroy
    #     redirect_to tutors_path
    # end

    private
    
    def set_tutor
       @tutor = Tutor.find(params[:id]) 
    end

    def tutor_params
        params.require(:tutor).permit(:name, :phone_number, :specializations)
    end
end
