class SchoolsController < ApplicationController
    def index
        @schools = School.all
        if @schools.present?
          render json: @schools
        else 
            render json: {message: "School not found"}
        end
    end

    def new
        @School = School.new
      end

      def show
        @School = School.find(params[:id])
        render json: @school
      end
    
      def edit
        @School = School.find(params[:id])
      end
    
      def create
        @School = School.new(schools_params)
        if @School.save
          render json: @School
        else
          render json: @School.errors.full_messages, status: :unprocessable_entity 
        end
      end

      def update
        @School = School.find(params[:id])
        if @School.update(schools_params)
        render json: @School
        else
          render json: @School.errors.full_messages
      end
    end
    
      def destroy
        @School = School.find(params[:id])
        @School.destroy
        # redirect_to "/"
        render json: "deleted......."
       end

       private                           
    def schools_params
      params.permit(:school_name, :school_id, :school_address)
    end
end
