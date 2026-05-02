package ezvcard.util;

import java.net.URI;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/GeoUri.class */
public final class GeoUri {
    public static final String CRS_WGS84 = "wgs84";
    private static final char[] validParamValueChars = "!$&'()*+-.:[]_~".toCharArray();
    private static final Pattern hexPattern;
    private static final Pattern labelTextPattern;
    private static final Pattern uriPattern;
    private static final String PARAM_CRS = "crs";
    private static final String PARAM_UNCERTAINTY = "u";
    private final Double coordA;
    private final Double coordB;
    private final Double coordC;
    private final String crs;
    private final Double uncertainty;
    private final Map<String, String> parameters;

    static {
        Arrays.sort(validParamValueChars);
        hexPattern = Pattern.compile("(?i)%([0-9a-f]{2})");
        labelTextPattern = Pattern.compile("(?i)^[-a-z0-9]+$");
        uriPattern = Pattern.compile("(?i)^geo:(-?\\d+(\\.\\d+)?),(-?\\d+(\\.\\d+)?)(,(-?\\d+(\\.\\d+)?))?(;(.*))?$");
    }

    private GeoUri(Builder builder) {
        this.coordA = builder.coordA;
        this.coordB = builder.coordB;
        this.coordC = builder.coordC;
        this.crs = builder.crs;
        this.uncertainty = builder.uncertainty;
        this.parameters = Collections.unmodifiableMap(builder.parameters);
    }

    public static GeoUri parse(String uri) {
        Matcher m = uriPattern.matcher(uri);
        if (!m.find()) {
            throw new IllegalArgumentException("Invalid geo URI: " + uri);
        }
        Builder builder = new Builder();
        builder.coordA = Double.valueOf(Double.parseDouble(m.group(1)));
        builder.coordB = Double.valueOf(Double.parseDouble(m.group(3)));
        String coordCStr = m.group(6);
        if (coordCStr != null) {
            builder.coordC = Double.valueOf(coordCStr);
        }
        String paramsStr = m.group(9);
        if (paramsStr != null) {
            String[] paramsArray = paramsStr.split(";");
            for (String param : paramsArray) {
                String[] paramSplit = param.split("=", 2);
                String paramName = paramSplit[0];
                String paramValue = paramSplit.length > 1 ? decodeParamValue(paramSplit[1]) : "";
                if (!PARAM_CRS.equalsIgnoreCase(paramName)) {
                    if (PARAM_UNCERTAINTY.equalsIgnoreCase(paramName)) {
                        try {
                            builder.uncertainty = Double.valueOf(paramValue);
                        } catch (NumberFormatException e) {
                        }
                    } else {
                        builder.parameters.put(paramName, paramValue);
                    }
                } else {
                    builder.crs = paramValue;
                }
            }
        }
        return builder.build();
    }

    public Double getCoordA() {
        return this.coordA;
    }

    public Double getCoordB() {
        return this.coordB;
    }

    public Double getCoordC() {
        return this.coordC;
    }

    public String getCrs() {
        return this.crs;
    }

    public Double getUncertainty() {
        return this.uncertainty;
    }

    public String getParameter(String name) {
        return this.parameters.get(name);
    }

    public Map<String, String> getParameters() {
        return this.parameters;
    }

    public URI toUri() {
        return URI.create(toString());
    }

    public String toString() {
        return toString(6);
    }

    public String toString(int decimals) {
        VCardFloatFormatter formatter = new VCardFloatFormatter(decimals);
        StringBuilder sb = new StringBuilder("geo:");
        sb.append(formatter.format(this.coordA));
        sb.append(',');
        sb.append(formatter.format(this.coordB));
        if (this.coordC != null) {
            sb.append(',');
            sb.append(this.coordC);
        }
        if (this.crs != null && !this.crs.equalsIgnoreCase(CRS_WGS84)) {
            writeParameter(PARAM_CRS, this.crs, sb);
        }
        if (this.uncertainty != null) {
            writeParameter(PARAM_UNCERTAINTY, formatter.format(this.uncertainty), sb);
        }
        for (Map.Entry<String, String> entry : this.parameters.entrySet()) {
            String name = entry.getKey();
            String value = entry.getValue();
            writeParameter(name, value, sb);
        }
        return sb.toString();
    }

    private void writeParameter(String name, String value, StringBuilder sb) {
        sb.append(';').append(name).append('=').append(encodeParamValue(value));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isLabelText(String text) {
        return labelTextPattern.matcher(text).find();
    }

    private static String encodeParamValue(String value) {
        StringBuilder sb = new StringBuilder(value.length());
        char[] arr$ = value.toCharArray();
        for (char c : arr$) {
            if ((c >= 'a' && c <= 'z') || ((c >= 'A' && c <= 'Z') || ((c >= '0' && c <= '9') || Arrays.binarySearch(validParamValueChars, c) >= 0))) {
                sb.append(c);
            } else {
                sb.append('%');
                sb.append(Integer.toString(c, 16));
            }
        }
        return sb.toString();
    }

    private static String decodeParamValue(String value) {
        Matcher m = hexPattern.matcher(value);
        StringBuffer sb = new StringBuffer();
        while (m.find()) {
            int hex = Integer.parseInt(m.group(1), 16);
            m.appendReplacement(sb, "" + ((char) hex));
        }
        m.appendTail(sb);
        return sb.toString();
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/GeoUri$Builder.class */
    public static class Builder {
        private Double coordA;
        private Double coordB;
        private Double coordC;
        private String crs;
        private Double uncertainty;
        private Map<String, String> parameters;

        private Builder() {
            this.parameters = new LinkedHashMap(0);
        }

        public Builder(Double coordA, Double coordB) {
            this();
            coordA(coordA);
            coordB(coordB);
        }

        public Builder(GeoUri original) {
            coordA(original.coordA);
            coordB(original.coordB);
            this.coordC = original.coordC;
            this.crs = original.crs;
            this.uncertainty = original.uncertainty;
            this.parameters = new LinkedHashMap(original.parameters);
        }

        public Builder coordA(Double coordA) {
            this.coordA = Double.valueOf(coordA == null ? 0.0d : coordA.doubleValue());
            return this;
        }

        public Builder coordB(Double coordB) {
            this.coordB = Double.valueOf(coordB == null ? 0.0d : coordB.doubleValue());
            return this;
        }

        public Builder coordC(Double coordC) {
            this.coordC = coordC;
            return this;
        }

        public Builder crs(String crs) {
            if (crs != null && !GeoUri.isLabelText(crs)) {
                throw new IllegalArgumentException("CRS can only contain letters, numbers, and hypens.");
            }
            this.crs = crs;
            return this;
        }

        public Builder uncertainty(Double uncertainty) {
            this.uncertainty = uncertainty;
            return this;
        }

        public Builder parameter(String name, String value) {
            if (!GeoUri.isLabelText(name)) {
                throw new IllegalArgumentException("Parameter names can only contain letters, numbers, and hyphens.");
            }
            if (value == null) {
                this.parameters.remove(name);
            } else {
                this.parameters.put(name, value);
            }
            return this;
        }

        public GeoUri build() {
            return new GeoUri(this);
        }
    }
}
