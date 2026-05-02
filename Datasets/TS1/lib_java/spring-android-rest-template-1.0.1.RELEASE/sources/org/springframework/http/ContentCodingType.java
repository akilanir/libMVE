package org.springframework.http;

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

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/ContentCodingType.class */
public class ContentCodingType implements Comparable<ContentCodingType> {
    public static final ContentCodingType ALL;
    public static final String ALL_VALUE = "*";
    public static final ContentCodingType IDENTITY;
    public static final String IDENTITY_VALUE = "identity";
    public static final ContentCodingType GZIP;
    public static final String GZIP_VALUE = "gzip";
    private static final BitSet TOKEN;
    private static final String WILDCARD_TYPE = "*";
    private static final String PARAM_QUALITY_FACTOR = "q";
    private final String type;
    private final Map<String, String> parameters;
    public static final Comparator<ContentCodingType> QUALITY_VALUE_COMPARATOR;

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
        ALL = valueOf("*");
        IDENTITY = valueOf(IDENTITY_VALUE);
        GZIP = valueOf(GZIP_VALUE);
        QUALITY_VALUE_COMPARATOR = new Comparator<ContentCodingType>() { // from class: org.springframework.http.ContentCodingType.1
            @Override // java.util.Comparator
            public int compare(ContentCodingType codingType1, ContentCodingType codingType2) {
                double quality1 = codingType1.getQualityValue();
                double quality2 = codingType2.getQualityValue();
                int qualityComparison = Double.compare(quality2, quality1);
                if (qualityComparison != 0) {
                    return qualityComparison;
                }
                if (codingType1.isWildcardType() && !codingType2.isWildcardType()) {
                    return 1;
                }
                if (codingType2.isWildcardType() && !codingType1.isWildcardType()) {
                    return -1;
                }
                if (!codingType1.getType().equals(codingType2.getType())) {
                    return 0;
                }
                return 0;
            }
        };
    }

    public ContentCodingType(String type) {
        this(type, (Map<String, String>) Collections.emptyMap());
    }

    public ContentCodingType(String type, double qualityValue) {
        this(type, (Map<String, String>) Collections.singletonMap(PARAM_QUALITY_FACTOR, Double.toString(qualityValue)));
    }

    public ContentCodingType(String type, Map<String, String> parameters) {
        Assert.hasLength(type, "'type' must not be empty");
        checkToken(type);
        this.type = type.toLowerCase(Locale.ENGLISH);
        if (!CollectionUtils.isEmpty(parameters)) {
            LinkedCaseInsensitiveMap linkedCaseInsensitiveMap = new LinkedCaseInsensitiveMap(parameters.size(), Locale.ENGLISH);
            for (Map.Entry<String, String> entry : parameters.entrySet()) {
                String attribute = entry.getKey();
                String value = entry.getValue();
                checkParameters(attribute, value);
                linkedCaseInsensitiveMap.put(attribute, unquote(value));
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

    public double getQualityValue() {
        String qualityFactory = getParameter(PARAM_QUALITY_FACTOR);
        if (qualityFactory != null) {
            return Double.parseDouble(qualityFactory);
        }
        return 1.0d;
    }

    public String getParameter(String name) {
        return this.parameters.get(name);
    }

    public boolean includes(ContentCodingType other) {
        if (other == null) {
            return false;
        }
        if (isWildcardType() || this.type.equals(other.type)) {
            return true;
        }
        return false;
    }

    public boolean isCompatibleWith(ContentCodingType other) {
        if (other == null) {
            return false;
        }
        if (isWildcardType() || other.isWildcardType() || this.type.equals(other.type)) {
            return true;
        }
        return false;
    }

    @Override // java.lang.Comparable
    public int compareTo(ContentCodingType other) {
        int comp = this.type.compareToIgnoreCase(other.type);
        if (comp != 0) {
            return comp;
        }
        int comp2 = this.parameters.size() - other.parameters.size();
        if (comp2 != 0) {
            return comp2;
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
            int comp3 = thisAttribute.compareToIgnoreCase(otherAttribute);
            if (comp3 != 0) {
                return comp3;
            }
            String thisValue = this.parameters.get(thisAttribute);
            String otherValue = other.parameters.get(otherAttribute);
            if (otherValue == null) {
                otherValue = "";
            }
            int comp4 = thisValue.compareTo(otherValue);
            if (comp4 != 0) {
                return comp4;
            }
        }
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ContentCodingType)) {
            return false;
        }
        ContentCodingType otherType = (ContentCodingType) other;
        return this.type.equalsIgnoreCase(otherType.type) && this.parameters.equals(otherType.parameters);
    }

    public int hashCode() {
        int result = this.type.hashCode();
        return (31 * result) + this.parameters.hashCode();
    }

    public String toString() {
        StringBuilder builder = new StringBuilder();
        appendTo(builder);
        return builder.toString();
    }

    private void appendTo(StringBuilder builder) {
        builder.append(this.type);
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

    public static ContentCodingType valueOf(String value) {
        return parseCodingType(value);
    }

    public static ContentCodingType parseCodingType(String codingType) {
        Assert.hasLength(codingType, "'codingType' must not be empty");
        String[] parts = StringUtils.tokenizeToStringArray(codingType, ";");
        String type = parts[0].trim();
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
        return new ContentCodingType(type, parameters);
    }

    public static List<ContentCodingType> parseCodingTypes(String codingTypes) {
        if (!StringUtils.hasLength(codingTypes)) {
            return Collections.emptyList();
        }
        String[] tokens = codingTypes.split(",");
        List<ContentCodingType> result = new ArrayList<>(tokens.length);
        for (String token : tokens) {
            result.add(parseCodingType(token));
        }
        return result;
    }

    public static String toString(Collection<ContentCodingType> codingTypes) {
        StringBuilder builder = new StringBuilder();
        Iterator<ContentCodingType> iterator = codingTypes.iterator();
        while (iterator.hasNext()) {
            ContentCodingType codingType = iterator.next();
            codingType.appendTo(builder);
            if (iterator.hasNext()) {
                builder.append(", ");
            }
        }
        return builder.toString();
    }

    public static void sortByQualityValue(List<ContentCodingType> codingTypes) {
        Assert.notNull(codingTypes, "'codingTypes' must not be null");
        if (codingTypes.size() > 1) {
            Collections.sort(codingTypes, QUALITY_VALUE_COMPARATOR);
        }
    }
}
