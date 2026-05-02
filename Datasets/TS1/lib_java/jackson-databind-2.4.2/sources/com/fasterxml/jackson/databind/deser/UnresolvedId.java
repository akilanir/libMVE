package com.fasterxml.jackson.databind.deser;

import com.fasterxml.jackson.core.JsonLocation;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/UnresolvedId.class */
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
        return String.format("Object id [%s] (for %s) at %s", this._id, this._type, this._location);
    }
}
