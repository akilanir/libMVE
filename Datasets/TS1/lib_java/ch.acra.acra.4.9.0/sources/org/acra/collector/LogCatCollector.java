package org.acra.collector;

import android.os.Build;
import android.os.Process;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.android.internal.util.Predicate;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import org.acra.ACRA;
import org.acra.collections.BoundedLinkedList;
import org.acra.config.ACRAConfiguration;
import org.acra.util.IOUtils;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collector/LogCatCollector.class */
class LogCatCollector {
    private static final int DEFAULT_TAIL_COUNT = 100;

    LogCatCollector() {
    }

    public String collectLogCat(@NonNull ACRAConfiguration config, @Nullable String bufferName) {
        int tailCount;
        int myPid = Process.myPid();
        String myPidStr = null;
        if (config.logcatFilterByPid() && myPid > 0) {
            myPidStr = Integer.toString(myPid) + "):";
        }
        List<String> commandLine = new ArrayList<>();
        commandLine.add("logcat");
        if (bufferName != null) {
            commandLine.add("-b");
            commandLine.add(bufferName);
        }
        List<String> logcatArgumentsList = config.logcatArguments();
        int tailIndex = logcatArgumentsList.indexOf("-t");
        if (tailIndex > -1 && tailIndex < logcatArgumentsList.size()) {
            tailCount = Integer.parseInt(logcatArgumentsList.get(tailIndex + 1));
            if (Build.VERSION.SDK_INT < 8) {
                logcatArgumentsList.remove(tailIndex + 1);
                logcatArgumentsList.remove(tailIndex);
                logcatArgumentsList.add("-d");
            }
        } else {
            tailCount = -1;
        }
        LinkedList<String> logcatBuf = new BoundedLinkedList<>(tailCount > 0 ? tailCount : 100);
        commandLine.addAll(logcatArgumentsList);
        try {
            final Process process = Runtime.getRuntime().exec((String[]) commandLine.toArray(new String[commandLine.size()]));
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Retrieving logcat output...");
            }
            new Thread(new Runnable() { // from class: org.acra.collector.LogCatCollector.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        IOUtils.streamToString(process.getErrorStream());
                    } catch (IOException e) {
                    }
                }
            }).start();
            final String finalMyPidStr = myPidStr;
            logcatBuf.add(IOUtils.streamToString(process.getInputStream(), new Predicate<String>() { // from class: org.acra.collector.LogCatCollector.2
                public boolean apply(String s) {
                    return finalMyPidStr == null || s.contains(finalMyPidStr);
                }
            }));
        } catch (IOException e) {
            ACRA.log.e(ACRA.LOG_TAG, "LogCatCollector.collectLogCat could not retrieve data.", e);
        }
        return logcatBuf.toString();
    }
}
