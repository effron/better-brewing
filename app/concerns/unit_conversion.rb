module UnitConversion
  extend ActiveSupport::Concern

  def method_missing(name, *args, &block)
    if name.to_s =~ /_gallons=$/
      if !args[0].blank?
        self.send("#{name.to_s[0..-10]}=", (args[0].to_f * 128).to_i)
      else
        self.send("#{name.to_s[0..-10]}=", nil)
      end
    elsif name.to_s =~/_gallons$/
      vol = self.send(name.to_s[0..-9])
      vol ? vol / 128.0 : nil
    else
      super(name, *args, &block)
    end
  end

  def respond_to?(method_sym, include_private = false)
    if method_sym.to_s =~ /_gallons=?$/
      true
    else
      super(method_sym, include_private)
    end
  end

end