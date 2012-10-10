# -*- encoding : utf-8 -*-
module ApplicationHelper
  def configuration
    @configuration ||= Configuration.first
  end
end
