package org.mozilla.universalchardet.prober;

import org.mozilla.universalchardet.prober.CharsetProber;

/* loaded from: juniversalchardet-1.0.3.jar:org/mozilla/universalchardet/prober/MBCSGroupProber.class */
public class MBCSGroupProber extends CharsetProber {
    private CharsetProber.ProbingState state;
    private CharsetProber[] probers = new CharsetProber[7];
    private boolean[] isActive = new boolean[7];
    private int bestGuess;
    private int activeNum;

    public MBCSGroupProber() {
        this.probers[0] = new UTF8Prober();
        this.probers[1] = new SJISProber();
        this.probers[2] = new EUCJPProber();
        this.probers[3] = new GB18030Prober();
        this.probers[4] = new EUCKRProber();
        this.probers[5] = new Big5Prober();
        this.probers[6] = new EUCTWProber();
        reset();
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public String getCharSetName() {
        if (this.bestGuess == -1) {
            getConfidence();
            if (this.bestGuess == -1) {
                this.bestGuess = 0;
            }
        }
        return this.probers[this.bestGuess].getCharSetName();
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public float getConfidence() {
        float bestConf = 0.0f;
        if (this.state == CharsetProber.ProbingState.FOUND_IT) {
            return 0.99f;
        }
        if (this.state == CharsetProber.ProbingState.NOT_ME) {
            return 0.01f;
        }
        for (int i = 0; i < this.probers.length; i++) {
            if (this.isActive[i]) {
                float cf = this.probers[i].getConfidence();
                if (bestConf < cf) {
                    bestConf = cf;
                    this.bestGuess = i;
                }
            }
        }
        return bestConf;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public CharsetProber.ProbingState getState() {
        return this.state;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public CharsetProber.ProbingState handleData(byte[] buf, int offset, int length) {
        boolean keepNext = true;
        byte[] highbyteBuf = new byte[length];
        int highpos = 0;
        int maxPos = offset + length;
        for (int i = offset; i < maxPos; i++) {
            if ((buf[i] & 128) != 0) {
                int i2 = highpos;
                highpos++;
                highbyteBuf[i2] = buf[i];
                keepNext = true;
            } else if (keepNext) {
                int i3 = highpos;
                highpos++;
                highbyteBuf[i3] = buf[i];
                keepNext = false;
            }
        }
        int i4 = 0;
        while (true) {
            if (i4 >= this.probers.length) {
                break;
            }
            if (this.isActive[i4]) {
                CharsetProber.ProbingState st = this.probers[i4].handleData(highbyteBuf, 0, highpos);
                if (st == CharsetProber.ProbingState.FOUND_IT) {
                    this.bestGuess = i4;
                    this.state = CharsetProber.ProbingState.FOUND_IT;
                    break;
                }
                if (st == CharsetProber.ProbingState.NOT_ME) {
                    this.isActive[i4] = false;
                    this.activeNum--;
                    if (this.activeNum <= 0) {
                        this.state = CharsetProber.ProbingState.NOT_ME;
                        break;
                    }
                } else {
                    continue;
                }
            }
            i4++;
        }
        return this.state;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public void reset() {
        this.activeNum = 0;
        for (int i = 0; i < this.probers.length; i++) {
            this.probers[i].reset();
            this.isActive[i] = true;
            this.activeNum++;
        }
        this.bestGuess = -1;
        this.state = CharsetProber.ProbingState.DETECTING;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public void setOption() {
    }
}
