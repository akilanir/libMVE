package com.alibaba.fastjson.parser;

import com.alibaba.fastjson.JSON;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/SymbolTable.class */
public class SymbolTable {
    private final String[] symbols;
    private final int indexMask;

    public SymbolTable(int tableSize) {
        this.indexMask = tableSize - 1;
        this.symbols = new String[tableSize];
        addSymbol("$ref", 0, 4, "$ref".hashCode());
        addSymbol(JSON.DEFAULT_TYPE_KEY, 0, 5, JSON.DEFAULT_TYPE_KEY.hashCode());
    }

    public String addSymbol(char[] buffer, int offset, int len) {
        int hash = hash(buffer, offset, len);
        return addSymbol(buffer, offset, len, hash);
    }

    public String addSymbol(char[] buffer, int offset, int len, int hash) {
        int bucket = hash & this.indexMask;
        String symbol = this.symbols[bucket];
        if (symbol != null) {
            boolean eq = true;
            if (hash == symbol.hashCode() && len == symbol.length()) {
                int i = 0;
                while (true) {
                    if (i >= len) {
                        break;
                    }
                    if (buffer[offset + i] == symbol.charAt(i)) {
                        i++;
                    } else {
                        eq = false;
                        break;
                    }
                }
            } else {
                eq = false;
            }
            if (eq) {
                return symbol;
            }
            return new String(buffer, offset, len);
        }
        String symbol2 = new String(buffer, offset, len).intern();
        this.symbols[bucket] = symbol2;
        return symbol2;
    }

    public String addSymbol(String buffer, int offset, int len, int hash) {
        int bucket = hash & this.indexMask;
        String symbol = this.symbols[bucket];
        if (symbol != null) {
            if (hash == symbol.hashCode() && len == symbol.length() && buffer.startsWith(symbol, offset)) {
                return symbol;
            }
            return subString(buffer, offset, len);
        }
        String symbol2 = (len == buffer.length() ? buffer : subString(buffer, offset, len)).intern();
        this.symbols[bucket] = symbol2;
        return symbol2;
    }

    private static String subString(String src, int offset, int len) {
        char[] chars = new char[len];
        src.getChars(offset, offset + len, chars, 0);
        return new String(chars);
    }

    public static int hash(char[] buffer, int offset, int len) {
        int h = 0;
        int off = offset;
        for (int i = 0; i < len; i++) {
            int i2 = off;
            off++;
            h = (31 * h) + buffer[i2];
        }
        return h;
    }
}
