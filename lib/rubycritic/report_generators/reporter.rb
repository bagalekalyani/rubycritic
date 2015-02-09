module Rubycritic

  module Reporter
    def self.generate_report(analysed_modules)
      report_generator_class.new(analysed_modules).generate_report
    end

    def self.report_generator_class
      case Config.format
      when :json
        require "rubycritic/report_generators/json"
        ReportGenerator::Json
      else
        require "rubycritic/report_generators/html"
        ReportGenerator::Html
      end
    end
  end

end
