package ch.qos.logback.classic.spi;

import java.io.Serializable;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/spi/ClassPackagingData.class */
public class ClassPackagingData implements Serializable {
    private static final long serialVersionUID = -804643281218337001L;
    final String codeLocation;
    final String version;
    private final boolean exact;

    public ClassPackagingData(String str, String str2) {
        this.codeLocation = str;
        this.version = str2;
        this.exact = true;
    }

    public ClassPackagingData(String str, String str2, boolean z) {
        this.codeLocation = str;
        this.version = str2;
        this.exact = z;
    }

    public String getCodeLocation() {
        return this.codeLocation;
    }

    public String getVersion() {
        return this.version;
    }

    public boolean isExact() {
        return this.exact;
    }

    public int hashCode() {
        return (31 * 1) + (this.codeLocation == null ? 0 : this.codeLocation.hashCode());
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        ClassPackagingData classPackagingData = (ClassPackagingData) obj;
        if (this.codeLocation == null) {
            if (classPackagingData.codeLocation != null) {
                return false;
            }
        } else if (!this.codeLocation.equals(classPackagingData.codeLocation)) {
            return false;
        }
        if (this.exact != classPackagingData.exact) {
            return false;
        }
        return this.version == null ? classPackagingData.version == null : this.version.equals(classPackagingData.version);
    }
}
