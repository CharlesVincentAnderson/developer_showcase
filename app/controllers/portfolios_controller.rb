require 'will_paginate/array'

class PortfoliosController < ApplicationController
#  before_action :set_location, only: [:show, :edit, :update, :destroy]
#  before_action :authenticate_user!, except: [:new, :create, :show]
#  before_action :verify_role!, except: [:new, :create]
  layout 'portfolios_layout'

  def index
    @portfolios = Portfolio.all.to_ary
    @portfolios = @portfolios.paginate(page: params[:page], :per_page => 10)
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new portfolio_params
    @portfolio.about_me.build
    @portfolio.user = current_user
    if @portfolio.save
      redirect_to '/portfolios', notice: "Portfolio added successfully"
    else
      redirect_to '/portfolios', alert: "Portfolio could not be added"
    end
  end

  def edit
    @portfolio = Portfolio.find params[:id]
  end

  def update
    @portfolio = Portfolio.find params[:id]
    if @portfolio.update portfolio_params
      redirect_to '/portfolios', notice: "Portfolio updated successfully"
    else
      redirect_to '/portfolios', alert: "Portfolio could not be updated"
    end
  end

  # ???should params[:sub_view] go through strong params? -- probably
  def show
    @sub_view = params[:sub_view]
    @portfolio = Portfolio.where(id: params[:id]).includes(:about_me)[0]
  end

  def destroy
    @portfolio = Portfolio.find parmas[:id]
    if @portfolio.destroy
      redirect_to '/portfolios', notice: "Portfolio deleted successfully"
    else
      redirect_to '/portfolios', alert: "Portfolio could not be deleted"
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:first_name, :last_name, :email, :linkedin, :github, :company_name, :company_email, :company_website)
  end

end
