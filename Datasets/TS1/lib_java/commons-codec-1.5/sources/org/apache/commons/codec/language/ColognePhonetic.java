package org.apache.commons.codec.language;

import java.util.Locale;
import org.apache.commons.codec.EncoderException;
import org.apache.commons.codec.StringEncoder;

/* loaded from: commons-codec-1.5.jar:org/apache/commons/codec/language/ColognePhonetic.class */
public class ColognePhonetic implements StringEncoder {
    private static final char[][] PREPROCESS_MAP = {new char[]{196, 'A'}, new char[]{220, 'U'}, new char[]{214, 'O'}, new char[]{223, 'S'}};
    static Class class$java$lang$String;

    /* loaded from: commons-codec-1.5.jar:org/apache/commons/codec/language/ColognePhonetic$CologneBuffer.class */
    private abstract class CologneBuffer {
        protected final char[] data;
        protected int length;
        private final ColognePhonetic this$0;

        protected abstract char[] copyData(int i, int i2);

        public CologneBuffer(ColognePhonetic colognePhonetic, char[] data) {
            this.this$0 = colognePhonetic;
            this.length = 0;
            this.data = data;
            this.length = data.length;
        }

        public CologneBuffer(ColognePhonetic colognePhonetic, int buffSize) {
            this.this$0 = colognePhonetic;
            this.length = 0;
            this.data = new char[buffSize];
            this.length = 0;
        }

        public int length() {
            return this.length;
        }

        public String toString() {
            return new String(copyData(0, this.length));
        }
    }

    /* loaded from: commons-codec-1.5.jar:org/apache/commons/codec/language/ColognePhonetic$CologneOutputBuffer.class */
    private class CologneOutputBuffer extends CologneBuffer {
        private final ColognePhonetic this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public CologneOutputBuffer(ColognePhonetic colognePhonetic, int buffSize) {
            super(colognePhonetic, buffSize);
            this.this$0 = colognePhonetic;
        }

        public void addRight(char chr) {
            this.data[this.length] = chr;
            this.length++;
        }

        @Override // org.apache.commons.codec.language.ColognePhonetic.CologneBuffer
        protected char[] copyData(int start, int length) {
            char[] newData = new char[length];
            System.arraycopy(this.data, start, newData, 0, length);
            return newData;
        }
    }

    /* loaded from: commons-codec-1.5.jar:org/apache/commons/codec/language/ColognePhonetic$CologneInputBuffer.class */
    private class CologneInputBuffer extends CologneBuffer {
        private final ColognePhonetic this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public CologneInputBuffer(ColognePhonetic colognePhonetic, char[] data) {
            super(colognePhonetic, data);
            this.this$0 = colognePhonetic;
        }

        public void addLeft(char ch) {
            this.length++;
            this.data[getNextPos()] = ch;
        }

        @Override // org.apache.commons.codec.language.ColognePhonetic.CologneBuffer
        protected char[] copyData(int start, int length) {
            char[] newData = new char[length];
            System.arraycopy(this.data, (this.data.length - this.length) + start, newData, 0, length);
            return newData;
        }

        public char getNextChar() {
            return this.data[getNextPos()];
        }

        protected int getNextPos() {
            return this.data.length - this.length;
        }

        public char removeNext() {
            char ch = getNextChar();
            this.length--;
            return ch;
        }
    }

    private static boolean arrayContains(char[] arr, char key) {
        for (char c : arr) {
            if (c == key) {
                return true;
            }
        }
        return false;
    }

