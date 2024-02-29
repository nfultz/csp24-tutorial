### A Pluto.jl notebook ###
# v0.19.39

using Markdown
using InteractiveUtils

# ╔═╡ 2edc9c69-c859-496c-81be-f23c81c9f129
using Pipe

# ╔═╡ 6d21bc4e-b132-4550-b08e-a76d34d91f6d
html"""
<style>
/* h/t https://codepen.io/JoeHastings/pen/gPrPMo */
.thought {
	position: relative;
	line-height: 1.4em;
	margin: 40px auto;
	background-color: #fff;
	border: 8px solid #333;
	border-radius: 30px;
	font-family: sans-serif;
	padding: 20px;
	font-size: large;
	border-radius: 200px;
	padding: 30px;	
}

.thought:not(:has(p)) {
    float: right;
	width: 300px;
	text-align: center;
}

.thought >* {
    padding: 0 40px 0 40px
}

.thought:before,
.thought:after {
	content: ' ';
	position: absolute;
	width: 0;
	height: 0;
}


.thought:before,
.thought:after {
	left: 10px;
	bottom: -30px;
	width: 40px;
	height: 40px;
	background-color: #fff;
	border: 8px solid #333;
	-webkit-border-radius: 28px;
	-moz-border-radius: 28px;
	border-radius: 28px;
}

.thought:after {
	width: 20px;
	height: 20px;
	left: 5px;
	bottom: -40px;
	-webkit-border-radius: 18px;
	-moz-border-radius: 18px;
	border-radius: 18px;
}
</style>
"""

# ╔═╡ da994a40-d008-42e2-b7a8-da6a1b40f7fe
macro bubble_str(s)
    :(HTML("<div class=thought>\n" * $s * "\n</div>"))
end

# ╔═╡ 3fdbe9ac-d330-11ee-099c-738ea0dc0f61
md"""
# Getting Things Done with Julia
"""

# ╔═╡ 6ab036b5-f5a3-430a-a53f-bcf50760efca
html"""
<div style="border: 1px dashed">
<em>Raison d'être</em>: Julia has a lot of features. Rather than try to exhausitively explain each one, we can run through a few use cases and call out the things that Julia does in a different or interesting way. 
</div>
"""

# ╔═╡ a0644071-1b20-4912-b744-c510f4e27354
bubble"""
Running commentary, digressions, NB and warnings in thought bubbles...
"""

# ╔═╡ 43803423-3f90-43c9-ab1d-6637d3311c80
md"""
**Goals**:

* Up and running
* Load a (real) dataset
* Plots
* Distributions & RNG
* Linear Models
* Optimization
* Foreign Language Interfaces
* Report Templates
* When and Why
"""

# ╔═╡ c10d063e-e8c8-42ff-a401-f182b5a884ac
md"""
**Non-goals**:
* From Scratch
* Yak shaving
* Features ad exhaustum
"""

# ╔═╡ de00b699-07d9-43fb-9612-cdae0ee2b954
bubble"""
Dedicated to Kevin Keys, maybe he was right :)
"""

# ╔═╡ 080cb05e-045f-44cf-9162-b8a60d8b37a7
md"""
## Up and running
"""

# ╔═╡ 56a8a282-d99c-42df-ae69-8fb6329b270b
md"""
**Option 1 - Cloud**: 
  * Register / login to [JuliaHub.com](//juliahub.com). 
  * Start Pluto.jl notebook.

**Option 2 - Local**:
  * Install julia from [JuliaLang.org](//julialang.org) or your system's package manager.
  * Start julia from terminal
  * Install Pluto.jl
    * Enter Pkg mode (ie hit `]`)
    * `add Pluto`
    * backspace to return to regular mode
  * `import Pluto`
  * `Pluto.run()`
"""

# ╔═╡ 084432a3-c5ef-4869-a66c-64444a8176b2
bubble"""
Already learned how to install and load packages en passant. 
"""

# ╔═╡ 3bc23224-ec9e-452c-ba43-926f836c09a8


# ╔═╡ d9a39af7-cfae-4ef4-8cc8-f5f5b539b7ad
bubble"""
<h2> Packages </h2>
<p> R and Python offer different ways of using packages.
<p> In R, we use <code>library()</code> to insert a package into the "Global Search List", and everything in it is made available to the user.
<p> In Python we use <code>import</code> to bind references to the "local namespace."
<p> Julia provides two mechanisms: <code>import</code>, which is similar to Python, and <code>using</code> which is similar to R.
"""

# ╔═╡ bfe49d06-8d12-4150-b46b-73a8c6e92342
bubble"""
<h2> Getting Help </h2> 
<p> Terminal users can type <code>?</code> to enter the built-in help mode.
<p> Pluto.jl users can use "Live Docs" in the bottom right.
"""

# ╔═╡ f8b19e6f-826d-4dca-9400-162df9ef6ebc
bubble"""
<h3><a href=https://cheatsheet.juliadocs.org/>Use the cheatsheet!!! </a></h3> https://cheatsheet.juliadocs.org/
"""

# ╔═╡ 80c7194e-1b92-40f8-aad1-26d8a451d8b2
md"""
### Obligatory programming demo

Declaring and using a function, if/else and for loops.
"""

# ╔═╡ f955f65b-0d6e-482a-9d65-849b397a29d2
# ±(x, y) = (x-y, x+y)

# ╔═╡ de3099bc-3d63-4cca-b80a-879d51f42c8a
# δ = -5 ±  1.96√(9) #TODO DEMO REACTIVITY

