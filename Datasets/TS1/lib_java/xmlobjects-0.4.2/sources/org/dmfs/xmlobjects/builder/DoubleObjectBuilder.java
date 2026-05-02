package org.dmfs.xmlobjects.builder;

import java.io.IOException;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.serializer.SerializerContext;
import org.dmfs.xmlobjects.serializer.SerializerException;
import org.dmfs.xmlobjects.serializer.XmlObjectSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/DoubleObjectBuilder.class */
public class DoubleObjectBuilder extends AbstractObjectBuilder<Double> {
    public static final DoubleObjectBuilder INSTANCE_STRICT = new DoubleObjectBuilder(true);
    public static final DoubleObjectBuilder INSTANCE = new DoubleObjectBuilder(false);
    private final boolean mStrict;

    private DoubleObjectBuilder(boolean z) {
        this.mStrict = z;
    }

    public Double update(ElementDescriptor<Double> elementDescriptor, Double d, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        if (str == null && !this.mStrict) {
            return null;
        }
        try {
            return Double.valueOf(Double.parseDouble(this.mStrict ? str : str.trim()));
        } catch (NumberFormatException e) {
            if (this.mStrict) {
                throw new XmlObjectPullParserException("could not parse double in '" + str + "'", e);
            }
            return null;
        }
    }

    public void writeChildren(ElementDescriptor<Double> elementDescriptor, Double d, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        if (d != null) {
            iXmlChildWriter.writeText(d.toString(), serializerContext);
        } else if (this.mStrict) {
            throw new IllegalStateException("Double value is null");
        }
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ void writeChildren(ElementDescriptor elementDescriptor, Object obj, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        writeChildren((ElementDescriptor<Double>) elementDescriptor, (Double) obj, iXmlChildWriter, serializerContext);
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Double>) elementDescriptor, (Double) obj, str, parserContext);
    }
}
