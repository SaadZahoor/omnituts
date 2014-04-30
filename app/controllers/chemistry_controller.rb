class ChemistryController < ApplicationController
  layout 'tutorial_listing'
  before_action :confirm_logged_in
  def index
    @chemtuts = Tutorial.where('course_id = 4')
    @course = Course.find(4)
  end
  def view
    @tut = Tutorial.find(params[:id])
  end
  def new
    @chemtut = Tutorial.new()
    @courses = Course.order('id ASC')
  end
  def create
    @chemtut = Tutorial.new(tut_params)
    @courses = Course.order('id ASC')
    chemistry = Course.find(4)
    if @chemtut.save
      chemistry.num_of_tuts += 1
      flash[:notice] = "Tutorial created successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end
  def edit
    @chemtut = Tutorial.find(params[:id])
    @courses = Course.order('id ASC')
  end
  def update
    @chemtut = Tutorial.find(params[:id])
    @courses = Course.order('id ASC')
    if @chemtut.update_attributes(tut_params)
      flash[:notice] = "Tutorial updated successfully."
      redirect_to(:action => 'view', :id => @chemtut.id)
    else
      render('edit')
    end
  end
  def delete
    @chemtut = Tutorial.find(params[:id])
  end
  def destroy
    chemtut = Tutorial.find(params[:id]).destroy
    chemistry = Course.find(4)
    chemistry.num_of_tuts -= 1
    flash[:notice] = "Tutorial #{chemtut.tut_title} deleted successfully."
    redirect_to(:action => 'index')
  end
  private
  def tut_params
    params.require(:chemtut).permit(:course_id, :tut_title, :tut_content)
  end
end
