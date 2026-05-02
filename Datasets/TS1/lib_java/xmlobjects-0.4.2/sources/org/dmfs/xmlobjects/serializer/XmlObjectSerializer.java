package org.dmfs.xmlobjects.serializer;

import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;
import java.util.HashSet;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/serializer/XmlObjectSerializer.class */
public class XmlObjectSerializer {
    private static final char[] PREFIX_CHARS = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
    private final IXmlAttributeWriter mAttributeWriter = new IXmlAttributeWriter() { // from class: org.dmfs.xmlobjects.serializer.XmlObjectSerializer.1
        @Override // org.dmfs.xmlobjects.serializer.XmlObjectSerializer.IXmlAttributeWriter
        public void writeAttribute(QualifiedName qualifiedName, String str, SerializerContext serializerContext) throws SerializerException, IOException {
            try {
                serializerContext.serializer.attribute(qualifiedName.namespace, qualifiedName.name, str);
            } catch (IllegalArgumentException e) {
                throw new SerializerException("can not serialize attribute " + qualifiedName, e);
            } catch (IllegalStateException e2) {
                throw new SerializerException("can not serialize attribute " + qualifiedName, e2);
            }
        }
    };
    private final IXmlChildWriter mChildWriter = new IXmlChildWriter() { // from class: org.dmfs.xmlobjects.serializer.XmlObjectSerializer.2
        @Override // org.dmfs.xmlobjects.serializer.XmlObjectSerializer.IXmlChildWriter
        public <T> void writeChild(ElementDescriptor<T> elementDescriptor, T t, SerializerContext serializerContext) throws SerializerException, IOException {
            QualifiedName qualifiedName = elementDescriptor.qualifiedName;
            if (elementDescriptor.builder == null) {
                throw new SerializerException(qualifiedName + " is not serializable");
            }
            try {
                serializerContext.serializer.startTag(qualifiedName.namespace, qualifiedName.name);
                elementDescriptor.builder.writeAttributes(elementDescriptor, t, XmlObjectSerializer.this.mAttributeWriter, serializerContext);
                elementDescriptor.builder.writeChildren(elementDescriptor, t, XmlObjectSerializer.this.mChildWriter, serializerContext);
                serializerContext.serializer.endTag(qualifiedName.namespace, qualifiedName.name);
            } catch (IllegalArgumentException e) {
                throw new SerializerException("can not serialize element " + qualifiedName, e);
            } catch (IllegalStateException e2) {
                throw new SerializerException("can not serialize element " + qualifiedName, e2);
            }
        }

        @Override // org.dmfs.xmlobjects.serializer.XmlObjectSerializer.IXmlChildWriter
        public void writeText(String str, SerializerContext serializerContext) throws SerializerException, IOException {
            if (str != null) {
                try {
                    serializerContext.serializer.text(str);
                } catch (IllegalArgumentException e) {
                    throw new SerializerException("can not serialize text '" + str + "'", e);
                } catch (IllegalStateException e2) {
                    throw new SerializerException("can not serialize text '" + str + "'", e2);
                }
            }
        }
    };

    /* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter.class */
    public interface IXmlAttributeWriter {
        void writeAttribute(QualifiedName qualifiedName, String str, SerializerContext serializerContext) throws SerializerException, IOException;
    }

    /* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter.class */
    public interface IXmlChildWriter {
        <T> void writeChild(ElementDescriptor<T> elementDescriptor, T t, SerializerContext serializerContext) throws SerializerException, IOException;

        void writeText(String str, SerializerContext serializerContext) throws SerializerException, IOException;
    }

    public XmlObjectSerializer setOutput(SerializerContext serializerContext, Writer writer) throws SerializerException, IOException {
        try {
            serializerContext.serializer.setOutput(writer);
            return this;
        } catch (IllegalArgumentException e) {
            throw new SerializerException("can't configure serializer", e);
        } catch (IllegalStateException e2) {
            throw new SerializerException("can't configure serializer", e2);
        }
    }

    public XmlObjectSerializer setOutput(SerializerContext serializerContext, OutputStream outputStream, String str) throws SerializerException, IOException {
        try {
            serializerContext.serializer.setOutput(outputStream, str == null ? "UTF-8" : str);
            return this;
        } catch (IllegalArgumentException e) {
            throw new SerializerException("can't configure serializer", e);
        } catch (IllegalStateException e2) {
            throw new SerializerException("can't configure serializer", e2);
        }
    }

    public void useNamespace(SerializerContext serializerContext, String str) {
        if (str == null || str.length() <= 0) {
            return;
        }
        if (serializerContext.knownNamespaces == null) {
            serializerContext.knownNamespaces = new HashSet(8);
        }
        serializerContext.knownNamespaces.add(str);
    }

    public void useNamespace(SerializerContext serializerContext, QualifiedName qualifiedName) {
        useNamespace(serializerContext, qualifiedName.namespace);
    }

    public void useNamespace(SerializerContext serializerContext, ElementDescriptor<?> elementDescriptor) {
        useNamespace(serializerContext, elementDescriptor.qualifiedName.namespace);
    }

    public <T> void serialize(SerializerContext serializerContext, ElementDescriptor<T> elementDescriptor, T t) throws SerializerException, IOException {
        serializerContext.serializer.startDocument(null, null);
        useNamespace(serializerContext, elementDescriptor.qualifiedName);
        bindNamespaces(serializerContext);
        this.mChildWriter.writeChild(elementDescriptor, t, serializerContext);
        serializerContext.serializer.endDocument();
    }

    private void bindNamespaces(SerializerContext serializerContext) throws IOException {
        if (serializerContext.knownNamespaces == null) {
            return;
        }
        StringBuilder sb = new StringBuilder(8);
        int i = 0;
        for (String str : serializerContext.knownNamespaces) {
            int i2 = i;
            do {
                sb.append(PREFIX_CHARS[i2 % PREFIX_CHARS.length]);
                i2 /= PREFIX_CHARS.length;
            } while (i2 > 0);
            serializerContext.serializer.setPrefix(sb.toString(), str);
            sb.setLength(0);
            i++;
        }
    }
}
