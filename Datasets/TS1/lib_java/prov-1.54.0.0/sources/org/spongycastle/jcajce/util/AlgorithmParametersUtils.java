package org.spongycastle.jcajce.util;

import java.io.IOException;
import java.security.AlgorithmParameters;
import org.spongycastle.asn1.ASN1Encodable;
import org.spongycastle.asn1.ASN1Primitive;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/util/AlgorithmParametersUtils.class */
public class AlgorithmParametersUtils {
    private AlgorithmParametersUtils() {
    }

    public static ASN1Encodable extractParameters(AlgorithmParameters params) throws IOException {
        ASN1Primitive fromByteArray;
        try {
            fromByteArray = ASN1Primitive.fromByteArray(params.getEncoded("ASN.1"));
        } catch (Exception e) {
            fromByteArray = ASN1Primitive.fromByteArray(params.getEncoded());
        }
        return fromByteArray;
    }

    public static void loadParameters(AlgorithmParameters params, ASN1Encodable sParams) throws IOException {
        try {
            params.init(sParams.toASN1Primitive().getEncoded(), "ASN.1");
        } catch (Exception e) {
            params.init(sParams.toASN1Primitive().getEncoded());
        }
    }
}