    public String colognePhonetic(String text) {
        char nextChar;
        char code;
        if (text == null) {
            return null;
        }
        String text2 = preprocess(text);
        CologneOutputBuffer output = new CologneOutputBuffer(this, text2.length() * 2);
        CologneInputBuffer input = new CologneInputBuffer(this, text2.toCharArray());
        char lastChar = '-';
        char lastCode = '/';
        int rightLength = input.length();
        while (rightLength > 0) {
            char chr = input.removeNext();
            int length = input.length();
            rightLength = length;
            if (length > 0) {
                nextChar = input.getNextChar();
            } else {
                nextChar = '-';
            }
            if (arrayContains(new char[]{'A', 'E', 'I', 'J', 'O', 'U', 'Y'}, chr)) {
                code = '0';
            } else if (chr == 'H' || chr < 'A' || chr > 'Z') {
                if (lastCode != '/') {
                    code = '-';
                }
            } else if (chr == 'B' || (chr == 'P' && nextChar != 'H')) {
                code = '1';
            } else if ((chr == 'D' || chr == 'T') && !arrayContains(new char[]{'S', 'C', 'Z'}, nextChar)) {
                code = '2';
            } else if (arrayContains(new char[]{'W', 'F', 'P', 'V'}, chr)) {
                code = '3';
            } else if (arrayContains(new char[]{'G', 'K', 'Q'}, chr)) {
                code = '4';
            } else if (chr == 'X' && !arrayContains(new char[]{'C', 'K', 'Q'}, lastChar)) {
                code = '4';
                input.addLeft('S');
                rightLength++;
            } else if (chr == 'S' || chr == 'Z') {
                code = '8';
            } else if (chr == 'C') {
                if (lastCode == '/') {
                    if (arrayContains(new char[]{'A', 'H', 'K', 'L', 'O', 'Q', 'R', 'U', 'X'}, nextChar)) {
                        code = '4';
                    } else {
                        code = '8';
                    }
                } else if (arrayContains(new char[]{'S', 'Z'}, lastChar) || !arrayContains(new char[]{'A', 'H', 'O', 'U', 'K', 'Q', 'X'}, nextChar)) {
                    code = '8';
                } else {
                    code = '4';
                }
            } else if (arrayContains(new char[]{'T', 'D', 'X'}, chr)) {
                code = '8';
            } else if (chr == 'R') {
                code = '7';
            } else if (chr == 'L') {
                code = '5';
            } else if (chr == 'M' || chr == 'N') {
                code = '6';
            } else {
                code = chr;
            }
            if (code != '-' && ((lastCode != code && (code != '0' || lastCode == '/')) || code < '0' || code > '8')) {
                output.addRight(code);
            }
            lastChar = chr;
            lastCode = code;
        }
        return output.toString();
    }

    @Override // org.apache.commons.codec.Encoder
    public Object encode(Object object) throws EncoderException {
        Class cls;
        if (!(object instanceof String)) {
            StringBuffer append = new StringBuffer().append("This method’s parameter was expected to be of the type ");
            if (class$java$lang$String == null) {
                cls = class$("java.lang.String");
                class$java$lang$String = cls;
            } else {
                cls = class$java$lang$String;
            }
            throw new EncoderException(append.append(cls.getName()).append(". But actually it was of the type ").append(object.getClass().getName()).append(".").toString());
        }
        return encode((String) object);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError().initCause(x1);
        }
    }

    @Override // org.apache.commons.codec.StringEncoder
    public String encode(String text) {
        return colognePhonetic(text);
    }

    public boolean isEncodeEqual(String text1, String text2) {
        return colognePhonetic(text1).equals(colognePhonetic(text2));
    }

    private String preprocess(String text) {
        char[] chrs = text.toUpperCase(Locale.GERMAN).toCharArray();
        for (int index = 0; index < chrs.length; index++) {
            if (chrs[index] > 'Z') {
                int replacement = 0;
                while (true) {
                    if (replacement >= PREPROCESS_MAP.length) {
                        break;
                    }
                    if (chrs[index] != PREPROCESS_MAP[replacement][0]) {
                        replacement++;
                    } else {
                        chrs[index] = PREPROCESS_MAP[replacement][1];
                        break;
                    }
                }
            }
        }
        return new String(chrs);
    }
}
