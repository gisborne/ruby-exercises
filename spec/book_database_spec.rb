require_relative 'spec_helper'
require_relative '../book_database'

RSpec.describe BookDatabase do
  bd = BookDatabase.new
  bd.set_books({ #Need parenthesis here so Ruby doesn't think this is a block
    'Frank Herbert'   => ['Dune', 'Dune Messiah', 'Children of Dune', 'God Emperor of Dune'],
    'Isaac Asimov'    => ['Foundation', 'Foundation and Empire', 'Second Foundation'],
    'Mervyn Peake'    => ['Titus Groan', 'Gormenghast'],
    'William Goldman' => ['The Princess Bride']
  })

  describe "count" do
      it "returns 4 for the count for Frank Herbert" do
        expect(bd.count_books 'Frank Herbert').to eq 4
      end

      it "returns 1 for the count for William Goldman" do
        expect(bd.count_books 'William Goldman').to eq 1
      end
  end

  describe "get" do
    it "returns Dune and Dune Messiah for Frank Herbert" do
      books = bd.get_books "Frank Herbert"
      expect(books).to include 'Dune'
      expect(books).to include 'Dune Messiah'
    end

    it "returns Foundation and Foundation and Empire for Isaac Asimov" do
      books = bd.get_books "Isaac Asimov"
      expect(books).to include 'Foundation'
      expect(books).to include 'Foundation and Empire'
    end
  end
  describe "find" do
    it "returns Mervyn Peake" do
      expect(bd.find "Titus Groan").to include 'Mervyn Peake'
    end
    it "returns Mervyn Peake" do
      expect(bd.find "Gormenghast").to include 'Mervyn Peake'
    end
  end
  describe "add" do
    it "returns book input" do
      bd.add_book "Sam Smith", "Fire"
      expect(bd.get_books 'Sam Smith').to include 'Fire'
    end
    it "returns book input" do
      bd.add_book "Sam Smith", "Water"
      expect(bd.get_books 'Sam Smith').to include 'Water'
    end
    it "returns that the book is already in the system" do
      expect(bd.add_book "Sam Smith", "Fire").to include 'That book is already in the system'
    end
  end
  describe "delete" do
    it "returns that there is no such book in the system" do
      bd.delete_book "Sam Smith", "Fire"
      expect(bd.find 'Fire').to include 'No such book'
    end
    it "returns that there is no such title in the system" do
      expect(bd.delete_book "Sam Smith", "Fire").to include 'No such title'
    end
    it "returns that there is no such author in the system" do
      expect(bd.delete_book "J.K Rowling", "Harry Potter").to include 'No such author'
    end
  end
end
