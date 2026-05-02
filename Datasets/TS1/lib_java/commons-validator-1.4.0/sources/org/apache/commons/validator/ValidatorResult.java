package org.apache.commons.validator;

import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/ValidatorResult.class */
public class ValidatorResult implements Serializable {
    private static final long serialVersionUID = -3713364681647250531L;
    protected Map hAction = new HashMap();
    protected Field field;

    public ValidatorResult(Field field) {
        this.field = null;
        this.field = field;
    }

    public void add(String validatorName, boolean result) {
        add(validatorName, result, null);
    }

    public void add(String validatorName, boolean result, Object value) {
        this.hAction.put(validatorName, new ResultStatus(result, value));
    }

    public boolean containsAction(String validatorName) {
        return this.hAction.containsKey(validatorName);
    }

    public boolean isValid(String validatorName) {
        ResultStatus status = (ResultStatus) this.hAction.get(validatorName);
        if (status == null) {
            return false;
        }
        return status.isValid();
    }

    public Object getResult(String validatorName) {
        ResultStatus status = (ResultStatus) this.hAction.get(validatorName);
        if (status == null) {
            return null;
        }
        return status.getResult();
    }

    public Iterator getActions() {
        return Collections.unmodifiableMap(this.hAction).keySet().iterator();
    }

    public Map getActionMap() {
        return Collections.unmodifiableMap(this.hAction);
    }

    public Field getField() {
        return this.field;
    }

    /* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/ValidatorResult$ResultStatus.class */
    protected static class ResultStatus implements Serializable {
        private static final long serialVersionUID = 4076665918535320007L;
        private boolean valid;
        private Object result;

        public ResultStatus(boolean valid, Object result) {
            this.valid = false;
            this.result = null;
            this.valid = valid;
            this.result = result;
        }

        public ResultStatus(ValidatorResult ignored, boolean valid, Object result) {
            this(valid, result);
        }

        public boolean isValid() {
            return this.valid;
        }

        public void setValid(boolean valid) {
            this.valid = valid;
        }

        public Object getResult() {
            return this.result;
        }

        public void setResult(Object result) {
            this.result = result;
        }
    }
}
