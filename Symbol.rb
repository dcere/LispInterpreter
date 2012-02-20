class Symbol

   # eval: Symbols evaluate to the value stored in the environment under their name
   def lispeval(env, forms)
      env.lookup(self)
   end
   
   # Helper functions
   def arrayify
      self == :nil ? [] : self
   end
   
   def conslist?
      self == :nil
   end
   
end
