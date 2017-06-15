# Namespace::AuthScope parses the scope string for the "namespace" type.
class Namespace::AuthScope < Portus::AuthScope
  attr_accessor :resource, :actions, :resource_type, :resource_name

  def resource
    if !resource_name.include?("/")
      raise NamespaceNotSupport, "Invalid namespace name" 
    end
    namespace_name, image_name = resource_name.split("/")
    found_resource = Namespace.find_by name: namespace_name
    raise ResourceNotFound, "Cannot find namespace #{namespace_name}" if found_resource.nil?

    found_resource
  end

  # Re-impemented to handle the special "*" action. If the action is "*", then
  # it returns the generic ["all"]. Otherwise it calls this same method from
  # the superclass.
  def scopes
    if @actions[0] == "*"
      ["all"]
    else
      super
    end
  end

  protected

  # Re-implemented from Portus::AuthScope to deal with the name of the
  # namespace.
  def parse_scope_string!
    super

    return unless @resource_name.include?("/")
    @namespace_name = @resource_name.split("/").first
  end
end
