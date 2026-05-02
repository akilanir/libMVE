package com.fasterxml.jackson.databind.ext;

import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.deser.std.FromStringDeserializer;
import java.io.StringReader;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ext/DOMDeserializer.class */
public abstract class DOMDeserializer<T> extends FromStringDeserializer<T> {
    private static final long serialVersionUID = 1;
    private static final DocumentBuilderFactory _parserFactory = DocumentBuilderFactory.newInstance();

    @Override // com.fasterxml.jackson.databind.deser.std.FromStringDeserializer
    public abstract T _deserialize(String str, DeserializationContext deserializationContext);

    static {
        _parserFactory.setNamespaceAware(true);
    }

    protected DOMDeserializer(Class<T> cls) {
        super(cls);
    }

    protected final Document parse(String value) throws IllegalArgumentException {
        try {
            return _parserFactory.newDocumentBuilder().parse(new InputSource(new StringReader(value)));
        } catch (Exception e) {
            throw new IllegalArgumentException("Failed to parse JSON String as XML: " + e.getMessage(), e);
        }
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ext/DOMDeserializer$NodeDeserializer.class */
    public static class NodeDeserializer extends DOMDeserializer<Node> {
        private static final long serialVersionUID = 1;

        public NodeDeserializer() {
            super(Node.class);
        }

        @Override // com.fasterxml.jackson.databind.ext.DOMDeserializer, com.fasterxml.jackson.databind.deser.std.FromStringDeserializer
        public Node _deserialize(String value, DeserializationContext ctxt) throws IllegalArgumentException {
            return parse(value);
        }
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ext/DOMDeserializer$DocumentDeserializer.class */
    public static class DocumentDeserializer extends DOMDeserializer<Document> {
        private static final long serialVersionUID = 1;

        public DocumentDeserializer() {
            super(Document.class);
        }

        @Override // com.fasterxml.jackson.databind.ext.DOMDeserializer, com.fasterxml.jackson.databind.deser.std.FromStringDeserializer
        public Document _deserialize(String value, DeserializationContext ctxt) throws IllegalArgumentException {
            return parse(value);
        }
    }
}
