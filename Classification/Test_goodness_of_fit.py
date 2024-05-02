
def hosmer_lemeshow_test(model, y, groups=10) -> pd.DataFrame:
    """
    Perform the Hosmer-Lemeshow goodness of fit test for logistic regression models.
    param y: The observed binary response variable.
    """
    # Get predicted probabilities
    pred_probs = model.predict()
    # Combine actual and predicted values
    data = pd.DataFrame({'actual': y, 'predicted': pred_probs})

    # Divide into groups based on predicted probabilities
    data['group'] = pd.qcut(data['predicted'], groups, labels=False, duplicates='drop')

    # Calculate observed and expected counts
    observed = data.groupby('group')['actual'].sum()
    expected = data.groupby('group')['predicted'].sum()
    n_group = data.groupby('group').size()

    # HL test statistic
    hl_test_stat = (((observed - expected)**2) / (expected * (1 - expected/n_group))).sum()

    # Degrees of freedom
    df = data['group'].nunique() - 2

    # P-value
    p_value = stats.chi2.sf(hl_test_stat, df)

    return pd.DataFrame({
        'Test Statistic': [hl_test_stat],
        'Degrees of Freedom': [df],
        'P-value': [p_value]
    })
