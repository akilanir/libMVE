package org.mozilla.universalchardet.prober;

import java.util.Arrays;
import org.mozilla.universalchardet.Constants;
import org.mozilla.universalchardet.prober.CharsetProber;
import org.mozilla.universalchardet.prober.distributionanalysis.Big5DistributionAnalysis;
import org.mozilla.universalchardet.prober.statemachine.Big5SMModel;
import org.mozilla.universalchardet.prober.statemachine.CodingStateMachine;
import org.mozilla.universalchardet.prober.statemachine.SMModel;

/* loaded from: juniversalchardet-1.0.3.jar:org/mozilla/universalchardet/prober/Big5Prober.class */
public class Big5Prober extends CharsetProber {
    private CharsetProber.ProbingState state;
    private static final SMModel smModel = new Big5SMModel();
    private CodingStateMachine codingSM = new CodingStateMachine(smModel);
    private Big5DistributionAnalysis distributionAnalyzer = new Big5DistributionAnalysis();
    private byte[] lastChar = new byte[2];

    public Big5Prober() {
        reset();
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public String getCharSetName() {
        return Constants.CHARSET_BIG5;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public float getConfidence() {
        float distribCf = this.distributionAnalyzer.getConfidence();
        return distribCf;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public CharsetProber.ProbingState getState() {
        return this.state;
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
            if (codingState == 0) {
                int charLen = this.codingSM.getCurrentCharLen();
                if (i == offset) {
                    this.lastChar[1] = buf[offset];
                    this.distributionAnalyzer.handleOneChar(this.lastChar, 0, charLen);
                } else {
                    this.distributionAnalyzer.handleOneChar(buf, i - 1, charLen);
                }
            }
            i++;
        }
        this.lastChar[0] = buf[maxPos - 1];
        if (this.state == CharsetProber.ProbingState.DETECTING && this.distributionAnalyzer.gotEnoughData() && getConfidence() > 0.95f) {
            this.state = CharsetProber.ProbingState.FOUND_IT;
        }
        return this.state;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public void reset() {
        this.codingSM.reset();
        this.state = CharsetProber.ProbingState.DETECTING;
        this.distributionAnalyzer.reset();
        Arrays.fill(this.lastChar, (byte) 0);
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public void setOption() {
    }
}