# ╔═╡ b95a6dba-d332-4f4b-98f6-27019ae6bba1
bubble"""
NB: Ctrl-Space to autocomplete, including convert \latex to symbols. No * req'd to multiply. Generic functions.
"""

# ╔═╡ e638f96f-ad39-4fc3-99fb-777b31014d8c
# if δ[1] < 0 < δ[2]
#     "Not Different !?"
# else
# 	"Different !?"
# end

# ╔═╡ 0f16fd37-23e2-4d25-bf17-3fd8abfadd87
# for i in 0:1/4:2
# 	println(sin(i * π))
# end

# ╔═╡ c18ae23f-76aa-4665-ba59-493ac24f42ef
md"""
## Data Import / Export
"""

# ╔═╡ 093dded5-8a0c-43a9-9e32-a976a08b3501
# using XLSX

# ╔═╡ 041e6a9d-c173-4c20-926d-d06e9190eeda
bubble"""
Pluto will automatically install and version a package that you <code>using<code>.
"""

# ╔═╡ 77e3c15e-0eda-411c-a317-66d28dcf6048
bubble"""
NB: <code>#</code> does comments. Shortcut key is <code>Ctrl+/</code>.
"""

# ╔═╡ 7559c4da-401f-4437-8823-64d2d31c9fe0
# url = "https://bit.ly/csp24_nf_demo_data"

# ╔═╡ 385ca477-461e-44e2-b99f-bfbfb56dd20a
bubble"""
<p>NB: "url =" in Pluto.jl output section. This is pluto telling you that it knows about the variable.
<p> Compared to jupyter notebooks, execution order is defined by variables defintion and usage, not by however you happen to run the cells. But then you can re-sequence code cells easily without breakage. 
<p> The tradeoff is that, generally, you should declare one variable per cell.
"""

# ╔═╡ 6f5daee0-ae86-4c63-a98f-367ee2791f32
# localcopy = download(url) 

# ╔═╡ 24ed4401-a8ff-42d6-80e0-e7a56f01e8a4
# popest = XLSX.readtable(localcopy, 1; first_row=10, header=false,
#   column_labels = append!(["Geo", "Census",	"Base"], string.(2010:2019))
# )

# ╔═╡ e872691b-bc30-4753-8b44-9ec51e0177e2
bubble"""
<p>NB: As is typical, they merged two cells in the header row, breaking defaults / happy path. But, <code>column_labels</code> demonstrates several things en passant:
<ul>
<li> using a fn from a package.
<li> optional / kwargs. Note the semi.
<li> vector literals. eg <code>[]</code>
<li> range literals. eg <code>:</code>
<li> using <code>append!</code> to concatenate the two. Note the <code>!</code>
<li> using dot to broadcast / apply <code>string()</code> to each element of range.   
</ul>
</p>
"""

# ╔═╡ 33ca0878-4a0e-4cca-be30-3bbfcbd0104f
bubble"""
R: <code>TRUE</code>. Python: <code>True</code>. Julia: <code>true</code>. ☹️
"""

# ╔═╡ 46d7c4ea-ea23-45be-9c85-023b29f71998
# popest.data[:,:]

# ╔═╡ 1416221b-0e7e-4743-90c5-263bb6d7fb1b
# typeof(popest)

# ╔═╡ 7a29c35c-5cc4-47c1-b20c-13d652eedbf3
# size(popest.data)

# ╔═╡ 2a09633d-0bdc-4154-818f-a6b50d4781bb
bubble"""
NB An odd / bespoke data structure?
"""

# ╔═╡ 4e4ad86a-c100-4d83-9f9b-29762dd0f9ec
html"""
<hr/>
"""

# ╔═╡ 072415ca-f63e-466e-8b0d-e7ce850e4225
# using DataFrames

# ╔═╡ fba330f9-aa13-40ea-8b6b-dc702d6dd876
# df = DataFrame(popest)

# ╔═╡ 967c5075-7060-41b6-a2e5-6799e7e714bd
bubble"""
<h2>Data Frames</h2>

<p> In R, there are three main data frame implementations and a bevy of file-format, cloud, and database specific packages with varying degrees of inter-compatibility and performance.

<p> In Python, there is basically pandas (although polars is one to watch).

<p> In Julia, DataFrames.jl is a user-facing package, with different file formats (XLSX.jl, CSV.jl), databases, and cloud services provided as additional packages. Julia accomplishes this via <code>Tables</code>.
"""

# ╔═╡ 7a74fc1d-24be-495c-a0e6-5db158b04478
md"""
### Obligatory Slicing examples
"""

# ╔═╡ 33901ce3-9003-4715-ae93-0481fff0ee9f
# df[ 10, 4:end]

# ╔═╡ a1e93867-6bfb-4d8b-ba93-b9768235c9f3
# df[ !, ["2010"]  ]

# ╔═╡ 0c1a179a-4d4b-4e89-8981-7486ded54555
# sum(df[ !, "2010"  ])

# ╔═╡ b11b6b4a-4c9b-4071-a86f-c738fd96b972
bubble"""
NB: sum is builtin, use Statistics for other aggregates (eg mean, stddev).
"""

# ╔═╡ df390c95-dafa-4e44-a298-444b7c2cae5a
# using Statistics

# ╔═╡ 27f57422-574c-4a08-b0a2-b9aea1b11b4c
# round(mean(df[ !, "2010"  ]); digits= -3)

