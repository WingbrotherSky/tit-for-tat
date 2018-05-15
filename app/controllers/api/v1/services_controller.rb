class Api::V1::ServicesController < Api::V1::BaseController
  def index
    @query = params[:query]
    if @query
      @services = Service.search_by_keyword(@query)
    else
      @services = Service.all
    end
  end

  def create

  end

  def update

  end

  def destroy

  end

end
