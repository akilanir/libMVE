package com.squareup.okhttp.internal;

import com.squareup.okhttp.internal.io.FileSystem;
import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.NoSuchElementException;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.Okio;
import okio.Sink;
import okio.Source;
import okio.Timeout;

/*  JADX ERROR: NullPointerException in pass: ClassModifier
    java.lang.NullPointerException: Cannot invoke "java.util.List.forEach(java.util.function.Consumer)" because "blocks" is null
    	at jadx.core.utils.BlockUtils.collectAllInsns(BlockUtils.java:1029)
    	at jadx.core.dex.visitors.ClassModifier.removeBridgeMethod(ClassModifier.java:245)
    	at jadx.core.dex.visitors.ClassModifier.removeSyntheticMethods(ClassModifier.java:160)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1511)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:65)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:58)
    */
/* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/internal/DiskLruCache.class */
public final class DiskLruCache implements Closeable {
    static final String JOURNAL_FILE = "journal";
    static final String JOURNAL_FILE_TEMP = "journal.tmp";
    static final String JOURNAL_FILE_BACKUP = "journal.bkp";
    static final String MAGIC = "libcore.io.DiskLruCache";
    static final String VERSION_1 = "1";
    static final long ANY_SEQUENCE_NUMBER = -1;
    static final Pattern LEGAL_KEY_PATTERN;
    private static final String CLEAN = "CLEAN";
    private static final String DIRTY = "DIRTY";
    private static final String REMOVE = "REMOVE";
    private static final String READ = "READ";
    private final FileSystem fileSystem;
    private final File directory;
    private final File journalFile;
    private final File journalFileTmp;
    private final File journalFileBackup;
    private final int appVersion;
    private long maxSize;
    private final int valueCount;
    private BufferedSink journalWriter;
    private int redundantOpCount;
    private boolean hasJournalErrors;
    private boolean initialized;
    private boolean closed;
    private final Executor executor;
    private static final Sink NULL_SINK;
    static final /* synthetic */ boolean $assertionsDisabled;
    private long size = 0;
    private final LinkedHashMap<String, Entry> lruEntries = new LinkedHashMap<>(0, 0.75f, true);
    private long nextSequenceNumber = 0;
    private final Runnable cleanupRunnable = new Runnable() { // from class: com.squareup.okhttp.internal.DiskLruCache.1
        @Override // java.lang.Runnable
        public void run() {
            synchronized (DiskLruCache.this) {
                if ((!DiskLruCache.this.initialized) || DiskLruCache.this.closed) {
                    return;
                }
                try {
                    DiskLruCache.this.trimToSize();
                    if (DiskLruCache.this.journalRebuildRequired()) {
                        DiskLruCache.this.rebuildJournal();
                        DiskLruCache.this.redundantOpCount = 0;
                    }
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    };

    static {
        $assertionsDisabled = !DiskLruCache.class.desiredAssertionStatus();
        LEGAL_KEY_PATTERN = Pattern.compile("[a-z0-9_-]{1,120}");
        NULL_SINK = new Sink() { // from class: com.squareup.okhttp.internal.DiskLruCache.4
            public void write(Buffer source, long byteCount) throws IOException {
                source.skip(byteCount);
            }

            public void flush() throws IOException {
            }

            public Timeout timeout() {
                return Timeout.NONE;
            }

            public void close() throws IOException {
            }
        };
    }

    DiskLruCache(FileSystem fileSystem, File directory, int appVersion, int valueCount, long maxSize, Executor executor) {
        this.fileSystem = fileSystem;
        this.directory = directory;
        this.appVersion = appVersion;
        this.journalFile = new File(directory, JOURNAL_FILE);
        this.journalFileTmp = new File(directory, JOURNAL_FILE_TEMP);
        this.journalFileBackup = new File(directory, JOURNAL_FILE_BACKUP);
        this.valueCount = valueCount;
        this.maxSize = maxSize;
        this.executor = executor;
    }

    public synchronized void initialize() throws IOException {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (this.initialized) {
            return;
        }
        if (this.fileSystem.exists(this.journalFileBackup)) {
            if (this.fileSystem.exists(this.journalFile)) {
                this.fileSystem.delete(this.journalFileBackup);
            } else {
                this.fileSystem.rename(this.journalFileBackup, this.journalFile);
            }
        }
        if (this.fileSystem.exists(this.journalFile)) {
            try {
                readJournal();
                processJournal();
                this.initialized = true;
                return;
            } catch (IOException journalIsCorrupt) {
                Platform.get().logW("DiskLruCache " + this.directory + " is corrupt: " + journalIsCorrupt.getMessage() + ", removing");
                delete();
                this.closed = false;
            }
        }
        rebuildJournal();
        this.initialized = true;
    }

    public static DiskLruCache create(FileSystem fileSystem, File directory, int appVersion, int valueCount, long maxSize) {
        if (maxSize <= 0) {
            throw new IllegalArgumentException("maxSize <= 0");
        }
        if (valueCount <= 0) {
            throw new IllegalArgumentException("valueCount <= 0");
        }
        Executor executor = new ThreadPoolExecutor(0, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue(), Util.threadFactory("OkHttp DiskLruCache", true));
        return new DiskLruCache(fileSystem, directory, appVersion, valueCount, maxSize, executor);
    }

    private void readJournal() throws IOException {
        BufferedSource source = Okio.buffer(this.fileSystem.source(this.journalFile));
        try {
            String magic = source.readUtf8LineStrict();
            String version = source.readUtf8LineStrict();
            String appVersionString = source.readUtf8LineStrict();
            String valueCountString = source.readUtf8LineStrict();
            String blank = source.readUtf8LineStrict();
            if (!MAGIC.equals(magic) || !VERSION_1.equals(version) || !Integer.toString(this.appVersion).equals(appVersionString) || !Integer.toString(this.valueCount).equals(valueCountString) || !"".equals(blank)) {
                throw new IOException("unexpected journal header: [" + magic + ", " + version + ", " + valueCountString + ", " + blank + "]");
            }
            int lineCount = 0;
            while (true) {
                try {
                    readJournalLine(source.readUtf8LineStrict());
                    lineCount++;
                } catch (EOFException e) {
                    this.redundantOpCount = lineCount - this.lruEntries.size();
                    if (!source.exhausted()) {
                        rebuildJournal();
                    } else {
                        this.journalWriter = newJournalWriter();
                    }
                    Util.closeQuietly((Closeable) source);
                    return;
                }
            }
        } catch (Throwable th) {
            Util.closeQuietly((Closeable) source);
            throw th;
        }
    }

    private BufferedSink newJournalWriter() throws FileNotFoundException {
        Sink fileSink = this.fileSystem.appendingSink(this.journalFile);
        return Okio.buffer(new FaultHidingSink(fileSink) { // from class: com.squareup.okhttp.internal.DiskLruCache.2
            static final /* synthetic */ boolean $assertionsDisabled;

            static {
                $assertionsDisabled = !DiskLruCache.class.desiredAssertionStatus();
            }

            @Override // com.squareup.okhttp.internal.FaultHidingSink
            protected void onException(IOException e) {
                if (!$assertionsDisabled && !Thread.holdsLock(DiskLruCache.this)) {
                    throw new AssertionError();
                }
                DiskLruCache.this.hasJournalErrors = true;
            }
        });
    }

    private void readJournalLine(String line) throws IOException {
        String key;
        int firstSpace = line.indexOf(32);
        if (firstSpace == -1) {
            throw new IOException("unexpected journal line: " + line);
        }
        int keyBegin = firstSpace + 1;
        int secondSpace = line.indexOf(32, keyBegin);
        if (secondSpace == -1) {
            key = line.substring(keyBegin);
            if (firstSpace == REMOVE.length() && line.startsWith(REMOVE)) {
                this.lruEntries.remove(key);
                return;
            }
        } else {
            key = line.substring(keyBegin, secondSpace);
        }
        Entry entry = this.lruEntries.get(key);
        if (entry == null) {
            entry = new Entry(key);
            this.lruEntries.put(key, entry);
        }
        if (secondSpace != -1 && firstSpace == CLEAN.length() && line.startsWith(CLEAN)) {
            String[] parts = line.substring(secondSpace + 1).split(" ");
            entry.readable = true;
            entry.currentEditor = null;
            entry.setLengths(parts);
            return;
        }
        if (secondSpace != -1 || firstSpace != DIRTY.length() || !line.startsWith(DIRTY)) {
            if (secondSpace != -1 || firstSpace != READ.length() || !line.startsWith(READ)) {
                throw new IOException("unexpected journal line: " + line);
            }
            return;
        }
        entry.currentEditor = new Editor(entry);
    }

    private void processJournal() throws IOException {
        this.fileSystem.delete(this.journalFileTmp);
        Iterator<Entry> i = this.lruEntries.values().iterator();
        while (i.hasNext()) {
            Entry entry = i.next();
            if (entry.currentEditor == null) {
                for (int t = 0; t < this.valueCount; t++) {
                    this.size += entry.lengths[t];
                }
            } else {
                entry.currentEditor = null;
                for (int t2 = 0; t2 < this.valueCount; t2++) {
                    this.fileSystem.delete(entry.cleanFiles[t2]);
                    this.fileSystem.delete(entry.dirtyFiles[t2]);
                }
                i.remove();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void rebuildJournal() throws IOException {
        if (this.journalWriter != null) {
            this.journalWriter.close();
        }
        BufferedSink writer = Okio.buffer(this.fileSystem.sink(this.journalFileTmp));
        try {
            writer.writeUtf8(MAGIC).writeByte(10);
            writer.writeUtf8(VERSION_1).writeByte(10);
            writer.writeDecimalLong(this.appVersion).writeByte(10);
            writer.writeDecimalLong(this.valueCount).writeByte(10);
            writer.writeByte(10);
            for (Entry entry : this.lruEntries.values()) {
                if (entry.currentEditor != null) {
                    writer.writeUtf8(DIRTY).writeByte(32);
                    writer.writeUtf8(entry.key);
                    writer.writeByte(10);
                } else {
                    writer.writeUtf8(CLEAN).writeByte(32);
                    writer.writeUtf8(entry.key);
                    entry.writeLengths(writer);
                    writer.writeByte(10);
                }
            }
            if (this.fileSystem.exists(this.journalFile)) {
                this.fileSystem.rename(this.journalFile, this.journalFileBackup);
            }
            this.fileSystem.rename(this.journalFileTmp, this.journalFile);
            this.fileSystem.delete(this.journalFileBackup);
            this.journalWriter = newJournalWriter();
            this.hasJournalErrors = false;
        } finally {
            writer.close();
        }
    }

    public synchronized Snapshot get(String key) throws IOException {
        Snapshot snapshot;
        initialize();
        checkNotClosed();
        validateKey(key);
        Entry entry = this.lruEntries.get(key);
        if (entry == null || !entry.readable || (snapshot = entry.snapshot()) == null) {
            return null;
        }
        this.redundantOpCount++;
        this.journalWriter.writeUtf8(READ).writeByte(32).writeUtf8(key).writeByte(10);
        if (journalRebuildRequired()) {
            this.executor.execute(this.cleanupRunnable);
        }
        return snapshot;
    }

    public Editor edit(String key) throws IOException {
        return edit(key, ANY_SEQUENCE_NUMBER);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized Editor edit(String key, long expectedSequenceNumber) throws IOException {
        initialize();
        checkNotClosed();
        validateKey(key);
        Entry entry = this.lruEntries.get(key);
        if (expectedSequenceNumber != ANY_SEQUENCE_NUMBER && (entry == null || entry.sequenceNumber != expectedSequenceNumber)) {
            return null;
        }
        if (entry != null && entry.currentEditor != null) {
            return null;
        }
        this.journalWriter.writeUtf8(DIRTY).writeByte(32).writeUtf8(key).writeByte(10);
        this.journalWriter.flush();
        if (this.hasJournalErrors) {
            return null;
        }
        if (entry == null) {
            entry = new Entry(key);
            this.lruEntries.put(key, entry);
        }
        Editor editor = new Editor(entry);
        entry.currentEditor = editor;
        return editor;
    }

    public File getDirectory() {
        return this.directory;
    }

    public synchronized long getMaxSize() {
        return this.maxSize;
    }

    public synchronized void setMaxSize(long maxSize) {
        this.maxSize = maxSize;
        if (this.initialized) {
            this.executor.execute(this.cleanupRunnable);
        }
    }

    public synchronized long size() throws IOException {
        initialize();
        return this.size;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Failed to check method for inline after forced processcom.squareup.okhttp.internal.DiskLruCache.Entry.access$1602(com.squareup.okhttp.internal.DiskLruCache$Entry, long):long */
    public synchronized void completeEdit(Editor editor, boolean success) throws IOException {
        Entry entry = editor.entry;
        if (entry.currentEditor != editor) {
            throw new IllegalStateException();
        }
        if (success && !entry.readable) {
            for (int i = 0; i < this.valueCount; i++) {
                if (!editor.written[i]) {
                    editor.abort();
                    throw new IllegalStateException("Newly created entry didn't create value for index " + i);
                }
                if (!this.fileSystem.exists(entry.dirtyFiles[i])) {
                    editor.abort();
                    return;
                }
            }
        }
        for (int i2 = 0; i2 < this.valueCount; i2++) {
            File dirty = entry.dirtyFiles[i2];
            if (success) {
                if (this.fileSystem.exists(dirty)) {
                    File clean = entry.cleanFiles[i2];
                    this.fileSystem.rename(dirty, clean);
                    long oldLength = entry.lengths[i2];
                    long newLength = this.fileSystem.size(clean);
                    entry.lengths[i2] = newLength;
                    this.size = (this.size - oldLength) + newLength;
                }
            } else {
                this.fileSystem.delete(dirty);
            }
        }
        this.redundantOpCount++;
        entry.currentEditor = null;
        if (entry.readable | success) {
            entry.readable = true;
            this.journalWriter.writeUtf8(CLEAN).writeByte(32);
            this.journalWriter.writeUtf8(entry.key);
            entry.writeLengths(this.journalWriter);
            this.journalWriter.writeByte(10);
            if (success) {
                long j = this.nextSequenceNumber;
                this.nextSequenceNumber = j + 1;
                Entry.access$1602(entry, j);
            }
        } else {
            this.lruEntries.remove(entry.key);
            this.journalWriter.writeUtf8(REMOVE).writeByte(32);
            this.journalWriter.writeUtf8(entry.key);
            this.journalWriter.writeByte(10);
        }
        this.journalWriter.flush();
        if (this.size > this.maxSize || journalRebuildRequired()) {
            this.executor.execute(this.cleanupRunnable);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean journalRebuildRequired() {
        return this.redundantOpCount >= 2000 && this.redundantOpCount >= this.lruEntries.size();
    }

    public synchronized boolean remove(String key) throws IOException {
        initialize();
        checkNotClosed();
        validateKey(key);
        Entry entry = this.lruEntries.get(key);
        if (entry == null) {
            return false;
        }
        return removeEntry(entry);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean removeEntry(Entry entry) throws IOException {
        if (entry.currentEditor != null) {
            entry.currentEditor.hasErrors = true;
        }
        for (int i = 0; i < this.valueCount; i++) {
            this.fileSystem.delete(entry.cleanFiles[i]);
            this.size -= entry.lengths[i];
            entry.lengths[i] = 0;
        }
        this.redundantOpCount++;
        this.journalWriter.writeUtf8(REMOVE).writeByte(32).writeUtf8(entry.key).writeByte(10);
        this.lruEntries.remove(entry.key);
        if (journalRebuildRequired()) {
            this.executor.execute(this.cleanupRunnable);
            return true;
        }
        return true;
    }

    public synchronized boolean isClosed() {
        return this.closed;
    }

    private synchronized void checkNotClosed() {
        if (isClosed()) {
            throw new IllegalStateException("cache is closed");
        }
    }

    public synchronized void flush() throws IOException {
        if (this.initialized) {
            checkNotClosed();
            trimToSize();
            this.journalWriter.flush();
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public synchronized void close() throws IOException {
        if (!this.initialized || this.closed) {
            this.closed = true;
            return;
        }
        for (Entry entry : (Entry[]) this.lruEntries.values().toArray(new Entry[this.lruEntries.size()])) {
            if (entry.currentEditor != null) {
                entry.currentEditor.abort();
            }
        }
        trimToSize();
        this.journalWriter.close();
        this.journalWriter = null;
        this.closed = true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void trimToSize() throws IOException {
        while (this.size > this.maxSize) {
            Entry toEvict = this.lruEntries.values().iterator().next();
            removeEntry(toEvict);
        }
    }

    public void delete() throws IOException {
        close();
        this.fileSystem.deleteContents(this.directory);
    }

    public synchronized void evictAll() throws IOException {
        initialize();
        for (Entry entry : (Entry[]) this.lruEntries.values().toArray(new Entry[this.lruEntries.size()])) {
            removeEntry(entry);
        }
    }

    private void validateKey(String key) {
        Matcher matcher = LEGAL_KEY_PATTERN.matcher(key);
        if (!matcher.matches()) {
            throw new IllegalArgumentException("keys must match regex [a-z0-9_-]{1,120}: \"" + key + "\"");
        }
    }

    public synchronized Iterator<Snapshot> snapshots() throws IOException {
        initialize();
        return new Iterator<Snapshot>() { // from class: com.squareup.okhttp.internal.DiskLruCache.3
            final Iterator<Entry> delegate;
            Snapshot nextSnapshot;
            Snapshot removeSnapshot;

            {
                this.delegate = new ArrayList(DiskLruCache.this.lruEntries.values()).iterator();
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                if (this.nextSnapshot != null) {
                    return true;
                }
                synchronized (DiskLruCache.this) {
                    if (DiskLruCache.this.closed) {
                        return false;
                    }
                    while (this.delegate.hasNext()) {
                        Entry entry = this.delegate.next();
                        Snapshot snapshot = entry.snapshot();
                        if (snapshot != null) {
                            this.nextSnapshot = snapshot;
                            return true;
                        }
                    }
                    return false;
                }
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.util.Iterator
            public Snapshot next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                this.removeSnapshot = this.nextSnapshot;
                this.nextSnapshot = null;
                return this.removeSnapshot;
            }

            @Override // java.util.Iterator
            public void remove() {
                if (this.removeSnapshot == null) {
                    throw new IllegalStateException("remove() before next()");
                }
                try {
                    DiskLruCache.this.remove(this.removeSnapshot.key);
                } catch (IOException e) {
                } finally {
                    this.removeSnapshot = null;
                }
            }
        };
    }

    /* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/internal/DiskLruCache$Snapshot.class */
    public final class Snapshot implements Closeable {
        private final String key;
        private final long sequenceNumber;
        private final Source[] sources;
        private final long[] lengths;
        final /* synthetic */ DiskLruCache this$0;

        /* synthetic */ Snapshot(DiskLruCache x0, String x1, long x2, Source[] x3, long[] x4, AnonymousClass1 x5) {
            this(x0, x1, x2, x3, x4);
        }

        private Snapshot(DiskLruCache this$0, String key, long sequenceNumber, Source[] sources, long[] lengths) {
            this.this$0 = this$0;
            this.key = key;
            this.sequenceNumber = sequenceNumber;
            this.sources = sources;
            this.lengths = lengths;
        }

        public String key() {
            return this.key;
        }

        public Editor edit() throws IOException {
            return this.this$0.edit(this.key, this.sequenceNumber);
        }

        public Source getSource(int index) {
            return this.sources[index];
        }

        public long getLength(int index) {
            return this.lengths[index];
        }

        @Override // java.io.Closeable, java.lang.AutoCloseable
        public void close() {
            for (Closeable closeable : this.sources) {
                Util.closeQuietly(closeable);
            }
        }
    }

    /* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/internal/DiskLruCache$Editor.class */
    public final class Editor {
        private final Entry entry;
        private final boolean[] written;
        private boolean hasErrors;
        private boolean committed;

        private Editor(Entry entry) {
            this.entry = entry;
            this.written = entry.readable ? null : new boolean[DiskLruCache.this.valueCount];
        }

        public Source newSource(int index) throws IOException {
            synchronized (DiskLruCache.this) {
                if (this.entry.currentEditor != this) {
                    throw new IllegalStateException();
                }
                if (!this.entry.readable) {
                    return null;
                }
                try {
                    return DiskLruCache.this.fileSystem.source(this.entry.cleanFiles[index]);
                } catch (FileNotFoundException e) {
                    return null;
                }
            }
        }

        public Sink newSink(int index) throws IOException {
            FaultHidingSink faultHidingSink;
            synchronized (DiskLruCache.this) {
                if (this.entry.currentEditor != this) {
                    throw new IllegalStateException();
                }
                if (!this.entry.readable) {
                    this.written[index] = true;
                }
                File dirtyFile = this.entry.dirtyFiles[index];
                try {
                    Sink sink = DiskLruCache.this.fileSystem.sink(dirtyFile);
                    faultHidingSink = new FaultHidingSink(sink) { // from class: com.squareup.okhttp.internal.DiskLruCache.Editor.1
                        @Override // com.squareup.okhttp.internal.FaultHidingSink
                        protected void onException(IOException e) {
                            synchronized (DiskLruCache.this) {
                                Editor.this.hasErrors = true;
                            }
                        }
                    };
                } catch (FileNotFoundException e) {
                    return DiskLruCache.NULL_SINK;
                }
            }
            return faultHidingSink;
        }

        public void commit() throws IOException {
            synchronized (DiskLruCache.this) {
                if (this.hasErrors) {
                    DiskLruCache.this.completeEdit(this, false);
                    DiskLruCache.this.removeEntry(this.entry);
                } else {
                    DiskLruCache.this.completeEdit(this, true);
                }
                this.committed = true;
            }
        }

        public void abort() throws IOException {
            synchronized (DiskLruCache.this) {
                DiskLruCache.this.completeEdit(this, false);
            }
        }

        public void abortUnlessCommitted() {
            synchronized (DiskLruCache.this) {
                if (!this.committed) {
                    try {
                        DiskLruCache.this.completeEdit(this, false);
                    } catch (IOException e) {
                    }
                }
            }
        }
    }

    /* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/internal/DiskLruCache$Entry.class */
    private final class Entry {
        private final String key;
        private final long[] lengths;
        private final File[] cleanFiles;
        private final File[] dirtyFiles;
        private boolean readable;
        private Editor currentEditor;
        private long sequenceNumber;

        /*  JADX ERROR: Failed to decode insn: 0x0002: MOVE_MULTI
            java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
            	at java.base/java.lang.System.arraycopy(Native Method)
            	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
            	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
            	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
            	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
            	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
            	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
            	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
            	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:464)
            	at jadx.core.ProcessClass.process(ProcessClass.java:69)
            	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
            	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
            	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
            	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
            */
        static /* synthetic */ long access$1602(com.squareup.okhttp.internal.DiskLruCache.Entry r6, long r7) {
            /*
                r0 = r6
                r1 = r7
                // decode failed: arraycopy: source index -1 out of bounds for object array[6]
                r0.sequenceNumber = r1
                return r-1
            */
            throw new UnsupportedOperationException("Method not decompiled: com.squareup.okhttp.internal.DiskLruCache.Entry.access$1602(com.squareup.okhttp.internal.DiskLruCache$Entry, long):long");
        }

        private Entry(String key) {
            this.key = key;
            this.lengths = new long[DiskLruCache.this.valueCount];
            this.cleanFiles = new File[DiskLruCache.this.valueCount];
            this.dirtyFiles = new File[DiskLruCache.this.valueCount];
            StringBuilder fileBuilder = new StringBuilder(key).append('.');
            int truncateTo = fileBuilder.length();
            for (int i = 0; i < DiskLruCache.this.valueCount; i++) {
                fileBuilder.append(i);
                this.cleanFiles[i] = new File(DiskLruCache.this.directory, fileBuilder.toString());
                fileBuilder.append(".tmp");
                this.dirtyFiles[i] = new File(DiskLruCache.this.directory, fileBuilder.toString());
                fileBuilder.setLength(truncateTo);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setLengths(String[] strings) throws IOException {
            if (strings.length != DiskLruCache.this.valueCount) {
                throw invalidLengths(strings);
            }
            for (int i = 0; i < strings.length; i++) {
                try {
                    this.lengths[i] = Long.parseLong(strings[i]);
                } catch (NumberFormatException e) {
                    throw invalidLengths(strings);
                }
            }
        }

        void writeLengths(BufferedSink writer) throws IOException {
            for (long length : this.lengths) {
                writer.writeByte(32).writeDecimalLong(length);
            }
        }

        private IOException invalidLengths(String[] strings) throws IOException {
            throw new IOException("unexpected journal line: " + Arrays.toString(strings));
        }

        Snapshot snapshot() {
            if (!Thread.holdsLock(DiskLruCache.this)) {
                throw new AssertionError();
            }
            Closeable[] closeableArr = new Source[DiskLruCache.this.valueCount];
            long[] lengths = (long[]) this.lengths.clone();
            for (int i = 0; i < DiskLruCache.this.valueCount; i++) {
                try {
                    closeableArr[i] = DiskLruCache.this.fileSystem.source(this.cleanFiles[i]);
                } catch (FileNotFoundException e) {
                    for (int i2 = 0; i2 < DiskLruCache.this.valueCount && closeableArr[i2] != null; i2++) {
                        Util.closeQuietly(closeableArr[i2]);
                    }
                    return null;
                }
            }
            return new Snapshot(DiskLruCache.this, this.key, this.sequenceNumber, closeableArr, lengths, null);
        }
    }
}
