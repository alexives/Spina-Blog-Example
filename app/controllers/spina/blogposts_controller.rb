module Spina
  class BlogpostsController < Spina::ApplicationController
    layout Spina.config.blog_layout

    before_action :get_blog_page
    before_action :rewrite_blogpost, only: [:show]

    def index
      @blogposts = Blogpost.ordered
    end

    private

      def get_blog_page
        @page = Page.find_by(name: 'blog')
      end

      def blogpost
        @blogpost ||= Blogpost.find_by(slug: params[:id])
      end
      helper_method :blogpost

      def rewrite_blogpost
        unless blogpost.present?
          @rule = RewriteRule.find_by(old_path: "/blog/#{params[:id]}")
          redirect_to @rule.new_path, status: :moved_permanently if @rule.present?
        end
      end
  end
end