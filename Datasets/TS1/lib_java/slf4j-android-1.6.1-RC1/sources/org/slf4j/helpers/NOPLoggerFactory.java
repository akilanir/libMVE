package org.slf4j.helpers;

import org.slf4j.ILoggerFactory;
import org.slf4j.Logger;

/* loaded from: slf4j-android-1.6.1-RC1.jar:org/slf4j/helpers/NOPLoggerFactory.class */
public class NOPLoggerFactory implements ILoggerFactory {
    @Override // org.slf4j.ILoggerFactory
    public Logger getLogger(String name) {
        return NOPLogger.NOP_LOGGER;
    }
}
