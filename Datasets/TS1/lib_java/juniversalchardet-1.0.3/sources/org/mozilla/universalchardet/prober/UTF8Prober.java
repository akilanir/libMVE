package org.mozilla.universalchardet.prober;

import org.mozilla.universalchardet.Constants;
import org.mozilla.universalchardet.prober.CharsetProber;
import org.mozilla.universalchardet.prober.statemachine.CodingStateMachine;
import org.mozilla.universalchardet.prober.statemachine.SMModel;
import org.mozilla.universalchardet.prober.statemachine.UTF8SMModel;

/* loaded from: juniversalchardet-1.0.3.jar:org/mozilla/universalchardet/prober/UTF8Prober.class */
public class UTF8Prober extends CharsetProber {
    public static final float ONE_CHAR_PROB = 0.5f;
    private CharsetProber.ProbingState state;
    private static final SMModel smModel = new UTF8SMModel();
    private int numOfMBChar = 0;
    private CodingStateMachine codingSM = new CodingStateMachine(smModel);

    public UTF8Prober() {
        reset();
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public String getCharSetName() {
        return Constants.CHARSET_UTF_8;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public CharsetProber.ProbingState handleData(byte[] buf, int offset, int length) {
        int maxPos = offset + length;
        int i = offset;
        while (true) {
            if (i >= maxPos) {
                break;
            }
            int codingState = this.codingSM.nextState(buf[i]);
            if (codingState == 1) {
                this.state = CharsetProber.ProbingState.NOT_ME;
                break;
            }
            if (codingState == 2) {
                this.state = CharsetProber.ProbingState.FOUND_IT;
                break;
            }
            if (codingState == 0 && this.codingSM.getCurrentCharLen() >= 2) {
                this.numOfMBChar++;
            }
            i++;
        }
        if (this.state == CharsetProber.ProbingState.DETECTING && getConfidence() > 0.95f) {
            this.state = CharsetProber.ProbingState.FOUND_IT;
        }
        return this.state;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public CharsetProber.ProbingState getState() {
        return this.state;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public void reset() {
        this.codingSM.reset();
        this.numOfMBChar = 0;
        this.state = CharsetProber.ProbingState.DETECTING;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public float getConfidence() {
        float unlike = 0.99f;
        if (this.numOfMBChar < 6) {
            for (int i = 0; i < this.numOfMBChar; i++) {
                unlike *= 0.5f;
            }
            return 1.0f - unlike;
        }
        return 0.99f;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public void setOption() {
    }
}
