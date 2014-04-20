class BiologyTutorialsController < ApplicationController

  layout "tutorial_listing"

  def index
    @bio_tuts = BiologyTutorial.all
  end

  def show
    @bio_tut = BiologyTutorial.find(params[:id])
  end

  def edit
    @biotut = BiologyTutorial.find(params[:id])
  end

  def update
    @bio_tut = BiologyTutorial.find(params[:id])
    if @bio_tut.update_attributes(bio_tut_params)
      flash[:notice] = "Biology tutorial updated successfully."
      redirect_to(:action => 'show', :id => @bio_tut.id)
    else
      render('edit')
    end
  end

  def new
    @biotut = BiologyTutorial.new({:title => 'TEST'})
  end

  def create
    @biotut = BiologyTutorial.new(bio_tut_params)
    if @biotut.save
      flash[:notice] = "Tutorial: '#{@biotut.title}' created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def delete
    @biotut = BiologyTutorial.find(params[:id])
  end

  def destroy
    biotut = BiologyTutorial.find(params[:id]).destroy
    flash[:notice] = "Biology tutorial #{biotut.title} deleted successfully."
    redirect_to(:action => 'index')
  end

  private

    def bio_tut_params
      params.require(:biology_tutorial).permit(:author_id, :title, :permalink, :content, :published)
    end

end
