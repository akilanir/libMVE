package org.apache.commons.validator;

import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/ValidatorResults.class */
public class ValidatorResults implements Serializable {
    private static final long serialVersionUID = -2709911078904924839L;
    protected Map hResults = new HashMap();

    public void merge(ValidatorResults results) {
        this.hResults.putAll(results.hResults);
    }

    public void add(Field field, String validatorName, boolean result) {
        add(field, validatorName, result, null);
    }

    public void add(Field field, String validatorName, boolean result, Object value) {
        ValidatorResult validatorResult = getValidatorResult(field.getKey());
        if (validatorResult == null) {
            validatorResult = new ValidatorResult(field);
            this.hResults.put(field.getKey(), validatorResult);
        }
        validatorResult.add(validatorName, result, value);
    }

    public void clear() {
        this.hResults.clear();
    }

    public boolean isEmpty() {
        return this.hResults.isEmpty();
    }

    public ValidatorResult getValidatorResult(String key) {
        return (ValidatorResult) this.hResults.get(key);
    }

    public Set getPropertyNames() {
        return Collections.unmodifiableSet(this.hResults.keySet());
    }

    public Map getResultValueMap() {
        Map results = new HashMap();
        for (String propertyKey : this.hResults.keySet()) {
            ValidatorResult vr = getValidatorResult(propertyKey);
            Iterator x = vr.getActions();
            while (x.hasNext()) {
                String actionKey = (String) x.next();
                Object result = vr.getResult(actionKey);
                if (result != null && !(result instanceof Boolean)) {
                    results.put(propertyKey, result);
                }
            }
        }
        return results;
    }
}
