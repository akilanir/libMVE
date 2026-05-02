package okhttp3.internal.framed;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import okio.Buffer;
import okio.BufferedSource;
import okio.ByteString;
import okio.ForwardingSource;
import okio.InflaterSource;
import okio.Okio;

/* loaded from: okhttp-3.1.2.jar:okhttp3/internal/framed/NameValueBlockReader.class */
class NameValueBlockReader {
    private final InflaterSource inflaterSource;
    private int compressedLimit;
    private final BufferedSource source;

    public NameValueBlockReader(BufferedSource source) {
        ForwardingSource forwardingSource = new ForwardingSource(source) { // from class: okhttp3.internal.framed.NameValueBlockReader.1
            public long read(Buffer sink, long byteCount) throws IOException {
                if (NameValueBlockReader.this.compressedLimit == 0) {
                    return -1L;
                }
                long read = super.read(sink, Math.min(byteCount, NameValueBlockReader.this.compressedLimit));
                if (read == -1) {
                    return -1L;
                }
                NameValueBlockReader.this.compressedLimit = (int) (NameValueBlockReader.this.compressedLimit - read);
                return read;
            }
        };
        Inflater inflater = new Inflater() { // from class: okhttp3.internal.framed.NameValueBlockReader.2
            @Override // java.util.zip.Inflater
            public int inflate(byte[] buffer, int offset, int count) throws DataFormatException {
                int result = super.inflate(buffer, offset, count);
                if (result == 0 && needsDictionary()) {
                    setDictionary(Spdy3.DICTIONARY);
                    result = super.inflate(buffer, offset, count);
                }
                return result;
            }
        };
        this.inflaterSource = new InflaterSource(forwardingSource, inflater);
        this.source = Okio.buffer(this.inflaterSource);
    }

    public List<Header> readNameValueBlock(int length) throws IOException {
        this.compressedLimit += length;
        int numberOfPairs = this.source.readInt();
        if (numberOfPairs < 0) {
            throw new IOException("numberOfPairs < 0: " + numberOfPairs);
        }
        if (numberOfPairs > 1024) {
            throw new IOException("numberOfPairs > 1024: " + numberOfPairs);
        }
        List<Header> entries = new ArrayList<>(numberOfPairs);
        for (int i = 0; i < numberOfPairs; i++) {
            ByteString name = readByteString().toAsciiLowercase();
            ByteString values = readByteString();
            if (name.size() == 0) {
                throw new IOException("name.size == 0");
            }
            entries.add(new Header(name, values));
        }
        doneReading();
        return entries;
    }

    private ByteString readByteString() throws IOException {
        int length = this.source.readInt();
        return this.source.readByteString(length);
    }

    private void doneReading() throws IOException {
        if (this.compressedLimit > 0) {
            this.inflaterSource.refill();
            if (this.compressedLimit != 0) {
                throw new IOException("compressedLimit > 0: " + this.compressedLimit);
            }
        }
    }

    public void close() throws IOException {
        this.source.close();
    }
}
