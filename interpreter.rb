require 'defaults'
require 'forms'


class Interpreter

   def initialize(defaults = DEFAULTS, forms = FORMS)
      @env   = Env.new(nil, defaults)
      @forms = Env.new(nil, forms)
   end


   def eval(string)
      exps = "(#{string})".parse_sexp
      puts "-- exps ="
      p exps
      exps.map do |exp|
         exp.consify.lispeval(@env, @forms)
      end.last
   end


   def repl
      print "lisp> "
      STDIN.each_line do |line|
         
         # Exit functions
         exit if line.chomp() == "quit"
         exit if line.chomp() == "exit"
         
         # REPL
         begin
            puts self.eval(line).to_sexp
         rescue StandardError => e
            puts "ERROR: #{e}"
         end
         print "lisp> "
      end
   end

end