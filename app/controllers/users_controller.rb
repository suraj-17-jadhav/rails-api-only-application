class UsersController < ApplicationController

    before_action :authenticate_user!
    before_action :authorize_action


    def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def assign_user_policy
        user = User.find_by(id: params[:id])
        if user.nil?
          render json: { error: "User not found" }, status: :not_found
          return
        end
        user_health_policy = UserHealthPolicy.new(user_id: user.id, policy_name: params[:policy_name], expiry_date: params[:expiry_date])
        if user_health_policy.save
          render json: { message: "Policy assigned successfully", user_health_policy: user_health_policy }, status: :created
        else
          render json: { error: user_policy.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render json: { error: "User not found" }, status: :not_found and return if @user.nil?
        respond_to do |format|
          format.json 
        end
    end

    def upload_document
      @user = User.find(params[:id])
      @documents = Document.upload(params[:file],@user.id, 'user')    
      if @documents.save
        render json: @documents, status: :created
      else
        render json: { errors: @documents.errors.full_messages }, status: :unprocessable_entity
      end
    end 

    def upload_policy_document
      @user = User.find(params[:id])
      @policy_documents = Document.upload(params[:file],@user.id, 'policy')    
      if @policy_documents.save
        render json: @policy_documents, status: :created
      else
        render json: { errors: @policy_documents.errors.full_messages }, status: :unprocessable_entity
      end
    end 
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :dob, :mobile_number, :password, :role)
    end

    def authorize_action
      authorize User
    end

    def pundit_user
      current_user
    end

end