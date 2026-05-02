package org.bson.types;

import java.io.Serializable;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/types/Symbol.class */
public class Symbol implements Serializable {
    private static final long serialVersionUID = 1326269319883146072L;
    private final String _symbol;

    public Symbol(String s) {
        this._symbol = s;
    }

    public String getSymbol() {
        return this._symbol;
    }

    public boolean equals(Object o) {
        String otherSymbol;
        if (this == o) {
            return true;
        }
        if (o == null) {
            return false;
        }
        if (o instanceof Symbol) {
            otherSymbol = ((Symbol) o)._symbol;
        } else if (o instanceof String) {
            otherSymbol = (String) o;
        } else {
            return false;
        }
        return this._symbol != null ? this._symbol.equals(otherSymbol) : otherSymbol == null;
    }

    public int hashCode() {
        if (this._symbol != null) {
            return this._symbol.hashCode();
        }
        return 0;
    }

    public String toString() {
        return this._symbol;
    }
}
