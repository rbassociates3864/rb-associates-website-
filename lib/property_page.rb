class PropertyPage

  ATTRS = [
    :name,
    :url,
    :bgVideo,
    :bgMap,
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
    :photos,
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

    return count unless self.propertySpaceTypes

    self.propertySpaceTypes.each do |space_type|
      continue unless space_type.propertySpaces
      count += space_type.propertySpaces.count
    end

    count
  end

  def space_types_count
    count = 0
    return count unless self.propertySpaceTypes
    count = self.propertySpaceTypes.count
  end

  def spaces_count_with_label
    spaces_count = self.spaces_count
    space_types_count = self.space_types_count

    if space_types_count == 1
      _set_spaces_title(spaces_count, self.propertySpaceTypes[0].name)
    else
      _set_spaces_title(spaces_count, 'Spaces')
    end
  end

  private

  def _set_spaces_title(count, plural_label)
    case count
    when 1
      return "1 #{plural_label.chop}"
    else
      return "#{count} #{plural_label}"
    end
  end

end
