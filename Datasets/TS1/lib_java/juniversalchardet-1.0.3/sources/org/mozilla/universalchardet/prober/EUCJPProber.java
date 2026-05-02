package org.mozilla.universalchardet.prober;

import java.util.Arrays;
import org.mozilla.universalchardet.Constants;
import org.mozilla.universalchardet.prober.CharsetProber;
import org.mozilla.universalchardet.prober.contextanalysis.EUCJPContextAnalysis;
import org.mozilla.universalchardet.prober.distributionanalysis.EUCJPDistributionAnalysis;
import org.mozilla.universalchardet.prober.statemachine.CodingStateMachine;
import org.mozilla.universalchardet.prober.statemachine.EUCJPSMModel;
import org.mozilla.universalchardet.prober.statemachine.SMModel;

/* loaded from: juniversalchardet-1.0.3.jar:org/mozilla/universalchardet/prober/EUCJPProber.class */
public class EUCJPProber extends CharsetProber {
    private CharsetProber.ProbingState state;
    private static final SMModel smModel = new EUCJPSMModel();
    private CodingStateMachine codingSM = new CodingStateMachine(smModel);
    private EUCJPContextAnalysis contextAnalyzer = new EUCJPContextAnalysis();
    private EUCJPDistributionAnalysis distributionAnalyzer = new EUCJPDistributionAnalysis();
    private byte[] lastChar = new byte[2];

    public EUCJPProber() {
        reset();
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public String getCharSetName() {
        return Constants.CHARSET_EUC_JP;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public float getConfidence() {
        float contextCf = this.contextAnalyzer.getConfidence();
        float distribCf = this.distributionAnalyzer.getConfidence();
        return Math.max(contextCf, distribCf);
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
                    this.contextAnalyzer.handleOneChar(this.lastChar, 0, charLen);
                    this.distributionAnalyzer.handleOneChar(this.lastChar, 0, charLen);
                } else {
                    this.contextAnalyzer.handleOneChar(buf, i - 1, charLen);
                    this.distributionAnalyzer.handleOneChar(buf, i - 1, charLen);
                }
            }
            i++;
        }
        this.lastChar[0] = buf[maxPos - 1];
        if (this.state == CharsetProber.ProbingState.DETECTING && this.contextAnalyzer.gotEnoughData() && getConfidence() > 0.95f) {
            this.state = CharsetProber.ProbingState.FOUND_IT;
        }
        return this.state;
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public void reset() {
        this.codingSM.reset();
        this.state = CharsetProber.ProbingState.DETECTING;
        this.contextAnalyzer.reset();
        this.distributionAnalyzer.reset();
        Arrays.fill(this.lastChar, (byte) 0);
    }

    @Override // org.mozilla.universalchardet.prober.CharsetProber
    public void setOption() {
    }
}
