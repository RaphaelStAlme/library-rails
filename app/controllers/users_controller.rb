class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    skip_before_action :verify_authenticity_token, only: [:login, :register, :logout]

    # GET /login
    def index
        @users = User.all
    end
    # Page de connexion - Normalement gérée par les vues

    # POST /login
    def login
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: { message: "Connexion réussie" }, status: :ok
        else
            render json: { error: "Email ou mot de passe incorrect" }, status: :unauthorized
        end
    end

    # DELETE /logout
    def logout
        session.delete(:user_id)
        render json: { message: "Déconnexion réussie" }, status: :ok
    end

    # GET /register
    # Page de création de compte - Normalement gérée par les vues

    # POST /register
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            render json: @user, status: :created, location: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    # Les autres actions (show, update, destroy) restent inchangées

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end