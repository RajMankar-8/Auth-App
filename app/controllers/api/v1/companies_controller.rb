class Api::V1::CompaniesController < ApiController
	load_and_authorize_resource
    before_action :set_company, only: [:show, :update, :destroy]

	def index
		@companies = Company.accessible_by(current_ability)

		render json: @companies, status: :ok
	end

	def create 
		@company = current_user.companies.new(company_params)

		if @company.save
			render json: @company, status: :ok
		else
			render json: { errors: @company.errors.full_messages, status: "Failed to create company"}, status: :unprocessable_entity
		end
	end

	def show
        render json: @company, status: :ok
	end

	def update
		if @company.update(company_params)
			render json: { success: true, message: "Company updated successfully"}, status: :ok
		else
			render json: { success: false, errors: @company.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def destroy
        if @company.destroy
        	render json: { status: 200, message: "Company destroyed successfully"}, status: :ok
        else
        	render json: { status: "Failed", message: @company.errors.full_messages }, status: :unprocessable_entity
        end
	end

	private

	def set_company
		begin
			@company = current_user.companies.find(params[:id])
        rescue => e
        	render json: { errors: e.full_messages }, status: :unauthorized
        end
	end

	def company_params
		params.require(:company).permit(:name, :address, :established_year, :user_id)
	end

end