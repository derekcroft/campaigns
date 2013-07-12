class AffiliateConstraint
  def initialize
    @subdomains = Team.all.collect(&:subdomain).uniq
  rescue PG::Error
    @cloud_66 = true
  end

  def matches?(request)
    return true if @cloud_66
    @subdomains.include? request.fullpath.sub(/^\//, "")
  end
end
