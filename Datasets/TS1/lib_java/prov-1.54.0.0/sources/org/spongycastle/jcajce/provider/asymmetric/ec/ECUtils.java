package org.spongycastle.jcajce.provider.asymmetric.ec;

import java.security.spec.ECGenParameterSpec;
import org.spongycastle.asn1.ASN1ObjectIdentifier;
import org.spongycastle.asn1.x9.X9ECParameters;
import org.spongycastle.jcajce.provider.asymmetric.util.ECUtil;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/ECUtils.class */
class ECUtils {
    ECUtils() {
    }

    static X9ECParameters getDomainParametersFromGenSpec(ECGenParameterSpec genSpec) {
        return getDomainParametersFromName(genSpec.getName());
    }

    static X9ECParameters getDomainParametersFromName(String curveName) {
        X9ECParameters domainParameters;
        try {
            if (curveName.charAt(0) >= '0' && curveName.charAt(0) <= '2') {
                ASN1ObjectIdentifier oidID = new ASN1ObjectIdentifier(curveName);
                domainParameters = ECUtil.getNamedCurveByOid(oidID);
            } else if (curveName.indexOf(32) > 0) {
                domainParameters = ECUtil.getNamedCurveByName(curveName.substring(curveName.indexOf(32) + 1));
            } else {
                domainParameters = ECUtil.getNamedCurveByName(curveName);
            }
        } catch (IllegalArgumentException e) {
            domainParameters = ECUtil.getNamedCurveByName(curveName);
        }
        return domainParameters;
    }
}
