# Jupyter Datascience Notebook for julia

## Run with :
	docker run -p 8888:8888 -v /path/to/data/notebooks/dir:/notebooks-dir saagie/julia-notebook:latest

	Mounting volume is optional (-v /path/to/data/notebooks/dir:/notebooks-dir) but if you want to do it:
		* create your local directory with: `mkdir -P /path/to/data/notebooks/dir`
		* make Jovyan (Jupyter notebook default user) the owner of this directory with: `chown -R 1000:100 /path/to/data/notebooks/dir`

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
