package org.dmfs.xmlobjects.builder;

import java.io.IOException;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.serializer.SerializerContext;
import org.dmfs.xmlobjects.serializer.SerializerException;
import org.dmfs.xmlobjects.serializer.XmlObjectSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/IObjectBuilder.class */
public interface IObjectBuilder<T> {
    T get(ElementDescriptor<T> elementDescriptor, T t, ParserContext parserContext) throws XmlObjectPullParserException;

    T update(ElementDescriptor<T> elementDescriptor, T t, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException;

    T update(ElementDescriptor<T> elementDescriptor, T t, String str, ParserContext parserContext) throws XmlObjectPullParserException;

    <V> T update(ElementDescriptor<T> elementDescriptor, T t, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException;

    <V> T update(ElementDescriptor<T> elementDescriptor, T t, QualifiedName qualifiedName, IObjectBuilder<V> iObjectBuilder, V v, ParserContext parserContext) throws XmlObjectPullParserException;

    T finish(ElementDescriptor<T> elementDescriptor, T t, ParserContext parserContext) throws XmlObjectPullParserException;

    void writeAttributes(ElementDescriptor<T> elementDescriptor, T t, XmlObjectSerializer.IXmlAttributeWriter iXmlAttributeWriter, SerializerContext serializerContext) throws SerializerException, IOException;

    void writeChildren(ElementDescriptor<T> elementDescriptor, T t, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException;
}
