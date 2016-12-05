class PropertyPage

  ATTRS = [
    :name,
    :url,
    :bgVideo,
    :backgroundImage,
    :price,
    :ownershipType,
    :address,
    :city,
    :state,
    :zipCode,
    :coordinates,
    :description,
    :detailSections,
    :propertySpaceTypes,
    :videos
  ]

  attr_reader(*ATTRS)

  # Class Methods

  def self.all(contentfulPropertyPages=[])
    properties = [].tap do |properties|
      contentfulPropertyPages.each do |p|
        properties << PropertyPage.new(p[1])
      end
    end

    properties.sort_by!(&:name)
  end

  # Instance Methods

  def initialize(attrs)
    attrs.each do |k,v|
      continue if v.nil?
      value = v.is_a?(String) ? v.strip : v
      instance_variable_set("@#{k}", value)
    end
  end

  def as_json
    {}.tap do |hash|
      instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
    end
  end

  def spaces_count
    count = 0
    self.propertySpaceTypes.each do |space_type|
      continue unless space_type.propertySpaces
      count += space_type.propertySpaces.count
    end

    count
  end

  def spaces_count_with_label
    count = self.spaces_count
    case count
    when 0
      return '0 Spaces'
    when 1
      return '1 Space'
    else
      return "#{count} Spaces"
    end
  end

end
