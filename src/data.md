# Meteorological Data
For our analysis we will use two sets of data provied by the European Climate Assessment \cite{data-direct} <!-- \cite{data-reanalysis} -->. Both sets contain daily measurements for temperature and surface pressure (reduced to ocean level) for a multitude of points across Europe. The first set consists of data directly from measurements at meteorlogical stations, the spatial index thus is the geographic coordinates of each station. The second set consists of reanalised data — that is the spacial component is a uniform grid of coordinates. It is our belief that data which has not been reanalysed will be better suited to our method, however, most of the data used in meteorolgical studies comes from reanalysis.

## Direct Measurements
The data consists of two time series — one for daily temperature, the second for daily pressure — for every location. We will restrict ourselves only to locations which provide data consistently from the year 1931, however, due to the sheer number of data points, we will remove all measurements from before the year 1991 and after the year 2020. A sample from the resulting data is shown in table <!-- \ref{data-direct} -->.

<!-- sample table -->

To be able to efficiently apply our method, we will separate the time and station index from our data and perform principal component analysis, to reduce the data to two dimensions. We obtain a two dimensional time series for every station in our dataset. To construct the sampled vector field, we attach to every point in every time series — excluding the last one — the vector from itself to the succeeding point. The Morse decomposition resulting from applying the method to the described sampled vector field is shown in figure <!-- \ref{fig-direct-morse} -->.

<!-- figure -->

## Reanalysed Data
As before, the data consists of two time series for every location, however, the locations are tied to regular grid points, not to actual stations. As a result, the spacial component only provides lattitude and longitude, without elevation. As before we will restrict our analysis to the 1991-2020 period. Apart from aforementioned exceptions, the construction of the sampled vector field is the same as with data from direct measurements. The Morse decomposition resulting from applying the method is shown in figure <!-- \ref{fig-reanalyse-morse} -->.

<!-- figure -->

## Results
It is clear from the example in chapter four, that the method can produce a Morse decomposition, which reflects the underlying dynamics of the original system. However, in the presence of noise — such as in chapter five — both the number of nontransversal edges and the number of very small morse sets are larger than one would hope. This results in images, which are hard to analyse definitively. However, some larger Morse sets are visible and could represent actual meteorological phenomena.

One way to mitigate the noise in further studies would be to first subdivide the domain into a net of simplices, then count the number of transitions from one simplex to another. Then, a face between two simplices could be called transversal if the number of transitions is sufficiently large or if the transitions happen mostly in one direction. Moreover, given a sufficiently large data set, instead of considering all the transitions at once, one could construct a sampled vector field at every time instance and track the persistence of the resulting Morse decompositions.
