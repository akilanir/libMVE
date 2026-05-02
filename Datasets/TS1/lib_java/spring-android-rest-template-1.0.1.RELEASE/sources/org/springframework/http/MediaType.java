package org.springframework.http;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeSet;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.util.LinkedCaseInsensitiveMap;
import org.springframework.util.StringUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/MediaType.class */
public class MediaType implements Comparable<MediaType> {
    public static final MediaType ALL;
    public static final String ALL_VALUE = "*/*";
    public static final MediaType APPLICATION_ATOM_XML;
    public static final String APPLICATION_ATOM_XML_VALUE = "application/atom+xml";
    public static final MediaType APPLICATION_RSS_XML;
    public static final String APPLICATION_RSS_XML_VALUE = "application/rss+xml";
    public static final MediaType APPLICATION_FORM_URLENCODED;
    public static final String APPLICATION_FORM_URLENCODED_VALUE = "application/x-www-form-urlencoded";
    public static final MediaType APPLICATION_JSON;
    public static final String APPLICATION_JSON_VALUE = "application/json";
    public static final MediaType APPLICATION_OCTET_STREAM;
    public static final String APPLICATION_OCTET_STREAM_VALUE = "application/octet-stream";
    public static final MediaType APPLICATION_XHTML_XML;
    public static final String APPLICATION_XHTML_XML_VALUE = "application/xhtml+xml";
    public static final MediaType APPLICATION_XML;
    public static final String APPLICATION_XML_VALUE = "application/xml";
    public static final MediaType APPLICATION_WILDCARD_XML;
    public static final String APPLICATION_WILDCARD_XML_VALUE = "application/*+xml";
    public static final MediaType IMAGE_GIF;
    public static final String IMAGE_GIF_VALUE = "image/gif";
    public static final MediaType IMAGE_JPEG;
    public static final String IMAGE_JPEG_VALUE = "image/jpeg";
    public static final MediaType IMAGE_PNG;
    public static final String IMAGE_PNG_VALUE = "image/png";
    public static final MediaType MULTIPART_FORM_DATA;
    public static final String MULTIPART_FORM_DATA_VALUE = "multipart/form-data";
    public static final MediaType TEXT_HTML;
    public static final String TEXT_HTML_VALUE = "text/html";
    public static final MediaType TEXT_PLAIN;
    public static final String TEXT_PLAIN_VALUE = "text/plain";
    public static final MediaType TEXT_XML;
    public static final String TEXT_XML_VALUE = "text/xml";
    private static final BitSet TOKEN;
    private static final String WILDCARD_TYPE = "*";
    private static final String PARAM_QUALITY_FACTOR = "q";
    private static final String PARAM_CHARSET = "charset";
    private final String type;
    private final String subtype;
    private final Map<String, String> parameters;
    public static final Comparator<MediaType> SPECIFICITY_COMPARATOR;
    public static final Comparator<MediaType> QUALITY_VALUE_COMPARATOR;

