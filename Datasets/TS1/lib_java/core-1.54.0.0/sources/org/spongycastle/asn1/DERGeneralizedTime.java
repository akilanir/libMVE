package org.spongycastle.asn1;

import java.util.Date;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/DERGeneralizedTime.class */
public class DERGeneralizedTime extends ASN1GeneralizedTime {
    DERGeneralizedTime(byte[] bytes) {
        super(bytes);
    }

    public DERGeneralizedTime(Date time) {
        super(time);
    }

    public DERGeneralizedTime(String time) {
        super(time);
    }
}
