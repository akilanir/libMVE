package com.sun.mail.iap;

import com.sun.mail.util.ASCIIUtility;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Vector;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/iap/Response.class */
public class Response {
    protected int index;
    protected int pindex;
    protected int size;
    protected byte[] buffer;
    protected int type;
    protected String tag;
    private static final int increment = 100;
    public static final int TAG_MASK = 3;
    public static final int CONTINUATION = 1;
    public static final int TAGGED = 2;
    public static final int UNTAGGED = 3;
    public static final int TYPE_MASK = 28;
    public static final int OK = 4;
    public static final int NO = 8;
    public static final int BAD = 12;
    public static final int BYE = 16;
    public static final int SYNTHETIC = 32;
    private static String ATOM_CHAR_DELIM = " (){%*\"\\]";
    private static String ASTRING_CHAR_DELIM = " (){%*\"\\";

    public Response(String s) {
        this.buffer = null;
        this.type = 0;
        this.tag = null;
        this.buffer = ASCIIUtility.getBytes(s);
        this.size = this.buffer.length;
        parse();
    }

    public Response(Protocol p) throws IOException, ProtocolException {
        this.buffer = null;
        this.type = 0;
        this.tag = null;
        ByteArray ba = p.getResponseBuffer();
        ByteArray response = p.getInputStream().readResponse(ba);
        this.buffer = response.getBytes();
        this.size = response.getCount() - 2;
        parse();
    }

    public Response(Response r) {
        this.buffer = null;
        this.type = 0;
        this.tag = null;
        this.index = r.index;
        this.size = r.size;
        this.buffer = r.buffer;
        this.type = r.type;
        this.tag = r.tag;
    }

    public static Response byeResponse(Exception ex) {
        String err = "* BYE JavaMail Exception: " + ex.toString();
        Response r = new Response(err.replace('\r', ' ').replace('\n', ' '));
        r.type |= 32;
        return r;
    }

    private void parse() {
        this.index = 0;
        if (this.size == 0) {
            return;
        }
        if (this.buffer[this.index] == 43) {
            this.type |= 1;
            this.index++;
            return;
        }
        if (this.buffer[this.index] == 42) {
            this.type |= 3;
            this.index++;
        } else {
            this.type |= 2;
            this.tag = readAtom();
            if (this.tag == null) {
                this.tag = "";
            }
        }
        int mark = this.index;
        String s = readAtom();
        if (s == null) {
            s = "";
        }
        if (s.equalsIgnoreCase("OK")) {
            this.type |= 4;
        } else if (s.equalsIgnoreCase("NO")) {
            this.type |= 8;
        } else if (s.equalsIgnoreCase("BAD")) {
            this.type |= 12;
        } else if (s.equalsIgnoreCase("BYE")) {
            this.type |= 16;
        } else {
            this.index = mark;
        }
        this.pindex = this.index;
    }

    public void skipSpaces() {
        while (this.index < this.size && this.buffer[this.index] == 32) {
            this.index++;
        }
    }

    public void skipToken() {
        while (this.index < this.size && this.buffer[this.index] != 32) {
            this.index++;
        }
    }

    public void skip(int count) {
        this.index += count;
    }

    public byte peekByte() {
        if (this.index < this.size) {
            return this.buffer[this.index];
        }
        return (byte) 0;
    }

    public byte readByte() {
        if (this.index < this.size) {
            byte[] bArr = this.buffer;
            int i = this.index;
            this.index = i + 1;
            return bArr[i];
        }
        return (byte) 0;
    }

    public String readAtom() {
        return readDelimString(ATOM_CHAR_DELIM);
    }

    private String readDelimString(String delim) {
        byte b;
        skipSpaces();
        if (this.index >= this.size) {
            return null;
        }
        int start = this.index;
        while (this.index < this.size && (b = this.buffer[this.index]) > 32 && delim.indexOf((char) b) < 0 && b >= 32 && b != Byte.MAX_VALUE) {
            this.index++;
        }
        return ASCIIUtility.toString(this.buffer, start, this.index);
    }

    public String readString(char delim) {
        skipSpaces();
        if (this.index >= this.size) {
            return null;
        }
        int start = this.index;
        while (this.index < this.size && this.buffer[this.index] != delim) {
            this.index++;
        }
        return ASCIIUtility.toString(this.buffer, start, this.index);
    }

    public String[] readStringList() {
        return readStringList(false);
    }

    public String[] readAtomStringList() {
        return readStringList(true);
    }

