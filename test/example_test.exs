defmodule BaseTest do
  use ExUnit.Case

  alias Pinterex.Api.Base

  test "get_fields_without_question_mark_in_path" do
    options = Base.get_fields("/me/", [fields: ["bio", "counts"]])
    assert options == "?fields=bio,counts"
  end

  test "get_fields_with_question_mark_in_path" do
    options = Base.get_fields("/me/search/boards/?query=garden", [fields: ["image", "counts"]])
    assert options == "&fields=image,counts"
  end

  test "get_fields_with_question_mark_in_path_with_fields_and_limit" do
    options = Base.get_fields("/me/search/boards/?query=garden", [fields: ["image", "counts"], limit: 2])
    assert options == "&fields=image,counts&limit=2"
  end
end
