pregibon_test = function(X,Y, data, link=NULL){
  # x: observation varibales
  # Y: response variable 
  formula_base = as.formula(paste(Y, "~", paste(X, collapse = "+")))
  results = list()
  y = data[[Y]]
  
  #part 1
  if(is.null(link) || link=="logit"){
    fit_logit = glm(formula_base, data = data, family = binomial(link = "logit"))
    eta_logit = predict(fit_logit, type="link")
    
    # Create an augmented variable
    p_logit = predict(fit_logit, type='response')
    z_logit = 0.5*(log(p_logit)^2 - log(1-p_logit)^2)
    
    z_logit[is.na(z_logit)] <- 0
    
    # fit again
    fit_logit_aug = glm(y ~ eta_logit + z_logit, family = binomial(link = "logit"))
    p_value_logit = summary(fit_logit_aug)$coefficients["z_logit","Pr(>|z|)"]
    
    #p1_d
    results$logit <- list(p_value = p_value_logit, acceptable = p_value_logit >= 0.05)
  }
  
  #part 2
  if (is.null(link) || link == "probit"){
    fit_probit = glm(formula_base, data = data, family = binomial(link = "probit"))
    eta_probit = predict(fit_probit, type="link")
    
    # Create an augmented variable
    p_probit = predict(fit_probit, type='response')
    z_probit = (1/(0.46^2))*((p_probit^0.46) * (0.46 * log(p_probit) - 1) + ((1-p_probit)^0.46) * (1 - 0.46 * log(1 - p_probit)))
    z_probit[is.na(z_probit)] <- 0
    
    # fit again
    fit_probit_aug = glm(y ~ eta_probit + z_probit, family = binomial(link = "probit"))
    p_value_probit = summary(fit_probit_aug)$coefficients["z_probit","Pr(>|z|)"]
    
    #p2_d
    results$probit <- list(p_value = p_value_probit, acceptable = p_value_probit >= 0.05)
  }
  
  #part 3
  if (is.null(link) || link == "cloglog"){
    fit_cloglog <- glm(formula_base, data = data, family = binomial(link = "cloglog"))
    eta_cloglog <- predict(fit_cloglog, type = "link")
    
    # Create an augmented variable
    p_cloglog = predict(fit_cloglog, type = "response")
    z_cloglog = -log(1 - p_cloglog) / 2
    z_cloglog[is.na(z_cloglog)] <- 0
    #fit again
    fit_cloglog_aug = glm(y ~ eta_cloglog + z_cloglog, family = binomial(link = "cloglog"))
    p_value_cloglog = summary(fit_cloglog_aug)$coefficients["z_cloglog","Pr(>|z|)"]
    
    #p3_d
    results$cloglog <- list(p_value = p_value_cloglog, acceptable = p_value_cloglog >= 0.05)
    
  }
  
  return(do.call(rbind, results))
}
