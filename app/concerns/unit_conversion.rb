module UnitConversion
  extend ActiveSupport::Concern

  module InstanceMethods
    def method_missing(name, *args, &block)
      if name.to_s =~ /_gallons=$/
        self.send("#{name.to_s[0..-10]}=", (args[0].to_f * 128).to_i)
      elsif name.to_s =~/_gallons$/
        (self.send(name.to_s[0..-9]) || 0) / 128.0
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
end