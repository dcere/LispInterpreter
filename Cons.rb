class Cons
   attr_reader :car, :cdr
   
   def initialize(car, cdr)
      @car = car
      @cdr = cdr
   end
   
   # eval
   def lispeval(env, forms)
      # Handle special forms
      return forms.lookup(car).call(env, forms, *cdr.arrayify) if forms.defined?(car)
      
      # Handle the rest
      func = car.lispeval(env, forms)
      return func.call(*cdr.arraify.map{|x| x.lispeval(env, forms) })
   end
      
   # Helper functions
   def arraify
      return self unless conslist?
      return [car] + cdr.arrayify
   end
   
end