# ╔═╡ 0024cb71-e453-451e-af09-91584d5daa69
bubble"""
NB: pipe for concatenative programming and printf for formatting. macros!
"""

# ╔═╡ 515b2a38-304a-42b7-b4f5-240b38194e8b
# using Printf

# ╔═╡ ff4d4d23-ce3e-437a-9ed1-68b186e67193
# @pipe df[ !, "2010"  ] |> 
#       mean(_) |> 
#       round(_; digits= -3) |> 
#       @printf("%7.0f", _)

# ╔═╡ e17adbb6-4910-4dc1-96c7-2b1f70ff2349
bubble"""
NB: STDOUT vs return value
"""

# ╔═╡ 91120b2c-0527-4bed-83f3-ff54ed38147d
bubble"""
Many ways to slice, see also <a href="//JuliaDataScience.io">JuliaDataScience.io</a>
"""

# ╔═╡ 3304c8da-79c8-40e5-bd13-ca8772455cea
# dplyr style
# @pipe df |>
# 	subset(_, :Geo => ByRow(in([".Louisiana", ".Mississippi"]))) |>
# 	select(_, ["Geo", "2012", "2016"])
  


# ╔═╡ 73f010c1-27a9-498d-8dde-5b226cf6e4c1
bubble"""
NB: Symbols (eg <code>:Geo</code>), Pair op (<code>=></code>), HOFs
"""

# ╔═╡ bdb05ba8-500c-4ccb-8991-f16d2e4ea493
md"""
### Side Quest: DBI
"""

# ╔═╡ 54252a56-0cb1-4dce-a642-0ea8fa9e84fc
# using SQLite

# ╔═╡ 6f276ad0-f1f0-4132-b548-6d268250f431
# db = download("https://bit.ly/chinook-sqlite") |> SQLite.DB

# ╔═╡ da1c8727-64a7-4c53-ab53-91a9e30cce97
# DBInterface.execute(db, "SELECT * FROM Employee limit 5") |>    	
#     DataFrame

# ╔═╡ 2b629205-1e54-4812-9259-76eb9a174907
bubble"""
Hopefully this is not too surprising.
"""

# ╔═╡ f01f4969-44c6-4417-9e07-88fb9ee681eb
md"""
## Plots
"""

# ╔═╡ 1ecaa24d-007d-4ab8-86c1-9523760589ec
# using Plots

# ╔═╡ 5d4042f8-ee16-4348-aa76-b8b530a00877
# Plots.plot(-10:1/6:10, t -> t*cos(t))

# ╔═╡ 6561736b-015a-4194-86f6-bebfea275c64
bubble"""
NB <code> -> </code> for lambda functions.
"""

# ╔═╡ df14d669-c435-409d-a07d-ceee7a138617
bubble"""
<h2>Plots</h2>

<p> In R, there are base plots (and add-ons) and grid plots (such as lattice and ggplot2).

<p> In Python, there is basically matplotlib with some more user-friendly wrappers.

<p> In Julia, Plots.jl is a central package, with different backends. See also <a href=https://docs.juliaplots.org/latest/backends/>[Backends]</a>
"""

# ╔═╡ 7403cc3a-35de-44d1-b8f2-7c73d02a9004
# Plots.plot(df[!, "2012"], df[!, "2016"], seriestype=:scatter, title="Population from one election to next")

# ╔═╡ d3c36fda-24f0-475d-a480-56710a07f96c
# Plots.plot(df[!, "2012"], df[!, "2016"] ./ df[!, "2012"], seriestype=:scatter, title="Population Change from one election to next", xscale=:log10, yscale=:log10)

# ╔═╡ eaf7ed7a-4048-4975-a5f1-5fd4fb215967
# Plots.histogram(df[!, "2016"] ./ df[!, "2012"], xscale=:log10, bins=.95:.01:1.10)

# ╔═╡ 25f045cd-aae9-48b3-8664-ac0861beb3e3
# Plots.plot(2010:2019, [collect(df[12, 4:end]), collect(df[13, 4:end])])

# ╔═╡ 42003c51-f8e6-436a-a0d6-45b0da96b98c
html"""
<hr/>
"""

# ╔═╡ 5b06c291-1a5c-48ea-a0aa-267333a7d54c
# import PlotlyJS

# ╔═╡ ffbef174-205b-464e-bde6-e58d8b50e917
# Plots.plotlyjs()

# ╔═╡ 497b2fd2-a9c4-4f52-910c-f1baff0ef222
# Plots.plot(2010:2019, [collect(df[12, 4:end]), collect(df[13, 4:end])])

# ╔═╡ 85652f4c-8988-441f-9e65-edf3b96ecb08
md"""
## Distributions and RNG
"""

# ╔═╡ f88afdcf-5523-49ea-ac12-5fb54472bbf3
# using Distributions

# ╔═╡ 3daa3037-5a0a-4555-851c-83434c2957f4
# z = MvNormal([1,2], [1 .5;.5 1])

# ╔═╡ 88aae939-899c-4d17-be78-9222314eaa54
# [√3/3 √3/3 ; -1 1] * z - [√3; 1]

# ╔═╡ 1360e25a-4005-4904-aa10-ef0e2fd0aab0
bubble"""
<h2>Types and Generic Functions</h2>

<p> We've managed to avoid types and generic functions, but this is a reasonable example. <em>Everything</em> in Julia has a type but sometimes the type is <code>Any</code>.

<p> Here, <code>MvNormal</code> is a Type (and a subtype of Distribution).

<p> z is an instance of <code>MvNormal</code> that has some parameters set.

<p> Affine transformations of an instance of <code>MvNormal</code> are also an instance of <code>MvNormal</code>.
"""

