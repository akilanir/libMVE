package com.sun.activation.registries;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/activation/registries/MailcapTokenizer.class */
public class MailcapTokenizer {
    public static final int UNKNOWN_TOKEN = 0;
    public static final int START_TOKEN = 1;
    public static final int STRING_TOKEN = 2;
    public static final int EOI_TOKEN = 5;
    public static final int SLASH_TOKEN = 47;
    public static final int SEMICOLON_TOKEN = 59;
    public static final int EQUALS_TOKEN = 61;
    private String data;
    private int dataLength;
    private int dataIndex = 0;
    private int currentToken = 1;
    private String currentTokenValue = "";
    private boolean isAutoquoting = false;
    private char autoquoteChar = ';';

    public MailcapTokenizer(String inputString) {
        this.data = inputString;
        this.dataLength = inputString.length();
    }

    public void setIsAutoquoting(boolean value) {
        this.isAutoquoting = value;
    }

    public void setAutoquoteChar(char value) {
        this.autoquoteChar = value;
    }

    public int getCurrentToken() {
        return this.currentToken;
    }

    public static String nameForToken(int token) {
        String name = "really unknown";
        switch (token) {
            case UNKNOWN_TOKEN /* 0 */:
                name = "unknown";
                break;
            case 1:
                name = "start";
                break;
            case 2:
                name = "string";
                break;
            case 5:
                name = "EOI";
                break;
            case SLASH_TOKEN /* 47 */:
                name = "'/'";
                break;
            case SEMICOLON_TOKEN /* 59 */:
                name = "';'";
                break;
            case EQUALS_TOKEN /* 61 */:
                name = "'='";
                break;
        }
        return name;
    }

    public String getCurrentTokenValue() {
        return this.currentTokenValue;
    }

    public int nextToken() {
        if (this.dataIndex < this.dataLength) {
            while (this.dataIndex < this.dataLength && isWhiteSpaceChar(this.data.charAt(this.dataIndex))) {
                this.dataIndex++;
            }
            if (this.dataIndex < this.dataLength) {
                char c = this.data.charAt(this.dataIndex);
                if (this.isAutoquoting) {
                    if (!isAutoquoteSpecialChar(c)) {
                        processAutoquoteToken();
                    } else if (c == ';' || c == '=') {
                        this.currentToken = c;
                        this.currentTokenValue = new Character(c).toString();
                        this.dataIndex++;
                    } else {
                        this.currentToken = 0;
                        this.currentTokenValue = new Character(c).toString();
                        this.dataIndex++;
                    }
                } else if (isStringTokenChar(c)) {
                    processStringToken();
                } else if (c == '/' || c == ';' || c == '=') {
                    this.currentToken = c;
                    this.currentTokenValue = new Character(c).toString();
                    this.dataIndex++;
                } else {
                    this.currentToken = 0;
                    this.currentTokenValue = new Character(c).toString();
                    this.dataIndex++;
                }
            } else {
                this.currentToken = 5;
                this.currentTokenValue = null;
            }
        } else {
            this.currentToken = 5;
            this.currentTokenValue = null;
        }
        return this.currentToken;
    }

    private void processStringToken() {
        int initialIndex = this.dataIndex;
        while (this.dataIndex < this.dataLength && isStringTokenChar(this.data.charAt(this.dataIndex))) {
            this.dataIndex++;
        }
        this.currentToken = 2;
        this.currentTokenValue = this.data.substring(initialIndex, this.dataIndex);
    }

    private void processAutoquoteToken() {
        int initialIndex = this.dataIndex;
        boolean foundTerminator = false;
        while (this.dataIndex < this.dataLength && !foundTerminator) {
            char c = this.data.charAt(this.dataIndex);
            if (c != this.autoquoteChar) {
                this.dataIndex++;
            } else {
                foundTerminator = true;
            }
        }
        this.currentToken = 2;
        this.currentTokenValue = fixEscapeSequences(this.data.substring(initialIndex, this.dataIndex));
    }

    public static boolean isSpecialChar(char c) {
        boolean lAnswer = false;
        switch (c) {
            case '\"':
            case '(':
            case ')':
            case ',':
            case SLASH_TOKEN /* 47 */:
            case ':':
            case SEMICOLON_TOKEN /* 59 */:
            case '<':
            case EQUALS_TOKEN /* 61 */:
            case '>':
            case '?':
            case '@':
            case '[':
            case '\\':
            case ']':
                lAnswer = true;
                break;
        }
        return lAnswer;
    }

    public static boolean isAutoquoteSpecialChar(char c) {
        boolean lAnswer = false;
        switch (c) {
            case SEMICOLON_TOKEN /* 59 */:
            case EQUALS_TOKEN /* 61 */:
                lAnswer = true;
                break;
        }
        return lAnswer;
    }

    public static boolean isControlChar(char c) {
        return Character.isISOControl(c);
    }

    public static boolean isWhiteSpaceChar(char c) {
        return Character.isWhitespace(c);
    }

    public static boolean isStringTokenChar(char c) {
        return (isSpecialChar(c) || isControlChar(c) || isWhiteSpaceChar(c)) ? false : true;
    }

    private static String fixEscapeSequences(String inputString) {
        int inputLength = inputString.length();
        StringBuffer buffer = new StringBuffer();
        buffer.ensureCapacity(inputLength);
        int i = 0;
        while (i < inputLength) {
            char currentChar = inputString.charAt(i);
            if (currentChar != '\\') {
                buffer.append(currentChar);
            } else if (i < inputLength - 1) {
                char nextChar = inputString.charAt(i + 1);
                buffer.append(nextChar);
                i++;
            } else {
                buffer.append(currentChar);
            }
            i++;
        }
        return buffer.toString();
    }
}
