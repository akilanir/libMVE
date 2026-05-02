package org.apache.commons.digester;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/SimpleRegexMatcher.class */
public class SimpleRegexMatcher extends RegexMatcher {
    private static final Log baseLog;
    private Log log = baseLog;
    static Class class$org$apache$commons$digester$SimpleRegexMatcher;

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    static {
        Class cls;
        if (class$org$apache$commons$digester$SimpleRegexMatcher == null) {
            cls = class$("org.apache.commons.digester.SimpleRegexMatcher");
            class$org$apache$commons$digester$SimpleRegexMatcher = cls;
        } else {
            cls = class$org$apache$commons$digester$SimpleRegexMatcher;
        }
        baseLog = LogFactory.getLog(cls);
    }

    public Log getLog() {
        return this.log;
    }

    public void setLog(Log log) {
        this.log = log;
    }

    @Override // org.apache.commons.digester.RegexMatcher
    public boolean match(String basePattern, String regexPattern) {
        if (basePattern == null || regexPattern == null) {
            return false;
        }
        return match(basePattern, regexPattern, 0, 0);
    }

    private boolean match(String basePattern, String regexPattern, int baseAt, int regexAt) {
        if (this.log.isTraceEnabled()) {
            this.log.trace(new StringBuffer().append("Base: ").append(basePattern).toString());
            this.log.trace(new StringBuffer().append("Regex: ").append(regexPattern).toString());
            this.log.trace(new StringBuffer().append("Base@").append(baseAt).toString());
            this.log.trace(new StringBuffer().append("Regex@").append(regexAt).toString());
        }
        if (regexAt >= regexPattern.length()) {
            if (baseAt >= basePattern.length()) {
                return true;
            }
            return false;
        }
        if (baseAt >= basePattern.length()) {
            return false;
        }
        char regexCurrent = regexPattern.charAt(regexAt);
        switch (regexCurrent) {
            case '*':
                int regexAt2 = regexAt + 1;
                if (regexAt2 >= regexPattern.length()) {
                    return true;
                }
                char nextRegex = regexPattern.charAt(regexAt2);
                if (this.log.isTraceEnabled()) {
                    this.log.trace(new StringBuffer().append("Searching for next '").append(nextRegex).append("' char").toString());
                }
                int indexOf = basePattern.indexOf(nextRegex, baseAt);
                while (true) {
                    int nextMatch = indexOf;
                    if (nextMatch != -1) {
                        if (this.log.isTraceEnabled()) {
                            this.log.trace(new StringBuffer().append("Trying '*' match@").append(nextMatch).toString());
                        }
                        if (match(basePattern, regexPattern, nextMatch, regexAt2)) {
                            return true;
                        }
                        indexOf = basePattern.indexOf(nextRegex, nextMatch + 1);
                    } else {
                        this.log.trace("No matches found.");
                        return false;
                    }
                }
            case '?':
                return match(basePattern, regexPattern, baseAt + 1, regexAt + 1);
            default:
                if (this.log.isTraceEnabled()) {
                    this.log.trace(new StringBuffer().append("Camparing ").append(regexCurrent).append(" to ").append(basePattern.charAt(baseAt)).toString());
                }
                if (regexCurrent == basePattern.charAt(baseAt)) {
                    return match(basePattern, regexPattern, baseAt + 1, regexAt + 1);
                }
                return false;
        }
    }
}
