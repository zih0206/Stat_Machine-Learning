# SLR_MR_Model_selection (Regressors selection)
* I will update a package for variable selection. (This will use statistic methods)

### Criterial:
* Best subset models under AIC, SBIC, SBC, Cp and Adjusted R-square

## K-var subset model selection (Plot)

## Automatic Selecton methods (Here:check p-value, you can also use AIC BIC and so on as the selection criterial):
* Foward
* Backwrd
* Stepwise

# This folder also contains the methods for detecting and alleviate collinearity
## Methods for detecting
* Correlation Matrix
* VIF
* Condition Index
* Condition Number

## Methods for alleviating
* Data Transformation (Box-Cox and Weighted least square)
* Centering Data
* Model re-specification
  
## Additionally, the below methods will be used for dealling with multi-collinearity if the above methods cannot perform perfect.
* Ridge Regression
* Principle Componet Regression
* Partial Least Square
* Elastic Net (Cross Validation will be use for choose parameter alpha, and lambda)