# ╔═╡ d6096c86-2b30-4999-b70c-913105645960
# typeof(z)

# ╔═╡ 26331da6-9c66-44c6-bf57-da0810255860
# mean(z), cov(z)

# ╔═╡ 11b479d0-5d96-433e-95e3-ab65fa45403c
bubble"""
NB: doing something different here?
"""

# ╔═╡ 7cbc7b63-38b5-4d90-bc11-335fc68f939c
# realization = rand(z, 100)'

# ╔═╡ 5f4a8aee-14e1-4a23-b395-a631d2188e75
bubble"""
rand is a generic function that takes an instance of a distribution and returns a corresponding random sample.
"""

# ╔═╡ dd793ed0-f232-4663-a3ca-1b65eba10c35
# fit(MvNormal, realization')

# ╔═╡ 4437b099-622a-4b59-9900-c83f96e28ac6
bubble"""
<p> fit is a generic function which takes a type and actual data and returns an instance of that type (via MLE). 

<p> Tracking the types under the hood is one part of why julia can perform well. For example, if a Distribution "knew" its covariance matrix was diagonal, there can be associated code that leverages that fact.

<p> In <a href=https://github.com/JuliaStats/Distributions.jl/blob/c1705a3015d438f7e841e82ef5148224813831e8/src/multivariate/mvnormal.jl#L419>fit()</a>, if we knew the Distribution is a MvNormal, than we don't need to form the log likelihood, take the derivative and solve; we can just use the well known results for mean and covariance. Compare/contrast with the <a href=https://github.com/cran/MASS/blob/master/R/fitdistr.R#L18-L24>R equivalent</a>.
"""

# ╔═╡ d6288a1e-4fc3-4ce6-a71a-5be50e79174c
bubble"""
NB use apostrophe for transpose operation.
"""

# ╔═╡ 5e9acf6b-154f-4db7-ac78-cca29906c5a1
md"""
## Linear Models
"""

# ╔═╡ c98713b6-9564-40e0-966b-91ffb931b00b
# using GLM

# ╔═╡ 559a86ae-ec20-4b3c-b0ba-638f3df11520
# begin
# 	Geo = []
# 	Pop :: Vector{Int64} = []
# 	Prev :: Vector{Int64} = []
# 	# Pop = [] #TODO FIXME
# 	# Prev = []

# 	for i in 1:50
# 		g = df[i, "Geo"]
# 		for j in 5:13
# 			append!(Geo, [g])
# 			append!(Pop, df[i, j])
# 			append!(Prev, df[i, j-1])
# 		end
# 	end

# 	# TODO!
# 	 long_df = DataFrame(:Geo => Geo, :Pop => Pop, :Prev => Prev)
# end

# ╔═╡ 92b90e2d-e446-45b3-ab14-b19e01ea492c
# # Poisson AR1
# gm1 = fit(
# 	GeneralizedLinearModel,
# 	@formula(Pop ~ Geo + log(Prev)),
# 	long_df,
# 	Poisson()
# )

# ╔═╡ acc8f64c-9e38-47e2-9b0d-02d7bfa62eb7
# exp(0.225854 / (1 - 0.985502))

# ╔═╡ d8f573e0-3df3-4eb3-9500-f737a9bad084
# gm2 = fit(
# 	GeneralizedLinearModel,
# 	@formula(Pop ~ Geo),
# 	long_df, 
# 	Poisson(); 
# 	offset=log.(long_df.Prev)
# )

# ╔═╡ 1a994c32-c796-4385-b704-133faca8b6d6
html"""
<hr/>
"""

# ╔═╡ f3fd70a2-5db4-4a33-b4b8-9d627811b356
bubble"""
Douglas Bates, one of the authors of Mixed Effect Models in S and S-plus, quite publicly switched from R to Julia, which is when I started to take Julia seriously.
"""

# ╔═╡ a79aa8a1-0ff5-4d54-9445-73ea00836986
# using MixedModels

# ╔═╡ 8f25edc8-276e-4af1-bcaf-3c2c6eb802cd
# gmm3 = fit(
# 	MixedModel, 
# 	@formula(Pop ~ 1 + (1 | Geo)),
# 	long_df,
# 	Poisson(),
# 	offset =log.(long_df.Prev)
# )

# ╔═╡ 45e0614b-19c7-48ea-ae15-22e9c9e5ca10
# @pipe ranef(gmm3)[1] |>
#   transpose(_) |>
#   describe(_)

# ╔═╡ aa1668b7-75c7-4301-a765-3ba2c0ec3468
md"""
## Optimization
"""

# ╔═╡ 03e970f8-f9ed-4e52-9cc7-e5c94d53bce4
# using Optimization

# ╔═╡ d8e6ed50-a5b7-4746-8142-e2d4a4f9d52c
bubble"""
<p> Similar to the model packages, Optimization is a common interface to a variety of solvers.

<p> The <a href=https://docs.sciml.ai/Optimization/stable/getting_started/>Optimization Getting Started Guide</a> is, not surprisingly, a good place to start.

"""

# ╔═╡ 40a404a0-b493-48d2-8654-38c583c2a8dc
# rosenbrock(u, p) = (p[1] - u[1])^2 + p[2] * (u[2] - u[1]^2)^2

