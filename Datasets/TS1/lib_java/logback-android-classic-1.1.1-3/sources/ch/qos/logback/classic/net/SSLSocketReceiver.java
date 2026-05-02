package ch.qos.logback.classic.net;

import ch.qos.logback.core.net.ssl.ConfigurableSSLSocketFactory;
import ch.qos.logback.core.net.ssl.SSLComponent;
import ch.qos.logback.core.net.ssl.SSLConfiguration;
import ch.qos.logback.core.net.ssl.SSLParametersConfiguration;
import javax.net.SocketFactory;
import javax.net.ssl.SSLContext;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/SSLSocketReceiver.class */
public class SSLSocketReceiver extends SocketReceiver implements SSLComponent {
    private SSLConfiguration ssl;
    private SocketFactory socketFactory;

    @Override // ch.qos.logback.classic.net.SocketReceiver
    protected SocketFactory getSocketFactory() {
        return this.socketFactory;
    }

    @Override // ch.qos.logback.classic.net.SocketReceiver, ch.qos.logback.classic.net.ReceiverBase
    protected boolean shouldStart() {
        try {
            SSLContext createContext = getSsl().createContext(this);
            SSLParametersConfiguration parameters = getSsl().getParameters();
            parameters.setContext(getContext());
            this.socketFactory = new ConfigurableSSLSocketFactory(parameters, createContext.getSocketFactory());
            return super.shouldStart();
        } catch (Exception e) {
            addError(e.getMessage(), e);
            return false;
        }
    }

    public SSLConfiguration getSsl() {
        if (this.ssl == null) {
            this.ssl = new SSLConfiguration();
        }
        return this.ssl;
    }

    public void setSsl(SSLConfiguration sSLConfiguration) {
        this.ssl = sSLConfiguration;
    }
}
