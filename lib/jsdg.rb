# frozen_string_literal: true

require_relative "jsdg/version"
require 'prawn'

module Jsdg

	class Error < StandardError; end
	# Your code goes here...
	extend self

	def hello()
# Using explicit block form and rendering to a file

	content = "Hello World"
	Prawn::Document.generate "example.pdf" do |pdf|

# self here is left alone
	pdf.font "Times-Roman"
	pdf.draw_text content, :at => [200,720], :size => 32

        end
    end
end