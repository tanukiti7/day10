defmodule Db do

  def query(sql) do
    case Ecto.Adapters.SQL.query(Geomap.Repo,sql, []) do
      {:ok, result} -> result
      {:error, _reason} -> {:error,"SQL Error"}
    end
  end

  def to_map(result) do
    Enum.map(result.rows, fn row -> Enum.into(List.zip([result.columns,row]), %{}) end)
  end
end
