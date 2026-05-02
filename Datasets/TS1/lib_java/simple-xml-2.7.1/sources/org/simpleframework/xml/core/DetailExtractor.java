package org.simpleframework.xml.core;

import org.simpleframework.xml.DefaultType;
import org.simpleframework.xml.util.Cache;
import org.simpleframework.xml.util.ConcurrentCache;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/DetailExtractor.class */
class DetailExtractor {
    private final Cache<ContactList> methods;
    private final Cache<ContactList> fields;
    private final Cache<Detail> details;
    private final DefaultType override;
    private final Support support;

    public DetailExtractor(Support support) {
        this(support, null);
    }

    public DetailExtractor(Support support, DefaultType override) {
        this.methods = new ConcurrentCache();
        this.fields = new ConcurrentCache();
        this.details = new ConcurrentCache();
        this.override = override;
        this.support = support;
    }

    public Detail getDetail(Class type) {
        Detail detail = this.details.fetch(type);
        if (detail == null) {
            detail = new DetailScanner(type, this.override);
            this.details.cache(type, detail);
        }
        return detail;
    }

    public ContactList getFields(Class type) throws Exception {
        Detail detail;
        ContactList list = this.fields.fetch(type);
        if (list == null && (detail = getDetail(type)) != null) {
            list = getFields(type, detail);
        }
        return list;
    }

    private ContactList getFields(Class type, Detail detail) throws Exception {
        ContactList list = new FieldScanner(detail, this.support);
        if (detail != null) {
            this.fields.cache(type, list);
        }
        return list;
    }

    public ContactList getMethods(Class type) throws Exception {
        Detail detail;
        ContactList list = this.methods.fetch(type);
        if (list == null && (detail = getDetail(type)) != null) {
            list = getMethods(type, detail);
        }
        return list;
    }

    private ContactList getMethods(Class type, Detail detail) throws Exception {
        ContactList list = new MethodScanner(detail, this.support);
        if (detail != null) {
            this.methods.cache(type, list);
        }
        return list;
    }
}
