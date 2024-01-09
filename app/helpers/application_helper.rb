module ApplicationHelper
    def format_decimal(value)
      number_with_precision(value, precision: 2)
    end
end