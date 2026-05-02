package cz.msebera.android.httpclient.conn.routing;

import cz.msebera.android.httpclient.HttpHost;
import java.net.InetAddress;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/routing/RouteInfo.class */
public interface RouteInfo {

    /* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/routing/RouteInfo$LayerType.class */
    public enum LayerType {
        PLAIN,
        LAYERED
    }

    /* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/routing/RouteInfo$TunnelType.class */
    public enum TunnelType {
        PLAIN,
        TUNNELLED
    }

    HttpHost getTargetHost();

    InetAddress getLocalAddress();

    int getHopCount();

    HttpHost getHopTarget(int i);

    HttpHost getProxyHost();

    TunnelType getTunnelType();

    boolean isTunnelled();

    LayerType getLayerType();

    boolean isLayered();

    boolean isSecure();
}
