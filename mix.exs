defmodule ExDataCatalog.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_data_catalog,
      version: "0.1.0",
      elixir: "~> 1.14",
      description: "A parser for the Data Catalog Vocabulary (DCAT) in Elixir",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:sweet_xml, "~> 0.7.4"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/joeyates/ex_data_catalog"
      },
      maintainers: ["Joe Yates"]
    }
  end
end
