package freemarker.core;

import java.io.Serializable;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/Token.class */
class Token implements Serializable {
    public int kind;
    public int beginLine;
    public int beginColumn;
    public int endLine;
    public int endColumn;
    public String image;
    public Token next;
    public Token specialToken;

    Token() {
    }

    public String toString() {
        return this.image;
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:3:0x0001. Please report as an issue. */
    public static final Token newToken(int ofKind) {
        switch (ofKind) {
        }
        return new Token();
    }
}
