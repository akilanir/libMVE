package org.mozilla.universalchardet.prober.statemachine;

/* loaded from: juniversalchardet-1.0.3.jar:org/mozilla/universalchardet/prober/statemachine/CodingStateMachine.class */
public class CodingStateMachine {
    protected SMModel model;
    protected int currentState = 0;
    protected int currentCharLen;
    protected int currentBytePos;

    public CodingStateMachine(SMModel model) {
        this.model = model;
    }

    public int nextState(byte c) {
        int byteCls = this.model.getClass(c);
        if (this.currentState == 0) {
            this.currentBytePos = 0;
            this.currentCharLen = this.model.getCharLen(byteCls);
        }
        this.currentState = this.model.getNextState(byteCls, this.currentState);
        this.currentBytePos++;
        return this.currentState;
    }

    public int getCurrentCharLen() {
        return this.currentCharLen;
    }

    public void reset() {
        this.currentState = 0;
    }

    public String getCodingStateMachine() {
        return this.model.getName();
    }
}
