package brut.androlib.res.decoder;

import android.content.res.XmlResourceParser;
import android.util.TypedValue;
import brut.androlib.AndrolibException;
import brut.androlib.res.xml.ResXmlEncoders;
import brut.util.ExtDataInput;
import com.mindprod.ledatastream.LEDataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: apktool-lib-1.4.4-3.jar:brut/androlib/res/decoder/AXmlResourceParser.class */
public class AXmlResourceParser implements XmlResourceParser {
    private ExtDataInput m_reader;
    private ResAttrDecoder mAttrDecoder;
    private AndrolibException mFirstError;
    private boolean m_operational;
    private StringBlock m_strings;
    private int[] m_resourceIDs;
    private NamespaceStack m_namespaces;
    private boolean m_decreaseDepth;
    private int m_event;
    private int m_lineNumber;
    private int m_name;
    private int m_namespaceUri;
    private int[] m_attributes;
    private int m_idAttribute;
    private int m_classAttribute;
    private int m_styleAttribute;
    private static final Logger LOGGER = Logger.getLogger(AXmlResourceParser.class.getName());
    private static final String E_NOT_SUPPORTED = "Method is not supported.";
    private static final int ATTRIBUTE_IX_NAMESPACE_URI = 0;
    private static final int ATTRIBUTE_IX_NAME = 1;
    private static final int ATTRIBUTE_IX_VALUE_STRING = 2;
    private static final int ATTRIBUTE_IX_VALUE_TYPE = 3;
    private static final int ATTRIBUTE_IX_VALUE_DATA = 4;
    private static final int ATTRIBUTE_LENGHT = 5;
    private static final int CHUNK_AXML_FILE = 524291;
    private static final int CHUNK_RESOURCEIDS = 524672;
    private static final int CHUNK_XML_FIRST = 1048832;
    private static final int CHUNK_XML_START_NAMESPACE = 1048832;
    private static final int CHUNK_XML_END_NAMESPACE = 1048833;
    private static final int CHUNK_XML_START_TAG = 1048834;
    private static final int CHUNK_XML_END_TAG = 1048835;
    private static final int CHUNK_XML_TEXT = 1048836;
    private static final int CHUNK_XML_LAST = 1048836;

    /* loaded from: apktool-lib-1.4.4-3.jar:brut/androlib/res/decoder/AXmlResourceParser$NamespaceStack.class */
    private static final class NamespaceStack {
        private int[] m_data = new int[32];
        private int m_dataLength;
        private int m_count;
        private int m_depth;

        public final void reset() {
            this.m_dataLength = AXmlResourceParser.ATTRIBUTE_IX_NAMESPACE_URI;
            this.m_count = AXmlResourceParser.ATTRIBUTE_IX_NAMESPACE_URI;
            this.m_depth = AXmlResourceParser.ATTRIBUTE_IX_NAMESPACE_URI;
        }

        public final int getTotalCount() {
            return this.m_count;
        }

        public final int getCurrentCount() {
            if (this.m_dataLength == 0) {
                return AXmlResourceParser.ATTRIBUTE_IX_NAMESPACE_URI;
            }
            return this.m_data[this.m_dataLength - AXmlResourceParser.ATTRIBUTE_IX_NAME];
        }

        public final int getAccumulatedCount(int i) {
            if (this.m_dataLength == 0 || i < 0) {
                return AXmlResourceParser.ATTRIBUTE_IX_NAMESPACE_URI;
            }
            if (i > this.m_depth) {
                i = this.m_depth;
            }
            int i2 = AXmlResourceParser.ATTRIBUTE_IX_NAMESPACE_URI;
            int i3 = AXmlResourceParser.ATTRIBUTE_IX_NAMESPACE_URI;
            while (i != 0) {
                int i4 = this.m_data[i3];
                i2 += i4;
                i3 += AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING + (i4 * AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING);
                i--;
            }
            return i2;
        }

        public final void push(int i, int i2) {
            if (this.m_depth == 0) {
                increaseDepth();
            }
            ensureDataCapacity(AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING);
            int i3 = this.m_dataLength - AXmlResourceParser.ATTRIBUTE_IX_NAME;
            int i4 = this.m_data[i3];
            this.m_data[(i3 - AXmlResourceParser.ATTRIBUTE_IX_NAME) - (i4 * AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING)] = i4 + AXmlResourceParser.ATTRIBUTE_IX_NAME;
            this.m_data[i3] = i;
            this.m_data[i3 + AXmlResourceParser.ATTRIBUTE_IX_NAME] = i2;
            this.m_data[i3 + AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING] = i4 + AXmlResourceParser.ATTRIBUTE_IX_NAME;
            this.m_dataLength += AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING;
            this.m_count += AXmlResourceParser.ATTRIBUTE_IX_NAME;
        }

