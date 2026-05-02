package tk.elevenk.olapi.logging;

import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/logging/Log.class */
public abstract class Log {
    private static void log(Level level, String msg, Throwable throwable) {
        if (throwable != null) {
            Logger.getLogger(Thread.currentThread().getStackTrace()[2].getClassName()).log(level, msg, throwable);
        } else {
            Logger.getLogger(Thread.currentThread().getStackTrace()[2].getClassName()).log(level, msg);
        }
    }

    public static void e(String msg, Throwable thrown) {
        log(Level.SEVERE, msg, thrown);
    }

    public static void d(String msg) {
        log(Level.FINE, msg, null);
    }
}
