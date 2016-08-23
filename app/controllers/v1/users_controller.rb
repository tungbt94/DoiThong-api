class V1::UsersController < V1::BaseController

  protect_from_forgery unless: -> { request.format.json? }

  # respond_to :json
  def index
    # binding.pry
    users = User.all.limit(5).order('score desc')
    render json: users, root: false
    # respond_with User.all
  end

  def create
    # binding.pry
    user = User.create!(
      :name => params[:name],
      :score => params[:score].to_i
    )

    if user.save
      render json: user, status: :created
    # else
    #   render json: user.errors, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :score) if params[:user]
    end
end