        public final boolean pop(int i, int i2) {
            if (this.m_dataLength == 0) {
                return false;
            }
            int i3 = this.m_dataLength - AXmlResourceParser.ATTRIBUTE_IX_NAME;
            int i4 = this.m_data[i3];
            int i5 = AXmlResourceParser.ATTRIBUTE_IX_NAMESPACE_URI;
            int i6 = i3 - AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING;
            while (i5 != i4) {
                if (this.m_data[i6] == i && this.m_data[i6 + AXmlResourceParser.ATTRIBUTE_IX_NAME] == i2) {
                    int i7 = i4 - 1;
                    if (i5 == 0) {
                        this.m_data[i6] = i7;
                        this.m_data[i6 - (AXmlResourceParser.ATTRIBUTE_IX_NAME + (i7 * AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING))] = i7;
                    } else {
                        this.m_data[i3] = i7;
                        this.m_data[i3 - (AXmlResourceParser.ATTRIBUTE_IX_VALUE_TYPE + (i7 * AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING))] = i7;
                        System.arraycopy(this.m_data, i6 + AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING, this.m_data, i6, this.m_dataLength - i6);
                    }
                    this.m_dataLength -= AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING;
                    this.m_count -= AXmlResourceParser.ATTRIBUTE_IX_NAME;
                    return true;
                }
                i5 += AXmlResourceParser.ATTRIBUTE_IX_NAME;
                i6 -= 2;
            }
            return false;
        }

        public final boolean pop() {
            if (this.m_dataLength == 0) {
                return false;
            }
            int i = this.m_dataLength - AXmlResourceParser.ATTRIBUTE_IX_NAME;
            int i2 = this.m_data[i];
            if (i2 == 0) {
                return false;
            }
            int i3 = i2 - 1;
            int i4 = i - 2;
            this.m_data[i4] = i3;
            this.m_data[i4 - (AXmlResourceParser.ATTRIBUTE_IX_NAME + (i3 * AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING))] = i3;
            this.m_dataLength -= AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING;
            this.m_count -= AXmlResourceParser.ATTRIBUTE_IX_NAME;
            return true;
        }

        public final int getPrefix(int i) {
            return get(i, true);
        }

        public final int getUri(int i) {
            return get(i, false);
        }

        public final int findPrefix(int i) {
            return find(i, false);
        }

        public final int findUri(int i) {
            return find(i, true);
        }

        public final int getDepth() {
            return this.m_depth;
        }

        public final void increaseDepth() {
            ensureDataCapacity(AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING);
            int i = this.m_dataLength;
            this.m_data[i] = AXmlResourceParser.ATTRIBUTE_IX_NAMESPACE_URI;
            this.m_data[i + AXmlResourceParser.ATTRIBUTE_IX_NAME] = AXmlResourceParser.ATTRIBUTE_IX_NAMESPACE_URI;
            this.m_dataLength += AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING;
            this.m_depth += AXmlResourceParser.ATTRIBUTE_IX_NAME;
        }

        public final void decreaseDepth() {
            if (this.m_dataLength == 0) {
                return;
            }
            int i = this.m_dataLength - AXmlResourceParser.ATTRIBUTE_IX_NAME;
            int i2 = this.m_data[i];
            if ((i - AXmlResourceParser.ATTRIBUTE_IX_NAME) - (i2 * AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING) == 0) {
                return;
            }
            this.m_dataLength -= AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING + (i2 * AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING);
            this.m_count -= i2;
            this.m_depth -= AXmlResourceParser.ATTRIBUTE_IX_NAME;
        }

        private void ensureDataCapacity(int i) {
            int length = this.m_data.length - this.m_dataLength;
            if (length > i) {
                return;
            }
            int[] iArr = new int[(this.m_data.length + length) * AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING];
            System.arraycopy(this.m_data, AXmlResourceParser.ATTRIBUTE_IX_NAMESPACE_URI, iArr, AXmlResourceParser.ATTRIBUTE_IX_NAMESPACE_URI, this.m_dataLength);
            this.m_data = iArr;
        }

