package org.slf4j.impl;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.ILoggerFactory;
import org.slf4j.Logger;

/* loaded from: slf4j-simple-1.6.1.jar:org/slf4j/impl/SimpleLoggerFactory.class */
public class SimpleLoggerFactory implements ILoggerFactory {
    static final SimpleLoggerFactory INSTANCE = new SimpleLoggerFactory();
    Map loggerMap = new HashMap();

    public Logger getLogger(String name) {
        SimpleLogger simpleLogger;
        synchronized (this) {
            simpleLogger = (Logger) this.loggerMap.get(name);
            if (simpleLogger == null) {
                simpleLogger = new SimpleLogger(name);
                this.loggerMap.put(name, simpleLogger);
            }
        }
        return simpleLogger;
    }
}
