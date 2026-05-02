package org.spongycastle.x509.util;

import java.util.Collection;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/x509/util/StreamParser.class */
public interface StreamParser {
    Object read() throws StreamParsingException;

    Collection readAll() throws StreamParsingException;
}