    static {
        BitSet ctl = new BitSet(128);
        for (int i = 0; i <= 31; i++) {
            ctl.set(i);
        }
        ctl.set(127);
        BitSet separators = new BitSet(128);
        separators.set(40);
        separators.set(41);
        separators.set(60);
        separators.set(62);
        separators.set(64);
        separators.set(44);
        separators.set(59);
        separators.set(58);
        separators.set(92);
        separators.set(34);
        separators.set(47);
        separators.set(91);
        separators.set(93);
        separators.set(63);
        separators.set(61);
        separators.set(123);
        separators.set(125);
        separators.set(32);
        separators.set(9);
        TOKEN = new BitSet(128);
        TOKEN.set(0, 128);
        TOKEN.andNot(ctl);
        TOKEN.andNot(separators);
        ALL = valueOf(ALL_VALUE);
        APPLICATION_ATOM_XML = valueOf(APPLICATION_ATOM_XML_VALUE);
        APPLICATION_RSS_XML = valueOf(APPLICATION_RSS_XML_VALUE);
        APPLICATION_FORM_URLENCODED = valueOf(APPLICATION_FORM_URLENCODED_VALUE);
        APPLICATION_JSON = valueOf(APPLICATION_JSON_VALUE);
        APPLICATION_OCTET_STREAM = valueOf(APPLICATION_OCTET_STREAM_VALUE);
        APPLICATION_XHTML_XML = valueOf(APPLICATION_XHTML_XML_VALUE);
        APPLICATION_XML = valueOf(APPLICATION_XML_VALUE);
        APPLICATION_WILDCARD_XML = valueOf(APPLICATION_WILDCARD_XML_VALUE);
        IMAGE_GIF = valueOf(IMAGE_GIF_VALUE);
        IMAGE_JPEG = valueOf(IMAGE_JPEG_VALUE);
        IMAGE_PNG = valueOf(IMAGE_PNG_VALUE);
        MULTIPART_FORM_DATA = valueOf(MULTIPART_FORM_DATA_VALUE);
        TEXT_HTML = valueOf(TEXT_HTML_VALUE);
        TEXT_PLAIN = valueOf(TEXT_PLAIN_VALUE);
        TEXT_XML = valueOf(TEXT_XML_VALUE);
        SPECIFICITY_COMPARATOR = new Comparator<MediaType>() { // from class: org.springframework.http.MediaType.1
            @Override // java.util.Comparator
            public int compare(MediaType mediaType1, MediaType mediaType2) {
                if (mediaType1.isWildcardType() && !mediaType2.isWildcardType()) {
                    return 1;
                }
                if (mediaType2.isWildcardType() && !mediaType1.isWildcardType()) {
                    return -1;
                }
                if (!mediaType1.getType().equals(mediaType2.getType())) {
                    return 0;
                }
                if (mediaType1.isWildcardSubtype() && !mediaType2.isWildcardSubtype()) {
                    return 1;
                }
                if (mediaType2.isWildcardSubtype() && !mediaType1.isWildcardSubtype()) {
                    return -1;
                }
                if (!mediaType1.getSubtype().equals(mediaType2.getSubtype())) {
                    return 0;
                }
                double quality1 = mediaType1.getQualityValue();
                double quality2 = mediaType2.getQualityValue();
                int qualityComparison = Double.compare(quality2, quality1);
                if (qualityComparison == 0) {
                    int paramsSize1 = mediaType1.parameters.size();
                    int paramsSize2 = mediaType2.parameters.size();
                    if (paramsSize2 < paramsSize1) {
                        return -1;
                    }
                    return paramsSize2 == paramsSize1 ? 0 : 1;
                }
                return qualityComparison;
            }
        };
        QUALITY_VALUE_COMPARATOR = new Comparator<MediaType>() { // from class: org.springframework.http.MediaType.2
            @Override // java.util.Comparator
            public int compare(MediaType mediaType1, MediaType mediaType2) {
                double quality1 = mediaType1.getQualityValue();
                double quality2 = mediaType2.getQualityValue();
                int qualityComparison = Double.compare(quality2, quality1);
                if (qualityComparison != 0) {
                    return qualityComparison;
                }
                if (mediaType1.isWildcardType() && !mediaType2.isWildcardType()) {
                    return 1;
                }
                if (mediaType2.isWildcardType() && !mediaType1.isWildcardType()) {
                    return -1;
                }
                if (!mediaType1.getType().equals(mediaType2.getType())) {
                    return 0;
                }
                if (mediaType1.isWildcardSubtype() && !mediaType2.isWildcardSubtype()) {
                    return 1;
                }
                if (mediaType2.isWildcardSubtype() && !mediaType1.isWildcardSubtype()) {
                    return -1;
                }
                if (mediaType1.getSubtype().equals(mediaType2.getSubtype())) {
                    int paramsSize1 = mediaType1.parameters.size();
                    int paramsSize2 = mediaType2.parameters.size();
                    if (paramsSize2 < paramsSize1) {
                        return -1;
                    }
                    return paramsSize2 == paramsSize1 ? 0 : 1;
                }
                return 0;
            }
        };
    }

