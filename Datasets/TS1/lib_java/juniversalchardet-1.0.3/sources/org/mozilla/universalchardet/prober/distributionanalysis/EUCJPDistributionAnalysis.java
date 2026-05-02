package org.mozilla.universalchardet.prober.distributionanalysis;

/* loaded from: juniversalchardet-1.0.3.jar:org/mozilla/universalchardet/prober/distributionanalysis/EUCJPDistributionAnalysis.class */
public class EUCJPDistributionAnalysis extends JISDistributionAnalysis {
    public static final int HIGHBYTE_BEGIN = 161;
    public static final int HIGHBYTE_END = 254;
    public static final int LOWBYTE_BEGIN = 161;
    public static final int LOWBYTE_END = 254;

    @Override // org.mozilla.universalchardet.prober.distributionanalysis.CharDistributionAnalysis
    protected int getOrder(byte[] buf, int offset) {
        int highbyte = buf[offset] & 255;
        if (highbyte >= 161) {
            int lowbyte = buf[offset + 1] & 255;
            return ((94 * (highbyte - 161)) + lowbyte) - 161;
        }
        return -1;
    }
}
