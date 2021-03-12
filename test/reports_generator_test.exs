defmodule ReportsGeneratorTest do
  use ExUnit.Case

  describe "generate/1" do
    test "when a file name is provided, should generate a report" do
      file_name = "resources/gen_report_test.csv"

      response = ReportsGenerator.generate(file_name)

      expected_response = %{
        "all_hours" => %{
          "Cleiton" => 4,
          "Daniele" => 21,
          "Giuliano" => 10,
          "Jakeliny" => 14,
          "Joseph" => 3,
          "Mayk" => 5
        },
        "hours_per_month" => %{
          "Cleiton" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 4,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Daniele" => %{
            "abril" => 7,
            "agosto" => 0,
            "dezembro" => 5,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 1,
            "maio" => 8,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Giuliano" => %{
            "abril" => 1,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 9,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Jakeliny" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 8,
            "junho" => 0,
            "maio" => 0,
            "março" => 6,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Joseph" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 3,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Mayk" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 5,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          }
        },
        "hours_per_year" => %{
          "Cleiton" => %{"2016" => 3, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 1},
          "Daniele" => %{"2016" => 10, "2017" => 3, "2018" => 7, "2019" => 0, "2020" => 1},
          "Giuliano" => %{"2016" => 0, "2017" => 3, "2018" => 0, "2019" => 6, "2020" => 1},
          "Jakeliny" => %{"2016" => 0, "2017" => 8, "2018" => 0, "2019" => 6, "2020" => 0},
          "Joseph" => %{"2016" => 0, "2017" => 3, "2018" => 0, "2019" => 0, "2020" => 0},
          "Mayk" => %{"2016" => 0, "2017" => 1, "2018" => 0, "2019" => 4, "2020" => 0}
        }
      }

      assert response == expected_response
    end
  end
end