    public MediaType(String type) {
        this(type, "*");
    }

    public MediaType(String type, String subtype) {
        this(type, subtype, (Map<String, String>) Collections.emptyMap());
    }

    public MediaType(String type, String subtype, Charset charSet) {
        this(type, subtype, (Map<String, String>) Collections.singletonMap(PARAM_CHARSET, charSet.displayName()));
    }

    public MediaType(String type, String subtype, double qualityValue) {
        this(type, subtype, (Map<String, String>) Collections.singletonMap(PARAM_QUALITY_FACTOR, Double.toString(qualityValue)));
    }

    public MediaType(MediaType other, Map<String, String> parameters) {
        this(other.getType(), other.getSubtype(), parameters);
    }

    public MediaType(String type, String subtype, Map<String, String> parameters) {
        Assert.hasLength(type, "'type' must not be empty");
        Assert.hasLength(subtype, "'subtype' must not be empty");
        checkToken(type);
        checkToken(subtype);
        this.type = type.toLowerCase(Locale.ENGLISH);
        this.subtype = subtype.toLowerCase(Locale.ENGLISH);
        if (!CollectionUtils.isEmpty(parameters)) {
            LinkedCaseInsensitiveMap linkedCaseInsensitiveMap = new LinkedCaseInsensitiveMap(parameters.size(), Locale.ENGLISH);
            for (Map.Entry<String, String> entry : parameters.entrySet()) {
                String attribute = entry.getKey();
                String value = entry.getValue();
                checkParameters(attribute, value);
                linkedCaseInsensitiveMap.put(attribute, value);
            }
            this.parameters = Collections.unmodifiableMap(linkedCaseInsensitiveMap);
            return;
        }
        this.parameters = Collections.emptyMap();
    }

