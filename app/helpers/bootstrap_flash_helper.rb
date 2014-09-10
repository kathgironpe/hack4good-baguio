module BootstrapFlashHelper
  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)

  def alert_type(type)
    alert_type = type.to_sym
    return :success if alert_type == :notice
    return :danger  if alert_type == :alert
    return :danger if alert_type == :error
  end

  def alert_class(type, options)
    "alert fade in alert-#{type} #{options[:class]}"
  end

  def bootstrap_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      next if message.blank?
      type = alert_type(type)
      next unless ALERT_TYPES.include?(type)
      Array(message).each do |msg|
        flash_messages << content_tag(:div, msg, class: alert_class(type, options)) if msg
      end
    end
    flash_messages.join('\n').html_safe
  end
end
