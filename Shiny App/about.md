---
title: "Instructions for Shiny-App Usage"
output: html_document
---

## Instructions for Shiny-App Usage

The App includes a prediction model for fertility based on swiss socio-economic indicators from end of XIX.
The prediction algorithm is based on the "swiss" dataset, which includes observations for each of 47 French-speaking provinces in Switzerland. 

The model has been estimated using the lm method and has two regressors: Education and Catholic.
Education represents the percentage of draftees with education beyond primary school while Catholic represents the percentage of catholics in the region as opposed to protestant.

The prediction algorithm is embebbed in the App and so the User only needs to choose the values of Education and Catholic for which he wishes to obtain a fertility prediction. The user can choose the desired values interactivily through the respective sidebars in the "Prediction" Tab. The default values are 11% for the variable education and 41% for the variable catholic. The default values correspond to the means over the 47 observations.

Once the User has chosen values for the variables Catholic and Education other than the default and has submitted them, the predicted value for fertility is displayed as a red dot in the figure. The graphic is a scatterplot for the fertility (y-axis), education (x-axis) and catholic (included through colour) data from the swiss dataset. It also includes a smooth-line for the model fit. 

The R-Code used to create this Shiny-App can be found in GitHub under this link:
https://github.com/alatriste65/DevelopingDataProducts_FinalProject

