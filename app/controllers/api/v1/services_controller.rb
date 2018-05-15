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
      render json: { message: "Service created" }
    else
      render json: { errors: @service.errors.messages }
    end
  end

  def update
    if Service.update(service_params)
      render json: { message: "Service updated" }
    else
      render json: { errors: "Service could not be updated" }
    end
  end

  def destroy
    @service = Service.find(params[:id])
    if @service.destroy
      render json: { message: "Service destroyed" }
    else
      render json: { errors: @json.errors.messages }
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :user_id, :description, :image)
  end


end
