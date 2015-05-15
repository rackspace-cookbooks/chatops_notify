if defined?(ChefSpec)

  # slack notify
  def slack_notify(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:slack_notify, :notify, resource_name)
  end

  # hipchat notify
  def hipchat_notify(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:hipchat_notify, :notify, resource_name)
  end

  # custom notify
  def custom_notify(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:custom_notify, :notify, resource_name)
  end

end
