package com.fasterxml.jackson.databind;

import java.io.Serializable;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/PropertyMetadata.class */
public class PropertyMetadata implements Serializable {
    private static final long serialVersionUID = -1;
    public static final PropertyMetadata STD_REQUIRED = new PropertyMetadata(Boolean.TRUE, null, null, null);
    public static final PropertyMetadata STD_OPTIONAL = new PropertyMetadata(Boolean.FALSE, null, null, null);
    public static final PropertyMetadata STD_REQUIRED_OR_OPTIONAL = new PropertyMetadata(null, null, null, null);
    protected final Boolean _required;
    protected final String _description;
    protected final Integer _index;
    protected final String _defaultValue;

    @Deprecated
    protected PropertyMetadata(Boolean req, String desc) {
        this(req, desc, null, null);
    }

    protected PropertyMetadata(Boolean req, String desc, Integer index, String def) {
        this._required = req;
        this._description = desc;
        this._index = index;
        this._defaultValue = (def == null || def.isEmpty()) ? null : def;
    }

    @Deprecated
    public static PropertyMetadata construct(boolean req, String desc) {
        return construct(req, desc, null, null);
    }

    public static PropertyMetadata construct(boolean req, String desc, Integer index, String defaultValue) {
        if (desc == null && index == null && defaultValue == null) {
            return req ? STD_REQUIRED : STD_OPTIONAL;
        }
        return new PropertyMetadata(Boolean.valueOf(req), desc, index, defaultValue);
    }

    protected Object readResolve() {
        if (this._description == null && this._index == null && this._defaultValue == null) {
            if (this._required == null) {
                return STD_REQUIRED_OR_OPTIONAL;
            }
            return this._required.booleanValue() ? STD_REQUIRED : STD_OPTIONAL;
        }
        return this;
    }

    public PropertyMetadata withDescription(String desc) {
        return new PropertyMetadata(this._required, desc, this._index, this._defaultValue);
    }

    public PropertyMetadata withDefaultValue(String def) {
        if (def == null || def.isEmpty()) {
            if (this._defaultValue == null) {
                return this;
            }
            def = null;
        } else if (this._defaultValue.equals(def)) {
            return this;
        }
        return new PropertyMetadata(this._required, this._description, this._index, def);
    }

    public PropertyMetadata withIndex(Integer index) {
        return new PropertyMetadata(this._required, this._description, index, this._defaultValue);
    }

    public PropertyMetadata withRequired(Boolean b) {
        if (b == null) {
            if (this._required == null) {
                return this;
            }
        } else if (this._required != null && this._required.booleanValue() == b.booleanValue()) {
            return this;
        }
        return new PropertyMetadata(b, this._description, this._index, this._defaultValue);
    }

    public String getDescription() {
        return this._description;
    }

    public String getDefaultValue() {
        return this._defaultValue;
    }

    public boolean hasDefuaultValue() {
        return hasDefaultValue();
    }

    public boolean hasDefaultValue() {
        return this._defaultValue != null;
    }

    public boolean isRequired() {
        return this._required != null && this._required.booleanValue();
    }

    public Boolean getRequired() {
        return this._required;
    }

    public Integer getIndex() {
        return this._index;
    }

    public boolean hasIndex() {
        return this._index != null;
    }
}
