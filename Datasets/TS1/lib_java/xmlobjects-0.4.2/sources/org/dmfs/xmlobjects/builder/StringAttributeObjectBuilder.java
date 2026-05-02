package org.dmfs.xmlobjects.builder;

import java.io.IOException;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.serializer.SerializerContext;
import org.dmfs.xmlobjects.serializer.SerializerException;
import org.dmfs.xmlobjects.serializer.XmlObjectSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/StringAttributeObjectBuilder.class */
public class StringAttributeObjectBuilder extends AbstractObjectBuilder<String> {
    public final QualifiedName attribute;

    public StringAttributeObjectBuilder(QualifiedName qualifiedName) {
        this.attribute = qualifiedName;
    }

    public String update(ElementDescriptor<String> elementDescriptor, String str, QualifiedName qualifiedName, String str2, ParserContext parserContext) throws XmlObjectPullParserException {
        return this.attribute == qualifiedName ? str2 : str;
    }

    public void writeAttributes(ElementDescriptor<String> elementDescriptor, String str, XmlObjectSerializer.IXmlAttributeWriter iXmlAttributeWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        iXmlAttributeWriter.writeAttribute(this.attribute, str, serializerContext);
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ void writeAttributes(ElementDescriptor elementDescriptor, Object obj, XmlObjectSerializer.IXmlAttributeWriter iXmlAttributeWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        writeAttributes((ElementDescriptor<String>) elementDescriptor, (String) obj, iXmlAttributeWriter, serializerContext);
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<String>) elementDescriptor, (String) obj, qualifiedName, str, parserContext);
    }
}
