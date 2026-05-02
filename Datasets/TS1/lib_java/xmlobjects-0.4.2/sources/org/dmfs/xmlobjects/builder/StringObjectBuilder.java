package org.dmfs.xmlobjects.builder;

import java.io.IOException;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.serializer.SerializerContext;
import org.dmfs.xmlobjects.serializer.SerializerException;
import org.dmfs.xmlobjects.serializer.XmlObjectSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/StringObjectBuilder.class */
public class StringObjectBuilder extends AbstractObjectBuilder<String> {
    public static final StringObjectBuilder INSTANCE = new StringObjectBuilder();

    private StringObjectBuilder() {
    }

    public String update(ElementDescriptor<String> elementDescriptor, String str, String str2, ParserContext parserContext) throws XmlObjectPullParserException {
        return str2;
    }

    public void writeChildren(ElementDescriptor<String> elementDescriptor, String str, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        iXmlChildWriter.writeText(str, serializerContext);
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ void writeChildren(ElementDescriptor elementDescriptor, Object obj, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        writeChildren((ElementDescriptor<String>) elementDescriptor, (String) obj, iXmlChildWriter, serializerContext);
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<String>) elementDescriptor, (String) obj, str, parserContext);
    }
}