# ╔═╡ b203e1cd-c8ec-4d94-995a-78221326395b
# prob = OptimizationProblem(rosenbrock, [0.0,0.0], [1.0, 100.0])

# ╔═╡ 745a71dd-8502-4803-85b8-d4a6779baee2
# using OptimizationOptimJL

# ╔═╡ b52258ee-c8ab-4871-b520-ca6eba6fb6de
# solve(prob, NelderMead())

# ╔═╡ e4e1be9e-5f24-425e-948e-260d5743f13a
bubble"""
<p> Key ideas:
<ul>
<li> Target function
<li> OptimizationProblem - connects function to params
<li> <code>solve</code> take a problem and a solver, runs the solver.
<ul>
"""

# ╔═╡ ba168c50-85fa-496a-a032-e7dd832453d8
# optf = OptimizationFunction(rosenbrock, Optimization.AutoForwardDiff())

# ╔═╡ c28ff11a-9f5f-41f3-91a5-15940d5c2c11
bubble"""
Here, we are annotating our target function with Automatic Differentiation - this will provide the gradient to the solver.
"""

# ╔═╡ 8bec713a-c3af-43be-bdd3-1e43f1f6f6a3
# prob_ad = OptimizationProblem(optf, [0.0,0.0], [1.0, 100.0], lb = [-1.0, -1.0], ub = [1.0, 1.0])

# ╔═╡ 46a0deda-0ad7-4d25-91e6-15f81a7a2f86
bubble"""
Box constraints, if you like.
"""

# ╔═╡ 80c90376-998d-487d-923e-800defdb3e28
# solve(prob_ad, NelderMead())

# ╔═╡ 3f0b1cff-1a5a-47b1-b848-feec28690de5
md"""
## Foreign Language Interfaces
"""

# ╔═╡ d349c37f-9598-48c4-b0cc-8d1ea2512770
bubble"""
<p> Many times, you want to use a pre-existing package in another language. Why re-invent the wheel?

<p> Julia has some good facilities for doing this. See also <a href=https://github.com/JuliaInterop>[Julia InterOp]</a>.

<p> I'll do a quick demo of R, Python, and C.
"""

# ╔═╡ 473e08e7-fdbc-4f7b-94b7-56e71d869e1e
md"""
### Julia -> R
"""

# ╔═╡ 4d68b549-e1b4-4df4-b6dc-4ff9b66a490e
# using RCall # https://juliainterop.github.io/RCall.jl/stable/gettingstarted/

# ╔═╡ 3d453cc2-c908-4eef-b2e1-c1437ba710cf
# R"""
# table(group=sleep$group)
# """

# ╔═╡ 873292bb-9ff2-42eb-bb83-25a680e21a56
md"""
### Julia -> Python
"""

# ╔═╡ 7abc6ce1-0849-4f61-8854-121a2cab5c51
# using PyCall # https://github.com/JuliaPy/PyCall.jl

# ╔═╡ 294f199a-078b-43a8-a6ba-2317f481674f
# py"[ x * i for i, x in enumerate(range(1,10,2))]"

# ╔═╡ e6b4e993-bccf-475f-93d2-c1495bcb3136
md"""
### Julia -> C
"""

# ╔═╡ 63351bbf-c3e0-43ce-b7d3-bfc853747858
# t = @ccall "/usr/lib/x86_64-linux-gnu/libgsl.so.27".gsl_poly_eval(
# 	[1.0, 2.0, 3.0]::Ptr{Float64}, 
# 	3::Int32, 
# 	2.0::Float64)::Float64

# ╔═╡ ec592364-893c-4c30-bc1a-9d78179faf52
bubble"""
NB: Don't assume that using C will always be faster. Julia comes with a JIT compiler that is quite competitive.
"""

# ╔═╡ 6397ea00-0a88-4e97-b5c5-8f348a9b285d
md"""
### Julia -> shell
"""

# ╔═╡ 0f149740-286d-4035-9bfe-9cbb48b8cc4b
# mycmd = `whoami`

# ╔═╡ 0c7af0f8-ef4b-4048-a362-4d994f085b17
# read(mycmd, String)

# ╔═╡ fc9ffbda-2213-44a9-ba54-c8778da36b48
bubble"""
NB: don't go too crazy with backtics.
"""

# ╔═╡ f55494f4-a5c0-4b0d-a19f-4b731ff9c700
md"""
### Shell -> Julia
"""

# ╔═╡ a1bd5200-ec3b-471a-8875-3653ba8748b2
# run(`julia -E "inv([1 .5 ; .5 1])"`)

# ╔═╡ 6ea46f9d-21c7-40b7-9001-a18fb0187b6d
bubble"""
NB This is output as text, may risk losing semantics, structure, precision, etc
"""

# ╔═╡ 1b30958c-e77e-4f7c-b9b0-04f5fa63255e
md"""
### R -> Julia
Not Covered. Call Julia from R. See also [CRAN JuliaCall](https://cran.r-project.org/web/packages/JuliaCall/readme/README.html)
"""

# ╔═╡ f193f9e8-3c70-41ff-8788-dd1a9beac589
md"""
## Report Templates
"""

# ╔═╡ 16e6f740-a44b-4f68-9761-fb1408f011fe
md"""
#### [Weave.jl](https://weavejl.mpastell.com/stable/) 
- literate programming.
- [Sample File](https://github.com/JunoLab/Weave.jl/blob/master/examples/julia_sample.mdw)
"""

