package com.wutka.dtd;

import java.io.IOException;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDParseException.class */
public class DTDParseException extends IOException {
    public String uriID;
    public int lineNumber;
    public int column;

    public DTDParseException() {
        this.uriID = "";
        this.lineNumber = -1;
        this.column = -1;
    }

    public DTDParseException(String message) {
        super(message);
        this.uriID = "";
        this.lineNumber = -1;
        this.column = -1;
    }

    public DTDParseException(String message, int line, int col) {
        super(new StringBuffer().append("At line ").append(line).append(", column ").append(col).append(": ").append(message).toString());
        this.uriID = "";
        this.lineNumber = line;
        this.column = col;
    }

    public DTDParseException(String id, String message, int line, int col) {
        super(new StringBuffer().append((null == id || id.length() <= 0) ? "At " : new StringBuffer().append("URI ").append(id).append(" at ").toString()).append("line ").append(line).append(", column ").append(col).append(": ").append(message).toString());
        this.uriID = "";
        if (null != id) {
            this.uriID = id;
        }
        this.lineNumber = line;
        this.column = col;
    }

    public String getId() {
        return this.uriID;
    }

    public int getLineNumber() {
        return this.lineNumber;
    }

    public int getColumn() {
        return this.column;
    }
}
