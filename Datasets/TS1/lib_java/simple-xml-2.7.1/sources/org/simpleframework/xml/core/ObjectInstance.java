package org.simpleframework.xml.core;

import org.simpleframework.xml.strategy.Value;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ObjectInstance.class */
class ObjectInstance implements Instance {
    private final Context context;
    private final Value value;
    private final Class type;

    public ObjectInstance(Context context, Value value) {
        this.type = value.getType();
        this.context = context;
        this.value = value;
    }

    @Override // org.simpleframework.xml.core.Instance
    public Object getInstance() throws Exception {
        if (this.value.isReference()) {
            return this.value.getValue();
        }
        Object object = getInstance(this.type);
        if (this.value != null) {
            this.value.setValue(object);
        }
        return object;
    }

    public Object getInstance(Class type) throws Exception {
        Instance value = this.context.getInstance(type);
        Object object = value.getInstance();
        return object;
    }

    @Override // org.simpleframework.xml.core.Instance
    public Object setInstance(Object object) {
        if (this.value != null) {
            this.value.setValue(object);
        }
        return object;
    }

    @Override // org.simpleframework.xml.core.Instance
    public boolean isReference() {
        return this.value.isReference();
    }

    @Override // org.simpleframework.xml.core.Instance
    public Class getType() {
        return this.type;
    }
}
