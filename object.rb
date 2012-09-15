class Object

   # eval: Numbers and Strings evaluate to themselves. Generic definition on Object class.
   def lispeval(env, forms)
      self
   end
   

   # Helper functions
   def arrayify
      self
   end
   

   def conslist?
      false
   end


   def consify
      self
   end
   
end
