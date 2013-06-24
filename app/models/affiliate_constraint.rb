class AffiliateConstraint
  def initialize
    @subdomains = Team.all.collect { |t|
      t.url.split('/').last
    }.uniq
  end

  def matches?(request)
    @subdomains.include? request.fullpath.sub(/^\//, "")
  end
end
