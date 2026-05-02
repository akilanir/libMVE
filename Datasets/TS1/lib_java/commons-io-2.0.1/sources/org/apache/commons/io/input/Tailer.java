package org.apache.commons.io.input;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

/* loaded from: commons-io-2.0.1.jar:org/apache/commons/io/input/Tailer.class */
public class Tailer implements Runnable {
    private final File file;
    private final long delay;
    private final boolean end;
    private final TailerListener listener;
    private volatile boolean run;

    public Tailer(File file, TailerListener listener) {
        this(file, listener, 1000L);
    }

    public Tailer(File file, TailerListener listener, long delay) {
        this(file, listener, 1000L, false);
    }

    public Tailer(File file, TailerListener listener, long delay, boolean end) {
        this.run = true;
        this.file = file;
        this.delay = delay;
        this.end = end;
        this.listener = listener;
        listener.init(this);
    }

    public static Tailer create(File file, TailerListener listener, long delay, boolean end) {
        Tailer tailer = new Tailer(file, listener, delay, end);
        Thread thread = new Thread(tailer);
        thread.setDaemon(true);
        thread.start();
        return tailer;
    }

    public static Tailer create(File file, TailerListener listener, long delay) {
        return create(file, listener, delay, false);
    }

    public static Tailer create(File file, TailerListener listener) {
        return create(file, listener, 1000L, false);
    }

    public File getFile() {
        return this.file;
    }

    public long getDelay() {
        return this.delay;
    }

    /* JADX WARN: Finally extract failed */
    @Override // java.lang.Runnable
    public void run() {
        RandomAccessFile reader = null;
        long last = 0;
        long position = 0;
        while (this.run && reader == null) {
            try {
                try {
                    try {
                        reader = new RandomAccessFile(this.file, "r");
                    } catch (FileNotFoundException e) {
                        this.listener.fileNotFound();
                    }
                    if (reader == null) {
                        try {
                            Thread.sleep(this.delay);
                        } catch (InterruptedException e2) {
                        }
                    } else {
                        position = this.end ? this.file.length() : 0L;
                        last = System.currentTimeMillis();
                        reader.seek(position);
                    }
                } catch (Exception e3) {
                    this.listener.handle(e3);
                    IOUtils.closeQuietly(reader);
                    return;
                }
            } catch (Throwable th) {
                IOUtils.closeQuietly(reader);
                throw th;
            }
        }
        while (this.run) {
            long length = this.file.length();
            if (length < position) {
                this.listener.fileRotated();
                try {
                    RandomAccessFile save = reader;
                    reader = new RandomAccessFile(this.file, "r");
                    position = 0;
                    IOUtils.closeQuietly(save);
                } catch (FileNotFoundException e4) {
                    this.listener.fileNotFound();
                }
            } else {
                if (length > position) {
                    last = System.currentTimeMillis();
                    position = readLines(reader);
                } else if (FileUtils.isFileNewer(this.file, last)) {
                    reader.seek(0L);
                    last = System.currentTimeMillis();
                    position = readLines(reader);
                }
                try {
                    Thread.sleep(this.delay);
                } catch (InterruptedException e5) {
                }
            }
        }
        IOUtils.closeQuietly(reader);
    }

    public void stop() {
        this.run = false;
    }

    private long readLines(RandomAccessFile reader) throws IOException {
        String readLine = reader.readLine();
        while (true) {
            String line = readLine;
            if (line != null) {
                this.listener.handle(line);
                readLine = reader.readLine();
            } else {
                return reader.getFilePointer();
            }
        }
    }
}
