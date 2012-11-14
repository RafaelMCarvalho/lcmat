class CoursesController < ApplicationController

  def show
    @course = Course.find(params[:id])
    @course_files = @course.course_files.order('updated_at DESC')
    @coordinator = @course.coordinator
  end
end