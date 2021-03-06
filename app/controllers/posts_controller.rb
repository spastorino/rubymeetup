class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @ongoing = Post.where(:category => 'ongoing')
    @upcoming = Post.where(:category => 'upcoming')
    @this_week = Post.where(:category => 'this_week')
    @picks = Post.where(:featured => true).order(:priority)
    @ranking = Post.order(:like_count)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # Overrides old picks with new picks
  # it should always erase all old picks
  # and replace them if new pick ids are provided.
  def save_picks
    Post.where(:featured => true).update_all(:featured => false, :priority => nil)
    if params[:featured_pick_ids].present?
      featured_picks = Post.find(params[:featured_pick_ids]).sort_by{|p| params[:featured_pick_ids].index(p.id.to_s) }
      featured_picks.each_with_index do |f, i|
        f.featured = true
        f.priority = i
        f.save
      end
    end
    render :nothing => true
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :priority, :category, :user_id)
    end
end
