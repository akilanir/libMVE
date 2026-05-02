package com.alibaba.fastjson.parser;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/JSONLexer.class */
public interface JSONLexer {
    public static final char EOI = 26;
    public static final int NOT_MATCH = -1;
    public static final int NOT_MATCH_NAME = -2;
    public static final int UNKNOWN = 0;
    public static final int OBJECT = 1;
    public static final int ARRAY = 2;
    public static final int VALUE = 3;
    public static final int END = 4;
    public static final int VALUE_NULL = 5;

    int token();

    String tokenName();

    void skipWhitespace();

    void nextToken();

    void nextToken(int i);

    char getCurrent();

    char next();

    String scanSymbol(SymbolTable symbolTable);

    String scanSymbol(SymbolTable symbolTable, char c);

    void resetStringPosition();

    void scanNumber();

    int pos();

    Number integerValue();

    BigDecimal decimalValue();

    Number decimalValue(boolean z);

    String scanSymbolUnQuoted(SymbolTable symbolTable);

    String stringVal();

    boolean isEnabled(int i);

    boolean isEnabled(Feature feature);

    void config(Feature feature, boolean z);

    void scanString();

    int intValue();

    void nextTokenWithColon();

    void nextTokenWithColon(int i);

    boolean isBlankInput();

    void close();

    long longValue();

    boolean isRef();

    String numberString();

    byte[] bytesValue();

    float floatValue();

    int scanInt(char c);

    long scanLong(char c);

    float scanFloat(char c);

    double scanDouble(char c);

    boolean scanBoolean(char c);

    String scanString(char c);

    Enum<?> scanEnum(Class<?> cls, SymbolTable symbolTable, char c);

    String scanSymbolWithSeperator(SymbolTable symbolTable, char c);

    void scanStringArray(Collection<String> collection, char c);

    TimeZone getTimeZone();

    void setTimeZone(TimeZone timeZone);

    Locale getLocale();

    void setLocale(Locale locale);

    String info();
}
