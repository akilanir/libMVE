package org.mozilla.universalchardet.prober;

import java.nio.ByteBuffer;
import org.mozilla.universalchardet.Constants;
import org.mozilla.universalchardet.prober.CharsetProber;
import org.mozilla.universalchardet.prober.statemachine.PkgInt;

/* loaded from: juniversalchardet-1.0.3.jar:org/mozilla/universalchardet/prober/Latin1Prober.class */
public class Latin1Prober extends CharsetProber {
    public static final byte UDF = 0;
    public static final byte OTH = 1;
    public static final byte ASC = 2;
    public static final byte ASS = 3;
    public static final byte ACV = 4;
    public static final byte ACO = 5;
    public static final byte ASV = 6;
    public static final byte ASO = 7;
    public static final int CLASS_NUM = 8;
    public static final int FREQ_CAT_NUM = 4;
    private CharsetProber.ProbingState state;
    private byte lastCharClass;
    private int[] freqCounter = new int[4];
    private static final byte[] latin1CharToClass = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 0, 1, 7, 1, 1, 1, 1, 1, 1, 5, 1, 5, 0, 5, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7, 1, 7, 0, 7, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 4, 4, 4, 4, 4, 1, 4, 4, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 6, 6, 7, 7, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 6, 6, 6, 6, 6, 1, 6, 6, 6, 6, 6, 7, 7, 7};
    private static final byte[] latin1ClassModel = {0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 0, 3, 3, 3, 3, 3, 3, 3, 0, 3, 3, 3, 1, 1, 3, 3, 0, 3, 3, 3, 1, 2, 1, 2, 0, 3, 3, 3, 3, 3, 3, 3, 0, 3, 1, 3, 1, 1, 1, 3, 0, 3, 1, 3, 1, 1, 3, 3};

    public Latin1Prober() {
        reset();
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public String getCharSetName() {
        return Constants.CHARSET_WINDOWS_1252;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public float getConfidence() {
        float confidence;
        if (this.state == CharsetProber.ProbingState.NOT_ME) {
            return 0.01f;
        }
        int total = 0;
        for (int i = 0; i < this.freqCounter.length; i++) {
            total += this.freqCounter[i];
        }
        if (total <= 0) {
            confidence = 0.0f;
        } else {
            float confidence2 = (this.freqCounter[3] * 1.0f) / total;
            confidence = confidence2 - ((this.freqCounter[1] * 20.0f) / total);
        }
        if (confidence < 0.0f) {
            confidence = 0.0f;
        }
        return confidence * 0.5f;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public CharsetProber.ProbingState getState() {
        return this.state;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public CharsetProber.ProbingState handleData(byte[] buf, int offset, int length) {
        ByteBuffer newBufTmp = filterWithEnglishLetters(buf, offset, length);
        byte[] newBuf = newBufTmp.array();
        int newBufLen = newBufTmp.position();
        int i = 0;
        while (true) {
            if (i >= newBufLen) {
                break;
            }
            int c = newBuf[i] & PkgInt.UNIT_MASK_8BITS;
            byte charClass = latin1CharToClass[c];
            byte freq = latin1ClassModel[(this.lastCharClass * 8) + charClass];
            if (freq == 0) {
                this.state = CharsetProber.ProbingState.NOT_ME;
                break;
            }
            int[] iArr = this.freqCounter;
            iArr[freq] = iArr[freq] + 1;
            this.lastCharClass = charClass;
            i++;
        }
        return this.state;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public void reset() {
        this.state = CharsetProber.ProbingState.DETECTING;
        this.lastCharClass = (byte) 1;
        for (int i = 0; i < this.freqCounter.length; i++) {
            this.freqCounter[i] = 0;
        }
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public void setOption() {
    }
}
