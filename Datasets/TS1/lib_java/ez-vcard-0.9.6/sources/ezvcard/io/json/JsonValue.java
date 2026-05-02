package ezvcard.io.json;

import java.util.List;
import java.util.Map;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/json/JsonValue.class */
public class JsonValue {
    private final boolean isNull;
    private final Object value;
    private final List<JsonValue> array;
    private final Map<String, JsonValue> object;

    public JsonValue(Object value) {
        this.value = value;
        this.array = null;
        this.object = null;
        this.isNull = value == null;
    }

    public JsonValue(List<JsonValue> array) {
        this.array = array;
        this.value = null;
        this.object = null;
        this.isNull = array == null;
    }

    public JsonValue(Map<String, JsonValue> object) {
        this.object = object;
        this.value = null;
        this.array = null;
        this.isNull = object == null;
    }

    public Object getValue() {
        return this.value;
    }

    public List<JsonValue> getArray() {
        return this.array;
    }

    public Map<String, JsonValue> getObject() {
        return this.object;
    }

    public boolean isNull() {
        return this.isNull;
    }

    public int hashCode() {
        int result = (31 * 1) + (this.array == null ? 0 : this.array.hashCode());
        return (31 * ((31 * ((31 * result) + (this.isNull ? 1231 : 1237))) + (this.object == null ? 0 : this.object.hashCode()))) + (this.value == null ? 0 : this.value.hashCode());
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        JsonValue other = (JsonValue) obj;
        if (this.array == null) {
            if (other.array != null) {
                return false;
            }
        } else if (!this.array.equals(other.array)) {
            return false;
        }
        if (this.isNull != other.isNull) {
            return false;
        }
        if (this.object == null) {
            if (other.object != null) {
                return false;
            }
        } else if (!this.object.equals(other.object)) {
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

    public String toString() {
        if (this.isNull) {
            return "NULL";
        }
        if (this.value != null) {
            return "VALUE = " + this.value;
        }
        if (this.array != null) {
            return "ARRAY = " + this.array;
        }
        if (this.object != null) {
            return "OBJECT = " + this.object;
        }
        return "";
    }
}
