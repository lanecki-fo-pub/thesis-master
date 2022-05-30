# Method
The method takes as input a sampled vector field — that is a partial map $\psi\colon W\rightharpoonup W$ on an inner product space $W$, such that $\lvert\dom{\psi}\rvert<\aleph_0$ — and produces a Morse decomposition of a hopefully related combinatorial dynamical system. In this chapter we present the method in detail, producing the sampled vector field from a classical differential equation. In the following chapter, we will construct the sampled vector field form time series data and jump straight to the resulting Morse decomposition.

The method has two stages, the first is to translate the sampled vector field into a combinatorial multivector field, while the second is to calculate the Morse decomposition of the combinatorial dynamical system associated to the combinatorial multivector field. From Theorem \ref{morse-graph} we know that the Morse decomposition can be calculated by finding the strongly connected components of the combinatorial dynamical system. There are many algorithms for finding strongly connected components in directed graphs, such as \cite{tarjan} and \cite{sharir}, hence we will not focus on this stage too much. The first stage is based largely on a paper currently in preparation \cite{donald}.

## Classical Dynamical System
We will describe the method by means of a simple example. Take the system of first order differential equations: \begin{equation}\label{eq-classical}\begin{aligned}x'&=-y + x(1-x^2-y^2)^2\\y'&=x+y(1-x^2-y^2)^2\end{aligned}\end{equation} This system produces a dynamical system with a repelling stationary point at the origin and an unstable periodic orbit at the unit circle, see figure \ref{fig-sample-ds-streamplot}.

\begin{figure}[h]
\centering
\includegraphics[width=0.64\textwidth]{fig/sample-ds-streamplot.pdf}
\caption{The stream plot of the described dynamical system. The repelling point and saddle orbit are clearly visible.}
\label{fig-sample-ds-streamplot}
\end{figure}

We can now randomly select a set $D$ of $n$ points from the $[-2,2]^2\subseteq\mathbb{R}^2$ square. Of course, $\mathbb{R}^2$ with the usual dot product $\mathbb{R}^2\times\mathbb{R}^2\ni(v,w)\mapsto v^\top w\dfeq v_0w_0+v_1w_1\in\mathbb{R}$ is an inner product space. We define our sampled vector field on the set $D$ as $\psi\colon D\ni(x,y)\mapsto(x',y')\in\mathbb{R}^2$, giving us a partial map $\psi\colon\mathbb{R}^2\rightharpoonup\mathbb{R}^2$.

Now, we can triangluate the set $D$ to produce a two dimemnsional simplicial complex $\mathcal{K}(D)$. We will use the algorithm described in \cite{delauney} to triangulate. Moreover, we add a point $\omega$ at infinity and for every edge $(v_j,v_k)$ on the boundary of the triangluation we construct a triangle $(\omega,v_j,v_k)$, in order to compactify our space. Recall, that the simplices of this complex constitute a poset $\mathcal{P}(\mathcal{K}(D))$. We will focus on the topolgocal space $X=\mathcal{T}(\mathcal{P}(\mathcal{K}(D)))$ associated to this poset by the Alexandroff Theorem.

Our goal will be to produce a combinatorial multivector field on $X$ in such a way as to reflect the dynamics of the sampled vector field. Our topological space consists of a net of top dimensional simplices (triangles). Notice that every face of codimension one (edge) of this net has vectors — arrows — rooted at all of its vertices. We will call such a face **transversal** if all of these vectors point to the same side of the hyperplane (line) containing the face in question. It is reasonable to assume that if an face between two simplices is transversal, the flow of the field goes from one simplex to the other. This of course may not be the case if our sample is too small, but with a finite set of data from actual measurements, this is fundamentally unknowable. If a face contains the infinity point $\omega$ it will be deemed as nontransversal, since we have no way of knowing what happens outside of our dataset.

> In the two dimensional case, we can compute transversality of an edge $e=(v,w)$ by computing the dot products with the vector $n$ normal to the edge $e$. If their product $(n^\top\psi(v))(n^\top\psi(w))$ is positive, then the edge is transversal, otherwise it is deemed as not transversal.

In broad strokes, we will merge together simplices which share a nontransversal face into one multivector, in order to hide the unknown behaviour and complexity inside the multivectors. More concretely, we will check the transversality of all faces of codimension one and construct an undirected graph $(T,\text{ntE})$, where the vertex set $T$ is the set of top dimensional simplices and two simplices are connected if they share a nontransversal face. If we consider this graph to be directed — every edge points in both directions — the set $\mathcal{C}$ of strongly connected components will form the basis for the construction of our multivector field.

A transversal edge $e$ of a triangle $t$ is **inbound** to $t$ if the normal vector aligned with the flow points towards the inside of $t$. If the triangle $t$ contains the infinity point $\omega$, a transversal edge is inbound if it is not inbound to the other triangle sharing this edge.

A vertex $v$ of a triangle $t$ is **inbound** to $t$ if the vector $\psi(v)$ points towards the inside of $t$.  We will mark the infinity point $\omega$ as inbound to all triangles that contain it, it will be clear from the following contruction that it is harmless. If the triangle $t$ contains the infinity point $\omega$, a vertex, which is not the infinity point, is inbound if it is not inbound to any of the non infinity containing triangles which contain it.

