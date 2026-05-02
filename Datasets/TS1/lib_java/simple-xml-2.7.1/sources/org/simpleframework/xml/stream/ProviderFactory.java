package org.simpleframework.xml.stream;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/ProviderFactory.class */
final class ProviderFactory {
    ProviderFactory() {
    }

    public static Provider getInstance() {
        try {
            try {
                return new StreamProvider();
            } catch (Throwable th) {
                return new PullProvider();
            }
        } catch (Throwable th2) {
            return new DocumentProvider();
        }
    }
}
