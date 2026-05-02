package org.spongycastle.util;

import java.util.Collection;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/StreamParser.class */
public interface StreamParser {
    Object read() throws StreamParsingException;

    Collection readAll() throws StreamParsingException;
}
