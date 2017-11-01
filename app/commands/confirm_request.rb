class ConfirmRequest
  prepend SimpleCommand
  prepend SimpleAuth::CustomAuth

  attr_accessor :options
  def initialize(options = {})
    @options = options
  end

  def call
    confirm
  end

  protected

  def confirm
    nil
  end
end