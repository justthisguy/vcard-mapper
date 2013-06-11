module Vcard
  class Parser
    attr_reader :lines

    def initialize(file_path: "./card.vcf")
      @lines = IO.readlines "#{File.dirname(__FILE__)}/#{file_path}"
    end

    def parse
      lines.map { |l| parse_line(l) }
    end

    def parse_line line
      line = line.strip
      header, body = line.split ':', 2
      property, attrs = parse_header header

      puts [property, body, attrs].inspect

      [property, body, attrs]
    end

    def parse_header header
      # returns property + attrs from header string
      header.split ';', 2
    end
  end
end
