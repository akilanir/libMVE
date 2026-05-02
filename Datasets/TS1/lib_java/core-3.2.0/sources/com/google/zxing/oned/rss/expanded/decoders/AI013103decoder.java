package com.google.zxing.oned.rss.expanded.decoders;

import com.google.zxing.common.BitArray;

/* loaded from: core-3.2.0.jar:com/google/zxing/oned/rss/expanded/decoders/AI013103decoder.class */
final class AI013103decoder extends AI013x0xDecoder {
    AI013103decoder(BitArray information) {
        super(information);
    }

    @Override // com.google.zxing.oned.rss.expanded.decoders.AI01weightDecoder
    protected void addWeightCode(StringBuilder buf, int weight) {
        buf.append("(3103)");
    }

    @Override // com.google.zxing.oned.rss.expanded.decoders.AI01weightDecoder
    protected int checkWeight(int weight) {
        return weight;
    }
}
