class StudentsController < ApplicationController
  before_action :set_student, only: :show
  # after_action :activate_student_path, only: :edit
  protect_from_forgery with: :null_session

  def index
    @students = Student.all
  end

  def show
  end

  def activate
    set_student

    if @student.active
      @student.update(active: false)
    else
      @student.update(active: true)
    end
    redirect_to "/students/#{@student.id}"
  end

  private
    # def activate_student_path
    #   if !@student.active
    #     @student.update(active: false)
    #   else
    #     @student.update(active: true)
    #   end
    #
    #   redirect_to "/students/#{params["id"]}"
    # end

    def set_student
      @student = Student.find(params[:id])
      if @student.active == true
        @student_active = "This student is currently active."
      else
        @student_active = "This student is currently inactive."
      end
    end
end
