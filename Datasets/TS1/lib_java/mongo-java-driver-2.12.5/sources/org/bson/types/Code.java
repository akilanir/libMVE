package org.bson.types;

import java.io.Serializable;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/types/Code.class */
public class Code implements Serializable {
    private static final long serialVersionUID = 475535263314046697L;
    final String _code;

    public Code(String code) {
        this._code = code;
    }

    public String getCode() {
        return this._code;
    }

    public boolean equals(Object o) {
        if (!(o instanceof Code)) {
            return false;
        }
        Code c = (Code) o;
        return this._code.equals(c._code);
    }

    public int hashCode() {
        return this._code.hashCode();
    }

    public String toString() {
        return getCode();
    }
}
