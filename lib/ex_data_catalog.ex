defmodule ExDataCatalog do
  @moduledoc """
  Documentation for ExDataCatalog.
  """

  defstruct [:distributions]

  import SweetXml, only: [sigil_x: 2, xpath: 2]

  alias __MODULE__.Distribution

  def load(path) do
    File.read!(path)
    |> parse()
  end

  def parse(xml) do
    xml
    |> SweetXml.xpath(~x"//rdf:RDF/dcat:Dataset/dcat:distribution/dcat:Distribution"l)
    |> Enum.map(fn node ->
      %{
        about: node |> xpath(~x"./@rdf:about") |> to_string(),
        type: node |> xpath(~x"./rdf:type/@rdf:resource") |> to_string(),
        title: %{
          en: node |> xpath(~x"./dct:title/text()") |> to_string(),
          it: node |> xpath(~x"./dct:title[@xml:lang='it']/text()") |> to_string()
        },
        description: %{
          en: node |> xpath(~x"./dct:description/text()") |> to_string(),
          it: node |> xpath(~x"./dct:description[@xml:lang='it']/text()") |> to_string()
        },
        media_type: node |> xpath(~x"./dcat:mediaType/text()") |> to_string(),
        format: node |> xpath(~x"./dct:format/@rdf:resource") |> to_string(),
        access_url: node |> xpath(~x"./dcat:accessURL/@rdf:resource") |> to_string(),
        issued: node |> xpath(~x"./dct:issued/text()") |> to_string(),
        modified: node |> xpath(~x"./dct:modified/text()") |> to_string(),
        byte_size: node |> xpath(~x"./dcat:byteSize/text()") |> to_string(),
        license: node |> xpath(~x"./dct:license/@rdf:resource") |> to_string()
      }
    end)
    |> Enum.map(&Distribution.new/1)
    |> then(&struct(__MODULE__, distributions: &1))
  end
end
