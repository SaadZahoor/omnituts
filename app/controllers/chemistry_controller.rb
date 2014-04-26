class ChemistryController < ApplicationController
  layout 'tutorial_listing'
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
    if @chemtut.save
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
    flash[:notice] = "Tutorial #{chemtut.tut_title} deleted successfully."
    redirect_to(:action => 'index')
  end
  private
  def tut_params
    params.require(:chemtut).permit(:course_id, :tut_title, :tut_content)
  end
end
