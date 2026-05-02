package org.ligi.tracedroid;

import android.content.Context;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.lang.Thread;
import org.ligi.tracedroid.collecting.TraceDroidMetaInfo;
import org.ligi.tracedroid.collecting.UncaughtExceptionSaver;
import org.ligi.tracedroid.logging.Log;

/* loaded from: tracedroid-1.4.jar:org/ligi/tracedroid/TraceDroid.class */
public class TraceDroid {
    public static void init(Context context) {
        TraceDroidMetaInfo.init(context);
        Thread.UncaughtExceptionHandler currentHandler = Thread.getDefaultUncaughtExceptionHandler();
        if (currentHandler != null) {
            Log.d("current handler class=" + currentHandler.getClass().getName());
        }
        if (!(currentHandler instanceof UncaughtExceptionSaver)) {
            UncaughtExceptionSaver exceptionSaver = new UncaughtExceptionSaver(currentHandler);
            Thread.setDefaultUncaughtExceptionHandler(exceptionSaver);
        }
    }

    public static File getEnsuredTraceDir() {
        File trace_files_dir = new File(TraceDroidMetaInfo.getFilesPath());
        if (!trace_files_dir.exists()) {
            trace_files_dir.mkdirs();
        }
        return trace_files_dir;
    }

    public static File[] getStackTraceFiles() {
        FilenameFilter filter = new FilenameFilter() { // from class: org.ligi.tracedroid.TraceDroid.1
            @Override // java.io.FilenameFilter
            public boolean accept(File dir, String name) {
                return name.endsWith(TraceDroidMetaInfo.getFileSuffix());
            }
        };
        return getEnsuredTraceDir().listFiles(filter);
    }

    public static String getStackTraceText(int limit) {
        Log.d("Searching Exceptions in: " + TraceDroidMetaInfo.getFilesPath());
        String stack_trace_text = "";
        File[] arr$ = getStackTraceFiles();
        for (File act_file : arr$) {
            int i = limit;
            limit--;
            if (i > 0) {
                try {
                    stack_trace_text = (stack_trace_text + "file: " + act_file.toString()) + System.getProperty("line.separator");
                    limit--;
                    if (limit > 0) {
                        BufferedReader input = new BufferedReader(new FileReader(act_file));
                        while (true) {
                            try {
                                String line = input.readLine();
                                if (line == null) {
                                    break;
                                }
                                stack_trace_text = (stack_trace_text + line) + System.getProperty("line.separator");
                            } catch (Throwable th) {
                                input.close();
                                throw th;
                            }
                        }
                        input.close();
                    } else {
                        stack_trace_text = stack_trace_text + " discarded by limit";
                    }
                } catch (Exception e) {
                    Log.w("problem loading stacktrace", e);
                }
            }
        }
        return stack_trace_text;
    }

    public static final void deleteStacktraceFiles() {
        File[] arr$ = getStackTraceFiles();
        for (File act_file : arr$) {
            act_file.delete();
        }
    }
}
