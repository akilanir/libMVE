package org.ligi.tracedroid.collecting;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.Thread;
import org.ligi.tracedroid.logging.Log;

/* loaded from: tracedroid-1.4.jar:org/ligi/tracedroid/collecting/UncaughtExceptionSaver.class */
public class UncaughtExceptionSaver implements Thread.UncaughtExceptionHandler {
    Thread.UncaughtExceptionHandler oldHandler;

    public UncaughtExceptionSaver(Thread.UncaughtExceptionHandler oldHandler) {
        this.oldHandler = oldHandler;
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread thread, Throwable throwable) {
        try {
            String filename = TraceDroidMetaInfo.getFilesPath() + "/" + TraceDroidMetaInfo.getAppVersion() + "-" + System.currentTimeMillis() + TraceDroidMetaInfo.getFileSuffix();
            Log.d("Writing unhandled exception to: " + filename);
            BufferedWriter bos = new BufferedWriter(new FileWriter(filename));
            bos.write("Android Version: " + TraceDroidMetaInfo.getAndroidVersion() + "\n");
            bos.write("Phone Model: " + TraceDroidMetaInfo.getPhoneModel() + "\n");
            bos.write("TraceDroid Version: " + TraceDroidMetaInfo.getTraceDroidVersion() + "\n");
            bos.write("TraceDroid extra: " + TraceDroidMetaInfo.getExtra() + "\n");
            bos.write("Stacktrace: \n " + getThrowableStackAsString(throwable));
            bos.write("Log: \n " + Log.getCachedLog());
            bos.flush();
            bos.close();
        } catch (Exception ebos) {
            Log.e("Error saving exception stacktrace", ebos);
        }
        Log.d(getThrowableStackAsString(throwable));
        this.oldHandler.uncaughtException(thread, throwable);
    }

    public static String getThrowableStackAsString(Throwable t) {
        try {
            StringWriter sw = new StringWriter();
            t.printStackTrace(new PrintWriter(sw));
            return sw.toString();
        } catch (Exception e) {
            return "bad exception stack";
        }
    }
}
