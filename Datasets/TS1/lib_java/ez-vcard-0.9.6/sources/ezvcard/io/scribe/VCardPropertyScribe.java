package ezvcard.io.scribe;

import ezvcard.VCard;
import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.CannotParseException;
import ezvcard.io.html.HCardElement;
import ezvcard.io.json.JCardValue;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.VCardProperty;
import ezvcard.util.StringUtils;
import ezvcard.util.VCardDateFormat;
import ezvcard.util.XmlUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.xml.namespace.QName;
import org.w3c.dom.Element;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/VCardPropertyScribe.class */
public abstract class VCardPropertyScribe<T extends VCardProperty> {
    protected final Class<T> clazz;
    protected final String propertyName;
    protected final QName qname;

    protected abstract VCardDataType _defaultDataType(VCardVersion vCardVersion);

    protected abstract String _writeText(T t, VCardVersion vCardVersion);

    protected abstract T _parseText(String str, VCardDataType vCardDataType, VCardVersion vCardVersion, VCardParameters vCardParameters, List<String> list);

    public VCardPropertyScribe(Class<T> clazz, String propertyName) {
        this(clazz, propertyName, new QName(VCardVersion.V4_0.getXmlNamespace(), propertyName.toLowerCase()));
    }

    public VCardPropertyScribe(Class<T> clazz, String propertyName, QName qname) {
        this.clazz = clazz;
        this.propertyName = propertyName;
        this.qname = qname;
    }

    public Class<T> getPropertyClass() {
        return this.clazz;
    }

    public String getPropertyName() {
        return this.propertyName;
    }

    public QName getQName() {
        return this.qname;
    }

    public final VCardParameters prepareParameters(T property, VCardVersion version, VCard vcard) {
        VCardParameters copy = new VCardParameters(property.getParameters());
        _prepareParameters(property, copy, version, vcard);
        return copy;
    }

    public final VCardDataType defaultDataType(VCardVersion version) {
        return _defaultDataType(version);
    }

    public final VCardDataType dataType(T property, VCardVersion version) {
        return _dataType(property, version);
    }

    public final String writeText(T property, VCardVersion version) {
        return _writeText(property, version);
    }

    public final void writeXml(T property, Element element) {
        XCardElement xCardElement = new XCardElement(element);
        _writeXml(property, xCardElement);
    }

    public final JCardValue writeJson(T property) {
        return _writeJson(property);
    }