        private final int find(int i, boolean z) {
            if (this.m_dataLength == 0) {
                return -1;
            }
            int i2 = this.m_dataLength - AXmlResourceParser.ATTRIBUTE_IX_NAME;
            for (int i3 = this.m_depth; i3 != 0; i3--) {
                i2 -= 2;
                for (int i4 = this.m_data[i2]; i4 != 0; i4--) {
                    if (z) {
                        if (this.m_data[i2] == i) {
                            return this.m_data[i2 + AXmlResourceParser.ATTRIBUTE_IX_NAME];
                        }
                    } else if (this.m_data[i2 + AXmlResourceParser.ATTRIBUTE_IX_NAME] == i) {
                        return this.m_data[i2];
                    }
                    i2 -= 2;
                }
            }
            return -1;
        }

        private final int get(int i, boolean z) {
            if (this.m_dataLength == 0 || i < 0) {
                return -1;
            }
            int i2 = AXmlResourceParser.ATTRIBUTE_IX_NAMESPACE_URI;
            for (int i3 = this.m_depth; i3 != 0; i3--) {
                int i4 = this.m_data[i2];
                if (i < i4) {
                    int i5 = i2 + AXmlResourceParser.ATTRIBUTE_IX_NAME + (i * AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING);
                    if (!z) {
                        i5 += AXmlResourceParser.ATTRIBUTE_IX_NAME;
                    }
                    return this.m_data[i5];
                }
                i -= i4;
                i2 += AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING + (i4 * AXmlResourceParser.ATTRIBUTE_IX_VALUE_STRING);
            }
            return -1;
        }
    }

    public AXmlResourceParser() {
        this.mAttrDecoder = new ResAttrDecoder();
        this.m_operational = false;
        this.m_namespaces = new NamespaceStack();
        resetEventInfo();
    }

    public AXmlResourceParser(InputStream inputStream) {
        this();
        open(inputStream);
    }

    public AndrolibException getFirstError() {
        return this.mFirstError;
    }

    public ResAttrDecoder getAttrDecoder() {
        return this.mAttrDecoder;
    }

    public void setAttrDecoder(ResAttrDecoder resAttrDecoder) {
        this.mAttrDecoder = resAttrDecoder;
    }

    public void open(InputStream inputStream) {
        close();
        if (inputStream != null) {
            this.m_reader = new ExtDataInput(new LEDataInputStream(inputStream));
        }
    }

