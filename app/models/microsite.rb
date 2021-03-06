class Microsite < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  has_one :form_details, :class_name => "Form", :foreign_key => "microsite_id"
  has_many :sub_microsites, :class_name => "Microsite"
  belongs_to :parent_microsite, :class_name => "Microsite", :foreign_key => "microsite_id"
  belongs_to :category
  has_one :image, :as => :owner, :conditions => "purpose = 'image'"
  has_one :header, :as => :owner, :class_name => "Image", :conditions => "purpose = 'header'"
  has_one :space1, :as => :owner, :class_name => "Image", :conditions => "purpose = 'space1'"
  has_one :space2, :as => :owner, :class_name => "Image", :conditions => "purpose = 'space2'"
  has_one :space3, :as => :owner, :class_name => "Image", :conditions => "purpose = 'space3'"
  has_one :space4, :as => :owner, :class_name => "Image", :conditions => "purpose = 'space4'"
  has_one :footer, :as => :owner, :class_name => "Image", :conditions => "purpose = 'footer'"
  accepts_nested_attributes_for :image, :header, :space1, :space2, :space3, :space4, :footer
  validates_presence_of :published, :summary, :content 
  validates_uniqueness_of :name
  validates_format_of :name, :with => /^\w+$/i, :message => "solo puede contener letras y numeros"
end
