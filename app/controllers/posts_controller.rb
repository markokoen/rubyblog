class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    # GET /posts
    # posts/index.html.erb
    # displays all posts
    def index
        @posts = Post.all
    end

    # GET /posts/1
    # posts/show.html.erb
    # this will show the post
    # will also contain the comment form to create a new comment and show comments
    def show
        @comment = Comment.new
    end

    # GET /posts/new
    # posts/new.html.erb
    # form to create a new post
    def new
        @post = Post.new
    end

    # GET /posts/1/edit
    # edit.html.erb
    # form for editing post
    def edit
    end

    # POST /posts
    # posts/index.html.erb
    # after new post created in form on new.html.erb above,
    # redirects to index page where new post will appear
    def create
        @post = Post.new(post_params)

        if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
        else
        render :new
        end
    end

    # PATCH/PUT /posts/1
    # posts/show.html.erb
    # updates specific post
    def update
        respond_to do |format|
        if @post.update(post_params)
            format.html { redirect_to @post, notice: 'Post was successfully updated.' }
            format.json { render :show, status: :ok, location: @post }
        else
            format.html { render :edit }
            format.json { render json: @post.errors, status: :unprocessable_entity }
        end
        end
    end

    # DELETE /posts/1
    # posts/show.html.erb
    # deletes specific post
    def destroy
        @post.destroy
        respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
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
        params.require(:post).permit(:title, :content)
        end

end
