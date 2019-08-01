class StudentsController < ApplicationController

  def index

  end

  def new
    @student = Student.new
  end

  def create
    if params[:search]
      @students = Student.where("name LIKE '%#{params[:search]}%'")
      render 'index'
    else
      @student = Student.new(student_params)

      if @student.save
        redirect_to @student
      else
        render 'new'
      end
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end


  private

  def student_params
    if params[:search].present?
      params.permit(:search)
    else
      params.require(:student).permit(:name, :birthday, :hometown)
    end
  end
end
