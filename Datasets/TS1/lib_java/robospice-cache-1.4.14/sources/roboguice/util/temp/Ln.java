package roboguice.util.temp;

import android.app.Application;
import android.util.Log;
import java.text.SimpleDateFormat;

/* loaded from: robospice-cache-1.4.14.jar:roboguice/util/temp/Ln.class */
public final class Ln {
    private static final BaseConfig CONFIG = new BaseConfig();
    private static Print print = new Print();

    /* loaded from: robospice-cache-1.4.14.jar:roboguice/util/temp/Ln$Config.class */
    public interface Config {
        int getLoggingLevel();

        void setLoggingLevel(int i);
    }

    private Ln() {
    }

    public static int v(Throwable t) {
        if (CONFIG.minimumLogLevel <= 2) {
            return print.println(2, Log.getStackTraceString(t));
        }
        return 0;
    }

    public static int v(Object s1, Object... args) {
        if (CONFIG.minimumLogLevel > 2) {
            return 0;
        }
        String s = Strings.toString(s1);
        String message = args.length > 0 ? String.format(s, args) : s;
        return print.println(2, message);
    }

    public static int v(Throwable throwable, Object s1, Object... args) {
        if (CONFIG.minimumLogLevel > 2) {
            return 0;
        }
        String s = Strings.toString(s1);
        String message = (args.length > 0 ? String.format(s, args) : s) + '\n' + Log.getStackTraceString(throwable);
        return print.println(2, message);
    }

    public static int d(Throwable t) {
        if (CONFIG.minimumLogLevel <= 3) {
            return print.println(3, Log.getStackTraceString(t));
        }
        return 0;
    }

    public static int d(Object s1, Object... args) {
        if (CONFIG.minimumLogLevel > 3) {
            return 0;
        }
        String s = Strings.toString(s1);
        String message = args.length > 0 ? String.format(s, args) : s;
        return print.println(3, message);
    }

    public static int d(Throwable throwable, Object s1, Object... args) {
        if (CONFIG.minimumLogLevel > 3) {
            return 0;
        }
        String s = Strings.toString(s1);
        String message = (args.length > 0 ? String.format(s, args) : s) + '\n' + Log.getStackTraceString(throwable);
        return print.println(3, message);
    }

    public static int i(Throwable t) {
        if (CONFIG.minimumLogLevel <= 4) {
            return print.println(4, Log.getStackTraceString(t));
        }
        return 0;
    }

    public static int i(Object s1, Object... args) {
        if (CONFIG.minimumLogLevel > 4) {
            return 0;
        }
        String s = Strings.toString(s1);
        String message = args.length > 0 ? String.format(s, args) : s;
        return print.println(4, message);
    }

    public static int i(Throwable throwable, Object s1, Object... args) {
        if (CONFIG.minimumLogLevel > 4) {
            return 0;
        }
        String s = Strings.toString(s1);
        String message = (args.length > 0 ? String.format(s, args) : s) + '\n' + Log.getStackTraceString(throwable);
        return print.println(4, message);
    }

    public static int w(Throwable t) {
        if (CONFIG.minimumLogLevel <= 5) {
            return print.println(5, Log.getStackTraceString(t));
        }
        return 0;
    }

    public static int w(Object s1, Object... args) {
        if (CONFIG.minimumLogLevel > 5) {
            return 0;
        }
        String s = Strings.toString(s1);
        String message = args.length > 0 ? String.format(s, args) : s;
        return print.println(5, message);
    }

    public static int w(Throwable throwable, Object s1, Object... args) {
        if (CONFIG.minimumLogLevel > 5) {
            return 0;
        }
        String s = Strings.toString(s1);
        String message = (args.length > 0 ? String.format(s, args) : s) + '\n' + Log.getStackTraceString(throwable);
        return print.println(5, message);
    }

    public static int e(Throwable t) {
        if (CONFIG.minimumLogLevel <= 6) {
            return print.println(6, Log.getStackTraceString(t));
        }
        return 0;
    }

    public static int e(Object s1, Object... args) {
        if (CONFIG.minimumLogLevel > 6) {
            return 0;
        }
        String s = Strings.toString(s1);
        String message = args.length > 0 ? String.format(s, args) : s;
        return print.println(6, message);
    }

    public static int e(Throwable throwable, Object s1, Object... args) {
        if (CONFIG.minimumLogLevel > 6) {
            return 0;
        }
        String s = Strings.toString(s1);
        String message = (args.length > 0 ? String.format(s, args) : s) + '\n' + Log.getStackTraceString(throwable);
        return print.println(6, message);
    }

    public static boolean isDebugEnabled() {
        return CONFIG.minimumLogLevel <= 3;
    }

    public static boolean isVerboseEnabled() {
        return CONFIG.minimumLogLevel <= 2;
    }

    public static Config getConfig() {
        return CONFIG;
    }

    /* loaded from: robospice-cache-1.4.14.jar:roboguice/util/temp/Ln$BaseConfig.class */
    public static class BaseConfig implements Config {
        protected int minimumLogLevel;
        protected String packageName;
        protected String scope;

        protected BaseConfig() {
            this.minimumLogLevel = 2;
            this.packageName = "";
            this.scope = "";
        }

        public BaseConfig(Application context) {
            this.minimumLogLevel = 2;
            this.packageName = "";
            this.scope = "";
            try {
                this.packageName = context.getPackageName();
                int flags = context.getPackageManager().getApplicationInfo(this.packageName, 0).flags;
                this.minimumLogLevel = (flags & 2) != 0 ? 2 : 4;
                this.scope = this.packageName.toUpperCase();
                Ln.d("Configuring Logging, minimum log level is %s", Ln.logLevelToString(this.minimumLogLevel));
            } catch (Exception e) {
                Log.e(this.packageName, "Error configuring logger", e);
            }
        }

        @Override // roboguice.util.temp.Ln.Config
        public int getLoggingLevel() {
            return this.minimumLogLevel;
        }

        @Override // roboguice.util.temp.Ln.Config
        public void setLoggingLevel(int level) {
            this.minimumLogLevel = level;
        }
    }

    public static String logLevelToString(int loglevel) {
        switch (loglevel) {
            case 2:
                return "VERBOSE";
            case 3:
                return "DEBUG";
            case 4:
                return "INFO";
            case 5:
                return "WARN";
            case 6:
                return "ERROR";
            case 7:
                return "ASSERT";
            default:
                return "UNKNOWN";
        }
    }

    public static void setPrint(Print print2) {
        print = print2;
    }

    /* loaded from: robospice-cache-1.4.14.jar:roboguice/util/temp/Ln$Print.class */
    public static class Print {
        private static final int DEFAULT_STACK_TRACE_LINE_COUNT = 5;

        public int println(int priority, String msg) {
            return Log.println(priority, getScope(), processMessage(msg));
        }

        protected String processMessage(String msg) {
            if (Ln.CONFIG.minimumLogLevel <= 3) {
                msg = String.format("%s %s %s", new SimpleDateFormat("HH:mm:ss.SSS").format(Long.valueOf(System.currentTimeMillis())), Thread.currentThread().getName(), msg);
            }
            return msg;
        }

        protected static String getScope() {
            if (Ln.CONFIG.minimumLogLevel > 3) {
                return Ln.CONFIG.scope;
            }
            StackTraceElement trace = Thread.currentThread().getStackTrace()[DEFAULT_STACK_TRACE_LINE_COUNT];
            return Ln.CONFIG.scope + "/" + trace.getFileName() + ":" + trace.getLineNumber();
        }
    }
}
