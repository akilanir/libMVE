package com.fasterxml.jackson.databind.cfg;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/cfg/ConfigFeature.class */
public interface ConfigFeature {
    boolean enabledByDefault();

    int getMask();
}
