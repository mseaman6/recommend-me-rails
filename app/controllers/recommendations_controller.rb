class RecommendationsController < ApplicationController
  before_action :require_login

  def index
    if params[:category_id]
      @recommendations = Recommendation.where("category_id = ?", (params[:category_id]))
    else
      @recommendations = Recommendation.all
    end
  end

  def recent
    if params[:category_id]
      @recommendations = Recommendation.where("category_id = ?", (params[:category_id])).recent
    else
      @recommendations = Recommendation.recent
    end
    render :index
  end

  def alphabetical
    @recommendations = Recommendation.title_a_z
    render :list
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.create(recommendation_params)
    @recommendation.user_id = session[:user_id]
    @category = Category.find_or_create_by(:name => params[:recommendation][:category][:name].upcase)
    if @category.save
      @recommendation.category_id = @category.id
    end
    if @recommendation.save
      redirect_to recommendation_path(@recommendation)
    else
      #flash[:message] = "The new recommendation failed to be created.  Please make sure that you complete all required fields and try again."
      render :new
    end
  end

  def show
    @recommendation ||= Recommendation.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @recommendation = Recommendation.find(params[:id])
    if current_user.id == @recommendation.user_id
    else
      flash[:message] = "The recommendation can only be edited by the user that created it."
      redirect_to recommendation_path(@recommendation)
    end
  end

  def update
    @recommendation = Recommendation.find(params[:id])
    if current_user.id == @recommendation.user_id
      @recommendation.update(recommendation_params)
      @category = Category.find_or_create_by(:name => params[:recommendation][:category][:name].upcase)
      if @category.save
        @recommendation.category_id = @category.id
      end
      if @recommendation.save
        redirect_to recommendation_path(@recommendation)
      else
        flash[:message] = "The recommendation failed to save, please try again."
        redirect_to edit_recommendation_path(@recommendation)
      end
    else
      flash[:message] = "The recommendation can only be edited by the user that created it."
      redirect_to recommendation_path(@recommendation)
    end
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])
    if current_user.id == @recommendation.user_id
      @recommendation = Recommendation.destroy(params[:id])
      flash[:message] = "Recommendation deleted successully."
      redirect_to recommendations_path
    else
      flash[:message] = "Recommendation can only be deleted by the user that created it."
      redirect_to recommendations_path
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:title, :description, :user_id, :category_id)
  end

end
