require "json"

module Rubycritic
  module ReportGenerator

    class Json
      def initialize(analysed_modules)
        @analysed_modules = analysed_modules
      end

      def generate_report
        create_directory_and_file
        puts "New JSON critique at #{report_location}"
      end

      private

      def create_directory_and_file
        File.open(report_location, "w+") do |file|
          file.write(JSON.dump(@analysed_modules))
        end
      end

      def report_location
        @report_location ||= File.join(Config.root, "rubycritic.json")
      end
    end

  end
end
