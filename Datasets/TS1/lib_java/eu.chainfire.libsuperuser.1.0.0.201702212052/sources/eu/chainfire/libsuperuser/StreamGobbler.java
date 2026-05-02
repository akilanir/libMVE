package eu.chainfire.libsuperuser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

/* loaded from: eu.chainfire.libsuperuser.1.0.0.201702212052.jar:eu/chainfire/libsuperuser/StreamGobbler.class */
public class StreamGobbler extends Thread {
    private String shell;
    private BufferedReader reader;
    private List<String> writer;
    private OnLineListener listener;

    /* loaded from: eu.chainfire.libsuperuser.1.0.0.201702212052.jar:eu/chainfire/libsuperuser/StreamGobbler$OnLineListener.class */
    public interface OnLineListener {
        void onLine(String str);
    }

    public StreamGobbler(String shell, InputStream inputStream, List<String> outputList) {
        this.shell = null;
        this.reader = null;
        this.writer = null;
        this.listener = null;
        this.shell = shell;
        this.reader = new BufferedReader(new InputStreamReader(inputStream));
        this.writer = outputList;
    }

    public StreamGobbler(String shell, InputStream inputStream, OnLineListener onLineListener) {
        this.shell = null;
        this.reader = null;
        this.writer = null;
        this.listener = null;
        this.shell = shell;
        this.reader = new BufferedReader(new InputStreamReader(inputStream));
        this.listener = onLineListener;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        while (true) {
            try {
                String line = this.reader.readLine();
                if (line == null) {
                    break;
                }
                Debug.logOutput(String.format("[%s] %s", this.shell, line));
                if (this.writer != null) {
                    this.writer.add(line);
                }
                if (this.listener != null) {
                    this.listener.onLine(line);
                }
            } catch (IOException e) {
            }
        }
        try {
            this.reader.close();
        } catch (IOException e2) {
        }
    }
}
