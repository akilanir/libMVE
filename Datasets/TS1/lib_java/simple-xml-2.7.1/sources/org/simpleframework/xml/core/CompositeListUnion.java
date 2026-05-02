package org.simpleframework.xml.core;

import java.util.Collection;
import java.util.Collections;
import org.simpleframework.xml.strategy.Type;
import org.simpleframework.xml.stream.InputNode;
import org.simpleframework.xml.stream.OutputNode;
import org.simpleframework.xml.stream.Style;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/CompositeListUnion.class */
class CompositeListUnion implements Repeater {
    private final LabelMap elements;
    private final Expression path;
    private final Context context;
    private final Group group;
    private final Style style;
    private final Type type;

    public CompositeListUnion(Context context, Group group, Expression path, Type type) throws Exception {
        this.elements = group.getElements();
        this.style = context.getStyle();
        this.context = context;
        this.group = group;
        this.type = type;
        this.path = path;
    }

    @Override // org.simpleframework.xml.core.Converter
    public Object read(InputNode node) throws Exception {
        Label text = this.group.getText();
        if (text == null) {
            return readElement(node);
        }
        return readText(node);
    }

    private Object readElement(InputNode node) throws Exception {
        String name = node.getName();
        String element = this.path.getElement(name);
        Label label = this.elements.get(element);
        Converter converter = label.getConverter(this.context);
        return converter.read(node);
    }

    private Object readText(InputNode node) throws Exception {
        Label text = this.group.getText();
        Converter converter = text.getConverter(this.context);
        return converter.read(node);
    }

    @Override // org.simpleframework.xml.core.Repeater, org.simpleframework.xml.core.Converter
    public Object read(InputNode node, Object value) throws Exception {
        Object result = readElement(node, value);
        Label text = this.group.getText();
        if (text != null) {
            return readText(node, value);
        }
        return result;
    }

    private Object readElement(InputNode node, Object value) throws Exception {
        String name = node.getName();
        String element = this.path.getElement(name);
        Label label = this.elements.get(element);
        Converter converter = label.getConverter(this.context);
        return converter.read(node, value);
    }

    private Object readText(InputNode node, Object value) throws Exception {
        Label label = this.group.getText();
        Converter converter = label.getConverter(this.context);
        InputNode parent = node.getParent();
        return converter.read(parent, value);
    }

    @Override // org.simpleframework.xml.core.Converter
    public boolean validate(InputNode node) throws Exception {
        String name = node.getName();
        String element = this.path.getElement(name);
        Label label = this.elements.get(element);
        Converter converter = label.getConverter(this.context);
        return converter.validate(node);
    }

    @Override // org.simpleframework.xml.core.Converter
    public void write(OutputNode node, Object source) throws Exception {
        Collection list = (Collection) source;
        if (this.group.isInline()) {
            if (!list.isEmpty()) {
                write(node, list);
                return;
            } else {
                if (!node.isCommitted()) {
                    node.remove();
                    return;
                }
                return;
            }
        }
        write(node, list);
    }

    private void write(OutputNode node, Collection list) throws Exception {
        for (Object item : list) {
            if (item != null) {
                Class real = item.getClass();
                Label label = this.group.getLabel(real);
                if (label == null) {
                    throw new UnionException("Entry of %s not declared in %s with annotation %s", real, this.type, this.group);
                }
                write(node, item, label);
            }
        }
    }

    private void write(OutputNode node, Object item, Label label) throws Exception {
        Converter converter = label.getConverter(this.context);
        Collection list = Collections.singleton(item);
        if (!label.isInline()) {
            String name = label.getName();
            String root = this.style.getElement(name);
            if (!node.isCommitted()) {
                node.setName(root);
            }
        }
        converter.write(node, list);
    }
}
