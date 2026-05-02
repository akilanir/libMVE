package org.acra.collector;

import android.os.Process;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import org.acra.ACRA;
import org.acra.ACRAConstants;
import org.acra.util.BoundedLinkedList;

/* loaded from: acra-4.6.2.jar:org/acra/collector/LogCatCollector.class */
class LogCatCollector {
    private static final int DEFAULT_TAIL_COUNT = 100;

    LogCatCollector() {
    }

    public static String collectLogCat(String bufferName) {
        int tailCount;
        int myPid = Process.myPid();
        String myPidStr = null;
        if (ACRA.getConfig().logcatFilterByPid() && myPid > 0) {
            myPidStr = Integer.toString(myPid) + "):";
        }
        List<String> commandLine = new ArrayList<>();
        commandLine.add("logcat");
        if (bufferName != null) {
            commandLine.add("-b");
            commandLine.add(bufferName);
        }
        List<String> logcatArgumentsList = new ArrayList<>(Arrays.asList(ACRA.getConfig().logcatArguments()));
        int tailIndex = logcatArgumentsList.indexOf("-t");
        if (tailIndex > -1 && tailIndex < logcatArgumentsList.size()) {
            tailCount = Integer.parseInt(logcatArgumentsList.get(tailIndex + 1));
            if (Compatibility.getAPILevel() < 8) {
                logcatArgumentsList.remove(tailIndex + 1);
                logcatArgumentsList.remove(tailIndex);
                logcatArgumentsList.add("-d");
            }
        } else {
            tailCount = -1;
        }
        LinkedList<String> logcatBuf = new BoundedLinkedList<>(tailCount > 0 ? tailCount : 100);
        commandLine.addAll(logcatArgumentsList);
        BufferedReader bufferedReader = null;
        try {
            try {
                final Process process = Runtime.getRuntime().exec((String[]) commandLine.toArray(new String[commandLine.size()]));
                bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()), ACRAConstants.DEFAULT_BUFFER_SIZE_IN_BYTES);
                ACRA.log.d(ACRA.LOG_TAG, "Retrieving logcat output...");
                new Thread(new Runnable() { // from class: org.acra.collector.LogCatCollector.1
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            InputStream stderr = process.getErrorStream();
                            byte[] dummy = new byte[ACRAConstants.DEFAULT_BUFFER_SIZE_IN_BYTES];
                            do {
                            } while (stderr.read(dummy) >= 0);
                        } catch (IOException e) {
                        }
                    }
                }).start();
                while (true) {
                    String line = bufferedReader.readLine();
                    if (line == null) {
                        break;
                    }
                    if (myPidStr == null || line.contains(myPidStr)) {
                        logcatBuf.add(line + "\n");
                    }
                }
                CollectorUtil.safeClose(bufferedReader);
            } catch (IOException e) {
                ACRA.log.e(ACRA.LOG_TAG, "LogCatCollector.collectLogCat could not retrieve data.", e);
                CollectorUtil.safeClose(bufferedReader);
            }
            return logcatBuf.toString();
        } catch (Throwable th) {
            CollectorUtil.safeClose(bufferedReader);
            throw th;
        }
    }
}
