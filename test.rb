require 'env'


e = Env.new
e.defined?(:var)
e.define(:var, 1)
e.defined?(:var)


e.define(:var1, 1)
e.lookup(:var1)
#e.lookup(:var2)     # Fails because var2 does not exist


# Lisp interpreter
require 'rubygems'
gem 'sexp'     # Changes the errors, but there are still
require 'sexp'

Dir["./*.rb"].each {|file| require file }
lisp = Interpreter.new
lisp.repl