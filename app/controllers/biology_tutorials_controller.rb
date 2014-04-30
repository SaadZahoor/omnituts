class BiologyTutorialsController < ApplicationController

  layout 'tutorial_listing'
  
  before_action :confirm_logged_in

  def index
    @biotuts = Tutorial.where('course_id = 3')
    @course = Course.find(3)
  end

  def view
    @tut = Tutorial.find(params[:id])
  end

  def new
    @tut = Tutorial.new()
    @courses = Course.order('id ASC')
  end

  def create
    @tut = Tutorial.new(tut_params)
    if @tut.save
      flash[:notice] = "Tutorial created successfully."
      redirect_to(:action => index)
    else
      render('new')
    end
  end

  def edit
    @tut = Tutorial.find(params[:id])
    @courses = Course.order('id ASC')
  end

  def update
    @tut = Tutorial.find(params[:id])
    if @tut.update_attributes(tut_params)
      flash[:notice] = "Tutorial updated successfully."
      redirect_to(:action => 'view', :id => @tut.id)
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
  end

  private

    def tut_params
      params.require(:tut).permit(:course_id, :tut_title, :tut_content)
    end

end
