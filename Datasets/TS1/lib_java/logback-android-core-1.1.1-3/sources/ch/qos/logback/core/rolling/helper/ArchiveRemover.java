package ch.qos.logback.core.rolling.helper;

import ch.qos.logback.core.spi.ContextAware;
import java.util.Date;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/helper/ArchiveRemover.class */
public interface ArchiveRemover extends ContextAware {
    void clean(Date date);

    void setMaxHistory(int i);
}
