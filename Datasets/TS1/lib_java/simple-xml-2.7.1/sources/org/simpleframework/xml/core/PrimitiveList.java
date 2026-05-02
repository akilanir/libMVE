package org.simpleframework.xml.core;

import java.util.Collection;
import org.simpleframework.xml.strategy.Type;
import org.simpleframework.xml.stream.InputNode;
import org.simpleframework.xml.stream.OutputNode;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/PrimitiveList.class */
class PrimitiveList implements Converter {
    private final CollectionFactory factory;
    private final Primitive root;
    private final String parent;
    private final Type entry;

    public PrimitiveList(Context context, Type type, Type entry, String parent) {
        this.factory = new CollectionFactory(context, type);
        this.root = new Primitive(context, entry);
        this.parent = parent;
        this.entry = entry;
    }

    @Override // org.simpleframework.xml.core.Converter
    public Object read(InputNode node) throws Exception {
        Instance type = this.factory.getInstance(node);
        Object list = type.getInstance();
        if (!type.isReference()) {
            return populate(node, list);
        }
        return list;
    }

    @Override // org.simpleframework.xml.core.Converter
    public Object read(InputNode node, Object result) throws Exception {
        Instance type = this.factory.getInstance(node);
        if (type.isReference()) {
            return type.getInstance();
        }
        type.setInstance(result);
        if (result != null) {
            return populate(node, result);
        }
        return result;
    }

    private Object populate(InputNode node, Object result) throws Exception {
        Collection list = (Collection) result;
        while (true) {
            InputNode next = node.getNext();
            if (next == null) {
                return list;
            }
            list.add(this.root.read(next));
        }
    }

    @Override // org.simpleframework.xml.core.Converter
    public boolean validate(InputNode node) throws Exception {
        Instance value = this.factory.getInstance(node);
        if (!value.isReference()) {
            value.setInstance(null);
            Class expect = value.getType();
            return validate(node, expect);
        }
        return true;
    }

    private boolean validate(InputNode node, Class type) throws Exception {
        while (true) {
            InputNode next = node.getNext();
            if (next == null) {
                return true;
            }
            this.root.validate(next);
        }
    }

    @Override // org.simpleframework.xml.core.Converter
    public void write(OutputNode node, Object source) throws Exception {
        Collection list = (Collection) source;
        for (Object item : list) {
            if (item != null) {
                OutputNode child = node.getChild(this.parent);
                if (!isOverridden(child, item)) {
                    this.root.write(child, item);
                }
            }
        }
    }

    private boolean isOverridden(OutputNode node, Object value) throws Exception {
        return this.factory.setOverride(this.entry, value, node);
    }
}
