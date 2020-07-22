class ScientistsController < ApplicationController
    before_action :find_scientist, only: [:show, :edit, :update, :destroy]

    def index
        @scientists = Scientist.all
    end

    def show

    end 

    def new
        @scientist = Scientist.new
    end

    def create
        @scientist = Scientist.create(scientist_params)

        if @scientist.valid?
            flash[:success] = "New Scientist"
            redirect_to scientist_path(@scientist)
          else 
            flash[:my_errors] = @scientist.errors.full_messages
            redirect_to new_scientist_path 
          end 
    end

    def edit

    end

    def update
        if @scientist.update(scientist_params)
            redirect_to scientist_path(@scientist)
        else
            flash[:my_errors] = @scientist.errors.full_messages
            redirect_to edit_scientist_path
        end
    end

    def destroy
        @scientist.destroy
        redirect_to scientists_path
    end


    private

    def find_scientist
        @scientist = Scientist.find(params[:id])
    end

    def scientist_params
        params.require(:scientist).permit(:name, :field_of_study)
    end



end
