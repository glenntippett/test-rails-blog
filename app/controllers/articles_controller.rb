class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    if !user_signed_in?
     flash.alert = 'You must be signed in to create an article'
     redirect_back_or_to({ action: 'index' })
    end
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      # redirect_to will cause the browser to make a new request,
      # whereas render renders the specified view for the current request.
      # It is important to use redirect_to after mutating the database or application state.
      # Otherwise, if the user refreshes the page, the browser will make the same request
      # and the mutation will be repeated.
      redirect_to @article
    else
      # https://guides.rubyonrails.org/active_record_validations.html#working-with-validation-errors
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    # https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/303
    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    # https://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    params.require(:article).permit(:title, :body, :status)
  end
end
