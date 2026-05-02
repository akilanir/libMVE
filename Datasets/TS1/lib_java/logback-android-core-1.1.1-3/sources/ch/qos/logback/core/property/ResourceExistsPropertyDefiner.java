package ch.qos.logback.core.property;

import ch.qos.logback.core.PropertyDefinerBase;
import ch.qos.logback.core.util.Loader;
import ch.qos.logback.core.util.OptionHelper;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/property/ResourceExistsPropertyDefiner.class */
public class ResourceExistsPropertyDefiner extends PropertyDefinerBase {
    String resourceStr;

    public String getResource() {
        return this.resourceStr;
    }

    public void setResource(String str) {
        this.resourceStr = str;
    }

    @Override // ch.qos.logback.core.spi.PropertyDefiner
    public String getPropertyValue() {
        if (!OptionHelper.isEmpty(this.resourceStr)) {
            return booleanAsStr(Loader.getResourceBySelfClassLoader(this.resourceStr) != null);
        }
        addError("The \"resource\" property must be set.");
        return null;
    }
}
