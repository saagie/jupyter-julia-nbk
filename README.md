# Jupyter Datascience Notebook for julia

## Run with :
	docker run -p 8888:8888 -v /path/to/data/notebooks/dir:/notebooks-dir saagie/julia-notebook:latest

## Libraries :
	* Data Processing
		* RDatasets
		* Pandas

	* Machine Learning
		* ForwardDiff
		* Distributions
		* NLsolve
		* QuantEcon

	* Data Visualisation
		* gadfly
		* Pyplot
		* Winston

	* Database connection
		* Hive
		* Mongo
	* Utils
		* Interact
		* PyCall

## Install libraries with :
	Pkg.add("libraryName")

