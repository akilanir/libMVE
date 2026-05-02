package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import com.fasterxml.jackson.annotation.ObjectIdResolver;
import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.databind.deser.UnresolvedForwardReference;
import java.io.IOException;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/impl/ReadableObjectId.class */
public class ReadableObjectId {

    @Deprecated
    public Object item;

    @Deprecated
    public final Object id;
    private final ObjectIdGenerator.IdKey _key;
    private LinkedList<Referring> _referringProperties;
    private ObjectIdResolver _resolver;

    @Deprecated
    public ReadableObjectId(Object id) {
        this.id = id;
        this._key = null;
    }

    public ReadableObjectId(ObjectIdGenerator.IdKey key) {
        this._key = key;
        this.id = key.key;
    }

    public void setResolver(ObjectIdResolver resolver) {
        this._resolver = resolver;
    }

    public ObjectIdGenerator.IdKey getKey() {
        return this._key;
    }

    public void appendReferring(Referring currentReferring) {
        if (this._referringProperties == null) {
            this._referringProperties = new LinkedList<>();
        }
        this._referringProperties.add(currentReferring);
    }

    public void bindItem(Object ob) throws IOException {
        this._resolver.bindItem(this._key, ob);
        this.item = ob;
        if (this._referringProperties != null) {
            Iterator<Referring> it = this._referringProperties.iterator();
            this._referringProperties = null;
            while (it.hasNext()) {
                it.next().handleResolvedForwardReference(this.id, ob);
            }
        }
    }

    public Object resolve() {
        Object resolveId = this._resolver.resolveId(this._key);
        this.item = resolveId;
        return resolveId;
    }

    public boolean hasReferringProperties() {
        return (this._referringProperties == null || this._referringProperties.isEmpty()) ? false : true;
    }

    public Iterator<Referring> referringProperties() {
        if (this._referringProperties == null) {
            return Collections.emptyList().iterator();
        }
        return this._referringProperties.iterator();
    }

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/impl/ReadableObjectId$Referring.class */
    public static abstract class Referring {
        private final UnresolvedForwardReference _reference;
        private final Class<?> _beanType;

        public abstract void handleResolvedForwardReference(Object obj, Object obj2) throws IOException;

        public Referring(UnresolvedForwardReference ref, Class<?> beanType) {
            this._reference = ref;
            this._beanType = beanType;
        }

        public JsonLocation getLocation() {
            return this._reference.getLocation();
        }

        public Class<?> getBeanType() {
            return this._beanType;
        }

        public boolean hasId(Object id) {
            return id.equals(this._reference.getUnresolvedId());
        }
    }
}
