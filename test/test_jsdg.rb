# frozen_string_literal: true

require "test_helper"

class TestJsdg < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jsdg::VERSION
  end

  def test_default_java_file
    test1 = Jsdg.importJavaFile(Dir.pwd + '/test/lib/defaultCode0.java')
    test2 = Jsdg.importJavaFile(Dir.pwd + '/test/lib/defaultCode1.java')
    assert test1 === test2
  end

  def test_empty_java_file0
    test1 = Jsdg.importJavaFile(Dir.pwd + '/test/lib/emptyCode0.java')
    assert test1 === ''
  end

  def test_empty_java_file1
    test1 = Jsdg.importJavaFile(Dir.pwd + '/test/lib/emptyCode1.java')
    assert test1 === ''
  end

  def test_rus_symbols_java_file
    test1 = Jsdg.importJavaFile(Dir.pwd + '/test/lib/rusCode0.java')
    assert test1 === 'абс'
  end

  def test_all_symbols_java_file
    test1 = Jsdg.importJavaFile(Dir.pwd + '/test/lib/allSymCode.java')
    assert test1 === "йцукенгшщзхъфывапролджэячсмитьбю.ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ.qwertyuiop[]asdfghjkl;zxcvbnm,./QWERTYUIOP[]ASDFGHJKL;ZXCVBNM,./
12344567890-=``!@#$%^&*()_+"
  end

  def test_empty_text_input
    assert Jsdg.genHeader('','') === "MINISTRY OF EDUCATION AND SCIENCE OF RUSSIA\n\nFederal State Autonomous Educational Institution of Higher Education \"Southern Federal University\"\n\n
I.I. Vorovich Institute of Mathematics, Mechanics and Computer Sciences\n\nDirection of training
\n02.03.02 — Fundamental Informatics and information technologies\n" + "PRACTICE REPORT\nMUAM JAVA\n" + ''
    + "\n\n3-year student\n" + ''
  end

  def test_default_text_input
    assert Jsdg.genHeader('someText','text') === "MINISTRY OF EDUCATION AND SCIENCE OF RUSSIA\n\nFederal State Autonomous Educational Institution of Higher Education \"Southern Federal University\"\n\n
I.I. Vorovich Institute of Mathematics, Mechanics and Computer Sciences\n\nDirection of training
\n02.03.02 — Fundamental Informatics and information technologies\n" + "PRACTICE REPORT\nMUAM JAVA\n" + 'text'
    + "\n\n3-year student\n" + 'someText'
  end

  def test_default_dig_input
    assert Jsdg.genHeader('123','456') === "MINISTRY OF EDUCATION AND SCIENCE OF RUSSIA\n\nFederal State Autonomous Educational Institution of Higher Education \"Southern Federal University\"\n\n
I.I. Vorovich Institute of Mathematics, Mechanics and Computer Sciences\n\nDirection of training
\n02.03.02 — Fundamental Informatics and information technologies\n" + "PRACTICE REPORT\nMUAM JAVA\n" + '456'
    + "\n\n3-year student\n" + '123'
  end

  def test_default_space_input
    assert Jsdg.genHeader(' ',' ') === "MINISTRY OF EDUCATION AND SCIENCE OF RUSSIA\n\nFederal State Autonomous Educational Institution of Higher Education \"Southern Federal University\"\n\n
I.I. Vorovich Institute of Mathematics, Mechanics and Computer Sciences\n\nDirection of training
\n02.03.02 — Fundamental Informatics and information technologies\n" + "PRACTICE REPORT\nMUAM JAVA\n" + ' '
    + "\n\n3-year student\n" + ' '
  end


end
