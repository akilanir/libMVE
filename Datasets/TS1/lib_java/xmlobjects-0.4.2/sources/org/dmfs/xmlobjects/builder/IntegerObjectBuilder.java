package org.dmfs.xmlobjects.builder;

import java.io.IOException;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.serializer.SerializerContext;
import org.dmfs.xmlobjects.serializer.SerializerException;
import org.dmfs.xmlobjects.serializer.XmlObjectSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/IntegerObjectBuilder.class */
public class IntegerObjectBuilder extends AbstractObjectBuilder<Integer> {
    public static final IntegerObjectBuilder INSTANCE_STRICT = new IntegerObjectBuilder(true);
    public static final IntegerObjectBuilder INSTANCE = new IntegerObjectBuilder(false);
    private final boolean mStrict;

    private IntegerObjectBuilder(boolean z) {
        this.mStrict = z;
    }

    public Integer update(ElementDescriptor<Integer> elementDescriptor, Integer num, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        if (str == null && !this.mStrict) {
            return null;
        }
        try {
            return Integer.valueOf(Integer.parseInt(this.mStrict ? str : str.trim()));
        } catch (NumberFormatException e) {
            if (this.mStrict) {
                throw new XmlObjectPullParserException("could not parse integer in '" + str + "'", e);
            }
            return null;
        }
    }

    public void writeChildren(ElementDescriptor<Integer> elementDescriptor, Integer num, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        if (num != null) {
            iXmlChildWriter.writeText(num.toString(), serializerContext);
        } else if (this.mStrict) {
            throw new IllegalStateException("Integer value is null");
        }
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ void writeChildren(ElementDescriptor elementDescriptor, Object obj, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        writeChildren((ElementDescriptor<Integer>) elementDescriptor, (Integer) obj, iXmlChildWriter, serializerContext);
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Integer>) elementDescriptor, (Integer) obj, str, parserContext);
    }
}
