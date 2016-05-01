module Spina
  module Blog
    class SitemapsController < Spina::ApplicationController
      def show
        @blogposts = Blogpost.ordered
      end
    end
  end
end