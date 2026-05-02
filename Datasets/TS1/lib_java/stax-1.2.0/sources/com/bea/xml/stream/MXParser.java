package com.bea.xml.stream;

import com.bea.xml.stream.events.DTDEvent;
import com.bea.xml.stream.reader.XmlReader;
import com.bea.xml.stream.util.ElementTypeNames;
import com.bea.xml.stream.util.EmptyIterator;
import com.wutka.dtd.DTD;
import com.wutka.dtd.DTDAttlist;
import com.wutka.dtd.DTDAttribute;
import com.wutka.dtd.DTDEntity;
import com.wutka.dtd.DTDNotation;
import com.wutka.dtd.DTDParser;
import java.io.BufferedReader;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Vector;
import javax.xml.namespace.NamespaceContext;
import javax.xml.namespace.QName;
import javax.xml.stream.Location;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.events.EntityDeclaration;
import javax.xml.stream.events.NotationDeclaration;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/MXParser.class */
public class MXParser implements XMLStreamReader, Location {
    protected static final char CHAR_UTF8_BOM = 65279;
    protected static final int MAX_UNICODE_CHAR = 1114111;
    protected static final String FEATURE_XML_ROUNDTRIP = "http://xmlpull.org/v1/doc/features.html#xml-roundtrip";
    protected static final String FEATURE_NAMES_INTERNED = "http://xmlpull.org/v1/doc/features.html#names-interned";
    public static final String FEATURE_PROCESS_DOCDECL = "http://xmlpull.org/v1/doc/features.html#process-docdecl";
    public static final String FEATURE_STAX_NOTATIONS = "javax.xml.stream.notations";
    public static final String FEATURE_STAX_ENTITIES = "javax.xml.stream.entities";
    static final String EOF_MSG = "Unexpected end of stream";
    private static final int TEXT = 16384;
    private static final int DOCDECL = 32768;
    protected boolean allStringsInterned;
    private static final boolean TRACE_SIZING = false;
    public static final String FEATURE_PROCESS_NAMESPACES = "http://xmlpull.org/v1/doc/features.html#process-namespaces";
    protected int lineNumber;
    protected int columnNumber;
    protected boolean seenRoot;
    protected boolean reachedEnd;
    protected int eventType;
    protected boolean emptyElementTag;
    protected int depth;
    protected char[][] elRawName;
    protected int[] elRawNameEnd;
    protected String[] elName;
    protected String[] elPrefix;
    protected String[] elUri;
    protected int[] elNamespaceCount;
    protected String charEncodingScheme;
    protected String piTarget;
    protected String piData;
    protected DTD mDtdIntSubset;
    protected HashMap defaultAttributes;
    protected static final int LOOKUP_MAX = 1024;
    protected static final char LOOKUP_MAX_CHAR = 1024;
    protected int attributeCount;
    protected String[] attributeName;
    protected int[] attributeNameHash;
    protected String[] attributePrefix;
    protected String[] attributeUri;
    protected String[] attributeValue;
    private static final String[] NO_STRINGS;
    private static final int[] NO_INTS;
    private static final char[] NO_CHARS;
    protected int namespaceEnd;
    protected int[] namespacePrefixHash;
    protected int localNamespaceEnd;
    protected String[] localNamespacePrefix;
    protected int[] localNamespacePrefixHash;
    protected String[] localNamespaceUri;
    protected int entityEnd;
    protected String[] entityName;
    protected char[][] entityNameBuf;
    protected int[] entityNameHash;
    protected char[][] entityReplacementBuf;
    protected String[] entityReplacement;
    protected static final int READ_CHUNK_SIZE = 8192;
    protected Reader reader;
    protected String inputEncoding;
    protected char[] buf;
    protected int bufSoftLimit;
    protected int bufAbsoluteStart;
    protected int bufStart;
    protected int bufEnd;
    protected int pos;
    protected int posStart;
    protected int posEnd;
    protected char[] pc;
    protected int pcStart;
    protected int pcEnd;
    protected boolean usePC;
    protected boolean seenStartTag;
    protected boolean seenEndTag;
    protected boolean pastEndTag;
    protected boolean seenAmpersand;
    protected boolean seenMarkup;
    protected boolean seenDocdecl;
    protected boolean tokenize;
    protected String text;
    protected String entityRefName;
    protected char[] entityValue;
    protected char[] charRefOneCharBuf;
    protected char[] charRefTwoCharBuf;
    protected static final char[] VERSION;
    protected static final char[] ENCODING;
    protected static final char[] STANDALONE;
    protected static final char[] YES;
    protected static final char[] NO;
    private ConfigurationContextBase configurationContext;
    static Class class$com$wutka$dtd$DTDEntity;
    static Class class$com$wutka$dtd$DTDAttlist;
    static Class class$com$wutka$dtd$DTDNotation;
    public static final String[] TYPES = {"[UNKNOWN]", "START_ELEMENT", "END_ELEMENT", "PROCESSING_INSTRUCTION", "CHARACTERS", "COMMENT", "SPACE", "START_DOCUMENT", "END_DOCUMENT", "ENTITY_REFERENCE", "ATTRIBUTE", "DTD", "CDATA", "NAMESPACE", "NOTATION_DECLARATION", "ENTITY_DECLARATION"};
    public static final String NO_NAMESPACE = null;
    protected static boolean[] lookupNameStartChar = new boolean[1024];
    protected static boolean[] lookupNameChar = new boolean[1024];
    private boolean reportCdataEvent = false;
    protected boolean processNamespaces = true;
    protected boolean roundtripSupported = true;
    protected String xmlVersion = null;
    protected boolean standalone = false;
    protected boolean standaloneSet = false;
    protected String[] namespacePrefix = NO_STRINGS;
    protected String[] namespaceUri = NO_STRINGS;
    protected int bufLoadFactor = 95;

    static {
        setNameStart(':');
        char c = 'A';
        while (true) {
            char ch = c;
            if (ch > 'Z') {
                break;
            }
            setNameStart(ch);
            c = (char) (ch + 1);
        }
        setNameStart('_');
        char c2 = 'a';
        while (true) {
            char ch2 = c2;
            if (ch2 > 'z') {
                break;
            }
            setNameStart(ch2);
            c2 = (char) (ch2 + 1);
        }
        char c3 = 192;
        while (true) {
            char ch3 = c3;
            if (ch3 > 767) {
                break;
            }
            setNameStart(ch3);
            c3 = (char) (ch3 + 1);
        }
        char c4 = 880;
        while (true) {
            char ch4 = c4;
            if (ch4 > 893) {
                break;
            }
            setNameStart(ch4);
            c4 = (char) (ch4 + 1);
        }
        char c5 = 895;
        while (true) {
            char ch5 = c5;
            if (ch5 >= 1024) {
                break;
            }
            setNameStart(ch5);
            c5 = (char) (ch5 + 1);
        }
        setName('-');
        setName('.');
        char c6 = '0';
        while (true) {
            char ch6 = c6;
            if (ch6 > '9') {
                break;
            }
            setName(ch6);
            c6 = (char) (ch6 + 1);
        }
        setName((char) 183);
        char c7 = 768;
        while (true) {
            char ch7 = c7;
            if (ch7 > 879) {
                NO_STRINGS = new String[TRACE_SIZING];
                NO_INTS = new int[TRACE_SIZING];
                NO_CHARS = new char[TRACE_SIZING];
                VERSION = new char[]{'v', 'e', 'r', 's', 'i', 'o', 'n'};
                ENCODING = new char[]{'e', 'n', 'c', 'o', 'd', 'i', 'n', 'g'};
                STANDALONE = new char[]{'s', 't', 'a', 'n', 'd', 'a', 'l', 'o', 'n', 'e'};
                YES = new char[]{'y', 'e', 's'};
                NO = new char[]{'n', 'o'};
                return;
            }
            setName(ch7);
            c7 = (char) (ch7 + 1);
        }
    }

    protected void resetStringCache() {
    }

    protected String newString(char[] cbuf, int off, int len) {
        return new String(cbuf, off, len);
    }

    protected String newStringIntern(char[] cbuf, int off, int len) {
        return new String(cbuf, off, len).intern();
    }

    /* JADX WARN: Type inference failed for: r0v38, types: [char[], char[][], java.lang.Object] */
    protected void ensureElementsCapacity() {
        int elStackSize = this.elName != null ? this.elName.length : TRACE_SIZING;
        if (this.depth + 1 >= elStackSize) {
            int newSize = (this.depth >= 7 ? 2 * this.depth : 8) + 2;
            boolean needsCopying = elStackSize > 0;
            String[] arr = new String[newSize];
            if (needsCopying) {
                System.arraycopy(this.elName, TRACE_SIZING, arr, TRACE_SIZING, elStackSize);
            }
            this.elName = arr;
            String[] arr2 = new String[newSize];
            if (needsCopying) {
                System.arraycopy(this.elPrefix, TRACE_SIZING, arr2, TRACE_SIZING, elStackSize);
            }
            this.elPrefix = arr2;
            String[] arr3 = new String[newSize];
            if (needsCopying) {
                System.arraycopy(this.elUri, TRACE_SIZING, arr3, TRACE_SIZING, elStackSize);
            }
            this.elUri = arr3;
            int[] iarr = new int[newSize];
            if (needsCopying) {
                System.arraycopy(this.elNamespaceCount, TRACE_SIZING, iarr, TRACE_SIZING, elStackSize);
            } else {
                iarr[TRACE_SIZING] = TRACE_SIZING;
            }
            this.elNamespaceCount = iarr;
            int[] iarr2 = new int[newSize];
            if (needsCopying) {
                System.arraycopy(this.elRawNameEnd, TRACE_SIZING, iarr2, TRACE_SIZING, elStackSize);
            }
            this.elRawNameEnd = iarr2;
            ?? r0 = new char[newSize];
            if (needsCopying) {
                System.arraycopy(this.elRawName, TRACE_SIZING, r0, TRACE_SIZING, elStackSize);
            }
            this.elRawName = r0;
        }
    }

    private static final void setName(char ch) {
        lookupNameChar[ch] = true;
    }

    private static final void setNameStart(char ch) {
        lookupNameStartChar[ch] = true;
        setName(ch);
    }

    protected boolean isNameStartChar(char ch) {
        return (ch < 1024 && lookupNameStartChar[ch]) || (ch >= 1024 && ch <= 8231) || ((ch >= 8234 && ch <= 8591) || (ch >= 10240 && ch <= 65519));
    }

    protected boolean isNameChar(char ch) {
        return (ch < 1024 && lookupNameChar[ch]) || (ch >= 1024 && ch <= 8231) || ((ch >= 8234 && ch <= 8591) || (ch >= 10240 && ch <= 65519));
    }

    protected boolean isS(char ch) {
        return ch == ' ' || ch == '\n' || ch == '\r' || ch == '\t';
    }

    protected void checkCharValidity(int ch, boolean surrogatesOk) throws XMLStreamException {
        if (ch < 32) {
            if (!isS((char) ch)) {
                throw new XMLStreamException(new StringBuffer().append("Illegal white space character (code 0x").append(Integer.toHexString(ch)).append(")").toString());
            }
        } else if (ch >= 55296) {
            if (ch <= 57343) {
                if (!surrogatesOk) {
                    throw new XMLStreamException(new StringBuffer().append("Illegal character (code 0x").append(Integer.toHexString(ch)).append("): surrogate characters are not valid XML characters").toString(), getLocation());
                }
            } else if (ch > MAX_UNICODE_CHAR) {
                throw new XMLStreamException(new StringBuffer().append("Illegal character (code 0x").append(Integer.toHexString(ch)).append("), past max. Unicode character 0x").append(Integer.toHexString(MAX_UNICODE_CHAR)).toString(), getLocation());
            }
        }
    }

    protected void ensureAttributesCapacity(int size) {
        int attrPosSize = this.attributeName != null ? this.attributeName.length : TRACE_SIZING;
        if (size >= attrPosSize) {
            int newSize = size > 7 ? 2 * size : 8;
            boolean needsCopying = attrPosSize > 0;
            String[] arr = new String[newSize];
            if (needsCopying) {
                System.arraycopy(this.attributeName, TRACE_SIZING, arr, TRACE_SIZING, attrPosSize);
            }
            this.attributeName = arr;
            String[] arr2 = new String[newSize];
            if (needsCopying) {
                System.arraycopy(this.attributePrefix, TRACE_SIZING, arr2, TRACE_SIZING, attrPosSize);
            }
            this.attributePrefix = arr2;
            String[] arr3 = new String[newSize];
            if (needsCopying) {
                System.arraycopy(this.attributeUri, TRACE_SIZING, arr3, TRACE_SIZING, attrPosSize);
            }
            this.attributeUri = arr3;
            String[] arr4 = new String[newSize];
            if (needsCopying) {
                System.arraycopy(this.attributeValue, TRACE_SIZING, arr4, TRACE_SIZING, attrPosSize);
            }
            this.attributeValue = arr4;
            if (!this.allStringsInterned) {
                int[] iarr = new int[newSize];
                if (needsCopying) {
                    System.arraycopy(this.attributeNameHash, TRACE_SIZING, iarr, TRACE_SIZING, attrPosSize);
                }
                this.attributeNameHash = iarr;
            }
        }
    }

