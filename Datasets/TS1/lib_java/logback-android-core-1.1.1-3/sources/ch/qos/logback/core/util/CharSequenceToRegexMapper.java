package ch.qos.logback.core.util;

import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.net.SyslogConstants;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/CharSequenceToRegexMapper.class */
class CharSequenceToRegexMapper {
    CharSequenceToRegexMapper() {
    }

    String toRegex(CharSequenceState charSequenceState) {
        int i = charSequenceState.occurrences;
        char c = charSequenceState.c;
        switch (charSequenceState.c) {
            case CoreConstants.SINGLE_QUOTE_CHAR /* 39 */:
                if (i == 1) {
                    return CoreConstants.EMPTY_STRING;
                }
                throw new IllegalStateException("Too many single quotes");
            case '(':
            case CoreConstants.RIGHT_PARENTHESIS_CHAR /* 41 */:
            case '*':
            case '+':
            case CoreConstants.COMMA_CHAR /* 44 */:
            case CoreConstants.DASH_CHAR /* 45 */:
            case '/':
            case SyslogConstants.LOG_LPR /* 48 */:
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case SyslogConstants.LOG_NEWS /* 56 */:
            case '9':
            case CoreConstants.COLON_CHAR /* 58 */:
            case ';':
            case '<':
            case '=':
            case '>':
            case '?':
            case SyslogConstants.LOG_UUCP /* 64 */:
            case 'A':
            case 'B':
            case 'C':
            case 'I':
            case 'J':
            case 'L':
            case 'N':
            case 'O':
            case SyslogConstants.LOG_AUTHPRIV /* 80 */:
            case 'Q':
            case 'R':
            case 'T':
            case 'U':
            case 'V':
            case SyslogConstants.LOG_FTP /* 88 */:
            case 'Y':
            case '[':
            case ']':
            case '^':
            case '_':
            case SyslogConstants.LOG_NTP /* 96 */:
            case 'b':
            case 'c':
            case 'e':
            case 'f':
            case 'g':
            case 'i':
            case 'j':
            case 'l':
            case 'n':
            case 'o':
            case SyslogConstants.LOG_ALERT /* 112 */:
            case 'q':
            case 'r':
            case 't':
            case 'u':
            case 'v':
            case SyslogConstants.LOG_CLOCK /* 120 */:
            default:
                return i == 1 ? CoreConstants.EMPTY_STRING + c : c + "{" + i + "}";
            case CoreConstants.DOT /* 46 */:
                return "\\.";
            case 'D':
            case CoreConstants.OOS_RESET_FREQUENCY /* 70 */:
            case SyslogConstants.LOG_CRON /* 72 */:
            case 'K':
            case 'S':
            case 'W':
            case 'd':
            case SyslogConstants.LOG_AUDIT /* 104 */:
            case 'k':
            case 'm':
            case 's':
            case 'w':
            case 'y':
                return number(i);
            case 'E':
                return ".{2,12}";
            case 'G':
            case 'z':
                return ".*";
            case 'M':
                return i >= 3 ? ".{3,12}" : number(i);
            case 'Z':
                return "(\\+|-)\\d{4}";
            case CoreConstants.ESCAPE_CHAR /* 92 */:
                throw new IllegalStateException("Forward slashes are not allowed");
            case 'a':
                return ".{2}";
        }
    }

    private String number(int i) {
        return "\\d{" + i + "}";
    }
}
