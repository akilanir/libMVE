package org.spongycastle.asn1;

import java.util.Date;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/DERUTCTime.class */
public class DERUTCTime extends ASN1UTCTime {
    DERUTCTime(byte[] bytes) {
        super(bytes);
    }

    public DERUTCTime(Date time) {
        super(time);
    }

    public DERUTCTime(String time) {
        super(time);
    }
}
