package org.spongycastle.math.ec.endo;

import org.spongycastle.math.ec.ECPointMap;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/math/ec/endo/ECEndomorphism.class */
public interface ECEndomorphism {
    ECPointMap getPointMap();

    boolean hasEfficientPointMap();
}
