class CoursesController < ApplicationController

  before_filter :get_course

  def show; end

  def professors; end

  def files
    @course_files = @course.course_files
  end

  private
  def get_course
    @course = Course.find(params[:id])
  end

end