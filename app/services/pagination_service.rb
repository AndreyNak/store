# frozen_string_literal: true

class PaginationService
  def initialize(elements = [], max_elements_on_page = 10)
    @elements = elements
    @max_elements_on_page = max_elements_on_page
  end

  def pagin(page)
    if @elements.count <= @max_elements_on_page
      @elements.page(@elements.count / @max_elements_on_page).per(@max_elements_on_page)
    else
      @elements.page(page).per(@max_elements_on_page)
    end
  end

  def max_page
    (@elements.count.to_f / @max_elements_on_page).ceil
  end

  def infinite_scroll(page)
    @elements.page(page).per(@max_elements_on_page)
  end
end
