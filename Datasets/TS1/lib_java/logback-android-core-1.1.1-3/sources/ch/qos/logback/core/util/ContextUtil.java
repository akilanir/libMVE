package ch.qos.logback.core.util;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.spi.ContextAwareBase;
import java.util.Properties;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/ContextUtil.class */
public class ContextUtil extends ContextAwareBase {
    public ContextUtil(Context context) {
        setContext(context);
    }

    public void addHostNameAsProperty() {
        this.context.putProperty(CoreConstants.HOSTNAME_KEY, "localhost");
    }

    public void addProperties(Properties properties) {
        if (properties == null) {
            return;
        }
        for (String str : properties.keySet()) {
            this.context.putProperty(str, properties.getProperty(str));
        }
    }
}
