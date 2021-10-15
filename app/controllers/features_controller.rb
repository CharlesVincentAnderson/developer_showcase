class FeaturesController < ApplicationController
  layout 'features_layout'

  def new
    @feature = Feature.new
    #@project = need to put project here somehow.  prob have to build the first one with build in project controller
    @project = 
  end

  def create
    feature = Feature.new feature_params
    feature.project_id = 
  end

  private

  def feature_params
    params.require(:feature).permit(:name, :description)
  end
end
