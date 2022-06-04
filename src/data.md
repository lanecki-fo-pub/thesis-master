# Meteorological Data
For our analysis we use two sets of data provied by the European Climate Assessment \cite{data-direct} \cite{data-reanalysis}. Both sets contain daily measurements for temperature and surface pressure (reduced to ocean level) for a multitude of points across Europe. The first set consists of data directly from measurements at meteorlogical stations, the spatial index thus is the geographic coordinates of each station. The second set consists of reanalised data — that is the spacial component is a uniform grid of coordinates. It is our belief that data which has not been reanalysed will be better suited to our method, however, most of the data used in meteorolgical studies comes from reanalysis.

## Direct Measurements
The data consists of two time series — one for daily temperature, the second for daily pressure — for every location. We will restrict ourselves only to locations which provide data consistently from the year 1931, however, due to the sheer number of data points, we will remove all measurements from before the year 1991 and after the year 2020. A sample from the resulting data is shown in Table \ref{data-direct}.

\begin{table}[h]
\centering
\begin{tabular}{||c c c c c c c||} 
\hline
STAID & DATE & TG & PP & ELEV & LAT & LON \\
\hline\hline
24058 & 20201229 & 2.5 & 924.6 & 612 & 47.849 & 15.000 \\
24058 & 20201230 & -0.5 & 933.2 & 612 & 47.849 & 15.000 \\
24058 & 20201231 & -1.8 & 935.9 & 612 & 47.849 & 15.000 \\
299 & 19910101 & -1.7 & 984.7 & 50 & 65.599 & -36.366 \\
299 & 19910102 & -0.7 & 986.4 & 50 & 65.599 & -36.366 \\
299 & 19910103 & -3.7 & 991.4 & 50 & 65.599 & -36.366 \\
\hline
\end{tabular}
\caption{Sample rows from the dataset of direct measurements.}
\label{data-direct}
\end{table}

To be able to efficiently apply our method, we separate the time and station indices from our data — for later use — and perform principal component analysis \cite{murphypca} on the five remaning columns, to reduce them to two dimensions. By combining the indices with the reduced data, we obtain a two dimensional time series for every station in our dataset. To construct the sampled vector field, we now take each time series and to every point in it — excluding the last one — we attach the vector from itself to the succeeding point. The Morse decomposition resulting from applying the method to the described sampled vector field is shown in Figure \ref{fig-direct-morse}.

\begin{figure}[h]
\centering
\begin{subfigure}[b]{0.42\textwidth}
\centering
\includegraphics[width=\textwidth]{fig/morse-direct-all.jpg}
\end{subfigure}
\hfill
\begin{subfigure}[b]{0.42\textwidth}
\centering
\includegraphics[width=\textwidth]{fig/morse-direct.jpg}
\end{subfigure}
\caption{The Morse decomposition of the data taken from direct measurements. On the left we depict all multivectors, on the right only the Morse sets.}
\label{fig-direct-morse}
\end{figure}

## Reanalysed Data
As before, the data consists of two time series for every location, however, the locations are tied to regular grid points, not to actual stations. As a result, the spacial component only provides lattitude and longitude, without elevation. As before we will restrict our analysis to the 1991-2020 period. Apart from aforementioned exceptions, the construction of the sampled vector field is the same as with data from direct measurements. The Morse decomposition resulting from applying the method is shown in Figure \ref{fig-reanalyse-morse}.

\begin{figure}[h]
\centering
\begin{subfigure}[b]{0.42\textwidth}
\centering
\includegraphics[width=\textwidth]{fig/morse-reanalysis-all.jpg}
\end{subfigure}
\hfill
\begin{subfigure}[b]{0.42\textwidth}
\centering
\includegraphics[width=\textwidth]{fig/morse-reanalysis.jpg}
\end{subfigure}
\caption{The Morse decomposition of the reanalysed data. On the left we depict all multivectors, on the right only the Morse sets.}
\label{fig-reanalyse-morse}
\end{figure}

## Results
It is clear from the example in chapter four, that the method can produce a Morse decomposition, which reflects the underlying dynamics of the original system. However, in the presence of noise — such as in our meteorological data — both the number of nontransversal edges and the number of very small morse sets are larger than one would hope. This results in images, which are hard to analyse definitively. However, some larger Morse sets are visible and could represent actual meteorological phenomena.

One way to mitigate the noise in further studies would be to first subdivide the domain into a net of simplices, then count the number of transitions from one simplex to another. Then, a face between two simplices could be called transversal if the number of transitions is sufficiently large or if the transitions happen mostly in one direction. A Morse decomposition of such a system should be more resiliant to small scale noise.

Moreover, given a sufficiently large data set, instead of considering all the transitions at once, one could construct a sampled vector field at every time instance, or divide the datasets based on additional knowledge. In our case, it might be reasonable to construct a sampled vector field for every decade, every year or every season. Given such a sequence, we could track the persistence of the Morse decompositions or Conley-Morse graphs.

This approach could also be used to analyse changes in atmospheric patterns through time, by observing changes in the Morse decpompositions or even Conley-Morse graphs. The Conley-Morse graph could be used as a descriptor — or maybe even predictor — of atmospheric circulation, similar in spirit to classifiers such as \cite{grosswetterlagen} or \cite{lamb}.
