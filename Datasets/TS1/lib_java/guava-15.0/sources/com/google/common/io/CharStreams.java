package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.collect.Iterables;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.StringReader;
import java.io.Writer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Beta
/* loaded from: guava-15.0.jar:com/google/common/io/CharStreams.class */
public final class CharStreams {
    private static final int BUF_SIZE = 2048;

    private CharStreams() {
    }

    public static InputSupplier<StringReader> newReaderSupplier(String value) {
        return asInputSupplier(CharSource.wrap(value));
    }

    @Deprecated
    public static CharSource asCharSource(String string) {
        return CharSource.wrap(string);
    }

    public static InputSupplier<InputStreamReader> newReaderSupplier(InputSupplier<? extends InputStream> in, Charset charset) {
        return asInputSupplier(ByteStreams.asByteSource(in).asCharSource(charset));
    }

    public static OutputSupplier<OutputStreamWriter> newWriterSupplier(OutputSupplier<? extends OutputStream> out, Charset charset) {
        return asOutputSupplier(ByteStreams.asByteSink(out).asCharSink(charset));
    }

    public static <W extends Appendable & Closeable> void write(CharSequence from, OutputSupplier<W> to) throws IOException {
        asCharSink(to).write(from);
    }

    public static <R extends Readable & Closeable, W extends Appendable & Closeable> long copy(InputSupplier<R> from, OutputSupplier<W> to) throws IOException {
        return asCharSource((InputSupplier<? extends Readable>) from).copyTo(asCharSink(to));
    }

    public static <R extends Readable & Closeable> long copy(InputSupplier<R> from, Appendable to) throws IOException {
        return asCharSource((InputSupplier<? extends Readable>) from).copyTo(to);
    }

    public static long copy(Readable from, Appendable to) throws IOException {
        Preconditions.checkNotNull(from);
        Preconditions.checkNotNull(to);
        CharBuffer buf = CharBuffer.allocate(BUF_SIZE);
        long total = 0;
        while (from.read(buf) != -1) {
            buf.flip();
            to.append(buf);
            total += buf.remaining();
            buf.clear();
        }
        return total;
    }

    public static String toString(Readable r) throws IOException {
        return toStringBuilder(r).toString();
    }

    public static <R extends Readable & Closeable> String toString(InputSupplier<R> supplier) throws IOException {
        return asCharSource((InputSupplier<? extends Readable>) supplier).read();
    }

    private static StringBuilder toStringBuilder(Readable r) throws IOException {
        StringBuilder sb = new StringBuilder();
        copy(r, sb);
        return sb;
    }

    public static <R extends Readable & Closeable> String readFirstLine(InputSupplier<R> supplier) throws IOException {
        return asCharSource((InputSupplier<? extends Readable>) supplier).readFirstLine();
    }

    public static <R extends Readable & Closeable> List<String> readLines(InputSupplier<R> supplier) throws IOException {
        Closer closer = Closer.create();
        try {
            try {
                List<String> readLines = readLines((Readable) closer.register(supplier.getInput()));
                closer.close();
                return readLines;
            } catch (Throwable e) {
                throw closer.rethrow(e);
            }
        } catch (Throwable th) {
            closer.close();
            throw th;
        }
    }

    public static List<String> readLines(Readable r) throws IOException {
        List<String> result = new ArrayList<>();
        LineReader lineReader = new LineReader(r);
        while (true) {
            String line = lineReader.readLine();
            if (line != null) {
                result.add(line);
            } else {
                return result;
            }
        }
    }

    public static <T> T readLines(Readable readable, LineProcessor<T> processor) throws IOException {
        String line;
        Preconditions.checkNotNull(readable);
        Preconditions.checkNotNull(processor);
        LineReader lineReader = new LineReader(readable);
        do {
            line = lineReader.readLine();
            if (line == null) {
                break;
            }
        } while (processor.processLine(line));
        return processor.getResult();
    }

    public static <R extends Readable & Closeable, T> T readLines(InputSupplier<R> inputSupplier, LineProcessor<T> lineProcessor) throws IOException {
        RuntimeException rethrow;
        Preconditions.checkNotNull(inputSupplier);
        Preconditions.checkNotNull(lineProcessor);
        Closer create = Closer.create();
        try {
            try {
                T t = (T) readLines((Readable) create.register(inputSupplier.getInput()), lineProcessor);
                create.close();
                return t;
            } finally {
            }
        } catch (Throwable th) {
            create.close();
            throw th;
        }
    }

