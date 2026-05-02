package org.apache.commons.cli;

/* loaded from: commons-cli-1.2.jar:org/apache/commons/cli/CommandLineParser.class */
public interface CommandLineParser {
    CommandLine parse(Options options, String[] strArr) throws ParseException;

    CommandLine parse(Options options, String[] strArr, boolean z) throws ParseException;
}
