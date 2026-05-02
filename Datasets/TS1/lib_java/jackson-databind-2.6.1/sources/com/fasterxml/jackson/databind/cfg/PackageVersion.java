package com.fasterxml.jackson.databind.cfg;

import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.Versioned;
import com.fasterxml.jackson.core.util.VersionUtil;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/cfg/PackageVersion.class */
public final class PackageVersion implements Versioned {
    public static final Version VERSION = VersionUtil.parseVersion("2.6.1", "com.fasterxml.jackson.core", "jackson-databind");

    public Version version() {
        return VERSION;
    }
}
