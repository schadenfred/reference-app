module Support
  module Helpers
    module FileHelper

      def write_yaml(hash, filename, destination_dir=nil)
        File.open("test/fixtures/files/#{filename}.yml","w") do |file|
          file.write hash.to_yaml
        end 
      end

      def read_yaml(filename, source_dir='test/fixtures/files')
        YAML.load_file("#{source_dir}/#{filename}.yml")
      end
    end
  end 
end 
