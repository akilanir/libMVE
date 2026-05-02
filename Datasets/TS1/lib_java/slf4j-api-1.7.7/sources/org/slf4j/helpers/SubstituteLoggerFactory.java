package org.slf4j.helpers;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import org.slf4j.ILoggerFactory;
import org.slf4j.Logger;

/* loaded from: slf4j-api-1.7.7.jar:org/slf4j/helpers/SubstituteLoggerFactory.class */
public class SubstituteLoggerFactory implements ILoggerFactory {
    final ConcurrentMap<String, SubstituteLogger> loggers = new ConcurrentHashMap();

    @Override // org.slf4j.ILoggerFactory
    public Logger getLogger(String name) {
        SubstituteLogger logger = this.loggers.get(name);
        if (logger == null) {
            logger = new SubstituteLogger(name);
            SubstituteLogger oldLogger = this.loggers.putIfAbsent(name, logger);
            if (oldLogger != null) {
                logger = oldLogger;
            }
        }
        return logger;
    }

    public List<String> getLoggerNames() {
        return new ArrayList(this.loggers.keySet());
    }

    public List<SubstituteLogger> getLoggers() {
        return new ArrayList(this.loggers.values());
    }

    public void clear() {
        this.loggers.clear();
    }
}
