\title{Morse Decomposition of a Combinatorial Dynamical System from Meteorological Time Series Data}
\author{Filip Øskar Przybycień}

We attempt to study dynamics of real-world systems based on time series data obtained from measurements. Given a sufficiently large data set, one would hope tobe able to recover useful or interesting information about the underlying dynamical system. In this paper, we present a computational topological method for anylising such data. Our method is based on Morse theory, which aims to decompose a dynamical system into invariant sets — like attractors or repellers, but also saddles — with gradient alike connections. The computational part leans heavily on the theory of combinatorial multivector fields of finite topological spaces, as developed in \cite{lipinski}. The author's contribution is the application of the developed method to a set of meteorological data. 

## Outline
Chapter one recalls basic concepts necessary for the theory described in the following chapters. Chapters two and three present the theory of finite topological spaces and their symplicial homology as well as combinatorial dynamical systems and Morse decompositions. Chapter four describes the developed method for constructing a Morse decpomposition from a sampled vector field constructed from a classical differential equation. Chapters five briefly describes the meteorological data, while chapter six is devoted to their analysis, using the developed method.

```include
src/basics.md
src/topology.md
src/cds.md
src/method.md
src/data.md
```

\printbibliography
