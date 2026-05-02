package com.wutka.dtd;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/Token.class */
class Token {
    public TokenType type;
    public String value;

    public Token(TokenType aType) {
        this.type = aType;
        this.value = null;
    }

    public Token(TokenType aType, String aValue) {
        this.type = aType;
        this.value = aValue;
    }
}
