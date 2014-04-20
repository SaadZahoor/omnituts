class ChemistryTutorialsController < ApplicationController

  layout "tutorial_listing"

  def index
    @chemtuts = ChemistryTutorial.sorted
  end

  def show
    @chemtut = ChemistryTutorial.find(params[:id])
  end

  def new
    @chemtut = ChemistryTutorial.new({:title => "Default title..."})
  end

  def create
    @chemtut = ChemistryTutorial.new(chem_tut_params)
    if @chemtut.save
      flash[:notice] = "Tutorial: '#{@chemtut.title}' created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @chemtut = ChemistryTutorial.find(params[:id])
  end

  def update
    @chemtut = ChemistryTutorial.find(params[:id])
    if @chemtut.update_attributes(chem_tut_params)
      flash[:notice] = "Chemistry tutorial updated successfully."
      redirect_to(:action => 'show', :id => @chemtut.id)
    else
      render('edit')
    end
  end

  def delete
    @chemtut = ChemistryTutorial.find(params[:id])
  end

  def destroy
    chemtut = ChemistryTutorial.find(params[:id]).destroy
    flash[:notice] = "Chemistry tutorial #{chemtut.title} deleted successfully."
    redirect_to(:action => 'index')
  end

  private

    def chem_tut_params
      params.require(:chemistry_tutorial).permit(:author_id, :title, :permalink, :content, :published)
    end

end
