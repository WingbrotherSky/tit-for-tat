class Api::V1::ContractsController < Api::V1::BaseController
  def show
    @contract = Contract.find(params[:id])
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      success_message
    else
      error_message(@contract)
    end
  end

  def update
    if Contract.update(contract_params)
      success_message
    else
      render json: { errors: "Failed to update" }
    end
  end

  def destroy
    @contract = Contract.find(params[:id])
    if @contract.destroy
      success_message
    else
      error_message(@contract)
    end
  end

  private

  def contract_params
    params.require(:contract).permit(:user_id, :service_id, :note, :status)
  end
end