    protected void ensureNamespacesCapacity(int size) {
        int namespaceSize = this.namespacePrefix != null ? this.namespacePrefix.length : TRACE_SIZING;
        if (size >= namespaceSize) {
            int newSize = size > 7 ? 2 * size : 8;
            String[] newNamespacePrefix = new String[newSize];
            String[] newNamespaceUri = new String[newSize];
            if (this.namespacePrefix != null) {
                System.arraycopy(this.namespacePrefix, TRACE_SIZING, newNamespacePrefix, TRACE_SIZING, this.namespaceEnd);
                System.arraycopy(this.namespaceUri, TRACE_SIZING, newNamespaceUri, TRACE_SIZING, this.namespaceEnd);
            }
            this.namespacePrefix = newNamespacePrefix;
            this.namespaceUri = newNamespaceUri;
            if (!this.allStringsInterned) {
                int[] newNamespacePrefixHash = new int[newSize];
                if (this.namespacePrefixHash != null) {
                    System.arraycopy(this.namespacePrefixHash, TRACE_SIZING, newNamespacePrefixHash, TRACE_SIZING, this.namespaceEnd);
                }
                this.namespacePrefixHash = newNamespacePrefixHash;
            }
        }
    }

    protected void ensureLocalNamespacesCapacity(int size) {
        int localNamespaceSize = this.localNamespacePrefix != null ? this.localNamespacePrefix.length : TRACE_SIZING;
        if (size >= localNamespaceSize) {
            int newSize = size > 7 ? 2 * size : 8;
            String[] newLocalNamespacePrefix = new String[newSize];
            String[] newLocalNamespaceUri = new String[newSize];
            if (this.localNamespacePrefix != null) {
                System.arraycopy(this.localNamespacePrefix, TRACE_SIZING, newLocalNamespacePrefix, TRACE_SIZING, this.localNamespaceEnd);
                System.arraycopy(this.localNamespaceUri, TRACE_SIZING, newLocalNamespaceUri, TRACE_SIZING, this.localNamespaceEnd);
            }
            this.localNamespacePrefix = newLocalNamespacePrefix;
            this.localNamespaceUri = newLocalNamespaceUri;
            if (!this.allStringsInterned) {
                int[] newLocalNamespacePrefixHash = new int[newSize];
                if (this.localNamespacePrefixHash != null) {
                    System.arraycopy(this.localNamespacePrefixHash, TRACE_SIZING, newLocalNamespacePrefixHash, TRACE_SIZING, this.localNamespaceEnd);
                }
                this.localNamespacePrefixHash = newLocalNamespacePrefixHash;
            }
        }
    }

    public int getLocalNamespaceCount() {
        int startNs = this.elNamespaceCount[this.depth - 1];
        return this.namespaceEnd - startNs;
    }

    private String getLocalNamespaceURI(int pos) {
        return this.namespaceUri[pos];
    }

    private String getLocalNamespacePrefix(int pos) {
        return this.namespacePrefix[pos];
    }

    protected static final int fastHash(char[] ch, int off, int len) {
        if (len == 0) {
            return TRACE_SIZING;
        }
        int hash = (ch[off] << 7) + ch[(off + len) - 1];
        if (len > 16) {
            hash = (hash << 7) + ch[off + (len / 4)];
        }
        if (len > 8) {
            hash = (hash << 7) + ch[off + (len / 2)];
        }
        return hash;
    }

    /* JADX WARN: Type inference failed for: r0v13, types: [char[], char[][], java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v17, types: [char[], char[][], java.lang.Object] */
    protected void ensureEntityCapacity() {
        int entitySize = this.entityReplacementBuf != null ? this.entityReplacementBuf.length : TRACE_SIZING;
        if (this.entityEnd >= entitySize) {
            int newSize = this.entityEnd > 7 ? 2 * this.entityEnd : 8;
            String[] newEntityName = new String[newSize];
            ?? r0 = new char[newSize];
            String[] newEntityReplacement = new String[newSize];
            ?? r02 = new char[newSize];
            if (this.entityName != null) {
                System.arraycopy(this.entityName, TRACE_SIZING, newEntityName, TRACE_SIZING, this.entityEnd);
                System.arraycopy(this.entityNameBuf, TRACE_SIZING, r0, TRACE_SIZING, this.entityEnd);
                System.arraycopy(this.entityReplacement, TRACE_SIZING, newEntityReplacement, TRACE_SIZING, this.entityEnd);
                System.arraycopy(this.entityReplacementBuf, TRACE_SIZING, r02, TRACE_SIZING, this.entityEnd);
            }
            this.entityName = newEntityName;
            this.entityNameBuf = r0;
            this.entityReplacement = newEntityReplacement;
            this.entityReplacementBuf = r02;
            if (!this.allStringsInterned) {
                int[] newEntityNameHash = new int[newSize];
                if (this.entityNameHash != null) {
                    System.arraycopy(this.entityNameHash, TRACE_SIZING, newEntityNameHash, TRACE_SIZING, this.entityEnd);
                }
                this.entityNameHash = newEntityNameHash;
            }
        }
    }

    private void reset() {
        this.lineNumber = 1;
        this.columnNumber = TRACE_SIZING;
        this.seenRoot = false;
        this.reachedEnd = false;
        this.eventType = 7;
        this.emptyElementTag = false;
        this.depth = TRACE_SIZING;
        this.attributeCount = TRACE_SIZING;
        this.namespaceEnd = TRACE_SIZING;
        this.localNamespaceEnd = TRACE_SIZING;
        this.entityEnd = TRACE_SIZING;
        this.reader = null;
        this.inputEncoding = null;
        this.bufAbsoluteStart = TRACE_SIZING;
        this.bufStart = TRACE_SIZING;
        this.bufEnd = TRACE_SIZING;
        this.posEnd = TRACE_SIZING;
        this.posStart = TRACE_SIZING;
        this.pos = TRACE_SIZING;
        this.pcStart = TRACE_SIZING;
        this.pcEnd = TRACE_SIZING;
        this.usePC = false;
        this.seenStartTag = false;
        this.seenEndTag = false;
        this.pastEndTag = false;
        this.seenAmpersand = false;
        this.seenMarkup = false;
        this.seenDocdecl = false;
        resetStringCache();
    }

    public MXParser() {
        this.buf = new char[Runtime.getRuntime().freeMemory() > 1000000 ? READ_CHUNK_SIZE : 256];
        this.bufSoftLimit = (this.bufLoadFactor * this.buf.length) / 100;
        this.pc = new char[Runtime.getRuntime().freeMemory() > 1000000 ? READ_CHUNK_SIZE : 64];
        this.entityValue = null;
        this.charRefOneCharBuf = new char[1];
        this.charRefTwoCharBuf = null;
    }

    public void setFeature(String name, boolean state) throws XMLStreamException {
        if (name == null) {
            throw new IllegalArgumentException("feature name should not be nulll");
        }
        if (FEATURE_PROCESS_NAMESPACES.equals(name)) {
            if (this.eventType != 7) {
                throw new XMLStreamException("namespace processing feature can only be changed before parsing", getLocation());
            }
            this.processNamespaces = state;
        } else if (FEATURE_NAMES_INTERNED.equals(name)) {
            if (state) {
                throw new XMLStreamException("interning names in this implementation is not supported");
            }
        } else if (FEATURE_PROCESS_DOCDECL.equals(name)) {
            if (state) {
                throw new XMLStreamException("processing DOCDECL is not supported");
            }
        } else {
            if (FEATURE_XML_ROUNDTRIP.equals(name)) {
                if (!state) {
                    throw new XMLStreamException("roundtrip feature can not be switched off");
                }
                return;
            }
            throw new XMLStreamException(new StringBuffer().append("unknown feature ").append(name).toString());
        }
    }

    public boolean getFeature(String name) {
        if (name == null) {
            throw new IllegalArgumentException("feature name should not be null");
        }
        if (FEATURE_PROCESS_NAMESPACES.equals(name)) {
            return this.processNamespaces;
        }
        if (!FEATURE_NAMES_INTERNED.equals(name) && !FEATURE_PROCESS_DOCDECL.equals(name) && FEATURE_XML_ROUNDTRIP.equals(name)) {
            return true;
        }
        return false;
    }

    public void setProperty(String name, Object value) throws XMLStreamException {
        throw new XMLStreamException(new StringBuffer().append("unsupported property: '").append(name).append("'").toString());
    }

    public boolean checkForXMLDecl() throws XMLStreamException {
        try {
            BufferedReader breader = new BufferedReader(this.reader, 7);
            this.reader = breader;
            breader.mark(7);
            int ch = breader.read();
            if (ch == CHAR_UTF8_BOM) {
                breader.mark(7);
                ch = breader.read();
            }
            if (ch == 60 && breader.read() == 63 && breader.read() == 120 && breader.read() == 109 && breader.read() == 108) {
                breader.reset();
                return true;
            }
            breader.reset();
            return false;
        } catch (IOException e) {
            throw new XMLStreamException(e);
        }
    }

    public void setInput(Reader in) throws XMLStreamException {
        reset();
        this.reader = in;
        if (checkForXMLDecl()) {
            next();
        }
    }

    public void setInput(InputStream in) throws XMLStreamException {
        try {
            Reader r = XmlReader.createReader(in);
            String enc = TRACE_SIZING;
            if (r instanceof XmlReader.BaseReader) {
                enc = ((XmlReader.BaseReader) r).getEncoding();
            }
            setInput(r);
            if (enc != null) {
                this.inputEncoding = enc;
            }
        } catch (IOException e) {
            throw new XMLStreamException(e);
        }
    }

    public void setInput(InputStream inputStream, String inputEncoding) throws XMLStreamException {
        if (inputStream == null) {
            throw new IllegalArgumentException("input stream can not be null");
        }
        try {
            Reader reader = inputEncoding != null ? XmlReader.createReader(inputStream, inputEncoding) : XmlReader.createReader(inputStream);
            setInput(reader);
            if (inputEncoding != null) {
                this.inputEncoding = inputEncoding;
            }
        } catch (IOException ioe) {
            String encMsg = inputEncoding == null ? new StringBuffer().append("(for encoding '").append(inputEncoding).append("')").toString() : "";
            throw new XMLStreamException(new StringBuffer().append("could not create reader ").append(encMsg).append(": ").append(ioe).toString(), getLocation(), ioe);
        }
    }

    public String getInputEncoding() {
        return this.inputEncoding;
    }

    public void defineEntityReplacementText(String entityName, String replacementText) throws XMLStreamException {
        ensureEntityCapacity();
        char[] ch = entityName.toCharArray();
        this.entityName[this.entityEnd] = newString(ch, TRACE_SIZING, entityName.length());
        this.entityNameBuf[this.entityEnd] = ch;
        this.entityReplacement[this.entityEnd] = replacementText;
        this.entityReplacementBuf[this.entityEnd] = replacementText == null ? NO_CHARS : replacementText.toCharArray();
        if (!this.allStringsInterned) {
            this.entityNameHash[this.entityEnd] = fastHash(this.entityNameBuf[this.entityEnd], TRACE_SIZING, this.entityNameBuf[this.entityEnd].length);
        }
        this.entityEnd++;
    }

    public int getNamespaceCount() {
        if (!isElementEvent(this.eventType)) {
            throwIllegalState(new int[]{1, 2});
        }
        return getNamespaceCount(this.depth);
    }

    public int getNamespaceCount(int depth) {
        if (!this.processNamespaces || depth == 0) {
            return TRACE_SIZING;
        }
        if (depth < 0) {
            throw new IllegalArgumentException(new StringBuffer().append("namespace count may be 0..").append(this.depth).append(" not ").append(depth).toString());
        }
        return this.elNamespaceCount[depth] - this.elNamespaceCount[depth - 1];
    }

    public String getNamespacePrefix(int pos) {
        if (!isElementEvent(this.eventType)) {
            throwIllegalState(new int[]{1, 2});
        }
        int currentDepth = this.depth;
        int end = getNamespaceCount(currentDepth);
        int newpos = pos + this.elNamespaceCount[currentDepth - 1];
        if (pos < end) {
            return this.namespacePrefix[newpos];
        }
        throw new ArrayIndexOutOfBoundsException(new StringBuffer().append("position ").append(pos).append(" exceeded number of available namespaces ").append(end).toString());
    }

    public String getNamespaceURI(int pos) {
        if (!isElementEvent(this.eventType)) {
            throwIllegalState(new int[]{1, 2});
        }
        int currentDepth = this.depth;
        int end = getNamespaceCount(currentDepth);
        int newpos = pos + this.elNamespaceCount[currentDepth - 1];
        if (pos < end) {
            return this.namespaceUri[newpos];
        }
        throw new ArrayIndexOutOfBoundsException(new StringBuffer().append("position ").append(pos).append(" exceedded number of available namespaces ").append(end).toString());
    }

    public String getNamespaceURI(String prefix) {
        if (!isElementEvent(this.eventType)) {
            throwIllegalState(new int[]{1, 2});
        }
        if (prefix != null && prefix.length() > 0) {
            for (int i = this.namespaceEnd - 1; i >= 0; i--) {
                if (prefix.equals(this.namespacePrefix[i])) {
                    return this.namespaceUri[i];
                }
            }
            if ("xml".equals(prefix)) {
                return "http://www.w3.org/XML/1998/namespace";
            }
            if ("xmlns".equals(prefix)) {
                return "http://www.w3.org/2000/xmlns/";
            }
            return null;
        }
        for (int i2 = this.namespaceEnd - 1; i2 >= 0; i2--) {
            if (this.namespacePrefix[i2] == null) {
                return this.namespaceUri[i2];
            }
        }
        return null;
    }

    public int getDepth() {
        return this.depth;
    }

    private static int findFragment(int bufMinPos, char[] b, int start, int end) {
        if (start < bufMinPos) {
            int start2 = bufMinPos;
            if (start2 > end) {
                start2 = end;
            }
            return start2;
        }
        if (end - start > 65) {
            start = end - 10;
        }
        int i = start + 1;
        while (true) {
            i--;
            if (i > bufMinPos && end - i <= 65) {
                char c = b[i];
                if (c == '<' && start - i > 10) {
                    break;
                }
            } else {
                break;
            }
        }
        return i;
    }

