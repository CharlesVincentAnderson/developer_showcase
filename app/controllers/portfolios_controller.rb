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
    @colors = ["lightsalmon", "salmon", "darksalmon", "lightcoral", "indianred", "crimson", "firebrick", "red", "darkred", "coral", "tomato", "orangered", "gold", "orange", "darkorange", "lightyellow", "lemonchiffon", "lightgoldenrodyellow", "papayawhip", "moccasin", "peachpuff", "palegoldenrod", "khaki", "darkkhaki", "yellow", "lawngreen", "chartreuse", "limegreen", "lime", "forestgreen", "green", "darkgreen", "greenyellow", "yellowgreen", "springgreen", "mediumspringgreen", "lightgreen", "palegreen", "darkseagreen", "mediumseagreen", "seagreen", "olive", "darkolivegreen", "olivedrab", "lightcyan", "cyan", "aqua", "aquamarine", "mediumaquamarine", "paleturquoise", "turquoise", "turquoise", "darkturquoise", "lightseagreen", "cadetblue", "darkcyan", "teal", "powderblue", "lightblue", "lightskyblue", "skyblue ", "deepskyblue", "lightsteelblue", "dodgerblue", "cornflowerblue", "steelblue", "royalblue", "blue", "mediumblue", "darkblue", "navy", "midnightblue", "mediumslateblue", "slateblue", "darkslateblue", "lavender", "thistle", "plum", "violet", "orchid", "fuchsia", "magenta", "mediumorchid", "mediumpurple", "blueviolet", "darkviolet", "darkorchid", "darkmagenta", "purple", "indigo", "pink", "lightpink", "hotpink", "deeppink", "palevioletred", "mediumvioletred", "white", "snow", "honeydew", "mintcream", "azure", "aliceblue", "ghostwhite", "whitesmoke", "seashell", "beige", "oldlace", "floralwhite", "ivory", "antiquewhite", "linen", "lavenderblush", "mistyrose", "gainsboro", "lightgray", "silver", "darkgray", "gray", "dimgray", "lightslategray", "slategray", "darkslategray", "black", "cornsilk", "blanchedalmond", "bisque", "navajowhite", "wheat", "burlywood", "tan", "rosybrown", "sandybrown", "goldenrod", "peru", "chocolate", "saddlebrown", "sienna", "brown", "maroon"]
  end

  def create
    @portfolio = Portfolio.new portfolio_params
    @portfolio.user = current_user
    @colors = ["lightsalmon", "salmon", "darksalmon", "lightcoral", "indianred", "crimson", "firebrick", "red", "darkred", "coral", "tomato", "orangered", "gold", "orange", "darkorange", "lightyellow", "lemonchiffon", "lightgoldenrodyellow", "papayawhip", "moccasin", "peachpuff", "palegoldenrod", "khaki", "darkkhaki", "yellow", "lawngreen", "chartreuse", "limegreen", "lime", "forestgreen", "green", "darkgreen", "greenyellow", "yellowgreen", "springgreen", "mediumspringgreen", "lightgreen", "palegreen", "darkseagreen", "mediumseagreen", "seagreen", "olive", "darkolivegreen", "olivedrab", "lightcyan", "cyan", "aqua", "aquamarine", "mediumaquamarine", "paleturquoise", "turquoise", "turquoise", "darkturquoise", "lightseagreen", "cadetblue", "darkcyan", "teal", "powderblue", "lightblue", "lightskyblue", "skyblue ", "deepskyblue", "lightsteelblue", "dodgerblue", "cornflowerblue", "steelblue", "royalblue", "blue", "mediumblue", "darkblue", "navy", "midnightblue", "mediumslateblue", "slateblue", "darkslateblue", "lavender", "thistle", "plum", "violet", "orchid", "fuchsia", "magenta", "mediumorchid", "mediumpurple", "blueviolet", "darkviolet", "darkorchid", "darkmagenta", "purple", "indigo", "pink", "lightpink", "hotpink", "deeppink", "palevioletred", "mediumvioletred", "white", "snow", "honeydew", "mintcream", "azure", "aliceblue", "ghostwhite", "whitesmoke", "seashell", "beige", "oldlace", "floralwhite", "ivory", "antiquewhite", "linen", "lavenderblush", "mistyrose", "gainsboro", "lightgray", "silver", "darkgray", "gray", "dimgray", "lightslategray", "slategray", "darkslategray", "black", "cornsilk", "blanchedalmond", "bisque", "navajowhite", "wheat", "burlywood", "tan", "rosybrown", "sandybrown", "goldenrod", "peru", "chocolate", "saddlebrown", "sienna", "brown", "maroon"]
    if @portfolio.save
      AboutMe.create portfolio_id: @portfolio.id
      redirect_to '/portfolios', notice: "Portfolio added successfully"
    else
      redirect_to '/portfolios', alert: "Portfolio could not be added"
    end
  end

  def edit
    @portfolio = Portfolio.find params[:id]
    @colors = ["lightsalmon", "salmon", "darksalmon", "lightcoral", "indianred", "crimson", "firebrick", "red", "darkred", "coral", "tomato", "orangered", "gold", "orange", "darkorange", "lightyellow", "lemonchiffon", "lightgoldenrodyellow", "papayawhip", "moccasin", "peachpuff", "palegoldenrod", "khaki", "darkkhaki", "yellow", "lawngreen", "chartreuse", "limegreen", "lime", "forestgreen", "green", "darkgreen", "greenyellow", "yellowgreen", "springgreen", "mediumspringgreen", "lightgreen", "palegreen", "darkseagreen", "mediumseagreen", "seagreen", "olive", "darkolivegreen", "olivedrab", "lightcyan", "cyan", "aqua", "aquamarine", "mediumaquamarine", "paleturquoise", "turquoise", "turquoise", "darkturquoise", "lightseagreen", "cadetblue", "darkcyan", "teal", "powderblue", "lightblue", "lightskyblue", "skyblue ", "deepskyblue", "lightsteelblue", "dodgerblue", "cornflowerblue", "steelblue", "royalblue", "blue", "mediumblue", "darkblue", "navy", "midnightblue", "mediumslateblue", "slateblue", "darkslateblue", "lavender", "thistle", "plum", "violet", "orchid", "fuchsia", "magenta", "mediumorchid", "mediumpurple", "blueviolet", "darkviolet", "darkorchid", "darkmagenta", "purple", "indigo", "pink", "lightpink", "hotpink", "deeppink", "palevioletred", "mediumvioletred", "white", "snow", "honeydew", "mintcream", "azure", "aliceblue", "ghostwhite", "whitesmoke", "seashell", "beige", "oldlace", "floralwhite", "ivory", "antiquewhite", "linen", "lavenderblush", "mistyrose", "gainsboro", "lightgray", "silver", "darkgray", "gray", "dimgray", "lightslategray", "slategray", "darkslategray", "black", "cornsilk", "blanchedalmond", "bisque", "navajowhite", "wheat", "burlywood", "tan", "rosybrown", "sandybrown", "goldenrod", "peru", "chocolate", "saddlebrown", "sienna", "brown", "maroon"]
  end

  def update
    @portfolio = Portfolio.find params[:id]
    @colors = ["lightsalmon", "salmon", "darksalmon", "lightcoral", "indianred", "crimson", "firebrick", "red", "darkred", "coral", "tomato", "orangered", "gold", "orange", "darkorange", "lightyellow", "lemonchiffon", "lightgoldenrodyellow", "papayawhip", "moccasin", "peachpuff", "palegoldenrod", "khaki", "darkkhaki", "yellow", "lawngreen", "chartreuse", "limegreen", "lime", "forestgreen", "green", "darkgreen", "greenyellow", "yellowgreen", "springgreen", "mediumspringgreen", "lightgreen", "palegreen", "darkseagreen", "mediumseagreen", "seagreen", "olive", "darkolivegreen", "olivedrab", "lightcyan", "cyan", "aqua", "aquamarine", "mediumaquamarine", "paleturquoise", "turquoise", "turquoise", "darkturquoise", "lightseagreen", "cadetblue", "darkcyan", "teal", "powderblue", "lightblue", "lightskyblue", "skyblue ", "deepskyblue", "lightsteelblue", "dodgerblue", "cornflowerblue", "steelblue", "royalblue", "blue", "mediumblue", "darkblue", "navy", "midnightblue", "mediumslateblue", "slateblue", "darkslateblue", "lavender", "thistle", "plum", "violet", "orchid", "fuchsia", "magenta", "mediumorchid", "mediumpurple", "blueviolet", "darkviolet", "darkorchid", "darkmagenta", "purple", "indigo", "pink", "lightpink", "hotpink", "deeppink", "palevioletred", "mediumvioletred", "white", "snow", "honeydew", "mintcream", "azure", "aliceblue", "ghostwhite", "whitesmoke", "seashell", "beige", "oldlace", "floralwhite", "ivory", "antiquewhite", "linen", "lavenderblush", "mistyrose", "gainsboro", "lightgray", "silver", "darkgray", "gray", "dimgray", "lightslategray", "slategray", "darkslategray", "black", "cornsilk", "blanchedalmond", "bisque", "navajowhite", "wheat", "burlywood", "tan", "rosybrown", "sandybrown", "goldenrod", "peru", "chocolate", "saddlebrown", "sienna", "brown", "maroon"]
    if @portfolio.update portfolio_params
      redirect_to portfolio_path(portfolio_id: @portfolio, sub_view: 'about'), notice: "Portfolio updated successfully"
    else
      redirect_to '/portfolios', alert: "Portfolio could not be updated"
    end
  end

  # ???should params[:sub_view] go through strong params? -- probably
  def show
    @sub_view = params[:sub_view]
    @portfolio = Portfolio.where(id: params[:id]).includes(:about_me, :projects)[0]
    if @sub_view == "about"
    elsif @sub_view.include? "project"
      project = @sub_view.split(',')[1].to_i
      @project = @portfolio.projects[project]
    end
  end

  def show_shared
    @sub_view = params[:sub_view]
    @portfolio = Portfolio.where(id: params[:id]).includes(:about_me, :projects)[0]
    if @sub_view == "about"
    elsif @sub_view.include? "project"
      project = @sub_view.split(',')[1].to_i
      @project = @portfolio.projects[project]
    end
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
    params.require(:portfolio).permit(:first_name, :last_name, :email, :linkedin, :github, :company_name, :company_email, :company_website, :header_color, :body_color, :font_color)
  end

end
