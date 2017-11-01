class RegisterRequest
  prepend SimpleCommand
  prepend SimpleAuth::CustomAuth

  attr_accessor :options
  def initialize(options = {})
    @options = options
  end

  def call
    register
  end

  protected

  def register
    nil
  end
end