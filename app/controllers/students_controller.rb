class StudentsController < ApplicationController
    def index
        @students = Student.all
        if @students.present?
          render json: @students
        else 
            render json: {message: "student not found"}
        end
    end

    def new
        @student = Student.new
      end

      def show
        @student = Student.find(params[:id])
        render json: @student
      end
    
      def edit
        @student = Student.find(params[:id])
      end
    
      def create
        @student = Student.new(students_params)
         @student.save
          render json: @student
        # else
        #   render json: @student.errors.full_messages, status: :unprocessable_entity 
        # end
      end

      def update
        @student = Student.find(params[:id])
        if @student.update(students_params)
        render json: @student
        else
          render json: @student.errors.full_messages
      end
    end
    
      def destroy
        @student = Student.find(params[:id])
        if @student.destroy
          render json: @student
        # redirect_to "/"
        else
        render json: @student.errors.full_messages
       end
      end
    

       private                           
    def students_params
      params.permit(:name, :age, :roll_no, :school_id)
    end
end

