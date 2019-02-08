# frozen_string_literal: true

require 'test_helper'

class TestTasklists < Minitest::Test
  def setup
    text = <<-MD
 - [x] Add task list
 - [ ] Define task list
MD
    @doc = CommonMarker.render_doc(text, :DEFAULT, %i[tasklist])
    @expected = <<-HTML
<ul>
<li class="task-list-item"><input type="checkbox" checked="" disabled="" /> Add task list</li>
<li class="task-list-item"><input type="checkbox" disabled="" /> Define task list</li>
</ul>
    HTML
  end

  def test_to_html
    assert_equal @expected, @doc.to_html
  end

  # def test_html_renderer
  #   assert_equal @expected, CommonMarker::HtmlRenderer.new.render(@doc)
  # end
end
