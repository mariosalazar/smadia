class MicrositesController < ApplicationController
  before_filter :menu_bar
  def show
    if @microsite = Microsite.find_by_name(params[:name])
      unless @microsite.external_page
        return redirect_to root_path 
      end
      @external = true
      render :layout => false
    end
    if @microsite = Microsite.find_by_id(params[:id])
      @external = false
    end
    @form = @microsite.form_details
  end
end
