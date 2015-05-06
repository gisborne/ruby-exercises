class BookDatabase
  def set_books books
    @books = books
  end

  def get_books author
    @books[author]
  end

  def count_books author
    books = @books[author]
    if books == nil
      return "No such author"
    else
      return books.length
    end
  end

  def find book
    result = nil
    @books.each do |author, books|
      if books.include? book
        result = author
      end
    end
    if result
      return result
    else
      return "No such book"
    end
  end

  def add_book author, title
    books = @books[author]
    if books
      if books.include? title
        return "That book is already in the system"
      else
        books << title
      end
    else
      @books[author] = [title]
    end
  end

  def delete_book author, title
    books = @books[author]
    if books
      if books.include? title
        books.delete title
      else
        return "No such title"
      end
    else
      return "No such author"
    end
  end
end
