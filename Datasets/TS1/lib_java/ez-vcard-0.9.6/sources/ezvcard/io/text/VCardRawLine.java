package ezvcard.io.text;

import ezvcard.parameter.VCardParameters;
import java.util.Arrays;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/text/VCardRawLine.class */
public class VCardRawLine {
    private final String group;
    private final String name;
    private final String value;
    private final VCardParameters parameters;

    public VCardRawLine(String group, String name, VCardParameters parameters, String value) {
        this.group = group;
        this.name = name;
        this.value = value;
        this.parameters = parameters;
    }

    public String getGroup() {
        return this.group;
    }

    public String getName() {
        return this.name;
    }

    public String getValue() {
        return this.value;
    }

    public VCardParameters getParameters() {
        return this.parameters;
    }

    public int hashCode() {
        int result = (31 * 1) + (this.group == null ? 0 : this.group.hashCode());
        return (31 * ((31 * ((31 * result) + (this.name == null ? 0 : this.name.hashCode()))) + (this.parameters == null ? 0 : this.parameters.hashCode()))) + (this.value == null ? 0 : this.value.hashCode());
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        VCardRawLine other = (VCardRawLine) obj;
        if (this.group == null) {
            if (other.group != null) {
                return false;
            }
        } else if (!this.group.equals(other.group)) {
            return false;
        }
        if (this.name == null) {
            if (other.name != null) {
                return false;
            }
        } else if (!this.name.equals(other.name)) {
            return false;
        }
        if (this.parameters == null) {
            if (other.parameters != null) {
                return false;
            }
        } else if (!this.parameters.equals(other.parameters)) {
            return false;
        }
        if (this.value == null) {
            if (other.value != null) {
                return false;
            }
            return true;
        }
        if (!this.value.equals(other.value)) {
            return false;
        }
        return true;
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/text/VCardRawLine$Builder.class */
    public static class Builder {
        private String group;
        private String name;
        private String value;
        private VCardParameters parameters = new VCardParameters();

        public Builder group(String group) {
            this.group = group;
            return this;
        }

        public Builder name(String name) {
            this.name = name;
            return this;
        }

        public Builder value(String value) {
            this.value = value;
            return this;
        }

        public Builder param(String name, String... values) {
            this.parameters.putAll(name, Arrays.asList(values));
            return this;
        }

        public VCardRawLine build() {
            if (this.name == null) {
                throw new IllegalArgumentException("Property name required.");
            }
            return new VCardRawLine(this.group, this.name, this.parameters, this.value);
        }
    }
}
