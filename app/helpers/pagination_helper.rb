module PaginationHelper
  def prev_page_for(page)
    page = page.abs
    page <= 1 ? nil : page - 1
  end
end
