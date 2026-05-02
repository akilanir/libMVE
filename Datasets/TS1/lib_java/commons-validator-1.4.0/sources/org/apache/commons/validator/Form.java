package org.apache.commons.validator;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.commons.collections.FastHashMap;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/Form.class */
public class Form implements Serializable {
    private static final long serialVersionUID = 6445211789563796371L;
    protected String name = null;
    protected List lFields = new ArrayList();
    protected FastHashMap hFields = new FastHashMap();
    protected String inherit = null;
    private boolean processed = false;

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void addField(Field f) {
        this.lFields.add(f);
        this.hFields.put(f.getKey(), f);
    }

    public List getFields() {
        return Collections.unmodifiableList(this.lFields);
    }

    public Field getField(String fieldName) {
        return (Field) this.hFields.get(fieldName);
    }

    public boolean containsField(String fieldName) {
        return this.hFields.containsKey(fieldName);
    }

    protected void merge(Form depends) {
        ArrayList arrayList = new ArrayList();
        FastHashMap fastHashMap = new FastHashMap();
        for (Field defaultField : depends.getFields()) {
            if (defaultField != null) {
                String fieldKey = defaultField.getKey();
                if (!containsField(fieldKey)) {
                    arrayList.add(defaultField);
                    fastHashMap.put(fieldKey, defaultField);
                } else {
                    Field old = getField(fieldKey);
                    this.hFields.remove(fieldKey);
                    this.lFields.remove(old);
                    arrayList.add(old);
                    fastHashMap.put(fieldKey, old);
                }
            }
        }
        this.lFields.addAll(0, arrayList);
        this.hFields.putAll(fastHashMap);
    }

    protected void process(Map globalConstants, Map constants, Map forms) {
        Form parent;
        if (isProcessed()) {
            return;
        }
        int n = 0;
        if (isExtending() && (parent = (Form) forms.get(this.inherit)) != null) {
            if (!parent.isProcessed()) {
                parent.process(constants, globalConstants, forms);
            }
            for (Field f : parent.getFields()) {
                if (this.hFields.get(f.getKey()) == null) {
                    this.lFields.add(n, f);
                    this.hFields.put(f.getKey(), f);
                    n++;
                }
            }
        }
        this.hFields.setFast(true);
        Iterator i = this.lFields.listIterator(n);
        while (i.hasNext()) {
            ((Field) i.next()).process(globalConstants, constants);
        }
        this.processed = true;
    }

    public String toString() {
        StringBuffer results = new StringBuffer();
        results.append("Form: ");
        results.append(this.name);
        results.append("\n");
        Iterator i = this.lFields.iterator();
        while (i.hasNext()) {
            results.append("\tField: \n");
            results.append(i.next());
            results.append("\n");
        }
        return results.toString();
    }

    ValidatorResults validate(Map params, Map actions, int page) throws ValidatorException {
        return validate(params, actions, page, null);
    }

    ValidatorResults validate(Map params, Map actions, int page, String fieldName) throws ValidatorException {
        ValidatorResults results = new ValidatorResults();
        params.put(Validator.VALIDATOR_RESULTS_PARAM, results);
        if (fieldName != null) {
            Field field = (Field) this.hFields.get(fieldName);
            if (field == null) {
                throw new ValidatorException(new StringBuffer().append("Unknown field ").append(fieldName).append(" in form ").append(getName()).toString());
            }
            params.put(Validator.FIELD_PARAM, field);
            if (field.getPage() <= page) {
                results.merge(field.validate(params, actions));
            }
        } else {
            for (Field field2 : this.lFields) {
                params.put(Validator.FIELD_PARAM, field2);
                if (field2.getPage() <= page) {
                    results.merge(field2.validate(params, actions));
                }
            }
        }
        return results;
    }

    public boolean isProcessed() {
        return this.processed;
    }

    public String getExtends() {
        return this.inherit;
    }

    public void setExtends(String inherit) {
        this.inherit = inherit;
    }

    public boolean isExtending() {
        return this.inherit != null;
    }

    protected Map getFieldMap() {
        return this.hFields;
    }
}
