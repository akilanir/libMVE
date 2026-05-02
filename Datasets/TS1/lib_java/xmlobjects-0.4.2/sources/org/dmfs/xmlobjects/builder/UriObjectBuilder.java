package org.dmfs.xmlobjects.builder;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.serializer.SerializerContext;
import org.dmfs.xmlobjects.serializer.SerializerException;
import org.dmfs.xmlobjects.serializer.XmlObjectSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/UriObjectBuilder.class */
public class UriObjectBuilder extends AbstractObjectBuilder<URI> {
    public static final UriObjectBuilder INSTANCE_STRICT = new UriObjectBuilder(true);
    public static final UriObjectBuilder INSTANCE = new UriObjectBuilder(false);
    private final boolean mStrict;

    private UriObjectBuilder(boolean z) {
        this.mStrict = z;
    }

    public URI update(ElementDescriptor<URI> elementDescriptor, URI uri, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        if (str == null && !this.mStrict) {
            return null;
        }
        try {
            return new URI(this.mStrict ? str : str.trim());
        } catch (URISyntaxException e) {
            if (this.mStrict) {
                throw new XmlObjectPullParserException("could not parse URI in '" + str + "'", e);
            }
            return null;
        }
    }

    public void writeChildren(ElementDescriptor<URI> elementDescriptor, URI uri, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        if (uri != null) {
            iXmlChildWriter.writeText(uri.toASCIIString(), serializerContext);
        } else if (this.mStrict) {
            throw new IllegalStateException("URI value is null");
        }
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ void writeChildren(ElementDescriptor elementDescriptor, Object obj, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        writeChildren((ElementDescriptor<URI>) elementDescriptor, (URI) obj, iXmlChildWriter, serializerContext);
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<URI>) elementDescriptor, (URI) obj, str, parserContext);
    }
}
