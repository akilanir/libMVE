package com.bea.xml.stream;

import com.bea.xml.stream.util.NamespaceContextImpl;
import com.bea.xml.stream.util.Stack;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.util.HashSet;
import java.util.Iterator;
import javax.xml.namespace.NamespaceContext;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamWriter;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/XMLWriterBase.class */
public class XMLWriterBase extends ReaderToWriter implements XMLStreamWriter {
    protected static final String DEFAULTNS = "";
    private Writer writer;
    private ConfigurationContextBase config;
    private CharsetEncoder encoder;
    private HashSet needToWrite;
    private boolean isPrefixDefaulting;
    private boolean startElementOpened = false;
    private boolean isEmpty = false;
    private Stack localNameStack = new Stack();
    private Stack prefixStack = new Stack();
    private Stack uriStack = new Stack();
    protected NamespaceContextImpl context = new NamespaceContextImpl();
    private int defaultPrefixCount = 0;
    private HashSet setNeedsWritingNs = new HashSet();

    public XMLWriterBase() {
    }

    public XMLWriterBase(Writer writer) {
        this.writer = writer;
        setWriter(writer);
    }

    public void setWriter(Writer writer) {
        this.writer = writer;
        setStreamWriter(this);
        if (writer instanceof OutputStreamWriter) {
            String charsetName = ((OutputStreamWriter) writer).getEncoding();
            this.encoder = Charset.forName(charsetName).newEncoder();
        } else {
            this.encoder = null;
        }
    }

    public void setConfigurationContext(ConfigurationContextBase c) {
        this.config = c;
        this.isPrefixDefaulting = this.config.isPrefixDefaulting();
    }

    protected void write(String s) throws XMLStreamException {
        try {
            this.writer.write(s);
        } catch (IOException e) {
            throw new XMLStreamException(e);
        }
    }

    protected void write(char c) throws XMLStreamException {
        try {
            this.writer.write(c);
        } catch (IOException e) {
            throw new XMLStreamException(e);
        }
    }

    protected void write(char[] c) throws XMLStreamException {
        try {
            this.writer.write(c);
        } catch (IOException e) {
            throw new XMLStreamException(e);
        }
    }

