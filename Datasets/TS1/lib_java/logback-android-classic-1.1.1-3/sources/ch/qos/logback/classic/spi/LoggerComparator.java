package ch.qos.logback.classic.spi;

import ch.qos.logback.classic.Logger;
import java.io.Serializable;
import java.util.Comparator;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/spi/LoggerComparator.class */
public class LoggerComparator implements Comparator<Logger>, Serializable {
    private static final long serialVersionUID = 1;

    @Override // java.util.Comparator
    public int compare(Logger logger, Logger logger2) {
        if (logger.getName().equals(logger2.getName())) {
            return 0;
        }
        if (logger.getName().equals("ROOT")) {
            return -1;
        }
        if (logger2.getName().equals("ROOT")) {
            return 1;
        }
        return logger.getName().compareTo(logger2.getName());
    }
}
