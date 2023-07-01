# Miscellaneous

* Add data examples for parameters which have them

Note: if we add examples for everything, our tests become problematic because
some parameters are exclusive. Thus, we'll need to find a way to account for
this. Something like `x-includes` and `x-excludes` in the OpenAPI?

* Don't pass API key to servers which don't use it
* Make it easy to override methods names
* Link to relevant schemas

# APIs to Add

* DONKI: Space Weather Database Of Notifications, Knowledge, Information
* EONET: The Earth Observatory Natural Event Tracker
    *	https://eonet.gsfc.nasa.gov/docs/v3
* 	Version 2.1 is deprecated. Will need to add v3
* EPIC: Earth Polychromatic Imaging Camera
* Exoplanet: Programmatic access to NASA's Exoplanet Archive database
* GeneLab: Programmatic interface for GeneLab's public data repository website
* Mars Rover Photos: Image data gathered by NASA's Curiosity, Opportunity, and Spirit rovers on Mars
* NASA Image and Video Library: API to access the NASA Image and Video Library site at images.nasa.gov
* TechTransfer: Patents, Software, and Tech Transfer Reports
* Satellite Situation Center: System to cast geocentric spacecraft location information into a framework of (empirical) geophysical regions
* SSD/CNEOS: Solar System Dynamics and Center for Near-Earth Object Studies
* Techport: API to make NASA technology project data available in a machine-readable format
* TLE API: Two line element data for earth-orbiting objects at a given point in time
* Vesta/Moon/Mars Trek WMTS: A Web Map Tile Service for the Vesta, Moon, and Mars Trek imagery projects

# Done

* APOD: Astronomy Picture of the Day
	* /planetary/apod
* Asteroids NeoWs: Near Earth Object Web Service
	* /neo/rest/v1...
* Earth: Unlock the significant public investment in earth observation data
	* /planetary/earth/assets
	* /planetary/earth/imagery

# Problems

* Insight: Mars Weather Service API

This one is listed, but it appears to be dead. Insight stopped serving data
bak in 2020.
