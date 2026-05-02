package ezvcard.util;

import java.util.Arrays;
import java.util.Collections;
import java.util.Map;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/TelUri.class */
public final class TelUri {
    private static final char[] validParamValueChars = "!$&'()*+-.:[]_~/".toCharArray();
    private static final Pattern hexPattern;
    private static final Pattern uriPattern;
    private static final String PARAM_EXTENSION = "ext";
    private static final String PARAM_ISDN_SUBADDRESS = "isub";
    private static final String PARAM_PHONE_CONTEXT = "phone-context";
    private final String number;
    private final String extension;
    private final String isdnSubaddress;
    private final String phoneContext;
    private final Map<String, String> parameters;

    static {
        Arrays.sort(validParamValueChars);
        hexPattern = Pattern.compile("(?i)%([0-9a-f]{2})");
        uriPattern = Pattern.compile("(?i)^tel:(.*?)(;(.*))?$");
    }

    private TelUri(Builder builder) {
        this.number = builder.number;
        this.extension = builder.extension;
        this.isdnSubaddress = builder.isdnSubaddress;
        this.phoneContext = builder.phoneContext;
        this.parameters = Collections.unmodifiableMap(builder.parameters);
    }

    public static TelUri parse(String uri) {
        Matcher m = uriPattern.matcher(uri);
        if (!m.find()) {
            throw new IllegalArgumentException("Invalid tel URI: " + uri);
        }
        Builder builder = new Builder();
        builder.number = m.group(1);
        String paramsStr = m.group(3);
        if (paramsStr != null) {
            String[] paramsArray = paramsStr.split(";");
            for (String param : paramsArray) {
                String[] paramSplit = param.split("=", 2);
                String paramName = paramSplit[0];
                String paramValue = paramSplit.length > 1 ? decodeParamValue(paramSplit[1]) : "";
                if (!PARAM_EXTENSION.equalsIgnoreCase(paramName)) {
                    if (!PARAM_ISDN_SUBADDRESS.equalsIgnoreCase(paramName)) {
                        if (PARAM_PHONE_CONTEXT.equalsIgnoreCase(paramName)) {
                            builder.phoneContext = paramValue;
                        } else {
                            builder.parameters.put(paramName, paramValue);
                        }
                    } else {
                        builder.isdnSubaddress = paramValue;
                    }
                } else {
                    builder.extension = paramValue;
                }
            }
        }
        return builder.build();
    }

    public String getNumber() {
        return this.number;
    }

    public String getPhoneContext() {
        return this.phoneContext;
    }

    public String getExtension() {
        return this.extension;
    }

    public String getIsdnSubaddress() {
        return this.isdnSubaddress;
    }

    public String getParameter(String name) {
        return this.parameters.get(name);
    }

    public Map<String, String> getParameters() {
        return this.parameters;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("tel:");
        sb.append(this.number);
        if (this.extension != null) {
            writeParameter(PARAM_EXTENSION, this.extension, sb);
        }
        if (this.isdnSubaddress != null) {
            writeParameter(PARAM_ISDN_SUBADDRESS, this.isdnSubaddress, sb);
        }
        if (this.phoneContext != null) {
            writeParameter(PARAM_PHONE_CONTEXT, this.phoneContext, sb);
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

    public int hashCode() {
        int result = (31 * 1) + (this.extension == null ? 0 : this.extension.hashCode());
        return (31 * ((31 * ((31 * ((31 * result) + (this.isdnSubaddress == null ? 0 : this.isdnSubaddress.hashCode()))) + (this.number == null ? 0 : this.number.hashCode()))) + (this.parameters == null ? 0 : this.parameters.hashCode()))) + (this.phoneContext == null ? 0 : this.phoneContext.hashCode());
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        TelUri other = (TelUri) obj;
        if (this.extension == null) {
            if (other.extension != null) {
                return false;
            }
        } else if (!this.extension.equals(other.extension)) {
            return false;
        }
        if (this.isdnSubaddress == null) {
            if (other.isdnSubaddress != null) {
                return false;
            }
        } else if (!this.isdnSubaddress.equals(other.isdnSubaddress)) {
            return false;
        }
        if (this.number == null) {
            if (other.number != null) {
                return false;
            }
        } else if (!this.number.equals(other.number)) {
            return false;
        }
        if (this.parameters == null) {
            if (other.parameters != null) {
                return false;
            }
        } else if (!this.parameters.equals(other.parameters)) {
            return false;
        }
        if (this.phoneContext == null) {
            if (other.phoneContext != null) {
                return false;
            }
            return true;
        }
        if (!this.phoneContext.equals(other.phoneContext)) {
            return false;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isParametername(String text) {
        return text.matches("(?i)[-a-z0-9]+");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isPhoneDigit(String text) {
        return text.matches("[-0-9.()]+");
    }

    private static String encodeParamValue(String value) {
        StringBuilder sb = new StringBuilder(value.length());
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
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

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/TelUri$Builder.class */
    public static class Builder {
        private String number;
        private String extension;
        private String isdnSubaddress;
        private String phoneContext;
        private Map<String, String> parameters;

        private Builder() {
            this.parameters = new TreeMap();
        }

        public Builder(String globalNumber) {
            this();
            globalNumber(globalNumber);
        }

        public Builder(String localNumber, String phoneContext) {
            this();
            localNumber(localNumber, phoneContext);
        }

        public Builder(TelUri original) {
            this.number = original.number;
            this.extension = original.extension;
            this.isdnSubaddress = original.isdnSubaddress;
            this.phoneContext = original.phoneContext;
            this.parameters = new TreeMap(original.parameters);
        }

        public Builder globalNumber(String globalNumber) {
            if (!globalNumber.matches(".*?[0-9].*")) {
                throw new IllegalArgumentException("Global number must contain at least one digit.");
            }
            if (!globalNumber.startsWith("+")) {
                throw new IllegalArgumentException("Global number must start with \"+\".");
            }
            if (!globalNumber.matches("\\+[-0-9.()]*")) {
                throw new IllegalArgumentException("Global number contains invalid characters.");
            }
            this.number = globalNumber;
            this.phoneContext = null;
            return this;
        }

        public Builder localNumber(String localNumber, String phoneContext) {
            if (!localNumber.matches(".*?[0-9*#].*") || !localNumber.matches("[0-9\\-.()*#]+")) {
                throw new IllegalArgumentException("Local number contains invalid characters.");
            }
            this.number = localNumber;
            this.phoneContext = phoneContext;
            return this;
        }

        public Builder extension(String extension) {
            if (extension != null && !TelUri.isPhoneDigit(extension)) {
                throw new IllegalArgumentException("Extension contains invalid characters.");
            }
            this.extension = extension;
            return this;
        }

        public Builder isdnSubaddress(String isdnSubaddress) {
            this.isdnSubaddress = isdnSubaddress;
            return this;
        }

        public Builder parameter(String name, String value) {
            if (!TelUri.isParametername(name)) {
                throw new IllegalArgumentException("Parameter names can only contain letters, numbers, and hyphens.");
            }
            if (value == null) {
                this.parameters.remove(name);
            } else {
                this.parameters.put(name, value);
            }
            return this;
        }

        public TelUri build() {
            return new TelUri(this);
        }
    }
}
