require 'active_support/inflector'

class Category
  MAP = {
    "Athenas": 5, "Box": 32, "Chronus": 31, "HELPDESK": 37,
    "Intranet": 3, "ODIN": 28, "Plantão": 30, "Portal": 4,
    "SAED": 29, "SEGAB": 35, "SEI": 16, "SERAPH": 34,
    "SICOR": 36, "SISREF": 1, "Site": 33, "SOLAR": 2
  }.freeze

  def system_id_for(system_name)
    MAP[system_name.downcase]
  end

  def names
    @names ||= MAP.keys.map(&:to_s)
  end

  def compare(name)
    normalized_names.find { |category_name| /^#{normalize(name)}$/ =~ category_name }
  end

  private

  def normalized_names
    @normalized_names ||= names.map { |name| normalize(name) }
  end

  def normalize(str)
    ActiveSupport::Inflector.transliterate str.downcase.gsub(/\s/, '_')
  end
end
