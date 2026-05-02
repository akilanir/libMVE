package ch.qos.logback.core.net.ssl;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/ssl/SSLConfigurable.class */
public interface SSLConfigurable {
    String[] getDefaultProtocols();

    String[] getSupportedProtocols();

    void setEnabledProtocols(String[] strArr);

    String[] getDefaultCipherSuites();

    String[] getSupportedCipherSuites();

    void setEnabledCipherSuites(String[] strArr);

    void setNeedClientAuth(boolean z);

    void setWantClientAuth(boolean z);
}
