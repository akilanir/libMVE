package javax.jmdns.impl;

import java.net.InetAddress;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/NameRegister.class */
public interface NameRegister {

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/NameRegister$NameType.class */
    public enum NameType {
        HOST,
        SERVICE
    }

    void register(InetAddress inetAddress, String str, NameType nameType);

    boolean checkName(InetAddress inetAddress, String str, NameType nameType);

    String incrementHostName(InetAddress inetAddress, String str, NameType nameType);

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/NameRegister$UniqueNamePerInterface.class */
    public static class UniqueNamePerInterface implements NameRegister {
        @Override // javax.jmdns.impl.NameRegister
        public void register(InetAddress networkInterface, String name, NameType type) {
        }

        @Override // javax.jmdns.impl.NameRegister
        public boolean checkName(InetAddress networkInterface, String name, NameType type) {
            return false;
        }

        @Override // javax.jmdns.impl.NameRegister
        public String incrementHostName(InetAddress networkInterface, String name, NameType type) {
            return null;
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/NameRegister$UniqueNameAcrossInterface.class */
    public static class UniqueNameAcrossInterface implements NameRegister {
        @Override // javax.jmdns.impl.NameRegister
        public void register(InetAddress networkInterface, String name, NameType type) {
        }

        @Override // javax.jmdns.impl.NameRegister
        public boolean checkName(InetAddress networkInterface, String name, NameType type) {
            return false;
        }

        @Override // javax.jmdns.impl.NameRegister
        public String incrementHostName(InetAddress networkInterface, String name, NameType type) {
            return null;
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/NameRegister$Factory.class */
    public static class Factory {
        private static volatile NameRegister _register;

        public static void setRegistry(NameRegister register) throws IllegalStateException {
            if (_register != null) {
                throw new IllegalStateException("The register can only be set once.");
            }
            if (register != null) {
                _register = register;
            }
        }

        public static NameRegister getRegistry() {
            if (_register == null) {
                _register = new UniqueNamePerInterface();
            }
            return _register;
        }
    }
}
