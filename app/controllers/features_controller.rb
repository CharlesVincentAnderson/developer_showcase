class FeaturesController < ApplicationController
  layout 'features_layout'

  def new
    @feature = Feature.new
    @project = feature_params[:project_id].to_i
  end

  def create
    @feature = Feature.new feature_params
    @feature.picture.attach(feature_params[:picture])
    @project = current_user.portfolio.projects[(params[:sub_view].to_i)]
    @feature.project_id = @project.id
    proj = params[:sub_view]
    if @feature.save
      redirect_to portfolio_path(current_user.portfolio, sub_view: "project,#{proj}"), notice: "feature created successfully"
    else
      redirect_to portfolio_path(current_user.portfolio, sub_view: "project,#{params[:project_id]}"), notice: "feature could not be created"
    end
  end

  def edit
    @feature = Feature.find params[:id]
  end

  def update
    @feature = Feature.find params[:id]
    @feature.picture.attach(feature_params[:picture])
    if @feature.update feature_params
      redirect_to portfolio_path(current_user.portfolio, sub_view: "project, #{@feature.project_id - 1}}"), notice: "feature updated successfully"
    else
      redirect_to portfolio_path(current_user.portfolio, sub_view: "project, #{@feature.project_id - 1}"), notice: "feature could not be updated"
    end
  end

  def destroy
    @feature = Feature.find params[:id]
    if @feature.destroy
      redirect_to portfolio_path(current_user.portfolio, sub_view: "project, #{@feature.project_id - 1}"), notice: "feature deleted"
    else
      redirect_to portfolio_path(current_user.portfolio, sub_view: "project, #{@feature.project_id - 1}"), notice: "feature could not be deleted"
    end
  end

  private

  def feature_params
    params.require(:feature).permit(:name, :description, :project_id, :picture)
  end
end
