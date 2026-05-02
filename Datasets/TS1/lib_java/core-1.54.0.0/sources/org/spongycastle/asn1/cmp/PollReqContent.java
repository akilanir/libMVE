package org.spongycastle.asn1.cmp;

import org.spongycastle.asn1.ASN1Integer;
import org.spongycastle.asn1.ASN1Object;
import org.spongycastle.asn1.ASN1Primitive;
import org.spongycastle.asn1.ASN1Sequence;
import org.spongycastle.asn1.DERSequence;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/cmp/PollReqContent.class */
public class PollReqContent extends ASN1Object {
    private ASN1Sequence content;

    private PollReqContent(ASN1Sequence seq) {
        this.content = seq;
    }

    public static PollReqContent getInstance(Object o) {
        if (o instanceof PollReqContent) {
            return (PollReqContent) o;
        }
        if (o != null) {
            return new PollReqContent(ASN1Sequence.getInstance(o));
        }
        return null;
    }

    public PollReqContent(ASN1Integer certReqId) {
        this(new DERSequence(new DERSequence(certReqId)));
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [org.spongycastle.asn1.ASN1Integer[], org.spongycastle.asn1.ASN1Integer[][]] */
    public ASN1Integer[][] getCertReqIds() {
        ?? r0 = new ASN1Integer[this.content.size()];
        for (int i = 0; i != r0.length; i++) {
            r0[i] = sequenceToASN1IntegerArray((ASN1Sequence) this.content.getObjectAt(i));
        }
        return r0;
    }

    private static ASN1Integer[] sequenceToASN1IntegerArray(ASN1Sequence seq) {
        ASN1Integer[] result = new ASN1Integer[seq.size()];
        for (int i = 0; i != result.length; i++) {
            result[i] = ASN1Integer.getInstance(seq.getObjectAt(i));
        }
        return result;
    }

    @Override // org.spongycastle.asn1.ASN1Object, org.spongycastle.asn1.ASN1Encodable
    public ASN1Primitive toASN1Primitive() {
        return this.content;
    }
}
