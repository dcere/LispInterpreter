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
      return func.call(*cdr.arrayify.map{|x| x.lispeval(env, forms) })
   end
   

   # Helper functions
   def arrayify
      return self unless conslist?
      return [car] + cdr.arrayify
   end
   

   # to_sexp
   def to_sexp
      return "(cons #{car.to_sexp} #{cdr.to_sexp})" unless conslist?
      sexp = arrayify.map{ |x| x.to_sexp}.join(' ')
      puts "-- Returning #{sexp}"
      return "(#{sexp})"
   end

end