# ╔═╡ c7cb1b3e-c302-442b-88c0-0e1d7a45a556
# md = download("https://github.com/JunoLab/Weave.jl/raw/master/examples/julia_sample.mdw")

# ╔═╡ dcc16149-1c48-4a19-90c7-7cd56fbe6da6
# @pipe md |> open(_, "r") |> read(_, String) |> string("<code><pre>" , _ , "</pre><code>") |> HTML

# ╔═╡ 2d899d32-8108-469e-856e-3536e036beb4
# import Weave

# ╔═╡ c19a6df6-45f5-4021-9633-e86ade6a854b
# out = Weave.weave(md; doctype="md2html")

# ╔═╡ 479db2bd-656d-4fed-af8e-dde8846aeacd
#@pipe out |> open(_, "r") |> read(_, String) |> HTML

# ╔═╡ f508ffe8-3e3f-493b-8351-ec53535f64df
bubble"""
<p> Most report template tools are language neutral. In addition to Host -> Julia FLI, some tools already support Julia.

<p> R users: <a href=https://bookdown.org/yihui/rmarkdown/language-engines.html>[knitr engines]</a> supports Julia via JuliaCall.

<p> Python users: Julia can be installed as a <a href=https://julialang.github.io/IJulia.jl/stable/>[kernel for Jupyter Notebooks]</a>. Once that is configured, you have full access to Jupyter, nbconvert, etc.
"""

# ╔═╡ 1211154c-308a-4403-b871-fa7123c75837
md"""
## When and Why

Talking points:
* "An alternative to the two-tier compromise" [2012 Manifesto](https://arxiv.org/pdf/1209.5145v1.pdf)
* Extensibility via pervasive multiple dispatch
* Performance via JIT
"""

# ╔═╡ 694a56ea-0781-4e32-8b84-207265d861bb
bubble"""
My exp vs Kevin Keys
"""

# ╔═╡ e6ca06b0-0a1c-405c-be65-748a5314f8ca
bubble"""
Package availability is <em>much</em> improved in 2024 vs 2014.
"""

# ╔═╡ 29ec46f2-6f8d-4d1a-a8af-8478202cf0ea
bubble"""
"technical computing" ...
"""

# ╔═╡ 51106e28-5585-4083-8974-77efb61d0198
bubble"""
"feels modern"
"""

# ╔═╡ 45fcf5a8-3f8f-4c1a-902a-362cc22f4977
md"""
### Other Resources


* [Cheatsheet](https://cheatsheet.juliadocs.org/)
* [QuantEcon Cheatsheet](https://cheatsheets.quantecon.org/)
* [Think Julia](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html)


* [UC Davis <3 Data Workshop](https://ucjug.github.io/workshop_julia_basics/)
* [magerton crash course](https://github.com/magerton/rcmnl.jl)
* [UCLA Biostat 257](http://ucla-biostat-257.com)
"""

# ╔═╡ c5461872-db14-4523-b0ae-85c2a4de11c3
md"""
## Coda: Neat Julia Tricks
"""

# ╔═╡ 6a46085d-d393-4eb8-8b0d-11c524656448
md"""
[https://discourse.julialang.org/t/fun-one-liners/28352/2](https://discourse.julialang.org/t/fun-one-liners/28352/2)
"""

# ╔═╡ 098a4f71-7400-4127-b3de-40da41fb70c7
html"""
<code><pre>
using LinearAlgebra
d = norm ∘ .-
</pre></code>
"""

# ╔═╡ 6051f678-ab26-4e35-ba29-a05ffb908c42
md"""
```
using CSV, Glob

# Read and concatenate all tables in CSV files matching the given `pattern`
cat_csv(pattern) = vcat(CSV.read.(glob(pattern))...)
```
"""

# ╔═╡ 7f4a136a-ad87-4dc5-a732-d3cb0d424f90
md"""
```
my_vector = [2^i ./ 2 for i in 1:10 if iseven(i)] 
```
"""

# ╔═╡ 119b395c-638e-4f03-9897-8c96c87fef52


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Pipe = "b98c9c47-44ae-5843-9183-064241ee97a0"

[compat]
Pipe = "~1.3.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.1"
manifest_format = "2.0"
project_hash = "a7de8005e08c531f8378566d940adc07062d8bd8"

