package org.apache.harmony.beans.internal.nls;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

/* loaded from: msgpack-0.6.12.jar:org/apache/harmony/beans/internal/nls/Messages.class */
public class Messages {
    private static ResourceBundle bundle = null;

    public static String getString(String msg) {
        if (bundle == null) {
            return msg;
        }
        try {
            return bundle.getString(msg);
        } catch (MissingResourceException e) {
            return "Missing message: " + msg;
        }
    }

    public static String getString(String msg, Object arg) {
        return getString(msg, new Object[]{arg});
    }

    public static String getString(String msg, int arg) {
        return getString(msg, new Object[]{Integer.toString(arg)});
    }

    public static String getString(String msg, char arg) {
        return getString(msg, new Object[]{String.valueOf(arg)});
    }

    public static String getString(String msg, Object arg1, Object arg2) {
        return getString(msg, new Object[]{arg1, arg2});
    }

    public static String getString(String msg, Object[] args) {
        String format = msg;
        if (bundle != null) {
            try {
                format = bundle.getString(msg);
            } catch (MissingResourceException e) {
            }
        }
        return format(format, args);
    }

    public static String format(String format, Object[] args) {
        int i;
        StringBuilder answer = new StringBuilder(format.length() + (args.length * 20));
        String[] argStrings = new String[args.length];
        for (int i2 = 0; i2 < args.length; i2++) {
            if (args[i2] == null) {
                argStrings[i2] = "<null>";
            } else {
                argStrings[i2] = args[i2].toString();
            }
        }
        int lastI = 0;
        int indexOf = format.indexOf(123, 0);
        while (true) {
            int i3 = indexOf;
            if (i3 < 0) {
                break;
            }
            if (i3 != 0 && format.charAt(i3 - 1) == '\\') {
                if (i3 != 1) {
                    answer.append(format.substring(lastI, i3 - 1));
                }
                answer.append('{');
                i = i3 + 1;
            } else if (i3 > format.length() - 3) {
                answer.append(format.substring(lastI, format.length()));
                i = format.length();
            } else {
                int argnum = (byte) Character.digit(format.charAt(i3 + 1), 10);
                if (argnum < 0 || format.charAt(i3 + 2) != '}') {
                    answer.append(format.substring(lastI, i3 + 1));
                    i = i3 + 1;
                } else {
                    answer.append(format.substring(lastI, i3));
                    if (argnum >= argStrings.length) {
                        answer.append("<missing argument>");
                    } else {
                        answer.append(argStrings[argnum]);
                    }
                    i = i3 + 3;
                }
            }
            lastI = i;
            indexOf = format.indexOf(123, lastI);
        }
        if (lastI < format.length()) {
            answer.append(format.substring(lastI, format.length()));
        }
        return answer.toString();
    }
}
