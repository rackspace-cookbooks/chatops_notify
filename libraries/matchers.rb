if defined?(ChefSpec)

  # chatops notify
  def chatops_notify(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:chatops_notify, :notify, resource_name)
  end
end
