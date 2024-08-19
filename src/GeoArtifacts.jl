# -----------------------------------------------------------------
# Licensed under the MIT License. See LICENSE in the project root.
# -----------------------------------------------------------------

module GeoArtifacts

include("gadm.jl")
include("naturalearth.jl")
include("inmet.jl")
include("geostatsimages.jl")

function __init__()
  # make sure geometries are always downloaded
  # without user interaction from DataDeps.jl
  ENV["DATADEPS_ALWAYS_ACCEPT"] = true
end

export GADM, NaturalEarth, INMET, GeoStatsImages

end
