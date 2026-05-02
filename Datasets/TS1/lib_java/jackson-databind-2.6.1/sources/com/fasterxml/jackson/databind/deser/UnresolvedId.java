package com.fasterxml.jackson.databind.deser;

import com.fasterxml.jackson.core.JsonLocation;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/UnresolvedId.class */
public class UnresolvedId {
    private final Object _id;
    private final JsonLocation _location;
    private final Class<?> _type;

    public UnresolvedId(Object id, Class<?> type, JsonLocation where) {
        this._id = id;
        this._type = type;
        this._location = where;
    }

    public Object getId() {
        return this._id;
    }

    public Class<?> getType() {
        return this._type;
    }

    public JsonLocation getLocation() {
        return this._location;
    }

    public String toString() {
        Object[] objArr = new Object[3];
        objArr[0] = this._id;
        objArr[1] = this._type == null ? "NULL" : this._type.getName();
        objArr[2] = this._location;
        return String.format("Object id [%s] (for %s) at %s", objArr);
    }
}