    protected void write(char[] c, int start, int len) throws XMLStreamException {
        try {
            this.writer.write(c, start, len);
        } catch (IOException e) {
            throw new XMLStreamException(e);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00a1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected void writeCharactersInternal(char[] r7, int r8, int r9, boolean r10) throws javax.xml.stream.XMLStreamException {
        /*
            r6 = this;
            r0 = r9
            if (r0 != 0) goto L5
            return
        L5:
            r0 = 0
            r11 = r0
        L8:
            r0 = r11
            r1 = r9
            if (r0 >= r1) goto L8f
            r0 = r7
            r1 = r11
            r2 = r8
            int r1 = r1 + r2
            char r0 = r0[r1]
            r12 = r0
            r0 = r12
            switch(r0) {
                case 34: goto L44;
                case 38: goto L4c;
                case 60: goto L4c;
                case 62: goto L4c;
                default: goto L4f;
            }
        L44:
            r0 = r10
            if (r0 != 0) goto L4c
            goto L89
        L4c:
            goto L8f
        L4f:
            r0 = r12
            r1 = 32
            if (r0 >= r1) goto L6c
            r0 = r10
            if (r0 != 0) goto L8f
            r0 = r12
            r1 = 9
            if (r0 == r1) goto L89
            r0 = r12
            r1 = 10
            if (r0 == r1) goto L89
            goto L8f
        L6c:
            r0 = r12
            r1 = 127(0x7f, float:1.78E-43)
            if (r0 <= r1) goto L89
            r0 = r6
            java.nio.charset.CharsetEncoder r0 = r0.encoder
            if (r0 == 0) goto L89
            r0 = r6
            java.nio.charset.CharsetEncoder r0 = r0.encoder
            r1 = r12
            boolean r0 = r0.canEncode(r1)
            if (r0 != 0) goto L89
            goto L8f
        L89:
            int r11 = r11 + 1
            goto L8
        L8f:
            r0 = r11
            r1 = r9
            if (r0 >= r1) goto La1
            r0 = r6
            r1 = r7
            r2 = r8
            r3 = r9
            r4 = r10
            r0.slowWriteCharacters(r1, r2, r3, r4)
            goto La8
        La1:
            r0 = r6
            r1 = r7
            r2 = r8
            r3 = r9
            r0.write(r1, r2, r3)
        La8:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bea.xml.stream.XMLWriterBase.writeCharactersInternal(char[], int, int, boolean):void");
    }

    private void slowWriteCharacters(char[] chars, int start, int length, boolean isAttributeValue) throws XMLStreamException {
        for (int i = 0; i < length; i++) {
            char c = chars[i + start];
            switch (c) {
                case '\"':
                    if (isAttributeValue) {
                        write("&quot;");
                    }
                    break;
                case '&':
                    write("&amp;");
                    continue;
                case '<':
                    write("&lt;");
                    continue;
                case '>':
                    write("&gt;");
                    continue;
                default:
                    if (c < ' ') {
                        if (isAttributeValue || (c != '\t' && c != '\n')) {
                            write("&#");
                            write(Integer.toString(c));
                            write(';');
                        }
                    } else if (c > 127 && this.encoder != null && !this.encoder.canEncode(c)) {
                        write("&#");
                        write(Integer.toString(c));
                        write(';');
                    }
                    break;
            }
            write(c);
        }
    }

    protected void closeStartElement() throws XMLStreamException {
        if (this.startElementOpened) {
            closeStartTag();
            this.startElementOpened = false;
        }
    }

    protected boolean isOpen() {
        return this.startElementOpened;
    }

    protected void closeStartTag() throws XMLStreamException {
        flushNamespace();
        clearNeedsWritingNs();
        if (this.isEmpty) {
            write("/>");
            this.isEmpty = false;
        } else {
            write(">");
        }
    }

    private void openStartElement() throws XMLStreamException {
        if (this.startElementOpened) {
            closeStartTag();
        } else {
            this.startElementOpened = true;
        }
    }

    protected String writeName(String prefix, String namespaceURI, String localName) throws XMLStreamException {
        if (!DEFAULTNS.equals(namespaceURI)) {
            prefix = getPrefixInternal(namespaceURI);
        }
        if (!DEFAULTNS.equals(prefix)) {
            write(prefix);
            write(":");
        }
        write(localName);
        return prefix;
    }

    private String getPrefixInternal(String namespaceURI) {
        String prefix = this.context.getPrefix(namespaceURI);
        if (prefix == null) {
            return DEFAULTNS;
        }
        return prefix;
    }

    protected String getURIInternal(String prefix) {
        String uri = this.context.getNamespaceURI(prefix);
        if (uri == null) {
            return DEFAULTNS;
        }
        return uri;
    }

    protected void openStartTag() throws XMLStreamException {
        write("<");
    }

    private boolean needToWrite(String uri) {
        if (this.needToWrite == null) {
            this.needToWrite = new HashSet();
        }
        boolean needs = this.needToWrite.contains(uri);
        this.needToWrite.add(uri);
        return needs;
    }

    private void prepareNamespace(String uri) throws XMLStreamException {
        if (this.isPrefixDefaulting && !DEFAULTNS.equals(uri)) {
            String prefix = getPrefix(uri);
            if (prefix != null) {
                return;
            }
            this.defaultPrefixCount++;
            String prefix2 = new StringBuffer().append("ns").append(this.defaultPrefixCount).toString();
            setPrefix(prefix2, uri);
        }
    }

    private void removeNamespace(String uri) {
        if (!this.isPrefixDefaulting || this.needToWrite == null) {
            return;
        }
        this.needToWrite.remove(uri);
    }

    private void flushNamespace() throws XMLStreamException {
        if (!this.isPrefixDefaulting || this.needToWrite == null) {
            return;
        }
        Iterator i = this.needToWrite.iterator();
        while (i.hasNext()) {
            String uri = (String) i.next();
            String prefix = this.context.getPrefix(uri);
            if (prefix == null) {
                throw new XMLStreamException(new StringBuffer().append("Unable to default prefix with uri:").append(uri).toString());
            }
            writeNamespace(prefix, uri);
        }
        this.needToWrite.clear();
    }

    protected void writeStartElementInternal(String namespaceURI, String localName) throws XMLStreamException {
        if (namespaceURI == null) {
            throw new IllegalArgumentException("The namespace URI may not be null");
        }
        if (localName == null) {
            throw new IllegalArgumentException("The local name  may not be null");
        }
        openStartElement();
        openStartTag();
        prepareNamespace(namespaceURI);
        this.prefixStack.push(writeName(DEFAULTNS, namespaceURI, localName));
        this.localNameStack.push(localName);
        this.uriStack.push(namespaceURI);
    }

    public void writeStartElement(String namespaceURI, String localName) throws XMLStreamException {
        this.context.openScope();
        writeStartElementInternal(namespaceURI, localName);
    }

    public void writeStartElement(String prefix, String localName, String namespaceURI) throws XMLStreamException {
        if (namespaceURI == null) {
            throw new IllegalArgumentException("The namespace URI may not be null");
        }
        if (localName == null) {
            throw new IllegalArgumentException("The local name may not be null");
        }
        if (prefix == null) {
            throw new IllegalArgumentException("The prefix may not be null");
        }
        this.context.openScope();
        prepareNamespace(namespaceURI);
        this.context.bindNamespace(prefix, namespaceURI);
        writeStartElementInternal(namespaceURI, localName);
    }

    public void writeStartElement(String localName) throws XMLStreamException {
        this.context.openScope();
        writeStartElement(DEFAULTNS, localName);
    }

    public void writeEmptyElement(String namespaceURI, String localName) throws XMLStreamException {
        openStartElement();
        prepareNamespace(namespaceURI);
        this.isEmpty = true;
        write("<");
        writeName(DEFAULTNS, namespaceURI, localName);
    }

    public void writeEmptyElement(String prefix, String localName, String namespaceURI) throws XMLStreamException {
        openStartElement();
        prepareNamespace(namespaceURI);
        this.isEmpty = true;
        write("<");
        write(prefix);
        write(":");
        write(localName);
    }

    public void writeEmptyElement(String localName) throws XMLStreamException {
        writeEmptyElement(DEFAULTNS, localName);
    }

    protected void openEndTag() throws XMLStreamException {
        write("</");
    }

    protected void closeEndTag() throws XMLStreamException {
        write(">");
    }

    public void writeEndElement() throws XMLStreamException {
        if (isOpen()) {
            closeStartElement();
        }
        String prefix = (String) this.prefixStack.pop();
        String local = (String) this.localNameStack.pop();
        this.uriStack.pop();
        openEndTag();
        writeName(prefix, DEFAULTNS, local);
        closeEndTag();
        this.context.closeScope();
    }

    public void writeRaw(String data) throws XMLStreamException {
        closeStartElement();
        write(data);
    }

    public void close() throws XMLStreamException {
        flush();
    }

    public void flush() throws XMLStreamException {
        try {
            this.writer.flush();
        } catch (IOException e) {
            throw new XMLStreamException(e);
        }
    }

    public void writeEndDocument() throws XMLStreamException {
        while (!this.localNameStack.isEmpty()) {
            writeEndElement();
        }
    }

    public void writeAttribute(String localName, String value) throws XMLStreamException {
        writeAttribute(DEFAULTNS, localName, value);
    }

    public void writeAttribute(String namespaceURI, String localName, String value) throws XMLStreamException {
        if (!isOpen()) {
            throw new XMLStreamException("A start element must be written before an attribute");
        }
        prepareNamespace(namespaceURI);
        write(" ");
        writeName(DEFAULTNS, namespaceURI, localName);
        write("=\"");
        writeCharactersInternal(value.toCharArray(), 0, value.length(), true);
        write("\"");
    }

    public void writeAttribute(String prefix, String namespaceURI, String localName, String value) throws XMLStreamException {
        if (!isOpen()) {
            throw new XMLStreamException("A start element must be written before an attribute");
        }
        prepareNamespace(namespaceURI);
        this.context.bindNamespace(prefix, namespaceURI);
        write(" ");
        writeName(prefix, namespaceURI, localName);
        write("=\"");
        writeCharactersInternal(value.toCharArray(), 0, value.length(), true);
        write("\"");
    }

    public void writeNamespace(String prefix, String namespaceURI) throws XMLStreamException {
        if (!isOpen()) {
            throw new XMLStreamException("A start element must be written before a namespace");
        }
        if (prefix == null || DEFAULTNS.equals(prefix) || "xmlns".equals(prefix)) {
            writeDefaultNamespace(namespaceURI);
            return;
        }
        if (needsWritingNs(prefix)) {
            write(" xmlns:");
            write(prefix);
            write("=\"");
            write(namespaceURI);
            write("\"");
            setPrefix(prefix, namespaceURI);
        }
    }

    private void clearNeedsWritingNs() {
        this.setNeedsWritingNs.clear();
    }

    private boolean needsWritingNs(String prefix) {
        boolean needs = !this.setNeedsWritingNs.contains(prefix);
        if (needs) {
            this.setNeedsWritingNs.add(prefix);
        }
        return needs;
    }

    public void writeDefaultNamespace(String namespaceURI) throws XMLStreamException {
        if (!isOpen()) {
            throw new XMLStreamException("A start element must be written before the default namespace");
        }
        if (needsWritingNs(DEFAULTNS)) {
            write(" xmlns");
            write("=\"");
            write(namespaceURI);
            write("\"");
            setPrefix(DEFAULTNS, namespaceURI);
        }
    }

    public void writeComment(String data) throws XMLStreamException {
        closeStartElement();
        write("<!--");
        if (data != null) {
            write(data);
        }
        write("-->");
    }

    public void writeProcessingInstruction(String target) throws XMLStreamException {
        closeStartElement();
        writeProcessingInstruction(target, null);
    }

    public void writeProcessingInstruction(String target, String text) throws XMLStreamException {
        closeStartElement();
        write("<?");
        if (target != null) {
            write(target);
        }
        if (text != null) {
            write(' ');
            write(text);
        }
        write("?>");
    }

    public void writeDTD(String dtd) throws XMLStreamException {
        write(dtd);
    }

    public void writeCData(String data) throws XMLStreamException {
        closeStartElement();
        write("<![CDATA[");
        if (data != null) {
            write(data);
        }
        write("]]>");
    }

    public void writeEntityRef(String name) throws XMLStreamException {
        closeStartElement();
        write("&");
        write(name);
        write(";");
    }

    public void writeStartDocument() throws XMLStreamException {
        write("<?xml version='1.0' encoding='utf-8'?>");
    }

    public void writeStartDocument(String version) throws XMLStreamException {
        write("<?xml version='");
        write(version);
        write("'?>");
    }

    public void writeStartDocument(String encoding, String version) throws XMLStreamException {
        write("<?xml version='");
        write(version);
        write("' encoding='");
        write(encoding);
        write("'?>");
    }

    public void writeCharacters(String text) throws XMLStreamException {
        closeStartElement();
        writeCharactersInternal(text.toCharArray(), 0, text.length(), false);
    }

    public void writeCharacters(char[] text, int start, int len) throws XMLStreamException {
        closeStartElement();
        writeCharactersInternal(text, start, len, false);
    }

    public String getPrefix(String uri) throws XMLStreamException {
        return this.context.getPrefix(uri);
    }

    public void setPrefix(String prefix, String uri) throws XMLStreamException {
        needToWrite(uri);
        this.context.bindNamespace(prefix, uri);
    }

    public void setDefaultNamespace(String uri) throws XMLStreamException {
        needToWrite(uri);
        this.context.bindDefaultNameSpace(uri);
    }

    public void setNamespaceContext(NamespaceContext context) throws XMLStreamException {
        if (context == null) {
            throw new NullPointerException("The namespace  context may not be null.");
        }
        this.context = new NamespaceContextImpl(context);
    }

    public NamespaceContext getNamespaceContext() {
        return this.context;
    }

    public Object getProperty(String name) throws IllegalArgumentException {
        return this.config.getProperty(name);
    }

    public static void main(String[] args) throws Exception {
        XMLOutputFactory output = XMLOutputFactoryBase.newInstance();
        output.setProperty("javax.xml.stream.isRepairingNamespaces", new Boolean(true));
        Writer myWriter = new OutputStreamWriter(new FileOutputStream("tmp"), "us-ascii");
        XMLStreamWriter writer2 = output.createXMLStreamWriter(myWriter);
        writer2.writeStartDocument();
        writer2.setPrefix("c", "http://c");
        writer2.setDefaultNamespace("http://d");
        writer2.writeStartElement("http://c", "a");
        writer2.writeAttribute("b", "blah");
        writer2.writeEmptyElement("http://c", "d");
        writer2.writeEmptyElement("http://d", "e");
        writer2.writeEmptyElement("http://e", "f");
        writer2.writeEmptyElement("http://f", "g");
        writer2.writeAttribute("http://c", "chris", "fry");
        writer2.writeCharacters("foo bar foo");
        writer2.writeCharacters("bad char coming[");
        char[] array = {4132};
        writer2.writeCharacters(new String(array));
        writer2.writeCharacters("]");
        writer2.writeEndElement();
        writer2.flush();
    }
}
