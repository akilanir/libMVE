package ch.qos.logback.classic.net.server;

import ch.qos.logback.core.net.ssl.ConfigurableSSLServerSocketFactory;
import ch.qos.logback.core.net.ssl.SSLComponent;
import ch.qos.logback.core.net.ssl.SSLConfiguration;
import ch.qos.logback.core.net.ssl.SSLParametersConfiguration;
import javax.net.ServerSocketFactory;
import javax.net.ssl.SSLContext;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/server/SSLServerSocketReceiver.class */
public class SSLServerSocketReceiver extends ServerSocketReceiver implements SSLComponent {
    private SSLConfiguration ssl;
    private ServerSocketFactory socketFactory;

    @Override // ch.qos.logback.classic.net.server.ServerSocketReceiver
    protected ServerSocketFactory getServerSocketFactory() throws Exception {
        if (this.socketFactory == null) {
            SSLContext createContext = getSsl().createContext(this);
            SSLParametersConfiguration parameters = getSsl().getParameters();
            parameters.setContext(getContext());
            this.socketFactory = new ConfigurableSSLServerSocketFactory(parameters, createContext.getServerSocketFactory());
        }
        return this.socketFactory;
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
