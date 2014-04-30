class PhysicsController < ApplicationController
  layout "tutorial_listing"
  before_action :confirm_logged_in
  def index
    @physicstuts = Tutorial.where('course_id = 5')
    @courses = Course.find(5)
  end
  def view
    @tut = Tutorial.find(params[:id])
  end
  def edit
  end
  def new
  end
  def delete
  end
  private
  def tut_params
    params.require(:physicstut).permit(:course_id, :tut_title, :tut_content)
  end
end
