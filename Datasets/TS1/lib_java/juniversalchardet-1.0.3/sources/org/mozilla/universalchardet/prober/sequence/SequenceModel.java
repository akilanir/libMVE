package org.mozilla.universalchardet.prober.sequence;

import org.mozilla.universalchardet.prober.statemachine.PkgInt;

/* loaded from: juniversalchardet-1.0.3.jar:org/mozilla/universalchardet/prober/sequence/SequenceModel.class */
public abstract class SequenceModel {
    protected short[] charToOrderMap;
    protected byte[] precedenceMatrix;
    protected float typicalPositiveRatio;
    protected boolean keepEnglishLetter;
    protected String charsetName;

    public SequenceModel(short[] charToOrderMap, byte[] precedenceMatrix, float typicalPositiveRatio, boolean keepEnglishLetter, String charsetName) {
        this.charToOrderMap = charToOrderMap;
        this.precedenceMatrix = precedenceMatrix;
        this.typicalPositiveRatio = typicalPositiveRatio;
        this.keepEnglishLetter = keepEnglishLetter;
        this.charsetName = charsetName;
    }

    public short getOrder(byte b) {
        int c = b & PkgInt.UNIT_MASK_8BITS;
        return this.charToOrderMap[c];
    }

    public byte getPrecedence(int pos) {
        return this.precedenceMatrix[pos];
    }

    public float getTypicalPositiveRatio() {
        return this.typicalPositiveRatio;
    }

    public boolean getKeepEnglishLetter() {
        return this.keepEnglishLetter;
    }

    public String getCharsetName() {
        return this.charsetName;
    }
}
