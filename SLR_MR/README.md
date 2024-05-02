# SLR and MR analysis (Sample Data set: 17-18 NBA data)
* The ipynb file provided a rigorous regresson analysis and factors interpretation.
* regresson analysis includes: Exploratory data analysis, model selection, model diagnostics, methods for processing the issues of ollinearity

## SLR_MR_Model_selection (Regressors selection)
* I will update a package for variables selection. (This will use statistic methods)
### Selection Criterials:
* AIC, SBIC, SBC, Cp and Adjusted R-square


## Data Transformation
(log, Box-Cox, Weighted least square)

## Automatic Selecton methods (Here:check p-value, you can also use AIC BIC and so on as a selection criterial):
* Foward
* Backwrd
* Stepwise

## This file also contains the methods for *detecting* collinearity and the methods of *alleviating* collinearity
### *1. Methods for detecting collinearity*
* Correlation Matrix
* VIF
* Condition Index
* Condition Number

### *2. Methods for alleviating collinearity*
* Centering Data
* Model re-specification
  
## Additionally, the below methods will be used for dealling with multi-collinearity if the above methods cannot perform perfect.
* Ridge Regression
* Principle Componet Regression
* Partial Least Square
* Elastic Net (Cross Validation will be use for choose parameter alpha, and lambda)

*All of the above mentioned methods have been shown on the jupyter file.*