    public String getPositionDescription() {
        String fragment = TRACE_SIZING;
        if (this.posStart <= this.pos) {
            int start = findFragment(TRACE_SIZING, this.buf, this.posStart, this.pos);
            if (start < this.pos) {
                fragment = new String(this.buf, start, this.pos - start);
            }
            if (this.bufAbsoluteStart > 0 || start > 0) {
                fragment = new StringBuffer().append("...").append(fragment).toString();
            }
        }
        return new StringBuffer().append(" ").append(fragment != null ? new StringBuffer().append(" seen ").append(printable(fragment)).append("...").toString() : "").append(" @").append(getLineNumber()).append(":").append(getColumnNumber()).toString();
    }

    public int getLineNumber() {
        return this.lineNumber;
    }

    public int getColumnNumber() {
        return this.columnNumber;
    }

    public String getLocationURI() {
        return null;
    }

    public boolean isWhiteSpace() {
        if (this.eventType == 4 || this.eventType == 12) {
            if (this.usePC) {
                for (int i = this.pcStart; i < this.pcEnd; i++) {
                    if (!isS(this.pc[i])) {
                        return false;
                    }
                }
                return true;
            }
            for (int i2 = this.posStart; i2 < this.posEnd; i2++) {
                if (!isS(this.buf[i2])) {
                    return false;
                }
            }
            return true;
        }
        if (this.eventType == 6) {
            return true;
        }
        return false;
    }

    public String getNamespaceURI() {
        if (this.eventType == 1 || this.eventType == 2) {
            return this.processNamespaces ? this.elUri[this.depth] : NO_NAMESPACE;
        }
        return throwIllegalState(new int[]{1, 2});
    }

    public String getLocalName() {
        if (this.eventType == 1) {
            return this.elName[this.depth];
        }
        if (this.eventType == 2) {
            return this.elName[this.depth];
        }
        if (this.eventType == 9) {
            if (this.entityRefName == null) {
                this.entityRefName = newString(this.buf, this.posStart, this.posEnd - this.posStart);
            }
            return this.entityRefName;
        }
        return throwIllegalState(new int[]{1, 2, 9});
    }

    public String getPrefix() {
        if (this.eventType == 1 || this.eventType == 2) {
            return this.elPrefix[this.depth];
        }
        return throwIllegalState(new int[]{1, 2});
    }

    public boolean isEmptyElementTag() throws XMLStreamException {
        if (this.eventType != 1) {
            throw new XMLStreamException("parser must be on XMLStreamConstants.START_ELEMENT to check for empty element", getLocation());
        }
        return this.emptyElementTag;
    }

    public int getAttributeCount() {
        if (this.eventType != 1) {
            throwIllegalState(1);
        }
        return this.attributeCount;
    }