    public final Result<T> parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters) {
        List<String> warnings = new ArrayList<>(0);
        VCardProperty _parseText = _parseText(value, dataType, version, parameters, warnings);
        _parseText.setParameters(parameters);
        return new Result<>(_parseText, warnings);
    }

    public final Result<T> parseXml(Element element, VCardParameters parameters) {
        List<String> warnings = new ArrayList<>(0);
        VCardProperty _parseXml = _parseXml(new XCardElement(element), parameters, warnings);
        _parseXml.setParameters(parameters);
        return new Result<>(_parseXml, warnings);
    }

    public final Result<T> parseHtml(HCardElement element) {
        List<String> warnings = new ArrayList<>(0);
        return new Result<>(_parseHtml(element, warnings), warnings);
    }

    public final Result<T> parseJson(JCardValue value, VCardDataType dataType, VCardParameters parameters) {
        List<String> warnings = new ArrayList<>(0);
        VCardProperty _parseJson = _parseJson(value, dataType, parameters, warnings);
        _parseJson.setParameters(parameters);
        return new Result<>(_parseJson, warnings);
    }

    protected void _prepareParameters(T property, VCardParameters copy, VCardVersion version, VCard vcard) {
    }

    protected VCardDataType _dataType(T property, VCardVersion version) {
        return _defaultDataType(version);
    }

    protected void _writeXml(T property, XCardElement element) {
        String value = writeText(property, VCardVersion.V4_0);
        VCardDataType dataType = dataType(property, VCardVersion.V4_0);
        element.append(dataType, value);
    }

    protected JCardValue _writeJson(T property) {
        String value = writeText(property, VCardVersion.V4_0);
        return JCardValue.single(value);
    }

    protected T _parseXml(XCardElement xCardElement, VCardParameters vCardParameters, List<String> list) {
        String str = null;
        VCardDataType vCardDataType = null;
        Element element = xCardElement.element();
        VCardVersion version = xCardElement.version();
        Iterator<Element> it = XmlUtils.toElementList(element.getChildNodes()).iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Element next = it.next();
            if (version.getXmlNamespace().equals(next.getNamespaceURI())) {
                String localName = next.getLocalName();
                vCardDataType = "unknown".equals(localName) ? null : VCardDataType.get(localName);
                str = next.getTextContent();
            }
        }
        if (vCardDataType == null) {
            str = element.getTextContent();
        }
        return (T) _parseText(escape(str), vCardDataType, version, vCardParameters, list);
    }

    protected T _parseHtml(HCardElement hCardElement, List<String> list) {
        String escape = escape(hCardElement.value());
        VCardParameters vCardParameters = new VCardParameters();
        T t = (T) _parseText(escape, null, VCardVersion.V3_0, vCardParameters, list);
        t.setParameters(vCardParameters);
        return t;
    }

    protected T _parseJson(JCardValue jCardValue, VCardDataType vCardDataType, VCardParameters vCardParameters, List<String> list) {
        return (T) _parseText(jcardValueToString(jCardValue), vCardDataType, VCardVersion.V4_0, vCardParameters, list);
    }

    private static String jcardValueToString(JCardValue value) {
        if (value.getValues().size() > 1) {
            List<String> multi = value.asMulti();
            if (!multi.isEmpty()) {
                return list(multi);
            }
        }
        if (!value.getValues().isEmpty() && value.getValues().get(0).getArray() != null) {
            List<List<String>> structured = value.asStructured();
            if (!structured.isEmpty()) {
                return structured(structured.toArray());
            }
        }
        return escape(value.asSingle());
    }

    public static String unescape(String text) {
        if (text == null) {
            return null;
        }
        StringBuilder sb = null;
        boolean escaped = false;
        for (int i = 0; i < text.length(); i++) {
            char ch = text.charAt(i);
            if (escaped) {
                if (sb == null) {
                    sb = new StringBuilder(text.length());
                    sb.append(text.substring(0, i - 1));
                }
                escaped = false;
                if (ch == 'n' || ch == 'N') {
                    sb.append(StringUtils.NEWLINE);
                } else {
                    sb.append(ch);
                }
            } else if (ch == '\\') {
                escaped = true;
            } else if (sb != null) {
                sb.append(ch);
            }
        }
        return sb == null ? text : sb.toString();
    }

    public static String escape(String text) {
        if (text == null) {
            return null;
        }
        StringBuilder sb = null;
        for (int i = 0; i < text.length(); i++) {
            char ch = text.charAt(i);
            if ("\\,;".indexOf(ch) >= 0) {
                if (sb == null) {
                    sb = new StringBuilder(text.length());
                    sb.append(text.substring(0, i));
                }
                sb.append('\\');
            }
            if (sb != null) {
                sb.append(ch);
            }
        }
        return sb == null ? text : sb.toString();
    }

    protected static Splitter splitter(char delimiter) {
        return new Splitter(delimiter);
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/VCardPropertyScribe$Splitter.class */
    protected static class Splitter {
        private char delimiter;
        private boolean unescape = false;
        private boolean nullEmpties = false;
        private int limit = -1;

        public Splitter(char delimiter) {
            this.delimiter = delimiter;
        }

        public Splitter unescape(boolean unescape) {
            this.unescape = unescape;
            return this;
        }

        public Splitter nullEmpties(boolean nullEmpties) {
            this.nullEmpties = nullEmpties;
            return this;
        }

        public Splitter limit(int limit) {
            this.limit = limit;
            return this;
        }

        public List<String> split(String string) {
            List<String> list = new ArrayList<>();
            boolean escaped = false;
            int start = 0;
            for (int i = 0; i < string.length(); i++) {
                char ch = string.charAt(i);
                if (escaped) {
                    escaped = false;
                } else if (ch == this.delimiter) {
                    add(string.substring(start, i), list);
                    start = i + 1;
                    if (this.limit > 0 && list.size() == this.limit - 1) {
                        break;
                    }
                } else if (ch == '\\') {
                    escaped = true;
                }
            }
            add(string.substring(start), list);
            return list;
        }

        private void add(String str, List<String> list) {
            String str2 = str.trim();
            if (this.nullEmpties && str2.length() == 0) {
                str2 = null;
            } else if (this.unescape) {
                str2 = VCardPropertyScribe.unescape(str2);
            }
            list.add(str2);
        }
    }

    protected static List<String> list(String value) {
        if (value.length() == 0) {
            return new ArrayList(0);
        }
        return splitter(',').unescape(true).split(value);
    }

    protected static String list(Object... values) {
        return list(Arrays.asList(values));
    }

    protected static <T> String list(Collection<T> values) {
        return StringUtils.join(values, ",", new StringUtils.JoinCallback<T>() { // from class: ezvcard.io.scribe.VCardPropertyScribe.1
            @Override // ezvcard.util.StringUtils.JoinCallback
            public void handle(StringBuilder sb, T value) {
                if (value == null) {
                    return;
                }
                sb.append(VCardPropertyScribe.escape(value.toString()));
            }
        });
    }

    protected static SemiStructuredIterator semistructured(String value) {
        return semistructured(value, -1);
    }

    protected static SemiStructuredIterator semistructured(String value, int limit) {
        List<String> split = splitter(';').unescape(true).limit(limit).split(value);
        return new SemiStructuredIterator(split.iterator());
    }

    protected static StructuredIterator structured(String value) {
        List<String> split = splitter(';').split(value);
        List<List<String>> components = new ArrayList<>(split.size());
        for (String s : split) {
            components.add(list(s));
        }
        return new StructuredIterator(components.iterator());
    }

    protected static StructuredIterator structured(JCardValue value) {
        return new StructuredIterator(value.asStructured().iterator());
    }

    protected static String structured(Object... values) {
        return StringUtils.join(Arrays.asList(values), ";", new StringUtils.JoinCallback<Object>() { // from class: ezvcard.io.scribe.VCardPropertyScribe.2
            @Override // ezvcard.util.StringUtils.JoinCallback
            public void handle(StringBuilder sb, Object value) {
                if (value == null) {
                    return;
                }
                if (value instanceof Collection) {
                    Collection<?> list = (Collection) value;
                    sb.append(VCardPropertyScribe.list(list));
                } else {
                    sb.append(VCardPropertyScribe.escape(value.toString()));
                }
            }
        });
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/VCardPropertyScribe$StructuredIterator.class */
    protected static class StructuredIterator {
        private final Iterator<List<String>> it;

        public StructuredIterator(Iterator<List<String>> it) {
            this.it = it;
        }

        public String nextString() {
            if (!hasNext()) {
                return null;
            }
            List<String> list = this.it.next();
            if (list.isEmpty()) {
                return null;
            }
            String value = list.get(0);
            if (value.length() == 0) {
                return null;
            }
            return value;
        }

        public List<String> nextComponent() {
            if (!hasNext()) {
                return new ArrayList(0);
            }
            List<String> list = this.it.next();
            if (list.size() == 1 && list.get(0).length() == 0) {
                return new ArrayList(0);
            }
            return list;
        }

        public boolean hasNext() {
            return this.it.hasNext();
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator.class */
    protected static class SemiStructuredIterator {
        private final Iterator<String> it;

        public SemiStructuredIterator(Iterator<String> it) {
            this.it = it;
        }

        public String next() {
            if (hasNext()) {
                return this.it.next();
            }
            return null;
        }

        public boolean hasNext() {
            return this.it.hasNext();
        }
    }

    protected static Date date(String value) {
        return VCardDateFormat.parse(value);
    }

    protected static DateWriter date(Date date) {
        return new DateWriter(date);
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/VCardPropertyScribe$DateWriter.class */
    protected static class DateWriter {
        private Date date;
        private boolean hasTime = true;
        private boolean extended = false;
        private boolean utc = true;

        public DateWriter(Date date) {
            this.date = date;
        }

        public DateWriter time(boolean hasTime) {
            this.hasTime = hasTime;
            return this;
        }

        public DateWriter extended(boolean extended) {
            this.extended = extended;
            return this;
        }

        public DateWriter utc(boolean utc) {
            this.utc = utc;
            return this;
        }

        public String write() {
            VCardDateFormat format;
            if (this.hasTime) {
                if (this.utc) {
                    format = this.extended ? VCardDateFormat.UTC_DATE_TIME_EXTENDED : VCardDateFormat.UTC_DATE_TIME_BASIC;
                } else {
                    format = this.extended ? VCardDateFormat.DATE_TIME_EXTENDED : VCardDateFormat.DATE_TIME_BASIC;
                }
            } else {
                format = this.extended ? VCardDateFormat.DATE_EXTENDED : VCardDateFormat.DATE_BASIC;
            }
            return format.format(this.date);
        }
    }

    protected static CannotParseException missingXmlElements(VCardDataType... dataTypes) {
        String[] elements = new String[dataTypes.length];
        for (int i = 0; i < dataTypes.length; i++) {
            VCardDataType dataType = dataTypes[i];
            elements[i] = dataType == null ? "unknown" : dataType.getName().toLowerCase();
        }
        return missingXmlElements(elements);
    }

    protected static CannotParseException missingXmlElements(String... elements) {
        return new CannotParseException(0, Arrays.toString(elements));
    }

    protected static void handlePrefParam(VCardProperty property, VCardParameters copy, VCardVersion version, VCard vcard) {
        switch (version) {
            case V2_1:
            case V3_0:
                copy.setPref(null);
                VCardProperty mostPreferred = null;
                for (VCardProperty p : vcard.getProperties(property.getClass())) {
                    Integer pref = p.getParameters().getPref();
                    if (pref != null && (mostPreferred == null || pref.intValue() < mostPreferred.getParameters().getPref().intValue())) {
                        mostPreferred = p;
                    }
                }
                if (property == mostPreferred) {
                    copy.addType("pref");
                    break;
                }
                break;
            case V4_0:
                for (String type : property.getParameters().getTypes()) {
                    if ("pref".equalsIgnoreCase(type)) {
                        copy.removeType(type);
                        copy.setPref(1);
                        break;
                    }
                }
                break;
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/VCardPropertyScribe$Result.class */
    public static class Result<T extends VCardProperty> {
        private final T property;
        private final List<String> warnings;

        public Result(T property, List<String> warnings) {
            this.property = property;
            this.warnings = warnings;
        }

        public List<String> getWarnings() {
            return this.warnings;
        }

        public T getProperty() {
            return this.property;
        }
    }
}
