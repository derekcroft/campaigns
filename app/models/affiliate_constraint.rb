class AffiliateConstraint
  def initialize
    @subdomains = Team.all.collect(&:subdomain).uniq
  end

  def matches?(request)
    @subdomains.include? request.fullpath.sub(/^\//, "")
  end
end
