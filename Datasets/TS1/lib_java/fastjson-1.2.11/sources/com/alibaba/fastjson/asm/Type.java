package com.alibaba.fastjson.asm;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/asm/Type.class */
public class Type {
    public static final Type VOID_TYPE = new Type(0, null, 1443168256, 1);
    public static final Type BOOLEAN_TYPE = new Type(1, null, 1509950721, 1);
    public static final Type CHAR_TYPE = new Type(2, null, 1124075009, 1);
    public static final Type BYTE_TYPE = new Type(3, null, 1107297537, 1);
    public static final Type SHORT_TYPE = new Type(4, null, 1392510721, 1);
    public static final Type INT_TYPE = new Type(5, null, 1224736769, 1);
    public static final Type FLOAT_TYPE = new Type(6, null, 1174536705, 1);
    public static final Type LONG_TYPE = new Type(7, null, 1241579778, 1);
    public static final Type DOUBLE_TYPE = new Type(8, null, 1141048066, 1);
    protected final int sort;
    private final char[] buf;
    private final int off;
    private final int len;

    private Type(int sort, char[] buf, int off, int len) {
        this.sort = sort;
        this.buf = buf;
        this.off = off;
        this.len = len;
    }

    public static Type getType(String typeDescriptor) {
        return getType(typeDescriptor.toCharArray(), 0);
    }

    public static int getArgumentsAndReturnSizes(String desc) {
        int i;
        int n = 1;
        int c = 1;
        while (true) {
            int i2 = c;
            c++;
            char car = desc.charAt(i2);
            if (car == ')') {
                break;
            }
            if (car == 'L') {
                do {
                    i = c;
                    c++;
                } while (desc.charAt(i) != ';');
                n++;
            } else if (car == 'D' || car == 'J') {
                n += 2;
            } else {
                n++;
            }
        }
        char car2 = desc.charAt(c);
        return (n << 2) | (car2 == 'V' ? 0 : (car2 == 'D' || car2 == 'J') ? 2 : 1);
    }

    private static Type getType(char[] buf, int off) {
        switch (buf[off]) {
            case 'B':
                return BYTE_TYPE;
            case 'C':
                return CHAR_TYPE;
            case 'D':
                return DOUBLE_TYPE;
            case 'E':
            case 'G':
            case 'H':
            case 'K':
            case 'L':
            case 'M':
            case 'N':
            case 'O':
            case 'P':
            case 'Q':
            case 'R':
            case 'T':
            case 'U':
            case Opcodes.POP /* 87 */:
            case 'X':
            case Opcodes.DUP /* 89 */:
            default:
                int len = 1;
                while (buf[off + len] != ';') {
                    len++;
                }
                return new Type(10, buf, off + 1, len - 1);
            case 'F':
                return FLOAT_TYPE;
            case 'I':
                return INT_TYPE;
            case 'J':
                return LONG_TYPE;
            case 'S':
                return SHORT_TYPE;
            case 'V':
                return VOID_TYPE;
            case 'Z':
                return BOOLEAN_TYPE;
            case '[':
                int len2 = 1;
                while (buf[off + len2] == '[') {
                    len2++;
                }
                if (buf[off + len2] == 'L') {
                    do {
                        len2++;
                    } while (buf[off + len2] != ';');
                }
                return new Type(9, buf, off, len2 + 1);
        }
    }

    public String getInternalName() {
        return new String(this.buf, this.off, this.len);
    }

    String getDescriptor() {
        return new String(this.buf, this.off, this.len);
    }
}
