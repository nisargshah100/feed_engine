class LinkPost < Post
  validates :content, :length => { :maximum => 2048 }

  validate do
    self.errors[:base] << "Link must be valid" unless self.content.match(/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix)
  end

  def template
    "link_post"
  end

  def decorate
    LinkPostDecorator.decorate(self)
  end
end