defmodule Sitback.Location do
  def location_by_beacon_version(major, minor) do
    locations = %{
      "1_0" => "desk",
      "1_1" => "toilet"
    }
    locations["#{major}_#{minor}"]
  end
end 
