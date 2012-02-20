class Array

   # Helper functions
   def consify
      map{|x| x.consify}.reverse.inject(:nil) {|cdr, car| Cons.new(car, cdr)}
   end
   
end
