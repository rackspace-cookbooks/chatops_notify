if defined?(ChefSpec)

  # slack notify require
  def slack_notify(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:slack_notify, :require, resource_name)
  end

  # hipchat notify require
  def hipchat_notify(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:hipchat_notify, :require, resource_name)
  end

end
