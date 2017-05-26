# Registry::AuthScope parses the scope string so it can be used afterwards for
# the "registry" type.
class Registry::AuthScope < Portus::AuthScope
  def resource
  end

  def scopes
    catalog? ? ["all"] : []
  end

  private

  # Returns true if the given scope string corresponds to the /v2/_catalog
  # endpoint.
  def catalog?
    @resource_name == "catalog" && @actions[0] == "*"
  end
end