    private void checkToken(String s) {
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (!TOKEN.get(ch)) {
                throw new IllegalArgumentException("Invalid token character '" + ch + "' in token \"" + s + "\"");
            }
        }
    }

    private void checkParameters(String attribute, String value) {
        Assert.hasLength(attribute, "parameter attribute must not be empty");
        Assert.hasLength(value, "parameter value must not be empty");
        checkToken(attribute);
        if (PARAM_QUALITY_FACTOR.equals(attribute)) {
            String value2 = unquote(value);
            double d = Double.parseDouble(value2);
            Assert.isTrue(d >= 0.0d && d <= 1.0d, "Invalid quality value \"" + value2 + "\": should be between 0.0 and 1.0");
        } else if (PARAM_CHARSET.equals(attribute)) {
            Charset.forName(unquote(value));
        } else if (!isQuotedString(value)) {
            checkToken(value);
        }
    }

    private boolean isQuotedString(String s) {
        return s.length() > 1 && s.startsWith("\"") && s.endsWith("\"");
    }

    private String unquote(String s) {
        if (s == null) {
            return null;
        }
        return isQuotedString(s) ? s.substring(1, s.length() - 1) : s;
    }

    public String getType() {
        return this.type;
    }

    public boolean isWildcardType() {
        return "*".equals(this.type);
    }

    public String getSubtype() {
        return this.subtype;
    }

    public boolean isWildcardSubtype() {
        return "*".equals(this.subtype);
    }

    public boolean isConcrete() {
        return (isWildcardType() || isWildcardSubtype()) ? false : true;
    }

    public Charset getCharSet() {
        String charSet = getParameter(PARAM_CHARSET);
        if (charSet != null) {
            return Charset.forName(unquote(charSet));
        }
        return null;
    }

    public double getQualityValue() {
        String qualityFactory = getParameter(PARAM_QUALITY_FACTOR);
        if (qualityFactory != null) {
            return Double.parseDouble(unquote(qualityFactory));
        }
        return 1.0d;
    }

    public String getParameter(String name) {
        return this.parameters.get(name);
    }

    public Map<String, String> getParameters() {
        return this.parameters;
    }

    public boolean includes(MediaType other) {
        if (other == null) {
            return false;
        }
        if (isWildcardType()) {
            return true;
        }
        if (this.type.equals(other.type)) {
            if (this.subtype.equals(other.subtype) || isWildcardSubtype()) {
                return true;
            }
            int thisPlusIdx = this.subtype.indexOf(43);
            int otherPlusIdx = other.subtype.indexOf(43);
            if (thisPlusIdx != -1 && otherPlusIdx != -1) {
                String thisSubtypeNoSuffix = this.subtype.substring(0, thisPlusIdx);
                String thisSubtypeSuffix = this.subtype.substring(thisPlusIdx + 1);
                String otherSubtypeSuffix = other.subtype.substring(otherPlusIdx + 1);
                if (thisSubtypeSuffix.equals(otherSubtypeSuffix) && "*".equals(thisSubtypeNoSuffix)) {
                    return true;
                }
                return false;
            }
            return false;
        }
        return false;
    }

    public boolean isCompatibleWith(MediaType other) {
        if (other == null) {
            return false;
        }
        if (isWildcardType() || other.isWildcardType()) {
            return true;
        }
        if (this.type.equals(other.type)) {
            if (this.subtype.equals(other.subtype) || isWildcardSubtype() || other.isWildcardSubtype()) {
                return true;
            }
            int thisPlusIdx = this.subtype.indexOf(43);
            int otherPlusIdx = other.subtype.indexOf(43);
            if (thisPlusIdx != -1 && otherPlusIdx != -1) {
                String thisSubtypeNoSuffix = this.subtype.substring(0, thisPlusIdx);
                String otherSubtypeNoSuffix = other.subtype.substring(0, otherPlusIdx);
                String thisSubtypeSuffix = this.subtype.substring(thisPlusIdx + 1);
                String otherSubtypeSuffix = other.subtype.substring(otherPlusIdx + 1);
                if (!thisSubtypeSuffix.equals(otherSubtypeSuffix)) {
                    return false;
                }
                if ("*".equals(thisSubtypeNoSuffix) || "*".equals(otherSubtypeNoSuffix)) {
                    return true;
                }
                return false;
            }
            return false;
        }
        return false;
    }

    @Override // java.lang.Comparable
    public int compareTo(MediaType other) {
        int comp = this.type.compareToIgnoreCase(other.type);
        if (comp != 0) {
            return comp;
        }
        int comp2 = this.subtype.compareToIgnoreCase(other.subtype);
        if (comp2 != 0) {
            return comp2;
        }
        int comp3 = this.parameters.size() - other.parameters.size();
        if (comp3 != 0) {
            return comp3;
        }
        TreeSet<String> thisAttributes = new TreeSet<>((Comparator<? super String>) String.CASE_INSENSITIVE_ORDER);
        thisAttributes.addAll(this.parameters.keySet());
        TreeSet<String> otherAttributes = new TreeSet<>((Comparator<? super String>) String.CASE_INSENSITIVE_ORDER);
        otherAttributes.addAll(other.parameters.keySet());
        Iterator<String> thisAttributesIterator = thisAttributes.iterator();
        Iterator<String> otherAttributesIterator = otherAttributes.iterator();
        while (thisAttributesIterator.hasNext()) {
            String thisAttribute = thisAttributesIterator.next();
            String otherAttribute = otherAttributesIterator.next();
            int comp4 = thisAttribute.compareToIgnoreCase(otherAttribute);
            if (comp4 != 0) {
                return comp4;
            }
            String thisValue = this.parameters.get(thisAttribute);
            String otherValue = other.parameters.get(otherAttribute);
            if (otherValue == null) {
                otherValue = "";
            }
            int comp5 = thisValue.compareTo(otherValue);
            if (comp5 != 0) {
                return comp5;
            }
        }
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MediaType)) {
            return false;
        }
        MediaType otherType = (MediaType) other;
        return this.type.equalsIgnoreCase(otherType.type) && this.subtype.equalsIgnoreCase(otherType.subtype) && this.parameters.equals(otherType.parameters);
    }

    public int hashCode() {
        int result = this.type.hashCode();
        return (31 * ((31 * result) + this.subtype.hashCode())) + this.parameters.hashCode();
    }

    public String toString() {
        StringBuilder builder = new StringBuilder();
        appendTo(builder);
        return builder.toString();
    }

    private void appendTo(StringBuilder builder) {
        builder.append(this.type);
        builder.append('/');
        builder.append(this.subtype);
        appendTo(this.parameters, builder);
    }

    private void appendTo(Map<String, String> map, StringBuilder builder) {
        for (Map.Entry<String, String> entry : map.entrySet()) {
            builder.append(';');
            builder.append(entry.getKey());
            builder.append('=');
            builder.append(entry.getValue());
        }
    }

    public static MediaType valueOf(String value) {
        return parseMediaType(value);
    }

    public static MediaType parseMediaType(String mediaType) {
        Assert.hasLength(mediaType, "'mediaType' must not be empty");
        String[] parts = StringUtils.tokenizeToStringArray(mediaType, ";");
        String fullType = parts[0].trim();
        if ("*".equals(fullType)) {
            fullType = ALL_VALUE;
        }
        int subIndex = fullType.indexOf(47);
        if (subIndex == -1) {
            throw new IllegalArgumentException("\"" + mediaType + "\" does not contain '/'");
        }
        if (subIndex == fullType.length() - 1) {
            throw new IllegalArgumentException("\"" + mediaType + "\" does not contain subtype after '/'");
        }
        String type = fullType.substring(0, subIndex);
        String subtype = fullType.substring(subIndex + 1, fullType.length());
        if ("*".equals(type) && !"*".equals(subtype)) {
            throw new IllegalArgumentException("A wildcard type is legal only in '*/*' (all media types).");
        }
        Map<String, String> parameters = null;
        if (parts.length > 1) {
            parameters = new LinkedHashMap<>(parts.length - 1);
            for (int i = 1; i < parts.length; i++) {
                String parameter = parts[i];
                int eqIndex = parameter.indexOf(61);
                if (eqIndex != -1) {
                    String attribute = parameter.substring(0, eqIndex);
                    String value = parameter.substring(eqIndex + 1, parameter.length());
                    parameters.put(attribute, value);
                }
            }
        }
        return new MediaType(type, subtype, parameters);
    }

    public static List<MediaType> parseMediaTypes(String mediaTypes) {
        if (!StringUtils.hasLength(mediaTypes)) {
            return Collections.emptyList();
        }
        String[] tokens = mediaTypes.split(",\\s*");
        List<MediaType> result = new ArrayList<>(tokens.length);
        for (String token : tokens) {
            result.add(parseMediaType(token));
        }
        return result;
    }

    public static String toString(Collection<MediaType> mediaTypes) {
        StringBuilder builder = new StringBuilder();
        Iterator<MediaType> iterator = mediaTypes.iterator();
        while (iterator.hasNext()) {
            MediaType mediaType = iterator.next();
            mediaType.appendTo(builder);
            if (iterator.hasNext()) {
                builder.append(", ");
            }
        }
        return builder.toString();
    }

    public static void sortBySpecificity(List<MediaType> mediaTypes) {
        Assert.notNull(mediaTypes, "'mediaTypes' must not be null");
        if (mediaTypes.size() > 1) {
            Collections.sort(mediaTypes, SPECIFICITY_COMPARATOR);
        }
    }

    public static void sortByQualityValue(List<MediaType> mediaTypes) {
        Assert.notNull(mediaTypes, "'mediaTypes' must not be null");
        if (mediaTypes.size() > 1) {
            Collections.sort(mediaTypes, QUALITY_VALUE_COMPARATOR);
        }
    }
}
