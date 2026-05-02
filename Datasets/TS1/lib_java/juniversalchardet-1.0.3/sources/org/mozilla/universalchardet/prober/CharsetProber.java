package org.mozilla.universalchardet.prober;

import java.nio.ByteBuffer;
import org.mozilla.universalchardet.prober.statemachine.PkgInt;

/* loaded from: juniversalchardet-1.0.3.jar:org/mozilla/universalchardet/prober/CharsetProber.class */
public abstract class CharsetProber {
    public static final float SHORTCUT_THRESHOLD = 0.95f;
    public static final int ASCII_A = 97;
    public static final int ASCII_Z = 122;
    public static final int ASCII_A_CAPITAL = 65;
    public static final int ASCII_Z_CAPITAL = 90;
    public static final int ASCII_LT = 60;
    public static final int ASCII_GT = 62;
    public static final int ASCII_SP = 32;

    /* loaded from: juniversalchardet-1.0.3.jar:org/mozilla/universalchardet/prober/CharsetProber$ProbingState.class */
    public enum ProbingState {
        DETECTING,
        FOUND_IT,
        NOT_ME
    }

    public abstract String getCharSetName();

    public abstract ProbingState handleData(byte[] bArr, int i, int i2);

    public abstract ProbingState getState();

    public abstract void reset();

    public abstract float getConfidence();

    public abstract void setOption();

    public ByteBuffer filterWithoutEnglishLetters(byte[] buf, int offset, int length) {
        ByteBuffer out = ByteBuffer.allocate(length);
        boolean meetMSB = false;
        int prevPtr = offset;
        int curPtr = offset;
        int maxPtr = offset + length;
        while (curPtr < maxPtr) {
            byte c = buf[curPtr];
            if (!isAscii(c)) {
                meetMSB = true;
            } else if (isAsciiSymbol(c)) {
                if (meetMSB && curPtr > prevPtr) {
                    out.put(buf, prevPtr, curPtr - prevPtr);
                    out.put((byte) 32);
                    prevPtr = curPtr + 1;
                    meetMSB = false;
                } else {
                    prevPtr = curPtr + 1;
                }
            }
            curPtr++;
        }
        if (meetMSB && curPtr > prevPtr) {
            out.put(buf, prevPtr, curPtr - prevPtr);
        }
        return out;
    }

    public ByteBuffer filterWithEnglishLetters(byte[] buf, int offset, int length) {
        ByteBuffer out = ByteBuffer.allocate(length);
        boolean isInTag = false;
        int prevPtr = offset;
        int curPtr = offset;
        int maxPtr = offset + length;
        while (curPtr < maxPtr) {
            byte c = buf[curPtr];
            if (c == 62) {
                isInTag = false;
            } else if (c == 60) {
                isInTag = true;
            }
            if (isAscii(c) && isAsciiSymbol(c)) {
                if (curPtr > prevPtr && !isInTag) {
                    out.put(buf, prevPtr, curPtr - prevPtr);
                    out.put((byte) 32);
                    prevPtr = curPtr + 1;
                } else {
                    prevPtr = curPtr + 1;
                }
            }
            curPtr++;
        }
        if (!isInTag && curPtr > prevPtr) {
            out.put(buf, prevPtr, curPtr - prevPtr);
        }
        return out;
    }

    private boolean isAscii(byte b) {
        return (b & 128) == 0;
    }

    private boolean isAsciiSymbol(byte b) {
        int c = b & PkgInt.UNIT_MASK_8BITS;
        return c < 65 || (c > 90 && c < 97) || c > 122;
    }
}
