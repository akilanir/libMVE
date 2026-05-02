package ch.qos.logback.core.property;

import ch.qos.logback.core.PropertyDefinerBase;
import ch.qos.logback.core.util.OptionHelper;
import java.io.File;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/property/FileExistsPropertyDefiner.class */
public class FileExistsPropertyDefiner extends PropertyDefinerBase {
    String path;

    public String getPath() {
        return this.path;
    }

    public void setPath(String str) {
        this.path = str;
    }

    @Override // ch.qos.logback.core.spi.PropertyDefiner
    public String getPropertyValue() {
        if (!OptionHelper.isEmpty(this.path)) {
            return booleanAsStr(new File(this.path).exists());
        }
        addError("The \"path\" property must be set.");
        return null;
    }
}