[[deps.Pipe]]
git-tree-sha1 = "6842804e7867b115ca9de748a0cf6b364523c16d"
uuid = "b98c9c47-44ae-5843-9183-064241ee97a0"
version = "1.3.0"
"""

# ╔═╡ Cell order:
# ╟─6d21bc4e-b132-4550-b08e-a76d34d91f6d
# ╟─da994a40-d008-42e2-b7a8-da6a1b40f7fe
# ╟─3fdbe9ac-d330-11ee-099c-738ea0dc0f61
# ╟─6ab036b5-f5a3-430a-a53f-bcf50760efca
# ╟─a0644071-1b20-4912-b744-c510f4e27354
# ╟─43803423-3f90-43c9-ab1d-6637d3311c80
# ╟─c10d063e-e8c8-42ff-a401-f182b5a884ac
# ╟─de00b699-07d9-43fb-9612-cdae0ee2b954
# ╟─080cb05e-045f-44cf-9162-b8a60d8b37a7
# ╟─56a8a282-d99c-42df-ae69-8fb6329b270b
# ╟─084432a3-c5ef-4869-a66c-64444a8176b2
# ╟─3bc23224-ec9e-452c-ba43-926f836c09a8
# ╟─d9a39af7-cfae-4ef4-8cc8-f5f5b539b7ad
# ╟─bfe49d06-8d12-4150-b46b-73a8c6e92342
# ╟─f8b19e6f-826d-4dca-9400-162df9ef6ebc
# ╟─80c7194e-1b92-40f8-aad1-26d8a451d8b2
# ╠═f955f65b-0d6e-482a-9d65-849b397a29d2
# ╠═de3099bc-3d63-4cca-b80a-879d51f42c8a
# ╟─b95a6dba-d332-4f4b-98f6-27019ae6bba1
# ╠═e638f96f-ad39-4fc3-99fb-777b31014d8c
# ╠═0f16fd37-23e2-4d25-bf17-3fd8abfadd87
# ╟─c18ae23f-76aa-4665-ba59-493ac24f42ef
# ╠═093dded5-8a0c-43a9-9e32-a976a08b3501
# ╟─041e6a9d-c173-4c20-926d-d06e9190eeda
# ╟─77e3c15e-0eda-411c-a317-66d28dcf6048
# ╠═7559c4da-401f-4437-8823-64d2d31c9fe0
# ╟─385ca477-461e-44e2-b99f-bfbfb56dd20a
# ╠═6f5daee0-ae86-4c63-a98f-367ee2791f32
# ╠═24ed4401-a8ff-42d6-80e0-e7a56f01e8a4
# ╟─e872691b-bc30-4753-8b44-9ec51e0177e2
# ╟─33ca0878-4a0e-4cca-be30-3bbfcbd0104f
# ╠═46d7c4ea-ea23-45be-9c85-023b29f71998
# ╠═1416221b-0e7e-4743-90c5-263bb6d7fb1b
# ╠═7a29c35c-5cc4-47c1-b20c-13d652eedbf3
# ╟─2a09633d-0bdc-4154-818f-a6b50d4781bb
# ╟─4e4ad86a-c100-4d83-9f9b-29762dd0f9ec
# ╠═072415ca-f63e-466e-8b0d-e7ce850e4225
# ╠═fba330f9-aa13-40ea-8b6b-dc702d6dd876
# ╟─967c5075-7060-41b6-a2e5-6799e7e714bd
# ╟─7a74fc1d-24be-495c-a0e6-5db158b04478
# ╠═33901ce3-9003-4715-ae93-0481fff0ee9f
# ╠═a1e93867-6bfb-4d8b-ba93-b9768235c9f3
# ╠═0c1a179a-4d4b-4e89-8981-7486ded54555
# ╟─b11b6b4a-4c9b-4071-a86f-c738fd96b972
# ╠═df390c95-dafa-4e44-a298-444b7c2cae5a
# ╠═27f57422-574c-4a08-b0a2-b9aea1b11b4c
# ╟─0024cb71-e453-451e-af09-91584d5daa69
# ╠═2edc9c69-c859-496c-81be-f23c81c9f129
# ╠═515b2a38-304a-42b7-b4f5-240b38194e8b
# ╠═ff4d4d23-ce3e-437a-9ed1-68b186e67193
# ╟─e17adbb6-4910-4dc1-96c7-2b1f70ff2349
# ╟─91120b2c-0527-4bed-83f3-ff54ed38147d
# ╠═3304c8da-79c8-40e5-bd13-ca8772455cea
# ╟─73f010c1-27a9-498d-8dde-5b226cf6e4c1
# ╟─bdb05ba8-500c-4ccb-8991-f16d2e4ea493
# ╠═54252a56-0cb1-4dce-a642-0ea8fa9e84fc
# ╠═6f276ad0-f1f0-4132-b548-6d268250f431
# ╠═da1c8727-64a7-4c53-ab53-91a9e30cce97
# ╟─2b629205-1e54-4812-9259-76eb9a174907
# ╟─f01f4969-44c6-4417-9e07-88fb9ee681eb
# ╠═1ecaa24d-007d-4ab8-86c1-9523760589ec
# ╠═5d4042f8-ee16-4348-aa76-b8b530a00877
# ╟─6561736b-015a-4194-86f6-bebfea275c64
# ╟─df14d669-c435-409d-a07d-ceee7a138617
# ╠═7403cc3a-35de-44d1-b8f2-7c73d02a9004
# ╠═d3c36fda-24f0-475d-a480-56710a07f96c
# ╠═eaf7ed7a-4048-4975-a5f1-5fd4fb215967
# ╠═25f045cd-aae9-48b3-8664-ac0861beb3e3
# ╟─42003c51-f8e6-436a-a0d6-45b0da96b98c
# ╠═5b06c291-1a5c-48ea-a0aa-267333a7d54c
# ╠═ffbef174-205b-464e-bde6-e58d8b50e917
# ╠═497b2fd2-a9c4-4f52-910c-f1baff0ef222
# ╟─85652f4c-8988-441f-9e65-edf3b96ecb08
# ╠═f88afdcf-5523-49ea-ac12-5fb54472bbf3
# ╠═3daa3037-5a0a-4555-851c-83434c2957f4
# ╠═88aae939-899c-4d17-be78-9222314eaa54
# ╟─1360e25a-4005-4904-aa10-ef0e2fd0aab0
# ╠═d6096c86-2b30-4999-b70c-913105645960
# ╠═26331da6-9c66-44c6-bf57-da0810255860
# ╟─11b479d0-5d96-433e-95e3-ab65fa45403c
# ╠═7cbc7b63-38b5-4d90-bc11-335fc68f939c
# ╟─5f4a8aee-14e1-4a23-b395-a631d2188e75
# ╠═dd793ed0-f232-4663-a3ca-1b65eba10c35
# ╟─4437b099-622a-4b59-9900-c83f96e28ac6
# ╟─d6288a1e-4fc3-4ce6-a71a-5be50e79174c
# ╟─5e9acf6b-154f-4db7-ac78-cca29906c5a1
# ╠═c98713b6-9564-40e0-966b-91ffb931b00b
# ╠═559a86ae-ec20-4b3c-b0ba-638f3df11520
# ╠═92b90e2d-e446-45b3-ab14-b19e01ea492c
# ╠═acc8f64c-9e38-47e2-9b0d-02d7bfa62eb7
# ╠═d8f573e0-3df3-4eb3-9500-f737a9bad084
# ╟─1a994c32-c796-4385-b704-133faca8b6d6
# ╟─f3fd70a2-5db4-4a33-b4b8-9d627811b356
# ╠═a79aa8a1-0ff5-4d54-9445-73ea00836986
# ╠═8f25edc8-276e-4af1-bcaf-3c2c6eb802cd
# ╠═45e0614b-19c7-48ea-ae15-22e9c9e5ca10
# ╟─aa1668b7-75c7-4301-a765-3ba2c0ec3468
# ╠═03e970f8-f9ed-4e52-9cc7-e5c94d53bce4
# ╟─d8e6ed50-a5b7-4746-8142-e2d4a4f9d52c
# ╠═40a404a0-b493-48d2-8654-38c583c2a8dc
# ╠═b203e1cd-c8ec-4d94-995a-78221326395b
# ╠═745a71dd-8502-4803-85b8-d4a6779baee2
# ╠═b52258ee-c8ab-4871-b520-ca6eba6fb6de
# ╟─e4e1be9e-5f24-425e-948e-260d5743f13a
# ╠═ba168c50-85fa-496a-a032-e7dd832453d8
# ╟─c28ff11a-9f5f-41f3-91a5-15940d5c2c11
# ╠═8bec713a-c3af-43be-bdd3-1e43f1f6f6a3
# ╟─46a0deda-0ad7-4d25-91e6-15f81a7a2f86
# ╠═80c90376-998d-487d-923e-800defdb3e28
# ╟─3f0b1cff-1a5a-47b1-b848-feec28690de5
# ╟─d349c37f-9598-48c4-b0cc-8d1ea2512770
# ╟─473e08e7-fdbc-4f7b-94b7-56e71d869e1e
# ╠═4d68b549-e1b4-4df4-b6dc-4ff9b66a490e
# ╠═3d453cc2-c908-4eef-b2e1-c1437ba710cf
# ╟─873292bb-9ff2-42eb-bb83-25a680e21a56
# ╠═7abc6ce1-0849-4f61-8854-121a2cab5c51
# ╠═294f199a-078b-43a8-a6ba-2317f481674f
# ╟─e6b4e993-bccf-475f-93d2-c1495bcb3136
# ╠═63351bbf-c3e0-43ce-b7d3-bfc853747858
# ╟─ec592364-893c-4c30-bc1a-9d78179faf52
# ╟─6397ea00-0a88-4e97-b5c5-8f348a9b285d
# ╠═0f149740-286d-4035-9bfe-9cbb48b8cc4b
# ╠═0c7af0f8-ef4b-4048-a362-4d994f085b17
# ╟─fc9ffbda-2213-44a9-ba54-c8778da36b48
# ╟─f55494f4-a5c0-4b0d-a19f-4b731ff9c700
# ╠═a1bd5200-ec3b-471a-8875-3653ba8748b2
# ╟─6ea46f9d-21c7-40b7-9001-a18fb0187b6d
# ╟─1b30958c-e77e-4f7c-b9b0-04f5fa63255e
# ╟─f193f9e8-3c70-41ff-8788-dd1a9beac589
# ╟─16e6f740-a44b-4f68-9761-fb1408f011fe
# ╠═c7cb1b3e-c302-442b-88c0-0e1d7a45a556
# ╠═dcc16149-1c48-4a19-90c7-7cd56fbe6da6
# ╠═2d899d32-8108-469e-856e-3536e036beb4
# ╠═c19a6df6-45f5-4021-9633-e86ade6a854b
# ╠═479db2bd-656d-4fed-af8e-dde8846aeacd
# ╟─f508ffe8-3e3f-493b-8351-ec53535f64df
# ╟─1211154c-308a-4403-b871-fa7123c75837
# ╟─694a56ea-0781-4e32-8b84-207265d861bb
# ╟─e6ca06b0-0a1c-405c-be65-748a5314f8ca
# ╟─29ec46f2-6f8d-4d1a-a8af-8478202cf0ea
# ╟─51106e28-5585-4083-8974-77efb61d0198
# ╟─45fcf5a8-3f8f-4c1a-902a-362cc22f4977
# ╟─c5461872-db14-4523-b0ae-85c2a4de11c3
# ╟─6a46085d-d393-4eb8-8b0d-11c524656448
# ╟─098a4f71-7400-4127-b3de-40da41fb70c7
# ╟─6051f678-ab26-4e35-ba29-a05ffb908c42
# ╟─7f4a136a-ad87-4dc5-a732-d3cb0d424f90
# ╠═119b395c-638e-4f03-9897-8c96c87fef52
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
