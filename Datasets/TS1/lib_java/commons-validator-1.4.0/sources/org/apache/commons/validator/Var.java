package org.apache.commons.validator;

import java.io.Serializable;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/Var.class */
public class Var implements Cloneable, Serializable {
    public static final String JSTYPE_INT = "int";
    public static final String JSTYPE_STRING = "string";
    public static final String JSTYPE_REGEXP = "regexp";
    private String name;
    private String value;
    private String jsType;
    private boolean resource;
    private String bundle;

    public Var() {
        this.name = null;
        this.value = null;
        this.jsType = null;
        this.resource = false;
        this.bundle = null;
    }

    public Var(String name, String value, String jsType) {
        this.name = null;
        this.value = null;
        this.jsType = null;
        this.resource = false;
        this.bundle = null;
        this.name = name;
        this.value = value;
        this.jsType = jsType;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return this.value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public boolean isResource() {
        return this.resource;
    }

    public void setResource(boolean resource) {
        this.resource = resource;
    }

    public String getBundle() {
        return this.bundle;
    }

    public void setBundle(String bundle) {
        this.bundle = bundle;
    }

    public String getJsType() {
        return this.jsType;
    }

    public void setJsType(String jsType) {
        this.jsType = jsType;
    }

    public Object clone() {
        try {
            return super.clone();
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e.toString());
        }
    }

    public String toString() {
        StringBuffer results = new StringBuffer();
        results.append("Var: name=");
        results.append(this.name);
        results.append("  value=");
        results.append(this.value);
        results.append("  resource=");
        results.append(this.resource);
        if (this.resource) {
            results.append("  bundle=");
            results.append(this.bundle);
        }
        results.append("  jsType=");
        results.append(this.jsType);
        results.append("\n");
        return results.toString();
    }
}
