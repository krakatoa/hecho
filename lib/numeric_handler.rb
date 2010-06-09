class NumericHandler
  def self.str_a_float(str)
    return 0 if not str
    str.gsub(",", ".").to_f
  end
end