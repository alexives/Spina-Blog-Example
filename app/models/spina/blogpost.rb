module Spina
  class Blogpost < ActiveRecord::Base
    attr_accessor :old_materialized_path

    belongs_to :photo

    scope :ordered, -> { order(created_at: :desc) }

    before_validation :set_slug
    after_save :rewrite_rule

    validates :title, presence: true
    validates :slug, uniqueness: true

    def materialized_path
      "/blog/#{slug}"
    end

    private

      def set_slug
        self.old_materialized_path = materialized_path
        self.slug = title.try(:parameterize)
        self.slug += "-#{self.class.where(slug: slug).count}" if self.class.where(slug: slug).where.not(id: id).count > 0
        slug
      end

      def rewrite_rule
        RewriteRule.create(old_path: old_materialized_path, new_path: materialized_path) if old_materialized_path != materialized_path
      end
  end
end
