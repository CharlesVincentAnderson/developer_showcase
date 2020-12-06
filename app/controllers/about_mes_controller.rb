class AboutMesController < ApplicationController
  layout 'about_mes_layout'

  def edit
    @about_me = current_user.portfolio.about_me  
  end

  def update
    @about_me = AboutMe.find params[:id]
    if @about_me.update about_me_params
      redirect_to portfolio_path(current_user.portfolio, sub_view: "about"), notice: "About me updated successfully"
    else
      redirect_to portfolio_path(current_user.portfolio, sub_view: "about"), alert: "About me could not be updated"
    end
  end

  private

  def about_me_params
    params.require(:about_me).permit(:description)
  end
end
