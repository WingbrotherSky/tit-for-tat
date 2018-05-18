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
    unless service.user.services.count == 3
      if @service.save
        render json: { userId: @service.user.id }
      else
        error_message(@service)
      end
    else
      render json: { errors: "User cannot have more than 3 services"}
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
