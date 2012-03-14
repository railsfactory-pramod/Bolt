class Page < ActiveRecord::Base
  has_ancestry
  has_many :page_sections, :dependent => :destroy

  accepts_nested_attributes_for :page_sections
end
