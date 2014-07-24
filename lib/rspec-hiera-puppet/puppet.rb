require 'puppet'
require 'hiera_puppet'

class Puppet::Parser::Compiler
  alias_method :compile_unadorned, :compile

  def compile
    spec = Thread.current[:spec]

    if spec
      register_function_hiera(spec)
      register_function_hiera_array(spec)
      register_function_hiera_hash(spec)
      register_function_hiera_include(spec)
    end

    compile_unadorned
  end

  def register_function_hiera(spec)
    Puppet::Parser::Functions.newfunction(:hiera, :type => :rvalue) do |*args|
      key, default, override = HieraPuppet.parse_args(args)
      hiera = Hiera.new(:config => spec.hiera_config.merge(:logger => 'puppet'))

      hiera.lookup(key, default, self, override, :priority)
    end
  end

  def register_function_hiera_array(spec)
    Puppet::Parser::Functions.newfunction(:hiera_array, :type => :rvalue) do |*args|
      key, default, override = HieraPuppet.parse_args(args)
      hiera = Hiera.new(:config => spec.hiera_config.merge(:logger => 'puppet'))

      hiera.lookup(key, default, self, override, :array)
    end
  end

  def register_function_hiera_hash(spec)
    Puppet::Parser::Functions.newfunction(:hiera_hash, :type => :rvalue) do |*args|
      key, default, override = HieraPuppet.parse_args(args)
      hiera = Hiera.new(:config => spec.hiera_config.merge(:logger => 'puppet'))

      hiera.lookup(key, default, self, override, :hash)
    end
  end

  def register_function_hiera_include(spec)
    Puppet::Parser::Functions.newfunction(:hiera_include) do |*args|
      hiera = Hiera.new(:config => spec.hiera_config.merge(:logger => 'puppet'))

      answer = hiera.lookup(key, default, self, override, :array)

      method = Puppet::Parser::Functions.function(:include)
      send(method, answer)
    end
  end
end
