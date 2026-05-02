package com.bea.xml.stream;

import java.io.IOException;
import java.io.Writer;
import javax.xml.namespace.QName;
import javax.xml.stream.Location;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.Characters;
import javax.xml.stream.events.EndElement;
import javax.xml.stream.events.StartElement;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/AttributeBase.class */
public class AttributeBase implements Attribute, Location {
    private String value;
    private QName name;
    private QName attributeType;
    private String locationURI;
    private int eventType = -1;
    private int line = -1;
    private int column = -1;
    private int characterOffset = 0;

    public AttributeBase(String prefix, String namespaceURI, String localName, String value, String attributeType) {
        this.name = new QName(namespaceURI, localName, prefix == null ? "" : prefix);
        this.value = value;
        this.attributeType = new QName(attributeType);
    }

    public AttributeBase(String prefix, String localName, String value) {
        this.name = new QName("", localName, prefix == null ? "" : prefix);
        this.value = value;
    }

    public AttributeBase(QName name, String value) {
        this.name = name;
        this.value = value;
    }

    public String toString() {
        if (this.name.getPrefix() != null && !this.name.getPrefix().equals("")) {
            return new StringBuffer().append("['").append(this.name.getNamespaceURI()).append("']:").append(this.name.getPrefix()).append(":").append(this.name.getLocalPart()).append("='").append(this.value).append("'").toString();
        }
        return new StringBuffer().append(this.name.getLocalPart()).append("='").append(this.value).append("'").toString();
    }

    public int getLineNumber() {
        return this.line;
    }

    public void setLineNumber(int line) {
        this.line = line;
    }

    public int getColumnNumber() {
        return this.column;
    }

    public void setColumnNumber(int col) {
        this.column = col;
    }

    public int getCharacterOffset() {
        return this.characterOffset;
    }

    public void setCharacterOffset(int c) {
        this.characterOffset = c;
    }

    public String getLocationURI() {
        return this.locationURI;
    }

    public void setLocationURI(String uri) {
        this.locationURI = uri;
    }

    public int getEventType() {
        return 10;
    }

    public boolean hasName() {
        return this.name != null;
    }

    public QName getName() {
        return this.name;
    }

    public boolean isNamespaceDeclaration() {
        return false;
    }

    public String getLocalName() {
        return this.name.getLocalPart();
    }

    public String getValue() {
        return this.value;
    }

    public String getDTDType() {
        return "CDATA";
    }

    public String getNamespaceURI() {
        return this.name.getNamespaceURI();
    }

    public void setNamespaceURI(String uri) {
        this.name = new QName(uri, this.name.getLocalPart());
    }

    public boolean isSpecified() {
        return true;
    }

    public boolean isStartElement() {
        return false;
    }

    public boolean isEndElement() {
        return false;
    }

    public boolean isEntityReference() {
        return false;
    }

    public boolean isProcessingInstruction() {
        return false;
    }

    public boolean isCharacters() {
        return false;
    }

    public boolean isAttribute() {
        return true;
    }

    public boolean isNamespace() {
        return false;
    }

    public boolean isStartDocument() {
        return false;
    }

    public boolean isEndDocument() {
        return false;
    }

    public boolean isEndEntity() {
        return false;
    }

    public boolean isStartEntity() {
        return false;
    }

    public String getPublicId() {
        return null;
    }

    public String getSystemId() {
        return null;
    }

    public Location getLocation() {
        return this;
    }

    public StartElement asStartElement() {
        throw new ClassCastException("cannnot cast AttributeBase to StartElement");
    }

    public EndElement asEndElement() {
        throw new ClassCastException("cannnot cast AttributeBase to EndElement");
    }

    public Characters asCharacters() {
        throw new ClassCastException("cannnot cast AttributeBase to Characters");
    }

    public void recycle() {
    }

    public boolean isDefault() {
        return true;
    }

    public String getSourceName() {
        return null;
    }

    public QName getSchemaType() {
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x008e A[Catch: IOException -> 0x0118, TryCatch #0 {IOException -> 0x0118, blocks: (B:2:0x0000, B:4:0x000c, B:6:0x0013, B:7:0x001e, B:12:0x0049, B:13:0x0053, B:18:0x0081, B:21:0x008e, B:24:0x009b, B:27:0x00aa, B:28:0x00b4, B:29:0x00d8, B:36:0x0109, B:30:0x00e1, B:31:0x00ea, B:34:0x00fa, B:35:0x0103, B:37:0x010f), top: B:42:0x0000 }] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0096  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void writeAsEncodedUnicode(java.io.Writer r6) throws javax.xml.stream.XMLStreamException {
        /*
            Method dump skipped, instructions count: 291
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bea.xml.stream.AttributeBase.writeAsEncodedUnicode(java.io.Writer):void");
    }

    public static void writeEncodedChar(Writer writer, char c) throws IOException {
        writer.write("&#");
        writer.write(Integer.toString(c));
        writer.write(59);
    }
}
