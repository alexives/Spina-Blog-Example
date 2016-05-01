module Spina
  module Admin
    class BlogpostsController < AdminController

      before_action :set_breadcrumb
      before_action :set_blogpost, only: [:edit, :update, :destroy]

      layout 'spina/admin/website'

      def index
        @blogposts = Blogpost.ordered
      end

      def new
        @blogpost = Blogpost.new
      end

      def edit
      end

      def create
        @blogpost = Blogpost.new(blogpost_params)

        if @blogpost.save
          redirect_to admin_blogposts_path
        else
          render :new
        end
      end

      def update
        if @blogpost.update(blogpost_params)
          redirect_to admin_blogposts_path
        else
          render :edit
        end
      end

      def destroy
        @blogpost.destroy
        respond_to do |format|
          redirect_to admin_blogposts_path
        end
      end

      private

      def blogpost_params
        params.require(:blogpost).permit(:title, :content, :description, :photo_id)
      end

      def set_breadcrumb
        add_breadcrumb 'Blog', admin_blogposts_path
      end

      def set_blogpost
        @blogpost = Blogpost.find(params[:id])
        add_breadcrumb @blogpost.title
      end

    end
  end
end