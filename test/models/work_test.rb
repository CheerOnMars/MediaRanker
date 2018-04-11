require "test_helper"

describe Work do
  # let(:work) { Work.new }

  describe 'validations' do
    it 'is invalid without a name' do
      work = Work.new
      result = work.valid?
      result.must_equal false
      work.errors.messages.must_include :work_title
    end

    it 'is invalid without a category' do
      work = Work.new
      result = work.valid?
      result.must_equal false
      work.errors.messages.must_include :work_category
    end

    it 'is invalid without a creator' do
      work = Work.new
      result = work.valid?
      result.must_equal false
      work.errors.messages.must_include :work_creator
    end
  end

  describe 'relations' do

  end

  it 'must have a title' do
    work = works(:inc_book)
    work.valid?.must_equal false
    work.errors.must_include :work_title
  end

  it 'must have a category' do
    work = works(:inc_album)
    work.valid?.must_equal false
    work.errors.must_include :work_category
  end

  it 'must have a creator' do
    work = works(:inc_movie)
    work.valid?.must_equal false
    work.errors.must_include :work_creator
  end

  it 'must accurately return the corresponding fields' do
    work = works(:babe)
    work.work_creator.must_equal "George Miller"
    work.work_title.must_equal "Babe"
    work.work_description.must_equal "Tale about a gallant sheep pig"
    work.work_category.must_equal "movie"
    work.work_publication_year.must_equal 1995
  end

end
