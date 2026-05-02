package org.dmfs.xmlobjects.builder;

import java.io.IOException;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.serializer.SerializerContext;
import org.dmfs.xmlobjects.serializer.SerializerException;
import org.dmfs.xmlobjects.serializer.XmlObjectSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/AbstractObjectBuilder.class */
public abstract class AbstractObjectBuilder<T> implements IObjectBuilder<T> {
    @Override // org.dmfs.xmlobjects.builder.IObjectBuilder
    public T get(ElementDescriptor<T> elementDescriptor, T t, ParserContext parserContext) throws XmlObjectPullParserException {
        return null;
    }

    @Override // org.dmfs.xmlobjects.builder.IObjectBuilder
    public T update(ElementDescriptor<T> elementDescriptor, T t, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return t;
    }

    @Override // org.dmfs.xmlobjects.builder.IObjectBuilder
    public T update(ElementDescriptor<T> elementDescriptor, T t, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return t;
    }

    @Override // org.dmfs.xmlobjects.builder.IObjectBuilder
    public <V> T update(ElementDescriptor<T> elementDescriptor, T t, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        return t;
    }

    @Override // org.dmfs.xmlobjects.builder.IObjectBuilder
    public <V> T update(ElementDescriptor<T> elementDescriptor, T t, QualifiedName qualifiedName, IObjectBuilder<V> iObjectBuilder, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        return t;
    }

    @Override // org.dmfs.xmlobjects.builder.IObjectBuilder
    public T finish(ElementDescriptor<T> elementDescriptor, T t, ParserContext parserContext) throws XmlObjectPullParserException {
        return t;
    }

    @Override // org.dmfs.xmlobjects.builder.IObjectBuilder
    public void writeAttributes(ElementDescriptor<T> elementDescriptor, T t, XmlObjectSerializer.IXmlAttributeWriter iXmlAttributeWriter, SerializerContext serializerContext) throws SerializerException, IOException {
    }

    @Override // org.dmfs.xmlobjects.builder.IObjectBuilder
    public void writeChildren(ElementDescriptor<T> elementDescriptor, T t, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
    }
}
