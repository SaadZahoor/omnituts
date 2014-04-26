class TutorialsController < ApplicationController

  layout 'tutorial_listing'

  def index
    @englang = Tutorial.where('course_id = 1')
    @englit = 
    @biotuts = Tutorial.where('course_id = 3')
  end

  def biology_tutorial
    @tut = Tutorial.find(params[:id])
  end

end
