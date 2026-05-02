package ch.qos.logback.core.net.ssl;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/ssl/SSLConfiguration.class */
public class SSLConfiguration extends SSLContextFactoryBean {
    private SSLParametersConfiguration parameters;

    public SSLParametersConfiguration getParameters() {
        if (this.parameters == null) {
            this.parameters = new SSLParametersConfiguration();
        }
        return this.parameters;
    }

    public void setParameters(SSLParametersConfiguration sSLParametersConfiguration) {
        this.parameters = sSLParametersConfiguration;
    }
}