    @Override // android.content.res.XmlResourceParser, java.lang.AutoCloseable
    public void close() {
        if (this.m_operational) {
            this.m_operational = false;
            this.m_reader = null;
            this.m_strings = null;
            this.m_resourceIDs = null;
            this.m_namespaces.reset();
            resetEventInfo();
        }
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int next() throws XmlPullParserException, IOException {
        if (this.m_reader == null) {
            throw new XmlPullParserException("Parser is not opened.", this, null);
        }
        try {
            doNext();
            return this.m_event;
        } catch (IOException e) {
            close();
            throw e;
        }
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int nextToken() throws XmlPullParserException, IOException {
        return next();
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int nextTag() throws XmlPullParserException, IOException {
        int next = next();
        if (next == ATTRIBUTE_IX_VALUE_DATA && isWhitespace()) {
            next = next();
        }
        if (next == ATTRIBUTE_IX_VALUE_STRING || next == ATTRIBUTE_IX_VALUE_TYPE) {
            return next;
        }
        throw new XmlPullParserException("Expected start or end tag.", this, null);
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String nextText() throws XmlPullParserException, IOException {
        if (getEventType() != ATTRIBUTE_IX_VALUE_STRING) {
            throw new XmlPullParserException("Parser must be on START_TAG to read next text.", this, null);
        }
        int next = next();
        if (next != ATTRIBUTE_IX_VALUE_DATA) {
            if (next == ATTRIBUTE_IX_VALUE_TYPE) {
                return "";
            }
            throw new XmlPullParserException("Parser must be on START_TAG or TEXT to read text.", this, null);
        }
        String text = getText();
        if (next() != ATTRIBUTE_IX_VALUE_TYPE) {
            throw new XmlPullParserException("Event TEXT must be immediately followed by END_TAG.", this, null);
        }
        return text;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public void require(int i, String str, String str2) throws XmlPullParserException, IOException {
        if (i != getEventType() || ((str != null && !str.equals(getNamespace())) || (str2 != null && !str2.equals(getName())))) {
            throw new XmlPullParserException(TYPES[i] + " is expected.", this, null);
        }
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int getDepth() {
        return this.m_namespaces.getDepth() - ATTRIBUTE_IX_NAME;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int getEventType() throws XmlPullParserException {
        return this.m_event;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int getLineNumber() {
        return this.m_lineNumber;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getName() {
        if (this.m_name == -1) {
            return null;
        }
        if (this.m_event == ATTRIBUTE_IX_VALUE_STRING || this.m_event == ATTRIBUTE_IX_VALUE_TYPE) {
            return this.m_strings.getString(this.m_name);
        }
        return null;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getText() {
        if (this.m_name == -1 || this.m_event != ATTRIBUTE_IX_VALUE_DATA) {
            return null;
        }
        return this.m_strings.getString(this.m_name);
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public char[] getTextCharacters(int[] iArr) {
        String text = getText();
        if (text == null) {
            return null;
        }
        iArr[ATTRIBUTE_IX_NAMESPACE_URI] = ATTRIBUTE_IX_NAMESPACE_URI;
        iArr[ATTRIBUTE_IX_NAME] = text.length();
        char[] cArr = new char[text.length()];
        text.getChars(ATTRIBUTE_IX_NAMESPACE_URI, text.length(), cArr, ATTRIBUTE_IX_NAMESPACE_URI);
        return cArr;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getNamespace() {
        return this.m_strings.getString(this.m_namespaceUri);
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getPrefix() {
        return this.m_strings.getString(this.m_namespaces.findPrefix(this.m_namespaceUri));
    }

    @Override // org.xmlpull.v1.XmlPullParser, android.util.AttributeSet
    public String getPositionDescription() {
        return "XML line #" + getLineNumber();
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int getNamespaceCount(int i) throws XmlPullParserException {
        return this.m_namespaces.getAccumulatedCount(i);
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getNamespacePrefix(int i) throws XmlPullParserException {
        return this.m_strings.getString(this.m_namespaces.getPrefix(i));
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getNamespaceUri(int i) throws XmlPullParserException {
        return this.m_strings.getString(this.m_namespaces.getUri(i));
    }

    @Override // android.util.AttributeSet
    public String getClassAttribute() {
        if (this.m_classAttribute == -1) {
            return null;
        }
        return this.m_strings.getString(this.m_attributes[getAttributeOffset(this.m_classAttribute) + ATTRIBUTE_IX_VALUE_STRING]);
    }

    @Override // android.util.AttributeSet
    public String getIdAttribute() {
        if (this.m_idAttribute == -1) {
            return null;
        }
        return this.m_strings.getString(this.m_attributes[getAttributeOffset(this.m_idAttribute) + ATTRIBUTE_IX_VALUE_STRING]);
    }

    @Override // android.util.AttributeSet
    public int getIdAttributeResourceValue(int i) {
        if (this.m_idAttribute == -1) {
            return i;
        }
        int attributeOffset = getAttributeOffset(this.m_idAttribute);
        return this.m_attributes[attributeOffset + ATTRIBUTE_IX_VALUE_TYPE] != ATTRIBUTE_IX_NAME ? i : this.m_attributes[attributeOffset + ATTRIBUTE_IX_VALUE_DATA];
    }

    @Override // android.util.AttributeSet
    public int getStyleAttribute() {
        if (this.m_styleAttribute == -1) {
            return ATTRIBUTE_IX_NAMESPACE_URI;
        }
        return this.m_attributes[getAttributeOffset(this.m_styleAttribute) + ATTRIBUTE_IX_VALUE_DATA];
    }

    @Override // org.xmlpull.v1.XmlPullParser, android.util.AttributeSet
    public int getAttributeCount() {
        if (this.m_event != ATTRIBUTE_IX_VALUE_STRING) {
            return -1;
        }
        return this.m_attributes.length / ATTRIBUTE_LENGHT;
    }

    @Override // android.content.res.XmlResourceParser, org.xmlpull.v1.XmlPullParser, android.util.AttributeSet
    public String getAttributeNamespace(int i) {
        int i2 = this.m_attributes[getAttributeOffset(i) + ATTRIBUTE_IX_NAMESPACE_URI];
        return i2 == -1 ? "" : this.m_strings.getString(i2);
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getAttributePrefix(int i) {
        int findPrefix = this.m_namespaces.findPrefix(this.m_attributes[getAttributeOffset(i) + ATTRIBUTE_IX_NAMESPACE_URI]);
        return findPrefix == -1 ? "" : this.m_strings.getString(findPrefix);
    }

    @Override // org.xmlpull.v1.XmlPullParser, android.util.AttributeSet
    public String getAttributeName(int i) {
        int i2 = this.m_attributes[getAttributeOffset(i) + ATTRIBUTE_IX_NAME];
        return i2 == -1 ? "" : this.m_strings.getString(i2);
    }

    @Override // android.util.AttributeSet
    public int getAttributeNameResource(int i) {
        int i2 = this.m_attributes[getAttributeOffset(i) + ATTRIBUTE_IX_NAME];
        return (this.m_resourceIDs == null || i2 < 0 || i2 >= this.m_resourceIDs.length) ? ATTRIBUTE_IX_NAMESPACE_URI : this.m_resourceIDs[i2];
    }

    public int getAttributeValueType(int i) {
        return this.m_attributes[getAttributeOffset(i) + ATTRIBUTE_IX_VALUE_TYPE];
    }

    public int getAttributeValueData(int i) {
        return this.m_attributes[getAttributeOffset(i) + ATTRIBUTE_IX_VALUE_DATA];
    }

    @Override // org.xmlpull.v1.XmlPullParser, android.util.AttributeSet
    public String getAttributeValue(int i) {
        int attributeOffset = getAttributeOffset(i);
        int i2 = this.m_attributes[attributeOffset + ATTRIBUTE_IX_VALUE_TYPE];
        int i3 = this.m_attributes[attributeOffset + ATTRIBUTE_IX_VALUE_DATA];
        int i4 = this.m_attributes[attributeOffset + ATTRIBUTE_IX_VALUE_STRING];
        if (this.mAttrDecoder != null) {
            try {
                return this.mAttrDecoder.decode(i2, i3, i4 == -1 ? null : ResXmlEncoders.escapeXmlChars(this.m_strings.getString(i4)), getAttributeNameResource(i));
            } catch (AndrolibException e) {
                setFirstError(e);
                LOGGER.log(Level.WARNING, String.format("Could not decode attr value, using undecoded value instead: ns=%s, name=%s, value=0x%08x", getAttributePrefix(i), getAttributeName(i), Integer.valueOf(i3)), (Throwable) e);
            }
        }
        return TypedValue.coerceToString(i2, i3);
    }

    @Override // android.util.AttributeSet
    public boolean getAttributeBooleanValue(int i, boolean z) {
        return getAttributeIntValue(i, z ? ATTRIBUTE_IX_NAME : ATTRIBUTE_IX_NAMESPACE_URI) != 0;
    }

    @Override // android.util.AttributeSet
    public float getAttributeFloatValue(int i, float f) {
        int attributeOffset = getAttributeOffset(i);
        return this.m_attributes[attributeOffset + ATTRIBUTE_IX_VALUE_TYPE] == ATTRIBUTE_IX_VALUE_DATA ? Float.intBitsToFloat(this.m_attributes[attributeOffset + ATTRIBUTE_IX_VALUE_DATA]) : f;
    }

    @Override // android.util.AttributeSet
    public int getAttributeIntValue(int i, int i2) {
        int attributeOffset = getAttributeOffset(i);
        int i3 = this.m_attributes[attributeOffset + ATTRIBUTE_IX_VALUE_TYPE];
        return (i3 < 16 || i3 > 31) ? i2 : this.m_attributes[attributeOffset + ATTRIBUTE_IX_VALUE_DATA];
    }

    @Override // android.util.AttributeSet
    public int getAttributeUnsignedIntValue(int i, int i2) {
        return getAttributeIntValue(i, i2);
    }

    @Override // android.util.AttributeSet
    public int getAttributeResourceValue(int i, int i2) {
        int attributeOffset = getAttributeOffset(i);
        return this.m_attributes[attributeOffset + ATTRIBUTE_IX_VALUE_TYPE] == ATTRIBUTE_IX_NAME ? this.m_attributes[attributeOffset + ATTRIBUTE_IX_VALUE_DATA] : i2;
    }

    @Override // org.xmlpull.v1.XmlPullParser, android.util.AttributeSet
    public String getAttributeValue(String str, String str2) {
        int findAttribute = findAttribute(str, str2);
        if (findAttribute == -1) {
            return null;
        }
        return getAttributeValue(findAttribute);
    }

    @Override // android.util.AttributeSet
    public boolean getAttributeBooleanValue(String str, String str2, boolean z) {
        int findAttribute = findAttribute(str, str2);
        return findAttribute == -1 ? z : getAttributeBooleanValue(findAttribute, z);
    }

    @Override // android.util.AttributeSet
    public float getAttributeFloatValue(String str, String str2, float f) {
        int findAttribute = findAttribute(str, str2);
        return findAttribute == -1 ? f : getAttributeFloatValue(findAttribute, f);
    }

    @Override // android.util.AttributeSet
    public int getAttributeIntValue(String str, String str2, int i) {
        int findAttribute = findAttribute(str, str2);
        return findAttribute == -1 ? i : getAttributeIntValue(findAttribute, i);
    }

    @Override // android.util.AttributeSet
    public int getAttributeUnsignedIntValue(String str, String str2, int i) {
        int findAttribute = findAttribute(str, str2);
        return findAttribute == -1 ? i : getAttributeUnsignedIntValue(findAttribute, i);
    }

    @Override // android.util.AttributeSet
    public int getAttributeResourceValue(String str, String str2, int i) {
        int findAttribute = findAttribute(str, str2);
        return findAttribute == -1 ? i : getAttributeResourceValue(findAttribute, i);
    }

    @Override // android.util.AttributeSet
    public int getAttributeListValue(int i, String[] strArr, int i2) {
        return ATTRIBUTE_IX_NAMESPACE_URI;
    }

    @Override // android.util.AttributeSet
    public int getAttributeListValue(String str, String str2, String[] strArr, int i) {
        return ATTRIBUTE_IX_NAMESPACE_URI;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getAttributeType(int i) {
        return "CDATA";
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public boolean isAttributeDefault(int i) {
        return false;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public void setInput(InputStream inputStream, String str) throws XmlPullParserException {
        open(inputStream);
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public void setInput(Reader reader) throws XmlPullParserException {
        throw new XmlPullParserException(E_NOT_SUPPORTED);
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getInputEncoding() {
        return null;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int getColumnNumber() {
        return -1;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public boolean isEmptyElementTag() throws XmlPullParserException {
        return false;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public boolean isWhitespace() throws XmlPullParserException {
        return false;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public void defineEntityReplacementText(String str, String str2) throws XmlPullParserException {
        throw new XmlPullParserException(E_NOT_SUPPORTED);
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getNamespace(String str) {
        throw new RuntimeException(E_NOT_SUPPORTED);
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public Object getProperty(String str) {
        return null;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public void setProperty(String str, Object obj) throws XmlPullParserException {
        throw new XmlPullParserException(E_NOT_SUPPORTED);
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public boolean getFeature(String str) {
        return false;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public void setFeature(String str, boolean z) throws XmlPullParserException {
        throw new XmlPullParserException(E_NOT_SUPPORTED);
    }

    final StringBlock getStrings() {
        return this.m_strings;
    }

    private final int getAttributeOffset(int i) {
        if (this.m_event != ATTRIBUTE_IX_VALUE_STRING) {
            throw new IndexOutOfBoundsException("Current event is not START_TAG.");
        }
        int i2 = i * ATTRIBUTE_LENGHT;
        if (i2 >= this.m_attributes.length) {
            throw new IndexOutOfBoundsException("Invalid attribute index (" + i + ").");
        }
        return i2;
    }

    private final int findAttribute(String str, String str2) {
        int find;
        if (this.m_strings == null || str2 == null || (find = this.m_strings.find(str2)) == -1) {
            return -1;
        }
        int find2 = str != null ? this.m_strings.find(str) : -1;
        for (int i = ATTRIBUTE_IX_NAMESPACE_URI; i != this.m_attributes.length; i += ATTRIBUTE_IX_NAME) {
            if (find == this.m_attributes[i + ATTRIBUTE_IX_NAME] && (find2 == -1 || find2 == this.m_attributes[i + ATTRIBUTE_IX_NAMESPACE_URI])) {
                return i / ATTRIBUTE_LENGHT;
            }
        }
        return -1;
    }

    private final void resetEventInfo() {
        this.m_event = -1;
        this.m_lineNumber = -1;
        this.m_name = -1;
        this.m_namespaceUri = -1;
        this.m_attributes = null;
        this.m_idAttribute = -1;
        this.m_classAttribute = -1;
        this.m_styleAttribute = -1;
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x00c0, code lost:
    
        throw new java.io.IOException("Invalid resource ids size (" + r0 + ").");
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00ff, code lost:
    
        throw new java.io.IOException("Invalid chunk type (" + r7 + ").");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final void doNext() throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 626
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: brut.androlib.res.decoder.AXmlResourceParser.doNext():void");
    }

    private void setFirstError(AndrolibException androlibException) {
        if (this.mFirstError == null) {
            this.mFirstError = androlibException;
        }
    }
}
