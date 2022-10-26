# frozen_string_literal: true

require_relative "jsdg/version"
require 'prawn'

module Jsdg

  class Error < StandardError; end

  # Your code goes here...
  extend self

  MainText = "МИНОБРНАУКИ РОССИИ

Федеральное государственное автономное образовательное учреждение высшего образования «Южный федеральный университет»

Институт математики, механики и компьютерных наук им. И.И. Воровича


Направление подготовки
02.03.02 — Фундаментальная информатика и информационные технологии
"

  Enters = "\n\n\n\n\n\n\n\n"

  def hello()
    # Using explicit block form and rendering to a file

    content = "Hello World"
    Prawn::Document.generate "example.pdf" do |pdf|

      # self here is left alone
      pdf.font "Times-Roman"
      pdf.draw_text content, :at => [200, 720], :size => 32

    end
  end

  def build()
    puts "Type path and title of document: "
    title = gets.chomp
    puts "Type your FIO: "
    name = gets.chomp
    puts "Type the title of report: "
    topic = gets.chomp

    paths = getFiles

    Prawn::Document.generate title do |pdf|

      pdf.text genHeader(name, topic), :size => 14

      for path in paths
        pdf.text importJavaFile(path), :size => 12
        pdf.text Enters, :size => 12
      end


    end
  end

  def getFiles()
    paths = []

    puts 'Type names of Java files for import (\'exit\' to exit)'
    path = gets.chomp
    until path === "exit"
      paths.push path

      path = gets.chomp
    end

    paths
  end

  def genHeader(name, topic)
    res = "MINISTRY OF EDUCATION AND SCIENCE OF RUSSIA\n\nFederal State Autonomous Educational Institution of Higher Education \"Southern Federal University\"\n\n
I.I. Vorovich Institute of Mathematics, Mechanics and Computer Sciences\n\nDirection of training
\n02.03.02 — Fundamental Informatics and information technologies\n" + "PRACTICE REPORT\nMUAM JAVA\n" + topic
    + "\n\n3-year student\n" + name

    res
  end
  def importJavaFile(path)
    file = File.open(path)

    data = file.read

    file.close
    data
  end
end