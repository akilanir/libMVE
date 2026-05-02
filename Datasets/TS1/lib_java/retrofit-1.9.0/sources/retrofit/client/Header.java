package retrofit.client;

/* loaded from: retrofit-1.9.0.jar:retrofit/client/Header.class */
public final class Header {
    private final String name;
    private final String value;

    public Header(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return this.name;
    }

    public String getValue() {
        return this.value;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Header header = (Header) o;
        if (this.name != null) {
            if (!this.name.equals(header.name)) {
                return false;
            }
        } else if (header.name != null) {
            return false;
        }
        return this.value != null ? this.value.equals(header.value) : header.value == null;
    }

    public int hashCode() {
        int result = this.name != null ? this.name.hashCode() : 0;
        return (31 * result) + (this.value != null ? this.value.hashCode() : 0);
    }

    public String toString() {
        return (this.name != null ? this.name : "") + ": " + (this.value != null ? this.value : "");
    }
}
