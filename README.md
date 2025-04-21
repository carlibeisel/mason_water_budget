Water Budget of Mason Creek Drainage

**Purpose:** A modified water budget was developed for an agricultural drainage in the Treasure Valley to evaluate how drain gains and losses differ between irrigated agricultural and developed land uses during the 2024 irrigation season. Measured surface water gains to modeled estimates of groundwater inflow (Hundt and Bartolino, 2023) and irrigation runoff (The Freshwater Trust, 2025). 



**Steps to running drain water budget:**

01_retrieve_usgs_mason.R
*Retrieve drainflow data from Mason Creek USGS gauge for the study period*

02_reach_drainflow.ipynb
*Compile streamflow data from Ethos Connected for the 2024 irrigation season*

03_reach_precip.ipynb
*Calculates precipitation for each Reach within Mason Drainage from PRISM. Uses the surface area of drain segment within each Reach to calculate the actual direct input into the reach.*

04_reach_pet.ipynb
*Calculates open-water evapiration for irrigation systems in Mason using IDWR monthly open-water evaporation estimates.*

05_reach_irrigation_runoff.ipynb
*Calculate monthly surface runoff for each reach and for Mason Creek Drainage. This data came from the Freshwater Trust.*

06_tvgwfm.ipynb
*Extract Treasure Valley Groundwater Flow Model (TVGWFM; Hundt and Bartolino, 2023) data for Mason Creek reaches.*

07_reach_compile_data.ipynb
*Compile all data and compute drain water budget for Mason Creek Drainage and reaches*

08_water_budget_figures.ipynb
*Create figures for the reach drain water budget*

09_mason_waterbudget.ipynb
*Create figures for the complete Mason Drainage water budget*