    public String getAttributeNamespace(int index) {
        if (this.eventType != 1) {
            throwIllegalState(1);
        }
        if (!this.processNamespaces) {
            return NO_NAMESPACE;
        }
        if (index < 0 || index >= this.attributeCount) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("attribute position must be 0..").append(this.attributeCount - 1).append(" and not ").append(index).toString());
        }
        return this.attributeUri[index];
    }

    public String getAttributeLocalName(int index) {
        if (this.eventType != 1) {
            throwIllegalState(1);
        }
        if (index < 0 || index >= this.attributeCount) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("attribute position must be 0..").append(this.attributeCount - 1).append(" and not ").append(index).toString());
        }
        return this.attributeName[index];
    }

    public String getAttributePrefix(int index) {
        if (this.eventType != 1) {
            throwIllegalState(1);
        }
        if (!this.processNamespaces) {
            return null;
        }
        if (index < 0 || index >= this.attributeCount) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("attribute position must be 0..").append(this.attributeCount - 1).append(" and not ").append(index).toString());
        }
        return this.attributePrefix[index];
    }

    public String getAttributeType(int index) {
        if (this.eventType != 1) {
            throwIllegalState(1);
        }
        if (index < 0 || index >= this.attributeCount) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("attribute position must be 0..").append(this.attributeCount - 1).append(" and not ").append(index).toString());
        }
        return "CDATA";
    }

    public boolean isAttributeSpecified(int index) {
        if (this.eventType != 1) {
            throwIllegalState(1);
        }
        if (index < 0 || index >= this.attributeCount) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("attribute position must be 0..").append(this.attributeCount - 1).append(" and not ").append(index).toString());
        }
        return true;
    }

    public String getAttributeValue(int index) {
        if (this.eventType != 1) {
            throwIllegalState(1);
        }
        if (index < 0 || index >= this.attributeCount) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("attribute position must be 0..").append(this.attributeCount - 1).append(" and not ").append(index).toString());
        }
        return this.attributeValue[index];
    }

    public String getAttributeValue(String namespace, String name) {
        if (this.eventType != 1) {
            throwIllegalState(1);
        }
        if (name == null) {
            throw new IllegalArgumentException("attribute name can not be null");
        }
        if (namespace != null) {
            for (int i = TRACE_SIZING; i < this.attributeCount; i++) {
                if (name.equals(this.attributeName[i]) && namespace.equals(this.attributeUri[i])) {
                    return this.attributeValue[i];
                }
            }
            return null;
        }
        for (int i2 = TRACE_SIZING; i2 < this.attributeCount; i2++) {
            if (name.equals(this.attributeName[i2])) {
                return this.attributeValue[i2];
            }
        }
        return null;
    }

    public int getEventType() {
        return this.eventType;
    }

    public void require(int type, String namespace, String name) throws XMLStreamException {
        int currType = getEventType();
        boolean ok = type == currType;
        if (ok && name != null) {
            if (currType == 1 || currType == 2 || currType == 9) {
                ok = name.equals(getLocalName());
            } else {
                throw new XMLStreamException(new StringBuffer().append("Using non-null local name argument for require(); ").append(ElementTypeNames.getEventTypeString(currType)).append(" event does not have local name").toString(), getLocation());
            }
        }
        if (ok && namespace != null && (currType == 1 || currType == 1)) {
            String currNsUri = getNamespaceURI();
            if (namespace.length() == 0) {
                ok = currNsUri == null;
            } else {
                ok = namespace.equals(currNsUri);
            }
        }
        if (!ok) {
            throw new XMLStreamException(new StringBuffer().append("expected event ").append(ElementTypeNames.getEventTypeString(type)).append(name != null ? new StringBuffer().append(" with name '").append(name).append("'").toString() : "").append((namespace == null || name == null) ? "" : " and").append(namespace != null ? new StringBuffer().append(" with namespace '").append(namespace).append("'").toString() : "").append(" but got").append(type != getEventType() ? new StringBuffer().append(" ").append(ElementTypeNames.getEventTypeString(getEventType())).toString() : "").append((name == null || getLocalName() == null || name.equals(getName())) ? "" : new StringBuffer().append(" name '").append(getLocalName()).append("'").toString()).append((namespace == null || name == null || getLocalName() == null || name.equals(getName()) || getNamespaceURI() == null || namespace.equals(getNamespaceURI())) ? "" : " and").append((namespace == null || getNamespaceURI() == null || namespace.equals(getNamespaceURI())) ? "" : new StringBuffer().append(" namespace '").append(getNamespaceURI()).append("'").toString()).append(" (position:").append(getPositionDescription()).append(")").toString(), getLocation());
        }
    }

    public String nextText() throws XMLStreamException {
        if (getEventType() != 1) {
            throw new XMLStreamException("parser must be on START_ELEMENT to read next text", getLocation());
        }
        int eventType = next();
        if (eventType == 4) {
            String result = getText();
            if (next() != 2) {
                throw new XMLStreamException(new StringBuffer().append("TEXT must be immediately followed by END_ELEMENT and not ").append(ElementTypeNames.getEventTypeString(getEventType())).toString(), getLocation());
            }
            return result;
        }
        if (eventType == 2) {
            return "";
        }
        throw new XMLStreamException("parser must be on START_ELEMENT or TEXT to read text", getLocation());
    }

    public int nextTag() throws XMLStreamException {
        next();
        while (true) {
            if (this.eventType != 6 && this.eventType != 5 && this.eventType != 3 && ((this.eventType != 4 || !isWhiteSpace()) && (this.eventType != 12 || !isWhiteSpace()))) {
                break;
            }
            next();
        }
        if (this.eventType != 1 && this.eventType != 2) {
            throw new XMLStreamException(new StringBuffer().append("expected XMLStreamConstants.START_ELEMENT or XMLStreamConstants.END_ELEMENT not ").append(ElementTypeNames.getEventTypeString(getEventType())).toString(), getLocation());
        }
        return this.eventType;
    }

    public String getElementText() throws XMLStreamException {
        StringBuffer buf = new StringBuffer();
        if (getEventType() != 1) {
            throw new XMLStreamException("Precondition for readText is getEventType() == START_ELEMENT");
        }
        while (next() != 8) {
            if (isStartElement()) {
                throw new XMLStreamException("Unexpected Element start");
            }
            if (isCharacters() || getEventType() == 9) {
                buf.append(getText());
            }
            if (isEndElement()) {
                return buf.toString();
            }
        }
        throw new XMLStreamException("Unexpected end of Document");
    }

    public int next() throws XMLStreamException {
        this.tokenize = true;
        this.pcStart = TRACE_SIZING;
        this.pcEnd = TRACE_SIZING;
        this.usePC = false;
        return nextImpl();
    }

    public int nextToken() throws XMLStreamException {
        this.tokenize = true;
        return nextImpl();
    }

    public int nextElement() throws XMLStreamException {
        return nextTag();
    }

    public boolean hasNext() throws XMLStreamException {
        return this.eventType != 8;
    }

    public void skip() throws XMLStreamException {
        nextToken();
    }

    public void close() throws XMLStreamException {
    }

    public boolean isStartElement() {
        return this.eventType == 1;
    }

    public boolean isEndElement() {
        return this.eventType == 2;
    }

    public boolean isCharacters() {
        return this.eventType == 4;
    }

    public boolean isEOF() {
        return this.eventType == 8;
    }

    public boolean moveToStartElement() throws XMLStreamException {
        if (isStartElement()) {
            return true;
        }
        while (hasNext()) {
            if (isStartElement()) {
                return true;
            }
            next();
        }
        return false;
    }

    public boolean moveToStartElement(String localName) throws XMLStreamException {
        if (localName == null) {
            return false;
        }
        while (moveToStartElement()) {
            if (localName.equals(getLocalName())) {
                return true;
            }
            if (!hasNext()) {
                return false;
            }
            next();
        }
        return false;
    }

    public boolean moveToStartElement(String localName, String namespaceUri) throws XMLStreamException {
        if (localName == null || namespaceUri == null) {
            return false;
        }
        while (moveToStartElement(localName)) {
            if (namespaceUri.equals(getNamespaceURI())) {
                return true;
            }
            if (!hasNext()) {
                return false;
            }
            next();
        }
        return false;
    }

    public boolean moveToEndElement() throws XMLStreamException {
        if (isEndElement()) {
            return true;
        }
        while (hasNext()) {
            if (isEndElement()) {
                return true;
            }
            next();
        }
        return false;
    }

    public boolean moveToEndElement(String localName) throws XMLStreamException {
        if (localName == null) {
            return false;
        }
        while (moveToEndElement()) {
            if (localName.equals(getLocalName())) {
                return true;
            }
            if (!hasNext()) {
                return false;
            }
            next();
        }
        return false;
    }

    public boolean moveToEndElement(String localName, String namespaceUri) throws XMLStreamException {
        if (localName == null || namespaceUri == null) {
            return false;
        }
        while (moveToEndElement(localName)) {
            if (namespaceUri.equals(getNamespaceURI())) {
                return true;
            }
            if (!hasNext()) {
                return false;
            }
            next();
        }
        return false;
    }

    public boolean hasAttributes() {
        if (getAttributeCount() > 0) {
            return true;
        }
        return false;
    }

    public boolean hasNamespaces() {
        if (getNamespaceCount() > 0) {
            return true;
        }
        return false;
    }

    public Iterator getAttributes() {
        if (!hasAttributes()) {
            return EmptyIterator.emptyIterator;
        }
        int attributeCount = getAttributeCount();
        ArrayList atts = new ArrayList();
        for (int i = TRACE_SIZING; i < attributeCount; i++) {
            atts.add(new AttributeBase(getAttributePrefix(i), getAttributeNamespace(i), getAttributeLocalName(i), getAttributeValue(i), getAttributeType(i)));
        }
        return atts.iterator();
    }

    public Iterator internalGetNamespaces(int depth, int namespaceCount) {
        ArrayList ns = new ArrayList();
        int startNs = this.elNamespaceCount[depth - 1];
        for (int i = TRACE_SIZING; i < namespaceCount; i++) {
            String prefix = getLocalNamespacePrefix(i + startNs);
            if (prefix == null) {
                ns.add(new NamespaceBase(getLocalNamespaceURI(i + startNs)));
            } else {
                ns.add(new NamespaceBase(prefix, getLocalNamespaceURI(i + startNs)));
            }
        }
        return ns.iterator();
    }

    public Iterator getNamespaces() {
        if (!hasNamespaces()) {
            return EmptyIterator.emptyIterator;
        }
        int namespaceCount = getLocalNamespaceCount();
        return internalGetNamespaces(this.depth, namespaceCount);
    }

    public Iterator getOutOfScopeNamespaces() {
        int startNs = this.elNamespaceCount[this.depth - 1];
        int endNs = this.elNamespaceCount[this.depth];
        int namespaceCount = endNs - startNs;
        return internalGetNamespaces(this.depth, namespaceCount);
    }

    public XMLStreamReader subReader() throws XMLStreamException {
        return new SubReader(this);
    }

    public void recycle() throws XMLStreamException {
        reset();
    }

    public Reader getTextStream() {
        throw new UnsupportedOperationException();
    }

    private final void checkTextEvent() {
        if (!hasText()) {
            throw new IllegalStateException(new StringBuffer().append("Current state (").append(eventTypeDesc(this.eventType)).append(") does not have textual content").toString());
        }
    }

    private final void checkTextEventXxx() {
        if (this.eventType != 4 && this.eventType != 12 && this.eventType != 5 && this.eventType != 6) {
            throw new IllegalStateException(new StringBuffer().append("getTextXxx methods cannot be called for ").append(eventTypeDesc(this.eventType)).toString());
        }
    }

    public String getText() {
        checkTextEvent();
        if (this.eventType == 9) {
            if (this.text == null && this.entityValue != null) {
                this.text = new String(this.entityValue);
            }
            return this.text;
        }
        if (this.usePC) {
            this.text = new String(this.pc, this.pcStart, this.pcEnd - this.pcStart);
        } else {
            this.text = new String(this.buf, this.posStart, this.posEnd - this.posStart);
        }
        return this.text;
    }

    public int getTextCharacters(int sourceStart, char[] target, int targetStart, int length) throws XMLStreamException {
        checkTextEventXxx();
        int intLen = getTextLength();
        if (sourceStart < 0 || sourceStart > intLen) {
            throw new ArrayIndexOutOfBoundsException();
        }
        int avail = intLen - sourceStart;
        if (avail < length) {
            length = avail;
        }
        if (length > 0) {
            char[] intBuf = getTextCharacters();
            int intStart = getTextStart();
            System.arraycopy(intBuf, intStart + sourceStart, target, targetStart, length);
        }
        return length;
    }

    public char[] getTextCharacters() {
        checkTextEventXxx();
        if (this.eventType == 4) {
            if (this.usePC) {
                return this.pc;
            }
            return this.buf;
        }
        return this.buf;
    }

    public int getTextStart() {
        checkTextEventXxx();
        if (this.usePC) {
            return this.pcStart;
        }
        return this.posStart;
    }

    public int getTextLength() {
        checkTextEventXxx();
        if (this.usePC) {
            return this.pcEnd - this.pcStart;
        }
        return this.posEnd - this.posStart;
    }

    public boolean hasText() {
        return this.eventType == 4 || this.eventType == 11 || this.eventType == 12 || this.eventType == 5 || this.eventType == 6 || this.eventType == 9;
    }

    public String getValue() {
        return getText();
    }

    public String getEncoding() {
        return getInputEncoding();
    }

    public int getCharacterOffset() {
        return this.posEnd;
    }

    private static final String checkNull(String s) {
        return s != null ? s : "";
    }

    private static String eventTypeDesc(int type) {
        return (type < 0 || type >= TYPES.length) ? "[UNKNOWN]" : TYPES[type];
    }

    private static boolean isElementEvent(int type) {
        return type == 1 || type == 2;
    }

    public QName getAttributeName(int index) {
        if (this.eventType != 1) {
            throwIllegalState(1);
        }
        return new QName(checkNull(getAttributeNamespace(index)), getAttributeLocalName(index), checkNull(getAttributePrefix(index)));
    }

    public QName getName() {
        if (!isElementEvent(this.eventType)) {
            throw new IllegalStateException("Current state not START_ELEMENT or END_ELEMENT");
        }
        return new QName(checkNull(getNamespaceURI()), getLocalName(), checkNull(getPrefix()));
    }

    public boolean hasName() {
        return isElementEvent(this.eventType);
    }

    public String getVersion() {
        return this.xmlVersion;
    }

    public boolean isStandalone() {
        return this.standalone;
    }

    public boolean standaloneSet() {
        return this.standaloneSet;
    }

    public String getCharacterEncodingScheme() {
        return this.charEncodingScheme;
    }

    protected int nextImpl() throws XMLStreamException {
        char ch;
        try {
            this.text = null;
            this.bufStart = this.posEnd;
            if (this.pastEndTag) {
                this.pastEndTag = false;
                this.depth--;
                this.namespaceEnd = this.elNamespaceCount[this.depth];
            }
            if (this.emptyElementTag) {
                this.emptyElementTag = false;
                this.pastEndTag = true;
                this.eventType = 2;
                return 2;
            }
            if (this.depth > 0) {
                if (this.seenStartTag) {
                    this.seenStartTag = false;
                    int parseStartTag = parseStartTag();
                    this.eventType = parseStartTag;
                    return parseStartTag;
                }
                if (this.seenEndTag) {
                    this.seenEndTag = false;
                    int parseEndTag = parseEndTag();
                    this.eventType = parseEndTag;
                    return parseEndTag;
                }
                if (this.seenMarkup) {
                    this.seenMarkup = false;
                    ch = '<';
                } else if (this.seenAmpersand) {
                    this.seenAmpersand = false;
                    ch = '&';
                } else {
                    ch = more();
                }
                this.posStart = this.pos - 1;
                boolean hadCharData = TRACE_SIZING;
                boolean needsMerging = TRACE_SIZING;
                while (true) {
                    if (ch == '<') {
                        if (hadCharData && this.tokenize) {
                            this.seenMarkup = true;
                            this.eventType = 4;
                            return 4;
                        }
                        char ch2 = more();
                        if (ch2 == '/') {
                            if (!this.tokenize && hadCharData) {
                                this.seenEndTag = true;
                                this.eventType = 4;
                                return 4;
                            }
                            int parseEndTag2 = parseEndTag();
                            this.eventType = parseEndTag2;
                            return parseEndTag2;
                        }
                        if (ch2 == '!') {
                            char ch3 = more();
                            if (ch3 == '-') {
                                parseComment();
                                if (this.tokenize) {
                                    this.eventType = 5;
                                    return 5;
                                }
                                if (!this.usePC && hadCharData) {
                                    needsMerging = true;
                                }
                            } else if (ch3 == '[') {
                                int oldStart = this.posStart;
                                int oldEnd = this.posEnd;
                                parseCDATA();
                                int cdStart = this.posStart;
                                int cdEnd = this.posEnd;
                                this.posStart = oldStart;
                                this.posEnd = oldEnd;
                                int cdLen = cdEnd - cdStart;
                                if (cdLen > 0) {
                                    if (hadCharData) {
                                        if (!this.usePC) {
                                            if (this.posEnd > this.posStart) {
                                                joinPC();
                                            } else {
                                                this.usePC = true;
                                                this.pcEnd = TRACE_SIZING;
                                                this.pcStart = TRACE_SIZING;
                                            }
                                        }
                                        if (this.pcEnd + cdLen >= this.pc.length) {
                                            ensurePC(this.pcEnd + cdLen);
                                        }
                                        System.arraycopy(this.buf, cdStart, this.pc, this.pcEnd, cdLen);
                                        this.pcEnd += cdLen;
                                    } else {
                                        needsMerging = true;
                                        this.posStart = cdStart;
                                        this.posEnd = cdEnd;
                                    }
                                    hadCharData = true;
                                } else if (!this.usePC && hadCharData) {
                                    needsMerging = true;
                                }
                                if (this.reportCdataEvent) {
                                    this.eventType = 12;
                                    return 12;
                                }
                            } else {
                                throw new XMLStreamException(new StringBuffer().append("unexpected character in markup ").append(printable(ch3)).toString(), getLocation());
                            }
                        } else if (ch2 == '?') {
                            parsePI();
                            if (this.tokenize) {
                                this.eventType = 3;
                                return 3;
                            }
                            if (!this.usePC && hadCharData) {
                                needsMerging = true;
                            }
                        } else {
                            if (isNameStartChar(ch2)) {
                                if (!this.tokenize && hadCharData) {
                                    this.seenStartTag = true;
                                    this.eventType = 4;
                                    return 4;
                                }
                                int parseStartTag2 = parseStartTag();
                                this.eventType = parseStartTag2;
                                return parseStartTag2;
                            }
                            throw new XMLStreamException(new StringBuffer().append("unexpected character in markup ").append(printable(ch2)).toString(), getLocation());
                        }
                    } else if (ch == '&') {
                        if (this.tokenize && hadCharData) {
                            this.seenAmpersand = true;
                            this.eventType = 4;
                            return 4;
                        }
                        int oldStart2 = this.posStart;
                        int oldEnd2 = this.posEnd;
                        boolean replace = getConfigurationContext().isReplacingEntities();
                        char[] resolvedEntity = parseEntityRef(replace);
                        if (!replace) {
                            this.eventType = 9;
                            return 9;
                        }
                        this.eventType = 4;
                        if (resolvedEntity == null) {
                            if (this.entityRefName == null) {
                                this.entityRefName = newString(this.buf, this.posStart, this.posEnd - this.posStart);
                            }
                            throw new XMLStreamException(new StringBuffer().append("could not resolve entity named '").append(printable(this.entityRefName)).append("'").toString(), getLocation());
                        }
                        this.posStart = oldStart2;
                        this.posEnd = oldEnd2;
                        if (!this.usePC) {
                            if (hadCharData) {
                                joinPC();
                                needsMerging = TRACE_SIZING;
                            } else {
                                this.usePC = true;
                                this.pcEnd = TRACE_SIZING;
                                this.pcStart = TRACE_SIZING;
                            }
                        }
                        for (int i = TRACE_SIZING; i < resolvedEntity.length; i++) {
                            if (this.pcEnd >= this.pc.length) {
                                ensurePC(this.pcEnd);
                            }
                            char[] cArr = this.pc;
                            int i2 = this.pcEnd;
                            this.pcEnd = i2 + 1;
                            cArr[i2] = resolvedEntity[i];
                        }
                        hadCharData = true;
                    } else {
                        if (needsMerging) {
                            joinPC();
                            needsMerging = TRACE_SIZING;
                        }
                        hadCharData = true;
                        boolean normalizedCR = TRACE_SIZING;
                        do {
                            if (ch == '\r') {
                                normalizedCR = true;
                                this.posEnd = this.pos - 1;
                                if (!this.usePC) {
                                    if (this.posEnd > this.posStart) {
                                        joinPC();
                                    } else {
                                        this.usePC = true;
                                        this.pcEnd = TRACE_SIZING;
                                        this.pcStart = TRACE_SIZING;
                                    }
                                }
                                if (this.pcEnd >= this.pc.length) {
                                    ensurePC(this.pcEnd);
                                }
                                char[] cArr2 = this.pc;
                                int i3 = this.pcEnd;
                                this.pcEnd = i3 + 1;
                                cArr2[i3] = '\n';
                            } else if (ch == '\n') {
                                if (!normalizedCR && this.usePC) {
                                    if (this.pcEnd >= this.pc.length) {
                                        ensurePC(this.pcEnd);
                                    }
                                    char[] cArr3 = this.pc;
                                    int i4 = this.pcEnd;
                                    this.pcEnd = i4 + 1;
                                    cArr3[i4] = '\n';
                                }
                                normalizedCR = TRACE_SIZING;
                            } else {
                                if (this.usePC) {
                                    if (this.pcEnd >= this.pc.length) {
                                        ensurePC(this.pcEnd);
                                    }
                                    char[] cArr4 = this.pc;
                                    int i5 = this.pcEnd;
                                    this.pcEnd = i5 + 1;
                                    cArr4[i5] = ch;
                                }
                                normalizedCR = TRACE_SIZING;
                            }
                            ch = more();
                            if (ch == '<') {
                                break;
                            }
                        } while (ch != '&');
                        this.posEnd = this.pos - 1;
                    }
                    ch = more();
                }
            } else {
                if (this.seenRoot) {
                    return parseEpilog();
                }
                return parseProlog();
            }
        } catch (EOFException eofe) {
            throw new XMLStreamException(EOF_MSG, getLocation(), eofe);
        }
    }

    protected int parseProlog() throws XMLStreamException {
        char ch;
        try {
            if (this.seenMarkup) {
                ch = this.buf[this.pos - 1];
            } else {
                ch = more();
            }
            if (this.eventType == 7) {
                if (ch == 65534) {
                    throw new XMLStreamException("first character in input was UNICODE noncharacter (0xFFFE)- input requires int swapping", getLocation());
                }
                if (ch == CHAR_UTF8_BOM) {
                    ch = more();
                }
            }
            this.seenMarkup = false;
            boolean gotS = TRACE_SIZING;
            this.posStart = this.pos - 1;
            while (true) {
                if (ch == '<') {
                    if (gotS && this.tokenize) {
                        this.posEnd = this.pos - 1;
                        this.seenMarkup = true;
                        this.eventType = 6;
                        return 6;
                    }
                    char ch2 = more();
                    if (ch2 == '?') {
                        boolean isXMLDecl = parsePI();
                        if (this.tokenize) {
                            if (isXMLDecl) {
                                this.eventType = 7;
                                return 7;
                            }
                            this.eventType = 3;
                            return 3;
                        }
                    } else if (ch2 == '!') {
                        char ch3 = more();
                        if (ch3 == 'D') {
                            if (this.seenDocdecl) {
                                throw new XMLStreamException("only one docdecl allowed in XML document", getLocation());
                            }
                            this.seenDocdecl = true;
                            parseDocdecl();
                            if (this.tokenize) {
                                this.eventType = 11;
                                return 11;
                            }
                        } else if (ch3 == '-') {
                            parseComment();
                            if (this.tokenize) {
                                this.eventType = 5;
                                return 5;
                            }
                        } else {
                            throw new XMLStreamException(new StringBuffer().append("unexpected markup <!").append(printable(ch3)).toString(), getLocation());
                        }
                    } else {
                        if (ch2 == '/') {
                            throw new XMLStreamException(new StringBuffer().append("expected start tag name and not ").append(printable(ch2)).toString(), getLocation());
                        }
                        if (isNameStartChar(ch2)) {
                            this.seenRoot = true;
                            return parseStartTag();
                        }
                        throw new XMLStreamException(new StringBuffer().append("expected start tag name and not ").append(printable(ch2)).toString(), getLocation());
                    }
                } else if (isS(ch)) {
                    gotS = true;
                } else {
                    throw new XMLStreamException(new StringBuffer().append("only whitespace content allowed before start tag and not ").append(printable(ch)).toString(), getLocation());
                }
                ch = more();
            }
        } catch (EOFException eofe) {
            throw new XMLStreamException(EOF_MSG, getLocation(), eofe);
        }
    }

    protected int parseEpilog() throws XMLStreamException {
        char ch;
        if (this.eventType == 8) {
            throw new XMLStreamException("already reached end document", getLocation());
        }
        if (this.reachedEnd) {
            this.eventType = 8;
            return 8;
        }
        boolean gotS = TRACE_SIZING;
        try {
            if (this.seenMarkup) {
                ch = this.buf[this.pos - 1];
            } else {
                ch = more();
            }
            this.seenMarkup = false;
            this.posStart = this.pos - 1;
            while (true) {
                if (ch == '<') {
                    if (gotS && this.tokenize) {
                        this.posEnd = this.pos - 1;
                        this.seenMarkup = true;
                        this.eventType = 6;
                        return 6;
                    }
                    char ch2 = more();
                    if (ch2 == '?') {
                        parsePI();
                        if (this.tokenize) {
                            this.eventType = 3;
                            return 3;
                        }
                    } else if (ch2 == '!') {
                        char ch3 = more();
                        if (ch3 == 'D') {
                            parseDocdecl();
                            if (this.tokenize) {
                                this.eventType = 11;
                                return 11;
                            }
                        } else if (ch3 == '-') {
                            parseComment();
                            if (this.tokenize) {
                                this.eventType = 5;
                                return 5;
                            }
                        } else {
                            throw new XMLStreamException(new StringBuffer().append("unexpected markup <!").append(printable(ch3)).toString(), getLocation());
                        }
                    } else {
                        if (ch2 == '/') {
                            throw new XMLStreamException(new StringBuffer().append("end tag not allowed in epilog but got ").append(printable(ch2)).toString(), getLocation());
                        }
                        if (isNameStartChar(ch2)) {
                            throw new XMLStreamException(new StringBuffer().append("start tag not allowed in epilog but got ").append(printable(ch2)).toString(), getLocation());
                        }
                        throw new XMLStreamException(new StringBuffer().append("in epilog expected ignorable content and not ").append(printable(ch2)).toString(), getLocation());
                    }
                } else if (isS(ch)) {
                    gotS = true;
                } else {
                    throw new XMLStreamException(new StringBuffer().append("in epilog non whitespace content is not allowed but got ").append(printable(ch)).toString(), getLocation());
                }
                ch = more();
            }
        } catch (EOFException e) {
            this.reachedEnd = true;
            if (this.tokenize && gotS) {
                this.posEnd = this.pos;
                this.eventType = 6;
                return 6;
            }
            this.eventType = 8;
            return 8;
        }
    }

    public int parseEndTag() throws XMLStreamException {
        char ch;
        this.eventType = 2;
        try {
            char ch2 = more();
            if (!isNameStartChar(ch2)) {
                throw new XMLStreamException(new StringBuffer().append("expected name start and not ").append(printable(ch2)).toString(), getLocation());
            }
            this.posStart = this.pos - 3;
            int nameStart = (this.pos - 1) + this.bufAbsoluteStart;
            do {
                ch = more();
            } while (isNameChar(ch));
            int last = this.pos - 1;
            int off = nameStart - this.bufAbsoluteStart;
            int len = last - off;
            char[] cbuf = this.elRawName[this.depth];
            if (this.elRawNameEnd[this.depth] != len) {
                String startname = new String(cbuf, TRACE_SIZING, this.elRawNameEnd[this.depth]);
                String endname = new String(this.buf, off, len);
                throw new XMLStreamException(new StringBuffer().append("end tag name '").append(endname).append("' must match start tag name '").append(startname).append("'").toString(), getLocation());
            }
            for (int i = TRACE_SIZING; i < len; i++) {
                int i2 = off;
                off++;
                if (this.buf[i2] != cbuf[i]) {
                    String startname2 = new String(cbuf, TRACE_SIZING, len);
                    String endname2 = new String(this.buf, (off - i) - 1, len);
                    throw new XMLStreamException(new StringBuffer().append("end tag name '").append(endname2).append("' must be the same as start tag '").append(startname2).append("'").toString(), getLocation());
                }
            }
            while (isS(ch)) {
                ch = more();
            }
            if (ch != '>') {
                throw new XMLStreamException(new StringBuffer().append("expected > to finsh end tag not ").append(printable(ch)).toString(), getLocation());
            }
            this.posEnd = this.pos;
            this.pastEndTag = true;
            return 2;
        } catch (EOFException eofe) {
            throw new XMLStreamException(EOF_MSG, getLocation(), eofe);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x03b3, code lost:
    
        if (r9.attributeUri[r17] == null) goto L102;
     */
    /* JADX WARN: Code restructure failed: missing block: B:101:0x03b6, code lost:
    
        r20 = new java.lang.StringBuffer().append(r9.attributeUri[r17]).append(":").append(r20).toString();
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x0401, code lost:
    
        throw new javax.xml.stream.XMLStreamException(new java.lang.StringBuffer().append("duplicated attributes ").append(r19).append(" and ").append(r20).toString(), getLocation());
     */
    /* JADX WARN: Code restructure failed: missing block: B:104:0x0402, code lost:
    
        r18 = r18 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x0408, code lost:
    
        r17 = r17 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x0411, code lost:
    
        r16 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x041a, code lost:
    
        if (r16 >= r9.attributeCount) goto L170;
     */
    /* JADX WARN: Code restructure failed: missing block: B:110:0x041d, code lost:
    
        r17 = com.bea.xml.stream.MXParser.TRACE_SIZING;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x0424, code lost:
    
        if (r17 >= r16) goto L173;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x042b, code lost:
    
        if (r9.allStringsInterned == false) goto L117;
     */
    /* JADX WARN: Code restructure failed: missing block: B:116:0x043f, code lost:
    
        if (r9.attributeName[r17].equals(r9.attributeName[r16]) != false) goto L171;
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x0446, code lost:
    
        if (r9.allStringsInterned != false) goto L174;
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:0x0457, code lost:
    
        if (r9.attributeNameHash[r17] != r9.attributeNameHash[r16]) goto L175;
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x046b, code lost:
    
        if (r9.attributeName[r17].equals(r9.attributeName[r16]) == false) goto L176;
     */
    /* JADX WARN: Code restructure failed: missing block: B:124:0x04ab, code lost:
    
        throw new javax.xml.stream.XMLStreamException(new java.lang.StringBuffer().append("duplicated attributes ").append(r9.attributeName[r17]).append(" and ").append(r9.attributeName[r16]).toString(), getLocation());
     */
    /* JADX WARN: Code restructure failed: missing block: B:125:0x04ac, code lost:
    
        r17 = r17 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:126:0x04b2, code lost:
    
        r16 = r16 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:127:0x04b8, code lost:
    
        r9.elNamespaceCount[r9.depth] = r9.namespaceEnd;
        r9.posEnd = r9.pos;
     */
    /* JADX WARN: Code restructure failed: missing block: B:128:0x04d1, code lost:
    
        if (r9.defaultAttributes == null) goto L133;
     */
    /* JADX WARN: Code restructure failed: missing block: B:130:0x04d6, code lost:
    
        if (r15 == null) goto L132;
     */
    /* JADX WARN: Code restructure failed: missing block: B:131:0x04d9, code lost:
    
        addDefaultAttributes(new java.lang.StringBuffer().append(r15).append(":").append(r14).toString());
     */
    /* JADX WARN: Code restructure failed: missing block: B:132:0x04f9, code lost:
    
        addDefaultAttributes(r14);
     */
    /* JADX WARN: Code restructure failed: missing block: B:137:0x0513, code lost:
    
        return 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0255, code lost:
    
        if (r9.processNamespaces == false) goto L107;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0258, code lost:
    
        r16 = getNamespaceURI(r15);
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0262, code lost:
    
        if (r16 != null) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x0267, code lost:
    
        if (r15 != null) goto L64;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x026a, code lost:
    
        r16 = com.bea.xml.stream.MXParser.NO_NAMESPACE;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0292, code lost:
    
        throw new javax.xml.stream.XMLStreamException(new java.lang.StringBuffer().append("could not determine namespace bound to element prefix ").append(r15).toString(), getLocation());
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0293, code lost:
    
        r9.elUri[r9.depth] = r16;
        r17 = com.bea.xml.stream.MXParser.TRACE_SIZING;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x02a7, code lost:
    
        if (r17 >= r9.attributeCount) goto L158;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x02aa, code lost:
    
        r0 = r9.attributePrefix[r17];
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x02b5, code lost:
    
        if (r0 == null) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x02b8, code lost:
    
        r0 = getNamespaceURI(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x02c2, code lost:
    
        if (r0 != null) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x02e5, code lost:
    
        throw new javax.xml.stream.XMLStreamException(new java.lang.StringBuffer().append("could not determine namespace bound to attribute prefix ").append(r0).toString(), getLocation());
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x02e6, code lost:
    
        r9.attributeUri[r17] = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x02f2, code lost:
    
        r9.attributeUri[r17] = com.bea.xml.stream.MXParser.NO_NAMESPACE;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x02fc, code lost:
    
        r17 = r17 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x0302, code lost:
    
        r17 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x030b, code lost:
    
        if (r17 >= r9.attributeCount) goto L162;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x030e, code lost:
    
        r18 = com.bea.xml.stream.MXParser.TRACE_SIZING;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x0315, code lost:
    
        if (r18 >= r17) goto L165;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x0326, code lost:
    
        if (r9.attributeUri[r18] != r9.attributeUri[r17]) goto L166;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x032d, code lost:
    
        if (r9.allStringsInterned == false) goto L90;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x0341, code lost:
    
        if (r9.attributeName[r18].equals(r9.attributeName[r17]) != false) goto L163;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x0348, code lost:
    
        if (r9.allStringsInterned != false) goto L167;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x0359, code lost:
    
        if (r9.attributeNameHash[r18] != r9.attributeNameHash[r17]) goto L168;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x036d, code lost:
    
        if (r9.attributeName[r18].equals(r9.attributeName[r17]) == false) goto L169;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x0370, code lost:
    
        r19 = r9.attributeName[r18];
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x0380, code lost:
    
        if (r9.attributeUri[r18] == null) goto L99;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x0383, code lost:
    
        r19 = new java.lang.StringBuffer().append(r9.attributeUri[r18]).append(":").append(r19).toString();
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x03a3, code lost:
    
        r20 = r9.attributeName[r17];
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int parseStartTag() throws javax.xml.stream.XMLStreamException {
        /*
            Method dump skipped, instructions count: 1301
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bea.xml.stream.MXParser.parseStartTag():int");
    }

    protected void addDefaultAttributes(String elementName) throws XMLStreamException {
        if (this.defaultAttributes == null) {
            return;
        }
        DTDAttlist attList = (DTDAttlist) this.defaultAttributes.get(elementName);
        if (elementName == null || attList == null) {
            return;
        }
        DTDAttribute[] atts = attList.getAttribute();
        for (int i = TRACE_SIZING; i < atts.length; i++) {
            DTDAttribute att = atts[i];
            if (att.getDefaultValue() != null) {
                boolean found = TRACE_SIZING;
                int count = this.attributeCount;
                int j = TRACE_SIZING;
                while (true) {
                    if (j >= count) {
                        break;
                    }
                    if (!this.attributeName[j].equals(att.getName())) {
                        j++;
                    } else {
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    this.attributeCount++;
                    ensureAttributesCapacity(this.attributeCount);
                    this.attributePrefix[this.attributeCount - 1] = null;
                    this.attributeUri[this.attributeCount - 1] = NO_NAMESPACE;
                    this.attributeName[this.attributeCount - 1] = att.getName();
                    this.attributeValue[this.attributeCount - 1] = att.getDefaultValue();
                }
            }
        }
    }

    protected char parseAttribute() throws XMLStreamException {
        String ns;
        try {
            int prevPosStart = this.posStart + this.bufAbsoluteStart;
            int nameStart = (this.pos - 1) + this.bufAbsoluteStart;
            int colonPos = -1;
            char ch = this.buf[this.pos - 1];
            if (ch == ':' && this.processNamespaces) {
                throw new XMLStreamException("when namespaces processing enabled colon can not be at attribute name start", getLocation());
            }
            boolean startsWithXmlns = this.processNamespaces && ch == 'x';
            int xmlnsPos = TRACE_SIZING;
            char ch2 = more();
            while (isNameChar(ch2)) {
                if (this.processNamespaces) {
                    if (startsWithXmlns && xmlnsPos < 5) {
                        xmlnsPos++;
                        if (xmlnsPos == 1) {
                            if (ch2 != 'm') {
                                startsWithXmlns = TRACE_SIZING;
                            }
                        } else if (xmlnsPos == 2) {
                            if (ch2 != 'l') {
                                startsWithXmlns = TRACE_SIZING;
                            }
                        } else if (xmlnsPos == 3) {
                            if (ch2 != 'n') {
                                startsWithXmlns = TRACE_SIZING;
                            }
                        } else if (xmlnsPos == 4) {
                            if (ch2 != 's') {
                                startsWithXmlns = TRACE_SIZING;
                            }
                        } else if (xmlnsPos == 5 && ch2 != ':') {
                            throw new XMLStreamException("after xmlns in attribute name must be colonwhen namespaces are enabled", getLocation());
                        }
                    }
                    if (ch2 != ':') {
                        continue;
                    } else {
                        if (colonPos != -1) {
                            throw new XMLStreamException("only one colon is allowed in attribute name when namespaces are enabled", getLocation());
                        }
                        colonPos = (this.pos - 1) + this.bufAbsoluteStart;
                    }
                }
                ch2 = more();
            }
            ensureAttributesCapacity(this.attributeCount);
            String name = TRACE_SIZING;
            if (this.processNamespaces) {
                if (xmlnsPos < 4) {
                    startsWithXmlns = TRACE_SIZING;
                }
                if (startsWithXmlns) {
                    if (colonPos != -1) {
                        name = newString(this.buf, (colonPos - this.bufAbsoluteStart) + 1, (this.pos - 2) - (colonPos - this.bufAbsoluteStart));
                        if (name.equals("xmlns")) {
                            throw new XMLStreamException("trying to bind reserved NS prefix 'xmlns'", getLocation());
                        }
                    }
                } else {
                    if (colonPos != -1) {
                        this.attributePrefix[this.attributeCount] = newString(this.buf, nameStart - this.bufAbsoluteStart, colonPos - nameStart);
                        String[] strArr = this.attributeName;
                        int i = this.attributeCount;
                        String newString = newString(this.buf, (colonPos - this.bufAbsoluteStart) + 1, (this.pos - 2) - (colonPos - this.bufAbsoluteStart));
                        strArr[i] = newString;
                        name = newString;
                    } else {
                        this.attributePrefix[this.attributeCount] = null;
                        String[] strArr2 = this.attributeName;
                        int i2 = this.attributeCount;
                        String newString2 = newString(this.buf, nameStart - this.bufAbsoluteStart, (this.pos - 1) - (nameStart - this.bufAbsoluteStart));
                        strArr2[i2] = newString2;
                        name = newString2;
                    }
                    if (!this.allStringsInterned) {
                        this.attributeNameHash[this.attributeCount] = name.hashCode();
                    }
                }
            } else {
                String[] strArr3 = this.attributeName;
                int i3 = this.attributeCount;
                String newString3 = newString(this.buf, nameStart - this.bufAbsoluteStart, (this.pos - 1) - (nameStart - this.bufAbsoluteStart));
                strArr3[i3] = newString3;
                name = newString3;
                if (!this.allStringsInterned) {
                    this.attributeNameHash[this.attributeCount] = name.hashCode();
                }
            }
            while (isS(ch2)) {
                ch2 = more();
            }
            if (ch2 != '=') {
                throw new XMLStreamException("expected = after attribute name", getLocation());
            }
            char ch3 = more();
            while (isS(ch3)) {
                ch3 = more();
            }
            char delimit = ch3;
            if (delimit != '\"' && delimit != '\'') {
                throw new XMLStreamException(new StringBuffer().append("attribute value must start with quotation or apostrophe not ").append(printable(delimit)).toString(), getLocation());
            }
            boolean normalizedCR = TRACE_SIZING;
            this.usePC = false;
            this.pcStart = this.pcEnd;
            this.posStart = this.pos;
            while (true) {
                char ch4 = more();
                if (ch4 != delimit) {
                    if (ch4 == '<') {
                        throw new XMLStreamException("markup not allowed inside attribute value - illegal < ", getLocation());
                    }
                    if (ch4 == '&') {
                        this.posEnd = this.pos - 1;
                        if (!this.usePC) {
                            boolean hadCharData = this.posEnd > this.posStart;
                            if (hadCharData) {
                                joinPC();
                            } else {
                                this.usePC = true;
                                this.pcEnd = TRACE_SIZING;
                                this.pcStart = TRACE_SIZING;
                            }
                        }
                        char[] resolvedEntity = parseEntityRef(getConfigurationContext().isReplacingEntities());
                        if (resolvedEntity == null) {
                            if (this.entityRefName == null) {
                                this.entityRefName = newString(this.buf, this.posStart, this.posEnd - this.posStart);
                            }
                            throw new XMLStreamException(new StringBuffer().append("could not resolve entity named '").append(printable(this.entityRefName)).append("'").toString(), getLocation());
                        }
                        for (int i4 = TRACE_SIZING; i4 < resolvedEntity.length; i4++) {
                            if (this.pcEnd >= this.pc.length) {
                                ensurePC(this.pcEnd);
                            }
                            char[] cArr = this.pc;
                            int i5 = this.pcEnd;
                            this.pcEnd = i5 + 1;
                            cArr[i5] = resolvedEntity[i4];
                        }
                    } else if (ch4 == '\t' || ch4 == '\n' || ch4 == '\r') {
                        if (!this.usePC) {
                            this.posEnd = this.pos - 1;
                            if (this.posEnd > this.posStart) {
                                joinPC();
                            } else {
                                this.usePC = true;
                                this.pcStart = TRACE_SIZING;
                                this.pcEnd = TRACE_SIZING;
                            }
                        }
                        if (this.pcEnd >= this.pc.length) {
                            ensurePC(this.pcEnd);
                        }
                        if (ch4 != '\n' || !normalizedCR) {
                            char[] cArr2 = this.pc;
                            int i6 = this.pcEnd;
                            this.pcEnd = i6 + 1;
                            cArr2[i6] = ' ';
                        }
                    } else if (this.usePC) {
                        if (this.pcEnd >= this.pc.length) {
                            ensurePC(this.pcEnd);
                        }
                        char[] cArr3 = this.pc;
                        int i7 = this.pcEnd;
                        this.pcEnd = i7 + 1;
                        cArr3[i7] = ch4;
                    }
                    normalizedCR = ch4 == '\r';
                } else {
                    if (this.processNamespaces && startsWithXmlns) {
                        if (!this.usePC) {
                            ns = newStringIntern(this.buf, this.posStart, (this.pos - 1) - this.posStart);
                        } else {
                            ns = newStringIntern(this.pc, this.pcStart, this.pcEnd - this.pcStart);
                        }
                        ensureNamespacesCapacity(this.namespaceEnd);
                        int prefixHash = -1;
                        if (ns.equals("http://www.w3.org/XML/1998/namespace")) {
                            if (!"xml".equals(name)) {
                                throw new XMLStreamException("trying to bind reserved NS URI  'http://www.w3.org/XML/1998/namespace' to prefix other than 'xml'");
                            }
                        } else if (ns.equals("http://www.w3.org/2000/xmlns/")) {
                            throw new XMLStreamException("trying to bind reserved NS URI  'http://www.w3.org/2000/xmlns/'");
                        }
                        if (colonPos != -1) {
                            if (ns.length() == 0) {
                                throw new XMLStreamException("non-default namespace can not be declared to be empty string (in xml 1.0)", getLocation());
                            }
                            if (name.equals("xml") && !ns.equals("http://www.w3.org/XML/1998/namespace")) {
                                throw new XMLStreamException("trying to bind reserved NS prefix 'xml' to URI other than its standard value (http://www.w3.org/XML/1998/namespace)", getLocation());
                            }
                            this.namespacePrefix[this.namespaceEnd] = name;
                            if (!this.allStringsInterned) {
                                int[] iArr = this.namespacePrefixHash;
                                int i8 = this.namespaceEnd;
                                int hashCode = name.hashCode();
                                iArr[i8] = hashCode;
                                prefixHash = hashCode;
                            }
                        } else {
                            this.namespacePrefix[this.namespaceEnd] = null;
                            if (ns.length() == 0) {
                                ns = NO_NAMESPACE;
                            }
                            if (!this.allStringsInterned) {
                                this.namespacePrefixHash[this.namespaceEnd] = -1;
                                prefixHash = -1;
                            }
                        }
                        this.namespaceUri[this.namespaceEnd] = ns;
                        int startNs = this.elNamespaceCount[this.depth - 1];
                        for (int i9 = this.namespaceEnd - 1; i9 >= startNs; i9--) {
                            if (((this.allStringsInterned || name == null) && this.namespacePrefix[i9] == name) || (!this.allStringsInterned && name != null && this.namespacePrefixHash[i9] == prefixHash && name.equals(this.namespacePrefix[i9]))) {
                                String s = name == null ? "default" : new StringBuffer().append("'").append(name).append("'").toString();
                                throw new XMLStreamException(new StringBuffer().append("duplicated namespace declaration for ").append(s).append(" prefix").toString(), getLocation());
                            }
                        }
                        this.namespaceEnd++;
                    } else {
                        if (!this.usePC) {
                            this.attributeValue[this.attributeCount] = new String(this.buf, this.posStart, (this.pos - 1) - this.posStart);
                        } else {
                            this.attributeValue[this.attributeCount] = new String(this.pc, this.pcStart, this.pcEnd - this.pcStart);
                        }
                        this.attributeCount++;
                    }
                    this.posStart = prevPosStart - this.bufAbsoluteStart;
                    return ch4;
                }
            }
        } catch (EOFException eofe) {
            throw new XMLStreamException(EOF_MSG, getLocation(), eofe);
        }
    }

    protected char[] parseEntityRef(boolean replace) throws XMLStreamException {
        char ch;
        try {
            this.entityRefName = null;
            this.posStart = this.pos;
            char ch2 = more();
            if (ch2 == '#') {
                int charRef = TRACE_SIZING;
                char ch3 = more();
                if (ch3 == 'x') {
                    do {
                        char ch4 = more();
                        if (ch4 == ';') {
                            break;
                        }
                        int charRef2 = charRef << 4;
                        if (ch4 >= '0' && ch4 <= '9') {
                            charRef = charRef2 + (ch4 - '0');
                        } else if (ch4 >= 'a' && ch4 <= 'f') {
                            charRef = charRef2 + (ch4 - 'W');
                        } else if (ch4 >= 'A' && ch4 <= 'F') {
                            charRef = charRef2 + (ch4 - '7');
                        } else {
                            throw new XMLStreamException(new StringBuffer().append("character reference (with hex value) may not contain ").append(printable(ch4)).toString(), getLocation());
                        }
                    } while (charRef <= MAX_UNICODE_CHAR);
                } else {
                    while (ch3 >= '0' && ch3 <= '9') {
                        charRef = (charRef * 10) + (ch3 - '0');
                        ch3 = more();
                        if (charRef > MAX_UNICODE_CHAR) {
                            break;
                        }
                    }
                    if (ch3 != ';') {
                        throw new XMLStreamException(new StringBuffer().append("character reference (with decimal value) may not contain ").append(printable(ch3)).toString(), getLocation());
                    }
                }
                this.posEnd = this.pos - 1;
                checkCharValidity(charRef, false);
                if (charRef > 65535) {
                    if (this.charRefTwoCharBuf == null) {
                        this.charRefTwoCharBuf = new char[2];
                    }
                    int charRef3 = charRef - 65536;
                    this.charRefTwoCharBuf[TRACE_SIZING] = (char) ((charRef3 >> 10) + 55296);
                    this.charRefTwoCharBuf[1] = (char) ((charRef3 & 1023) + 56320);
                    char[] cArr = this.charRefTwoCharBuf;
                    this.entityValue = cArr;
                    return cArr;
                }
                this.charRefOneCharBuf[TRACE_SIZING] = (char) charRef;
                char[] cArr2 = this.charRefOneCharBuf;
                this.entityValue = cArr2;
                return cArr2;
            }
            do {
                ch = more();
            } while (ch != ';');
            this.posEnd = this.pos - 1;
            int len = this.posEnd - this.posStart;
            if (len == 2) {
                if (this.buf[this.posStart] == 'l' && this.buf[this.posStart + 1] == 't') {
                    if (!replace) {
                        this.text = "<";
                    }
                    this.charRefOneCharBuf[TRACE_SIZING] = '<';
                    char[] cArr3 = this.charRefOneCharBuf;
                    this.entityValue = cArr3;
                    return cArr3;
                }
                if (this.buf[this.posStart] == 'g' && this.buf[this.posStart + 1] == 't') {
                    if (!replace) {
                        this.text = ">";
                    }
                    this.charRefOneCharBuf[TRACE_SIZING] = '>';
                    char[] cArr4 = this.charRefOneCharBuf;
                    this.entityValue = cArr4;
                    return cArr4;
                }
            } else if (len == 3) {
                if (this.buf[this.posStart] == 'a' && this.buf[this.posStart + 1] == 'm' && this.buf[this.posStart + 2] == 'p') {
                    if (!replace) {
                        this.text = "&";
                    }
                    this.charRefOneCharBuf[TRACE_SIZING] = '&';
                    char[] cArr5 = this.charRefOneCharBuf;
                    this.entityValue = cArr5;
                    return cArr5;
                }
            } else if (len == 4) {
                if (this.buf[this.posStart] == 'a' && this.buf[this.posStart + 1] == 'p' && this.buf[this.posStart + 2] == 'o' && this.buf[this.posStart + 3] == 's') {
                    if (!replace) {
                        this.text = "'";
                    }
                    this.charRefOneCharBuf[TRACE_SIZING] = '\'';
                    char[] cArr6 = this.charRefOneCharBuf;
                    this.entityValue = cArr6;
                    return cArr6;
                }
                if (this.buf[this.posStart] == 'q' && this.buf[this.posStart + 1] == 'u' && this.buf[this.posStart + 2] == 'o' && this.buf[this.posStart + 3] == 't') {
                    if (!replace) {
                        this.text = "\"";
                    }
                    this.charRefOneCharBuf[TRACE_SIZING] = '\"';
                    char[] cArr7 = this.charRefOneCharBuf;
                    this.entityValue = cArr7;
                    return cArr7;
                }
            }
            char[] lookupEntityReplacement = lookupEntityReplacement(len);
            this.entityValue = lookupEntityReplacement;
            return lookupEntityReplacement;
        } catch (EOFException eofe) {
            throw new XMLStreamException(EOF_MSG, getLocation(), eofe);
        }
    }

    protected char[] lookupEntityReplacement(int entitNameLen) throws XMLStreamException {
        if (!this.allStringsInterned) {
            int hash = fastHash(this.buf, this.posStart, this.posEnd - this.posStart);
            for (int i = this.entityEnd - 1; i >= 0; i--) {
                if (hash == this.entityNameHash[i] && entitNameLen == this.entityNameBuf[i].length) {
                    char[] entityBuf = this.entityNameBuf[i];
                    for (int j = TRACE_SIZING; j < entitNameLen; j++) {
                        if (this.buf[this.posStart + j] != entityBuf[j]) {
                            break;
                        }
                    }
                    if (this.tokenize) {
                        this.text = this.entityReplacement[i];
                    }
                    this.entityRefName = this.entityName[i];
                    return this.entityReplacementBuf[i];
                }
            }
            return null;
        }
        this.entityRefName = newString(this.buf, this.posStart, this.posEnd - this.posStart);
        for (int i2 = this.entityEnd - 1; i2 >= 0; i2--) {
            if (this.entityRefName == this.entityName[i2]) {
                if (this.tokenize) {
                    this.text = this.entityReplacement[i2];
                }
                return this.entityReplacementBuf[i2];
            }
        }
        return null;
    }

    protected void parseComment() throws XMLStreamException {
        try {
            if (more() != '-') {
                throw new XMLStreamException("expected <!-- for COMMENT start", getLocation());
            }
            this.posStart = this.pos;
            int curLine = this.lineNumber;
            int curColumn = this.columnNumber;
            int expDash = -2;
            int skipLfAt = -2;
            int at = -1;
            boolean anySkipped = TRACE_SIZING;
            while (true) {
                try {
                    char ch = more();
                    at++;
                    if (ch == '-') {
                        if (expDash >= at) {
                            break;
                        } else {
                            expDash = at + 1;
                        }
                    } else if (ch == '\r') {
                        this.columnNumber = 1;
                        skipLfAt = at + 1;
                        if (!anySkipped) {
                            this.buf[this.pos - 1] = '\n';
                        } else {
                            ch = '\n';
                        }
                    } else if (ch == '\n' && skipLfAt == at) {
                        if (!anySkipped) {
                            anySkipped = true;
                            this.posEnd = this.pos - 1;
                        }
                    }
                    if (anySkipped) {
                        this.buf[this.posEnd] = ch;
                        this.posEnd++;
                    }
                } catch (EOFException ex) {
                    throw new XMLStreamException(new StringBuffer().append("COMMENT started on line ").append(curLine).append(" and column ").append(curColumn).append(" was not closed").toString(), getLocation(), ex);
                }
            }
            char ch2 = more();
            if (ch2 != '>') {
                throw new XMLStreamException(new StringBuffer().append("in COMMENT after two dashes (--) next character must be '>' not ").append(printable(ch2)).toString(), getLocation());
            }
            if (anySkipped) {
                this.posEnd--;
            } else {
                this.posEnd = this.pos - 3;
            }
        } catch (EOFException eofe) {
            throw new XMLStreamException(EOF_MSG, getLocation(), eofe);
        }
    }

    public String getPITarget() {
        if (this.eventType != 3) {
            throwIllegalState(3);
        }
        return this.piTarget;
    }

    public String getPIData() {
        if (this.eventType != 3) {
            throwIllegalState(3);
        }
        return this.piData;
    }

    public NamespaceContext getNamespaceContext() {
        return new ReadOnlyNamespaceContextBase(this.namespacePrefix, this.namespaceUri, this.namespaceEnd);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x006a, code lost:
    
        r0 = (r8.pos - r8.posStart) - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0079, code lost:
    
        if (r0 != 0) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x008a, code lost:
    
        throw new javax.xml.stream.XMLStreamException("processing instruction must have PITarget name", getLocation());
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x008b, code lost:
    
        r8.piTarget = new java.lang.String(r8.buf, r8.posStart, r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x00a3, code lost:
    
        if (r11 == '?') goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x00a6, code lost:
    
        r11 = skipS(r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x00ac, code lost:
    
        r13 = r8.piTarget.equalsIgnoreCase("xml");
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x00b9, code lost:
    
        if (r13 == false) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x00c6, code lost:
    
        if ((r8.posStart + r8.bufAbsoluteStart) <= 2) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x00d7, code lost:
    
        throw new javax.xml.stream.XMLStreamException("processing instruction can not have PITarget with reserved name 'xml'", getLocation());
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00e1, code lost:
    
        if ("xml".equals(r8.piTarget) != false) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00f2, code lost:
    
        throw new javax.xml.stream.XMLStreamException("XMLDecl must have xml name in lowercase", getLocation());
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00f3, code lost:
    
        r8.posStart = r8.pos - 1;
        parseXmlDecl(r11);
        r13 = true;
        r8.posEnd = r8.pos - 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0112, code lost:
    
        r8.posStart = r8.pos - 1;
        r14 = -2;
        r15 = -2;
        r16 = -1;
        r17 = com.bea.xml.stream.MXParser.TRACE_SIZING;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x012a, code lost:
    
        r16 = r16 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0130, code lost:
    
        if (r11 != '?') goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0133, code lost:
    
        r14 = r16 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x013f, code lost:
    
        if (r11 != '>') goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0146, code lost:
    
        if (r16 != r14) goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x014f, code lost:
    
        if (r11 != '\r') goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0152, code lost:
    
        r8.columnNumber = 1;
        r15 = r16 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x015f, code lost:
    
        if (r17 != false) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0162, code lost:
    
        r8.buf[r8.pos - 1] = '\n';
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0172, code lost:
    
        r11 = '\n';
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x017b, code lost:
    
        if (r11 != '\n') goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x0182, code lost:
    
        if (r15 != r16) goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0187, code lost:
    
        if (r17 != false) goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x018a, code lost:
    
        r17 = true;
        r8.posEnd = r8.pos - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x019c, code lost:
    
        if (r17 == false) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x019f, code lost:
    
        r8.buf[r8.posEnd] = r11;
        r8.posEnd++;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x01b3, code lost:
    
        r11 = more();
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x01bd, code lost:
    
        if (r17 == false) goto L62;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x01c0, code lost:
    
        r8.posEnd--;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x01cd, code lost:
    
        r8.posEnd = r8.pos - 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x01d7, code lost:
    
        r8.piData = new java.lang.String(r8.buf, r8.posStart, r8.posEnd - r8.posStart);
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x01f5, code lost:
    
        return r13;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected boolean parsePI() throws javax.xml.stream.XMLStreamException {
        /*
            Method dump skipped, instructions count: 552
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bea.xml.stream.MXParser.parsePI():boolean");
    }

    protected char requireInput(char ch, char[] input) throws XMLStreamException {
        for (int i = TRACE_SIZING; i < input.length; i++) {
            if (ch != input[i]) {
                throw new XMLStreamException(new StringBuffer().append("expected ").append(printable(input[i])).append(" in ").append(new String(input)).append(" and not ").append(printable(ch)).toString(), getLocation());
            }
            try {
                ch = more();
            } catch (EOFException eofe) {
                throw new XMLStreamException(EOF_MSG, getLocation(), eofe);
            }
        }
        return ch;
    }

    protected char requireNextS() throws XMLStreamException {
        try {
            char ch = more();
            if (!isS(ch)) {
                throw new XMLStreamException(new StringBuffer().append("white space is required and not ").append(printable(ch)).toString(), getLocation());
            }
            return skipS(ch);
        } catch (EOFException eofe) {
            throw new XMLStreamException(EOF_MSG, getLocation(), eofe);
        }
    }

    protected char skipS(char ch) throws XMLStreamException {
        while (isS(ch)) {
            try {
                ch = more();
            } catch (EOFException eofe) {
                throw new XMLStreamException(EOF_MSG, getLocation(), eofe);
            }
        }
        return ch;
    }

    protected void parseXmlDecl(char ch) throws XMLStreamException {
        try {
            char ch2 = skipS(requireInput(skipS(ch), VERSION));
            if (ch2 != '=') {
                throw new XMLStreamException(new StringBuffer().append("expected equals sign (=) after version and not ").append(printable(ch2)).toString(), getLocation());
            }
            char ch3 = more();
            char ch4 = skipS(ch3);
            if (ch4 != '\'' && ch4 != '\"') {
                throw new XMLStreamException(new StringBuffer().append("expected apostrophe (') or quotation mark (\") after version and not ").append(printable(ch4)).toString(), getLocation());
            }
            int versionStart = this.pos;
            char ch5 = more();
            while (ch5 != ch4) {
                if ((ch5 < 'a' || ch5 > 'z') && ((ch5 < 'A' || ch5 > 'Z') && ((ch5 < '0' || ch5 > '9') && ch5 != '_' && ch5 != '.' && ch5 != ':' && ch5 != '-'))) {
                    throw new XMLStreamException(new StringBuffer().append("<?xml version value expected to be in ([a-zA-Z0-9_.:] | '-') not ").append(printable(ch5)).toString(), getLocation());
                }
                ch5 = more();
            }
            int versionEnd = this.pos - 1;
            parseXmlDeclWithVersion(versionStart, versionEnd);
        } catch (EOFException eofe) {
            throw new XMLStreamException(EOF_MSG, getLocation(), eofe);
        }
    }

    protected void parseXmlDeclWithVersion(int versionStart, int versionEnd) throws XMLStreamException {
        char ch;
        try {
            if (versionEnd - versionStart != 3 || this.buf[versionStart] != '1' || this.buf[versionStart + 1] != '.' || this.buf[versionStart + 2] != '0') {
                throw new XMLStreamException(new StringBuffer().append("only 1.0 is supported as <?xml version not '").append(printable(new String(this.buf, versionStart, versionEnd))).append("'").toString(), getLocation());
            }
            this.xmlVersion = new String(this.buf, versionStart, versionEnd - versionStart);
            char ch2 = skipS(more());
            if (ch2 != '?') {
                ch2 = skipS(ch2);
                if (ch2 == ENCODING[TRACE_SIZING]) {
                    char ch3 = skipS(requireInput(ch2, ENCODING));
                    if (ch3 != '=') {
                        throw new XMLStreamException(new StringBuffer().append("expected equals sign (=) after encoding and not ").append(printable(ch3)).toString(), getLocation());
                    }
                    char ch4 = skipS(more());
                    if (ch4 != '\'' && ch4 != '\"') {
                        throw new XMLStreamException(new StringBuffer().append("expected apostrophe (') or quotation mark (\") after encoding and not ").append(printable(ch4)).toString(), getLocation());
                    }
                    int encodingStart = this.pos;
                    char ch5 = more();
                    if ((ch5 < 'a' || ch5 > 'z') && (ch5 < 'A' || ch5 > 'Z')) {
                        throw new XMLStreamException(new StringBuffer().append("<?xml encoding name expected to start with [A-Za-z] not ").append(printable(ch5)).toString(), getLocation());
                    }
                    char ch6 = more();
                    while (ch6 != ch4) {
                        if ((ch6 < 'a' || ch6 > 'z') && ((ch6 < 'A' || ch6 > 'Z') && ((ch6 < '0' || ch6 > '9') && ch6 != '.' && ch6 != '_' && ch6 != '-'))) {
                            throw new XMLStreamException(new StringBuffer().append("<?xml encoding value expected to be in ([A-Za-z0-9._] | '-') not ").append(printable(ch6)).toString(), getLocation());
                        }
                        ch6 = more();
                    }
                    int encodingEnd = this.pos - 1;
                    this.charEncodingScheme = newString(this.buf, encodingStart, encodingEnd - encodingStart);
                    ch2 = skipS(more());
                }
                if (ch2 != '?') {
                    char ch7 = skipS(requireInput(skipS(ch2), STANDALONE));
                    if (ch7 != '=') {
                        throw new XMLStreamException(new StringBuffer().append("expected equals sign (=) after standalone and not ").append(printable(ch7)).toString(), getLocation());
                    }
                    char ch8 = skipS(more());
                    if (ch8 != '\'' && ch8 != '\"') {
                        throw new XMLStreamException(new StringBuffer().append("expected apostrophe (') or quotation mark (\") after encoding and not ").append(printable(ch8)).toString(), getLocation());
                    }
                    int i = this.pos;
                    char ch9 = more();
                    if (ch9 == 'y') {
                        ch = requireInput(ch9, YES);
                        this.standalone = true;
                    } else if (ch9 == 'n') {
                        ch = requireInput(ch9, NO);
                        this.standalone = false;
                    } else {
                        throw new XMLStreamException(new StringBuffer().append("expected 'yes' or 'no' after standalone and not ").append(printable(ch9)).toString(), getLocation());
                    }
                    this.standaloneSet = true;
                    if (ch != ch8) {
                        throw new XMLStreamException(new StringBuffer().append("expected ").append(ch8).append(" after standalone value not ").append(printable(ch)).toString(), getLocation());
                    }
                    ch2 = more();
                }
            }
            char ch10 = skipS(ch2);
            if (ch10 != '?') {
                throw new XMLStreamException(new StringBuffer().append("expected ?> as last part of <?xml not ").append(printable(ch10)).toString(), getLocation());
            }
            char ch11 = more();
            if (ch11 != '>') {
                throw new XMLStreamException(new StringBuffer().append("expected ?> as last part of <?xml not ").append(printable(ch11)).toString(), getLocation());
            }
        } catch (EOFException eofe) {
            throw new XMLStreamException(EOF_MSG, getLocation(), eofe);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to find 'out' block for switch in B:76:0x01ad. Please report as an issue. */
    protected void parseDocdecl() throws XMLStreamException {
        char ch;
        char more;
        this.posStart = this.pos - 3;
        try {
            if (more() != 'O' || more() != 'C' || more() != 'T' || more() != 'Y' || more() != 'P' || more() != 'E') {
                throw new XMLStreamException("expected <!DOCTYPE", getLocation());
            }
            char ch2 = requireNextS();
            if (!isNameStartChar(ch2)) {
                throwNotNameStart(ch2);
            }
            int i = (this.pos - 1) + this.bufAbsoluteStart;
            do {
                ch = more();
            } while (isNameChar(ch));
            char ch3 = skipS(ch);
            if (ch3 == 'S' || ch3 == 'P') {
                if (ch3 == 'S') {
                    if (more() != 'Y' || more() != 'S' || more() != 'T' || more() != 'E' || more() != 'M') {
                        throw new XMLStreamException("expected keyword SYSTEM", getLocation());
                    }
                } else {
                    if (more() != 'U' || more() != 'B' || more() != 'L' || more() != 'I' || more() != 'C') {
                        throw new XMLStreamException("expected keyword PUBLIC", getLocation());
                    }
                    char quotChar = requireNextS();
                    if (quotChar != '\"' && quotChar != '\'') {
                        throw new XMLStreamException(new StringBuffer().append("Public identifier has to be enclosed in quotes, not ").append(printable(ch3)).toString(), getLocation());
                    }
                    do {
                        more = more();
                        ch3 = more;
                    } while (more != quotChar);
                }
                char quotChar2 = requireNextS();
                if (quotChar2 != '\"' && quotChar2 != '\'') {
                    throw new XMLStreamException(new StringBuffer().append("System identifier has to be enclosed in quotes, not ").append(printable(ch3)).toString(), getLocation());
                }
                while (more() != quotChar2) {
                }
                ch3 = skipS(more());
            }
            if (ch3 == '[') {
                this.posStart = this.pos;
                int bracketLevel = 1;
                while (true) {
                    char ch4 = more();
                    switch (ch4) {
                        case '\"':
                        case '\'':
                            while (more() != ch4) {
                            }
                        case '>':
                            break;
                        case '[':
                            bracketLevel++;
                        case ']':
                            bracketLevel--;
                    }
                    if (bracketLevel <= 0) {
                        this.posEnd = this.pos - 2;
                        processDTD();
                    }
                }
            } else {
                int i2 = this.pos;
                this.posEnd = i2;
                this.posStart = i2;
                char ch5 = skipS(ch3);
                if (ch5 != '>') {
                    throw new XMLStreamException(new StringBuffer().append("Expected closing '>' after internal DTD subset, not '").append(printable(ch5)).append("'").toString(), getLocation());
                }
            }
        } catch (EOFException eofe) {
            throw new XMLStreamException(EOF_MSG, getLocation(), eofe);
        }
    }

    protected void processDTD() throws XMLStreamException {
        Class cls;
        Class cls2;
        try {
            String internalDTD = new String(this.buf, this.posStart, this.posEnd - this.posStart);
            DTDParser dtdParser = new DTDParser(new StringReader(internalDTD));
            this.mDtdIntSubset = dtdParser.parse();
            DTD dtd = this.mDtdIntSubset;
            if (class$com$wutka$dtd$DTDEntity == null) {
                cls = class$("com.wutka.dtd.DTDEntity");
                class$com$wutka$dtd$DTDEntity = cls;
            } else {
                cls = class$com$wutka$dtd$DTDEntity;
            }
            Vector v = dtd.getItemsByType(cls);
            Enumeration e = v.elements();
            while (e.hasMoreElements()) {
                DTDEntity entity = (DTDEntity) e.nextElement();
                if (!entity.isParsed()) {
                    defineEntityReplacementText(entity.getName(), entity.getValue());
                }
            }
            DTD dtd2 = this.mDtdIntSubset;
            if (class$com$wutka$dtd$DTDAttlist == null) {
                cls2 = class$("com.wutka.dtd.DTDAttlist");
                class$com$wutka$dtd$DTDAttlist = cls2;
            } else {
                cls2 = class$com$wutka$dtd$DTDAttlist;
            }
            Vector v2 = dtd2.getItemsByType(cls2);
            Enumeration e2 = v2.elements();
            while (e2.hasMoreElements()) {
                DTDAttlist list = (DTDAttlist) e2.nextElement();
                DTDAttribute[] atts = list.getAttribute();
                for (int i = TRACE_SIZING; i < atts.length; i++) {
                    DTDAttribute att = atts[i];
                    if (att.getDefaultValue() != null) {
                        if (this.defaultAttributes == null) {
                            this.defaultAttributes = new HashMap();
                        }
                        this.defaultAttributes.put(list.getName(), list);
                    }
                }
            }
        } catch (IOException ioe) {
            throw new XMLStreamException(ioe);
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    protected void parseCDATA() throws XMLStreamException {
        try {
            if (more() != 'C' || more() != 'D' || more() != 'A' || more() != 'T' || more() != 'A' || more() != '[') {
                throw new XMLStreamException("expected <[CDATA[ for CDATA start", getLocation());
            }
            this.posStart = this.pos;
            int curLine = this.lineNumber;
            int curColumn = this.columnNumber;
            int bracketCount = TRACE_SIZING;
            int skipLfAt = -2;
            int at = -1;
            boolean anySkipped = TRACE_SIZING;
            while (true) {
                try {
                    at++;
                    char ch = more();
                    if (ch == ']') {
                        bracketCount++;
                    } else if (ch == '>') {
                        if (bracketCount >= 2) {
                            break;
                        } else {
                            bracketCount = TRACE_SIZING;
                        }
                    } else {
                        bracketCount = TRACE_SIZING;
                        if (ch == '\r') {
                            this.columnNumber = 1;
                            skipLfAt = at + 1;
                            if (!anySkipped) {
                                this.buf[this.pos - 1] = '\n';
                            } else {
                                ch = '\n';
                            }
                        } else if (ch == '\n' && skipLfAt == at) {
                            anySkipped = true;
                            this.posEnd = this.pos - 1;
                        }
                    }
                    if (anySkipped) {
                        this.buf[this.posEnd] = ch;
                        this.posEnd++;
                    }
                } catch (EOFException ex) {
                    throw new XMLStreamException(new StringBuffer().append("CDATA section on line ").append(curLine).append(" and column ").append(curColumn).append(" was not closed").toString(), getLocation(), ex);
                }
            }
            if (anySkipped) {
                this.posEnd -= 2;
            } else {
                this.posEnd = this.pos - 3;
            }
        } catch (EOFException eofe) {
            throw new XMLStreamException("Unexpected EOF in directive", getLocation(), eofe);
        }
    }

    protected void fillBuf() throws XMLStreamException, EOFException {
        if (this.reader == null) {
            throw new XMLStreamException("reader must be set before parsing is started");
        }
        if (this.bufEnd > this.bufSoftLimit) {
            boolean compact = this.bufStart > this.bufSoftLimit;
            boolean expand = TRACE_SIZING;
            if (!compact) {
                if (this.bufStart < this.buf.length / 2) {
                    expand = true;
                } else {
                    compact = true;
                }
            }
            if (compact) {
                System.arraycopy(this.buf, this.bufStart, this.buf, TRACE_SIZING, this.bufEnd - this.bufStart);
            } else if (expand) {
                int newSize = 2 * this.buf.length;
                char[] newBuf = new char[newSize];
                System.arraycopy(this.buf, this.bufStart, newBuf, TRACE_SIZING, this.bufEnd - this.bufStart);
                this.buf = newBuf;
                if (this.bufLoadFactor > 0) {
                    this.bufSoftLimit = (this.bufLoadFactor * this.buf.length) / 100;
                }
            } else {
                throw new XMLStreamException("internal error in fillBuffer()");
            }
            this.bufEnd -= this.bufStart;
            this.pos -= this.bufStart;
            this.posStart -= this.bufStart;
            this.posEnd -= this.bufStart;
            this.bufAbsoluteStart += this.bufStart;
            this.bufStart = TRACE_SIZING;
        }
        int room = this.buf.length - this.bufEnd;
        int len = room > READ_CHUNK_SIZE ? READ_CHUNK_SIZE : room;
        try {
            int ret = this.reader.read(this.buf, this.bufEnd, len);
            if (ret > 0) {
                this.bufEnd += ret;
            } else {
                if (ret == -1) {
                    throw new EOFException("no more data available");
                }
                throw new XMLStreamException(new StringBuffer().append("error reading input, returned ").append(ret).toString());
            }
        } catch (IOException ioe) {
            throw new XMLStreamException(ioe);
        }
    }

    protected char more() throws XMLStreamException, EOFException {
        if (this.pos >= this.bufEnd) {
            fillBuf();
        }
        char[] cArr = this.buf;
        int i = this.pos;
        this.pos = i + 1;
        char ch = cArr[i];
        if (ch == '\n') {
            this.lineNumber++;
            this.columnNumber = 1;
        } else {
            this.columnNumber++;
        }
        return ch;
    }

    protected String printable(char ch) {
        if (ch == '\n') {
            return "\\n";
        }
        if (ch == '\r') {
            return "\\r";
        }
        if (ch == '\t') {
            return "\\t";
        }
        if (ch == '\'') {
            return "\\'";
        }
        if (ch > 127 || ch < ' ') {
            return new StringBuffer().append("\\u").append(Integer.toHexString(ch)).toString();
        }
        return new StringBuffer().append("").append(ch).toString();
    }

    protected String printable(String s) {
        if (s == null) {
            return null;
        }
        StringBuffer buf = new StringBuffer();
        for (int i = TRACE_SIZING; i < s.length(); i++) {
            buf.append(printable(s.charAt(i)));
        }
        return buf.toString();
    }

    protected void ensurePC(int end) {
        int newSize = end > READ_CHUNK_SIZE ? 2 * end : TEXT;
        char[] newPC = new char[newSize];
        System.arraycopy(this.pc, TRACE_SIZING, newPC, TRACE_SIZING, this.pcEnd);
        this.pc = newPC;
    }

    protected void joinPC() {
        int len = this.posEnd - this.posStart;
        int newEnd = this.pcEnd + len + 1;
        if (newEnd >= this.pc.length) {
            ensurePC(newEnd);
        }
        System.arraycopy(this.buf, this.posStart, this.pc, this.pcEnd, len);
        this.pcEnd += len;
        this.usePC = true;
    }

    public Location getLocation() {
        return this;
    }

    public String getPublicId() {
        return null;
    }

    public String getSystemId() {
        return null;
    }

    public void setConfigurationContext(ConfigurationContextBase c) {
        this.configurationContext = c;
        Boolean.TRUE.equals(c.getProperty("javax.xml.stream.isCoalescing"));
        this.reportCdataEvent = Boolean.TRUE.equals(c.getProperty("http://java.sun.com/xml/stream/properties/report-cdata-event"));
    }

    public ConfigurationContextBase getConfigurationContext() {
        return this.configurationContext;
    }

    public Object getProperty(String name) {
        Class cls;
        Class cls2;
        if (name.equals("javax.xml.stream.entities")) {
            if (this.mDtdIntSubset != null) {
                DTD dtd = this.mDtdIntSubset;
                if (class$com$wutka$dtd$DTDEntity == null) {
                    cls2 = class$("com.wutka.dtd.DTDEntity");
                    class$com$wutka$dtd$DTDEntity = cls2;
                } else {
                    cls2 = class$com$wutka$dtd$DTDEntity;
                }
                Vector v = dtd.getItemsByType(cls2);
                Enumeration e = v.elements();
                ArrayList result = new ArrayList(v.size());
                while (e.hasMoreElements()) {
                    DTDEntity ent = (DTDEntity) e.nextElement();
                    EntityDeclaration createEntityDeclaration = DTDEvent.createEntityDeclaration(ent);
                    if (createEntityDeclaration != null) {
                        result.add(createEntityDeclaration);
                    }
                }
                return result;
            }
            return null;
        }
        if (name.equals("javax.xml.stream.notations")) {
            if (this.mDtdIntSubset != null) {
                DTD dtd2 = this.mDtdIntSubset;
                if (class$com$wutka$dtd$DTDNotation == null) {
                    cls = class$("com.wutka.dtd.DTDNotation");
                    class$com$wutka$dtd$DTDNotation = cls;
                } else {
                    cls = class$com$wutka$dtd$DTDNotation;
                }
                Vector v2 = dtd2.getItemsByType(cls);
                Enumeration e2 = v2.elements();
                ArrayList result2 = new ArrayList(v2.size());
                while (e2.hasMoreElements()) {
                    DTDNotation n = (DTDNotation) e2.nextElement();
                    NotationDeclaration createNotationDeclaration = DTDEvent.createNotationDeclaration(n);
                    if (createNotationDeclaration != null) {
                        result2.add(createNotationDeclaration);
                    }
                }
                return result2;
            }
            return null;
        }
        return this.configurationContext.getProperty(name);
    }

    private String throwIllegalState(int expState) throws IllegalStateException {
        throw new IllegalStateException(new StringBuffer().append("Current state (").append(eventTypeDesc(this.eventType)).append(") not ").append(eventTypeDesc(expState)).toString());
    }

    private String throwIllegalState(int[] expStates) throws IllegalStateException {
        StringBuffer sb = new StringBuffer();
        sb.append(eventTypeDesc(expStates[TRACE_SIZING]));
        int last = expStates.length - 1;
        for (int i = TRACE_SIZING; i < last; i++) {
            sb.append(", ");
            sb.append(eventTypeDesc(expStates[i]));
        }
        sb.append(" or ");
        sb.append(eventTypeDesc(expStates[last]));
        throw new IllegalStateException(new StringBuffer().append("Current state (").append(eventTypeDesc(this.eventType)).append(") not ").append(sb.toString()).toString());
    }

    private void throwNotNameStart(char ch) throws XMLStreamException {
        throw new XMLStreamException(new StringBuffer().append("expected name start character and not ").append(printable(ch)).toString(), getLocation());
    }
}
