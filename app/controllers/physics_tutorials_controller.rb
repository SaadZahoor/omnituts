class PhysicsTutorialsController < ApplicationController

  layout "tutorial_listing"

  def index
    @physicstuts = PhysicsTutorial.sorted
  end

  def show
    @physicstut = PhysicsTutorial.find(params[:id])
  end

  def new
    @physicstut = PhysicsTutorial.new({:title => "Default title..."})
  end

  def create
    @physicstut = PhysicsTutorial.new(physics_tut_params)
    if @physicstut.save
      flash[:notice] = "Tutorial: '#{@physicstut.title}' created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @physicstut = PhysicsTutorial.find(params[:id])
  end

  def update
    @physicstut = PhysicsTutorial.find(params[:id])
    if @physicstut.update_attributes(physics_tut_params)
      flash[:notice] = "Physics tutorial updated successfully."
      redirect_to(:action => 'show', :id => @physics_tut.id)
    else
      render('edit')
    end
  end

  def delete
    @physicstut = PhysicsTutorial.find(params[:id])
  end

  def destroy
    physicstut = PhysicsTutorial.find(params[:id]).destroy
    flash[:notice] = "Physics tutorial #{physicstut.title} deleted successfully."
    redirect_to(:action => 'index')
  end

  private

    def physics_tut_params
      params.require(:physics_tutorial).permit(:author_id, :title, :permalink, :content, :published)
    end

end
