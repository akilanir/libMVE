package com.wutka.dtd;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/TokenType.class */
class TokenType {
    public int value;
    public String name;

    public TokenType(int aValue, String aName) {
        this.value = aValue;
        this.name = aName;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof TokenType)) {
            return false;
        }
        TokenType other = (TokenType) o;
        return other.value == this.value;
    }

    public int hashCode() {
        return this.name.hashCode();
    }
}
