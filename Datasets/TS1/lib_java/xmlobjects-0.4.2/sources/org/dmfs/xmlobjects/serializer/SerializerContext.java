package org.dmfs.xmlobjects.serializer;

import java.util.Set;
import org.dmfs.xmlobjects.XmlContext;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/serializer/SerializerContext.class */
public class SerializerContext {
    XmlContext xmlContext;
    XmlSerializer serializer;
    Set<String> knownNamespaces;

    public SerializerContext(XmlContext xmlContext) throws SerializerException {
        this.xmlContext = xmlContext;
        try {
            this.serializer = XmlPullParserFactory.newInstance().newSerializer();
        } catch (XmlPullParserException e) {
            throw new SerializerException("can't get serializer", e);
        }
    }

    public XmlContext getXmlContext() {
        return this.xmlContext;
    }
}
