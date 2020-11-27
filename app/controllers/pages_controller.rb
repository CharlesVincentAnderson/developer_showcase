class PagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:landing_page], :raise => false
  layout 'pages_layout'
end
