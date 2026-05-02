package org.spongycastle.asn1.smime;

import org.spongycastle.asn1.DERSequence;
import org.spongycastle.asn1.DERSet;
import org.spongycastle.asn1.cms.Attribute;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/smime/SMIMECapabilitiesAttribute.class */
public class SMIMECapabilitiesAttribute extends Attribute {
    public SMIMECapabilitiesAttribute(SMIMECapabilityVector capabilities) {
        super(SMIMEAttributes.smimeCapabilities, new DERSet(new DERSequence(capabilities.toASN1EncodableVector())));
    }
}