    public static InputSupplier<Reader> join(Iterable<? extends InputSupplier<? extends Reader>> suppliers) {
        Preconditions.checkNotNull(suppliers);
        Iterable<CharSource> sources = Iterables.transform(suppliers, new Function<InputSupplier<? extends Reader>, CharSource>() { // from class: com.google.common.io.CharStreams.1
            @Override // com.google.common.base.Function
            public CharSource apply(InputSupplier<? extends Reader> input) {
                return CharStreams.asCharSource(input);
            }
        });
        return asInputSupplier(CharSource.concat(sources));
    }

    public static InputSupplier<Reader> join(InputSupplier<? extends Reader>... suppliers) {
        return join(Arrays.asList(suppliers));
    }

    public static void skipFully(Reader reader, long n) throws IOException {
        Preconditions.checkNotNull(reader);
        while (n > 0) {
            long amt = reader.skip(n);
            if (amt == 0) {
                if (reader.read() == -1) {
                    throw new EOFException();
                }
                n--;
            } else {
                n -= amt;
            }
        }
    }

    public static Writer nullWriter() {
        return NullWriter.INSTANCE;
    }

    /* loaded from: guava-15.0.jar:com/google/common/io/CharStreams$NullWriter.class */
    private static final class NullWriter extends Writer {
        private static final NullWriter INSTANCE = new NullWriter();

        private NullWriter() {
        }

        @Override // java.io.Writer
        public void write(int c) {
        }

        @Override // java.io.Writer
        public void write(char[] cbuf) {
            Preconditions.checkNotNull(cbuf);
        }

        @Override // java.io.Writer
        public void write(char[] cbuf, int off, int len) {
            Preconditions.checkPositionIndexes(off, off + len, cbuf.length);
        }

        @Override // java.io.Writer
        public void write(String str) {
            Preconditions.checkNotNull(str);
        }

        @Override // java.io.Writer
        public void write(String str, int off, int len) {
            Preconditions.checkPositionIndexes(off, off + len, str.length());
        }

        @Override // java.io.Writer, java.lang.Appendable
        public Writer append(CharSequence csq) {
            Preconditions.checkNotNull(csq);
            return this;
        }

        @Override // java.io.Writer, java.lang.Appendable
        public Writer append(CharSequence csq, int start, int end) {
            Preconditions.checkPositionIndexes(start, end, csq.length());
            return this;
        }

        @Override // java.io.Writer, java.lang.Appendable
        public Writer append(char c) {
            return this;
        }

        @Override // java.io.Writer, java.io.Flushable
        public void flush() {
        }

        @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
        public void close() {
        }

        public String toString() {
            return "CharStreams.nullWriter()";
        }
    }

    public static Writer asWriter(Appendable target) {
        if (target instanceof Writer) {
            return (Writer) target;
        }
        return new AppendableWriter(target);
    }

    static Reader asReader(final Readable readable) {
        Preconditions.checkNotNull(readable);
        if (readable instanceof Reader) {
            return (Reader) readable;
        }
        return new Reader() { // from class: com.google.common.io.CharStreams.2
            @Override // java.io.Reader
            public int read(char[] cbuf, int off, int len) throws IOException {
                return read(CharBuffer.wrap(cbuf, off, len));
            }

            @Override // java.io.Reader, java.lang.Readable
            public int read(CharBuffer target) throws IOException {
                return readable.read(target);
            }

            @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
            public void close() throws IOException {
                if (readable instanceof Closeable) {
                    ((Closeable) readable).close();
                }
            }
        };
    }

    public static CharSource asCharSource(final InputSupplier<? extends Readable> supplier) {
        Preconditions.checkNotNull(supplier);
        return new CharSource() { // from class: com.google.common.io.CharStreams.3
            @Override // com.google.common.io.CharSource
            public Reader openStream() throws IOException {
                return CharStreams.asReader((Readable) supplier.getInput());
            }

            public String toString() {
                return "CharStreams.asCharSource(" + supplier + ")";
            }
        };
    }

    public static CharSink asCharSink(final OutputSupplier<? extends Appendable> supplier) {
        Preconditions.checkNotNull(supplier);
        return new CharSink() { // from class: com.google.common.io.CharStreams.4
            @Override // com.google.common.io.CharSink
            public Writer openStream() throws IOException {
                return CharStreams.asWriter((Appendable) supplier.getOutput());
            }

            public String toString() {
                return "CharStreams.asCharSink(" + supplier + ")";
            }
        };
    }

    static <R extends Reader> InputSupplier<R> asInputSupplier(CharSource source) {
        return (InputSupplier) Preconditions.checkNotNull(source);
    }

    static <W extends Writer> OutputSupplier<W> asOutputSupplier(CharSink sink) {
        return (OutputSupplier) Preconditions.checkNotNull(sink);
    }
}
