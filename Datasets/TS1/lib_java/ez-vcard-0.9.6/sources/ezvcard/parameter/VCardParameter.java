package ezvcard.parameter;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/VCardParameter.class */
public class VCardParameter {
    protected final String value;

    public VCardParameter(String value) {
        this.value = value == null ? null : value.toLowerCase();
    }

    public String getValue() {
        return this.value;
    }

    public String toString() {
        return this.value;
    }

    public int hashCode() {
        int result = (31 * 1) + (this.value == null ? 0 : this.value.hashCode());
        return result;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        VCardParameter other = (VCardParameter) obj;
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
}
