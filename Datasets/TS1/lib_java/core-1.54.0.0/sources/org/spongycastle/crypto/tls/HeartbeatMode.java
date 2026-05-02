package org.spongycastle.crypto.tls;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/HeartbeatMode.class */
public class HeartbeatMode {
    public static final short peer_allowed_to_send = 1;
    public static final short peer_not_allowed_to_send = 2;

    public static boolean isValid(short heartbeatMode) {
        return heartbeatMode >= 1 && heartbeatMode <= 2;
    }
}
