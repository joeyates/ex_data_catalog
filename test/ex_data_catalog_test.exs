defmodule ExDataCatalogTest do
  use ExUnit.Case

  describe "parse/1" do
    test "parses XML data" do
      xml = File.read!("test/support/fixtures/rt-oraritb.xml")

      expected = [
        %ExDataCatalog{
          distributions: [
            %ExDataCatalog.Distribution{
              about:
                "https://dati.toscana.it/dataset/8bb8f8fe-fe7d-41d0-90dc-49f2456180d1/resource/4f85393b-357d-443d-8378-65de4198505f",
              type: "http://dati.gov.it/onto/dcatapit#Distribution",
              title: %{en: "TRENITALIA.gtfs", it: "TRENITALIA.gtfs"},
              description: %{
                en:
                  "servizio ferroviario svolto da Trenitalia S.p.A. sulle linee regionali toscane",
                it:
                  "servizio ferroviario svolto da Trenitalia S.p.A. sulle linee regionali toscane"
              },
              media_type: "application/zip",
              format: "http://publications.europa.eu/resource/authority/file-type/ZIP",
              access_url:
                "https://dati.toscana.it/dataset/8bb8f8fe-fe7d-41d0-90dc-49f2456180d1/resource/4f85393b-357d-443d-8378-65de4198505f/download/trenitalia.gtfs",
              issued: "2017-05-19T10:35:03.253522",
              modified: "2024-01-09T20:01:29.373851",
              byte_size: "6574832.0",
              license: "https://creativecommons.org/licenses/by/4.0/"
            }
          ]
        }
      ]

      assert ExDataCatalog.parse(xml) == expected
    end
  end
end
