module UnitConversion
  extend ActiveSupport::Concern

  module InstanceMethods
    def method_missing(name, *args, &block)
      puts "METHOD MISSING CALLED"
      if name.to_s =~ /_gallons=$/
        self.send("#{name.to_s[0..-10]}=", (args[0]* 128).to_i)
      elsif name.to_s =~/_gallons$/
        self.send(name.to_s[0..-9]) / 128
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