    private String[] readStringList(boolean atom) {
        byte[] bArr;
        int i;
        skipSpaces();
        if (this.buffer[this.index] != 40) {
            return null;
        }
        this.index++;
        Vector v = new Vector();
        do {
            v.addElement(atom ? readAtomString() : readString());
            bArr = this.buffer;
            i = this.index;
            this.index = i + 1;
        } while (bArr[i] != 41);
        int size = v.size();
        if (size > 0) {
            String[] s = new String[size];
            v.copyInto(s);
            return s;
        }
        return null;
    }

    public int readNumber() {
        skipSpaces();
        int start = this.index;
        while (this.index < this.size && Character.isDigit((char) this.buffer[this.index])) {
            this.index++;
        }
        if (this.index > start) {
            try {
                return ASCIIUtility.parseInt(this.buffer, start, this.index);
            } catch (NumberFormatException e) {
                return -1;
            }
        }
        return -1;
    }

    public long readLong() {
        skipSpaces();
        int start = this.index;
        while (this.index < this.size && Character.isDigit((char) this.buffer[this.index])) {
            this.index++;
        }
        if (this.index > start) {
            try {
                return ASCIIUtility.parseLong(this.buffer, start, this.index);
            } catch (NumberFormatException e) {
                return -1L;
            }
        }
        return -1L;
    }

    public String readString() {
        return (String) parseString(false, true);
    }

    public ByteArrayInputStream readBytes() {
        ByteArray ba = readByteArray();
        if (ba != null) {
            return ba.toByteArrayInputStream();
        }
        return null;
    }

    public ByteArray readByteArray() {
        if (isContinuation()) {
            skipSpaces();
            return new ByteArray(this.buffer, this.index, this.size - this.index);
        }
        return (ByteArray) parseString(false, false);
    }

    public String readAtomString() {
        return (String) parseString(true, true);
    }

    private Object parseString(boolean parseAtoms, boolean returnString) {
        byte b;
        skipSpaces();
        byte b2 = this.buffer[this.index];
        if (b2 == 34) {
            this.index++;
            int start = this.index;
            int copyto = this.index;
            while (this.index < this.size && (b = this.buffer[this.index]) != 34) {
                if (b == 92) {
                    this.index++;
                }
                if (this.index != copyto) {
                    this.buffer[copyto] = this.buffer[this.index];
                }
                copyto++;
                this.index++;
            }
            if (this.index >= this.size) {
                return null;
            }
            this.index++;
            if (returnString) {
                return ASCIIUtility.toString(this.buffer, start, copyto);
            }
            return new ByteArray(this.buffer, start, copyto - start);
        }
        if (b2 == 123) {
            int start2 = this.index + 1;
            this.index = start2;
            while (this.buffer[this.index] != 125) {
                this.index++;
            }
            try {
                int count = ASCIIUtility.parseInt(this.buffer, start2, this.index);
                int start3 = this.index + 3;
                this.index = start3 + count;
                if (returnString) {
                    return ASCIIUtility.toString(this.buffer, start3, start3 + count);
                }
                return new ByteArray(this.buffer, start3, count);
            } catch (NumberFormatException e) {
                return null;
            }
        }
        if (parseAtoms) {
            int start4 = this.index;
            String s = readDelimString(ASTRING_CHAR_DELIM);
            if (returnString) {
                return s;
            }
            return new ByteArray(this.buffer, start4, this.index);
        }
        if (b2 == 78 || b2 == 110) {
            this.index += 3;
            return null;
        }
        return null;
    }

    public int getType() {
        return this.type;
    }

    public boolean isContinuation() {
        return (this.type & 3) == 1;
    }

    public boolean isTagged() {
        return (this.type & 3) == 2;
    }

    public boolean isUnTagged() {
        return (this.type & 3) == 3;
    }

    public boolean isOK() {
        return (this.type & 28) == 4;
    }

    public boolean isNO() {
        return (this.type & 28) == 8;
    }

    public boolean isBAD() {
        return (this.type & 28) == 12;
    }

    public boolean isBYE() {
        return (this.type & 28) == 16;
    }

    public boolean isSynthetic() {
        return (this.type & 32) == 32;
    }

    public String getTag() {
        return this.tag;
    }

    public String getRest() {
        skipSpaces();
        return ASCIIUtility.toString(this.buffer, this.index, this.size);
    }

    public void reset() {
        this.index = this.pindex;
    }

    public String toString() {
        return ASCIIUtility.toString(this.buffer, 0, this.size);
    }
}
