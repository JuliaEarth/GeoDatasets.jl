module GeoDatasets

using GeoIO
using Meshes

using GADM
using INMET
using GeoStatsImages

"""
    gadm(country, subregions...; depth=0, ϵ=nothing,
         min=3, max=typemax(Int), maxiter=10, fix=true)

(Down)load GADM table using `GADM.get` and convert
the `geometry` column to Meshes.jl geometries.

The `depth` option can be used to return tables for subregions
at a given depth starting from the given region specification.

The options `ϵ`, `min`, `max` and `maxiter` are forwarded to the
`decimate` function from Meshes.jl to reduce the number of vertices.

The option `fix` can be used to fix orientation and degeneracy
issues with polygons.
"""
function gadm(country, subregions...; depth=0, ϵ=nothing, min=3, max=typemax(Int), maxiter=10, fix=true, kwargs...)
  table = GADM.get(country, subregions...; depth, kwargs...)
  geotable = GeoIO.asgeotable(table, fix)
  dom = domain(geotable)
  newdom = decimate(dom, ϵ; min, max, maxiter)
  georef(values(geotable), newdom)
end

export INMET
export geostatsimage, gadm

end