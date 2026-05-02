package org.spongycastle.jce;

import java.security.spec.ECFieldF2m;
import java.security.spec.ECFieldFp;
import java.security.spec.ECPoint;
import java.security.spec.EllipticCurve;
import org.spongycastle.math.ec.ECCurve;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/ECPointUtil.class */
public class ECPointUtil {
    public static ECPoint decodePoint(EllipticCurve curve, byte[] encoded) {
        ECCurve.Fp f2m;
        if (curve.getField() instanceof ECFieldFp) {
            f2m = new ECCurve.Fp(((ECFieldFp) curve.getField()).getP(), curve.getA(), curve.getB());
        } else {
            int[] k = ((ECFieldF2m) curve.getField()).getMidTermsOfReductionPolynomial();
            if (k.length == 3) {
                f2m = new ECCurve.F2m(((ECFieldF2m) curve.getField()).getM(), k[2], k[1], k[0], curve.getA(), curve.getB());
            } else {
                f2m = new ECCurve.F2m(((ECFieldF2m) curve.getField()).getM(), k[0], curve.getA(), curve.getB());
            }
        }
        org.spongycastle.math.ec.ECPoint p = f2m.decodePoint(encoded);
        return new ECPoint(p.getAffineXCoord().toBigInteger(), p.getAffineYCoord().toBigInteger());
    }
}
