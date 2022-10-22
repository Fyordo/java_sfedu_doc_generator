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
    puts "Введите название документа и путь к нему: "
    title = gets
    puts "Введите ваше ФИО: "
    name = gets
    puts "Введите название задания: "
    topic = gets

    paths = getFiles

    Prawn::Document.generate title do |pdf|

      # self here is left alone
      pdf.font "Times-Roman"
      pdf.draw_text genHeader(name, topic), :size => 14

      for path in paths
        pdf.draw_text importJavaFile(path), :size => 12
        pdf.draw_text Enters, :size => 12
      end


    end
  end

  def getFiles()
    paths = []

    puts 'Вводите названия Java файлов для импорта (для прерывания введите простую строку)'
    path = gets
    while path != ''
      paths.include path

      path = gets
    end

    paths
  end

  def genHeader(name, topic)
    # TODO Сюзанна

    # Используя константу выше сгенироровать текст титульника и вернуть его в виде строки
    throw NotImplementedError
  end

  def importJavaFile(path)
    # TODO Мария

    # Проверить, что такой файл существует, прочитать из него текст и вернуть его в виде строки
    throw NotImplementedError
  end
end