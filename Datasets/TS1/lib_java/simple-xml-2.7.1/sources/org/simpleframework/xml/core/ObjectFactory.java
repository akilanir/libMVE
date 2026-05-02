package org.simpleframework.xml.core;

import org.simpleframework.xml.strategy.Type;
import org.simpleframework.xml.strategy.Value;
import org.simpleframework.xml.stream.InputNode;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ObjectFactory.class */
class ObjectFactory extends PrimitiveFactory {
    public ObjectFactory(Context context, Type type, Class override) {
        super(context, type, override);
    }

    @Override // org.simpleframework.xml.core.PrimitiveFactory
    public Instance getInstance(InputNode node) throws Exception {
        Value value = getOverride(node);
        Class expect = getType();
        if (value == null) {
            if (!isInstantiable(expect)) {
                throw new InstantiationException("Cannot instantiate %s for %s", expect, this.type);
            }
            return this.context.getInstance(expect);
        }
        return new ObjectInstance(this.context, value);
    }
}
