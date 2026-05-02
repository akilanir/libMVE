package org.dmfs.xmlobjects.builder;

import java.io.IOException;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.XmlContext;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.serializer.SerializerContext;
import org.dmfs.xmlobjects.serializer.SerializerException;
import org.dmfs.xmlobjects.serializer.XmlObjectSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/TransientObjectBuilder.class */
public class TransientObjectBuilder<T> extends AbstractObjectBuilder<T> {
    private final ElementDescriptor<T> mChildDescriptor;
    private final IObjectBuilder<T> mChildBuilder;

    public TransientObjectBuilder(ElementDescriptor<T> elementDescriptor) {
        this.mChildDescriptor = elementDescriptor;
        this.mChildBuilder = null;
    }

    public TransientObjectBuilder(IObjectBuilder<T> iObjectBuilder) {
        this.mChildDescriptor = null;
        this.mChildBuilder = iObjectBuilder;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public <V> T update(ElementDescriptor<T> elementDescriptor, T t, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        return (elementDescriptor2 == this.mChildDescriptor || (this.mChildDescriptor == null && elementDescriptor2 != null && this.mChildBuilder == elementDescriptor2.builder)) ? v : t;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public void writeChildren(ElementDescriptor<T> elementDescriptor, T t, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        if (t != 0) {
            XmlContext xmlContext = serializerContext.getXmlContext();
            if (this.mChildDescriptor == null && (t instanceof QualifiedName)) {
                iXmlChildWriter.writeChild(ElementDescriptor.get((QualifiedName) t, elementDescriptor, xmlContext), t, serializerContext);
            } else {
                iXmlChildWriter.writeChild(this.mChildDescriptor, t, serializerContext);
            }
        }
    }
}
