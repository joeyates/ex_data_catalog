defmodule ExDataCatalog.Distribution do
  defstruct [
    :about,
    :type,
    :title,
    :description,
    :media_type,
    :format,
    :access_url,
    :issued,
    :modified,
    :byte_size,
    :license
  ]

  def new(data) do
    struct!(__MODULE__, data)
  end
end
