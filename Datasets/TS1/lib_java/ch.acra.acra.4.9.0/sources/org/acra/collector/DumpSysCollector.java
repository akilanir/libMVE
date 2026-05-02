package org.acra.collector;

import android.os.Process;
import android.support.annotation.NonNull;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.acra.ACRA;
import org.acra.util.IOUtils;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collector/DumpSysCollector.class */
final class DumpSysCollector {
    private DumpSysCollector() {
    }

    @NonNull
    public static String collectMemInfo() {
        StringBuilder meminfo = new StringBuilder();
        try {
            List<String> commandLine = new ArrayList<>();
            commandLine.add("dumpsys");
            commandLine.add("meminfo");
            commandLine.add(Integer.toString(Process.myPid()));
            Process process = Runtime.getRuntime().exec((String[]) commandLine.toArray(new String[commandLine.size()]));
            meminfo.append(IOUtils.streamToString(process.getInputStream()));
        } catch (IOException e) {
            ACRA.log.e(ACRA.LOG_TAG, "DumpSysCollector.meminfo could not retrieve data", e);
        }
        return meminfo.toString();
    }
}