> More concretely, given a triangle $(v,w,u)$, a transversal edge $(v,w)$ is inbound if \begin{equation}\sgn{(n(v,w)^\top\psi(v))}\cdot n(v,w)^\top((u-v)+(u-w))>0\end{equation} where $\sgn{x}$ is the sign function. A vertex $v$ is inbound if both \begin{equation}\begin{aligned}\ort{(\ort{(w-v,u-v)}\cdot(w-v),\psi(v))}&>0\\\ort{(-\ort{(w-v,u-v)}\cdot(u-v),\psi(v))}&>0\end{aligned}\end{equation} where $\ort{(x,y)}$ is the orientation of vectors $x$ and $y$.

Let us go back to the collection $\mathcal{C}$, we will add all vertices and edges of the triangulation to some set in $\mathcal{C}$ in order to produce a partition of the space $X$, which — as we shall see — will be a multivector. Firstly, we shall add every nontransversal edge to the set of triangles which share it. By our construction, all such triangles are in the same equivalence class. Now, for every vertex and every transversal edge, add it to the equivalence class of the triangle into which it is inbound. Let us denote the resulting collection as $\hat{\mathcal{C}}$. \begin{theorem} The collection $\hat{\mathcal{C}}$ is a combinatorial multivector field on $X$.\end{theorem}

\begin{proof}
First of all, every simplex has been assigned to some class in $\hat{\mathcal{C}}$. Moreover, every triangle and every edge has been added to at most one class. If a vertex does not belong to a triangle at infinity, it also belongs to exaclty one class, we only need to prove that all vertices at the boundary of our original triangulation belong to exaclty one class.

We shall observe, that all the triangles at infinity are in a single class, since they all share a nontransversal edge, which has $\omega$ as one of its vertices. If a vertex belongs only to triangles inside the infinity class, it also only belongs to this class. If a vertex belongs to a triangle in the infinity class and to at least one triangle outside of this class, it either is inbound to exaclty one triangle outside of the class or inbound to none of them; in the former case, it belongs to the class of that triangle, while in the latter it belongs to the infinity class. Hence, the collection $\hat{\mathcal{C}}$ is a partition of the space $X$.

We shall now see that all sets in $\hat{\mathcal{C}}$ are locally closed. Recall that a set is locally closed if and only if it is convex in the corresponding partial order. Hence, a set in $\hat{\mathcal{C}}$ can only be not convex if it contains a triangle along with one of its vertices, but not all of the edges containing this vertex. Suppose there exists a set $C\in\hat{\mathcal{C}}$ such that it contains a triangle $t$ and one of its vertices $v$. If at least one of the edges of $t$ that contain $v$ is non transversal, then it will also belong to $C$ by our construction. If edge of $t$ is transversal, then from the fact that v is inbound to $t$, we can conclude that it is also inbound to $t$ and, therefore, belongs to $C$. Hence, we conclude that $\hat{\mathcal{C}}$ is indeed a combinatorial multivector field on $X$.
\end{proof}

Let us examine the purpose of the infinity point $\omega$. It is posible to obtain a transversal edge inbound to an infinity triangle, as well as a nontransversal edge between a regular triangle and an infinity triangle. Were we not to compactify the space, those edges would result in an ill-defined combinatorial multivector field. However, it is also possible that there exist paths between multivectors, which would not be possible, were it not for the existence of the multivector at infinity. Such paths can interfere with the dynamics of the combinatorial dynamical system, hence, we now remove the multivector containing the infinity point $\omega$ from the combinatorial multivector field $\hat{\mathcal{C}}$. It is, of course, possible that this multivector contains most of our original domain, which sugests that we need more data points, to spearate the interesing dynamics from infinity.

Collecting the steps described above, we obtain the following algorithm:

\begin{algorithm}
\caption{Morse decomposition of a sampled vector field.}
\label{alg-method}
\begin{algorithmic}
\Require a sampled vector field $\psi$
\State Triangulate the domain of $\psi$.
\State Add the point $\omega$ along with the necessary triangles.
\State Assert the transversality of all edges and calculate the set $\mathcal{C}$ of collections of triangles, which share a nontransversal edge.
\State Add all nontransversal edges to the collection in $\mathcal{C}$ containing the triangles which share it, as well as all transversal edges and vertices to the collection in $\mathcal{C}$ containing the traingle into which they are inbound, obtaining the combinatorial multivector field $\hat{\mathcal{C}}$.
\State Remove from $\hat{\mathcal{C}}$ the multivector which contains the point $\omega$.
\State Calculate the strongly connected components of the combinatorial multivector field.
\end{algorithmic}
\end{algorithm}

Following Algorithm \ref{alg-method} for the right-hand side of (\ref{eq-classical}) sampled in $1296$ points yields the Morse decomposition depicted in Figure \ref{fig-sample-ds-morse}.

\begin{figure}[h]
\centering
\includegraphics[width=0.64\textwidth]{fig/morse-sample-1296.pdf}
\caption{The Morse decomposition of a combinatorial multivector field obtaining by sampling the right-hand side of (\ref{eq-classical}) in 1296 points. The Morse set representing the repelling point is encapsulated by the set in khaki, and the Morse set representing the unstable orbit in brown.}
\label{fig-sample-ds-morse}
\end{figure}

Now, an avid reader will notice that parts of the method were only described for two dimensional spaces. However, one can define the notions of transversality as well as inboundness for higher dimensional simplices. Transversality is of course only defined for faces of codimension one. The intuitive definitions remain the same, however, the technical details get even more technical and the proof that what we obtain is indeed a multivetor field becomes more involved. Nevertheless, our analysis in the following chapter will only use this two dimensional case.
