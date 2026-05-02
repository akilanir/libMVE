package ch.qos.logback.core.joran.spi;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/spi/HostClassAndPropertyDouble.class */
public class HostClassAndPropertyDouble {
    final Class<?> hostClass;
    final String propertyName;

    public HostClassAndPropertyDouble(Class<?> cls, String str) {
        this.hostClass = cls;
        this.propertyName = str;
    }

    public Class<?> getHostClass() {
        return this.hostClass;
    }

    public String getPropertyName() {
        return this.propertyName;
    }

    public int hashCode() {
        return (31 * ((31 * 1) + (this.hostClass == null ? 0 : this.hostClass.hashCode()))) + (this.propertyName == null ? 0 : this.propertyName.hashCode());
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        HostClassAndPropertyDouble hostClassAndPropertyDouble = (HostClassAndPropertyDouble) obj;
        if (this.hostClass == null) {
            if (hostClassAndPropertyDouble.hostClass != null) {
                return false;
            }
        } else if (!this.hostClass.equals(hostClassAndPropertyDouble.hostClass)) {
            return false;
        }
        return this.propertyName == null ? hostClassAndPropertyDouble.propertyName == null : this.propertyName.equals(hostClassAndPropertyDouble.propertyName);
    }
}
