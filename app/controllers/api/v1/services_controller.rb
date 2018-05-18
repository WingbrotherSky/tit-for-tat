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
    @service = Service.new(service_params)
    if @service.save
      render json: { userId: @service.user.id }
    else
      error_message(@service)
    end
  end

  def update
    if Service.update(service_params)
      success_messsage
    else
      render json: { errors: "Service could not be updated" }
    end
  end

  def destroy
    @service = Service.find(params[:id])
    if @service.destroy
      success_messsage
    else
      error_message(@service)
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :user_id, :description, :image)
  end


end
