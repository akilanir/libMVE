package com.koushikdutta.async;

import com.koushikdutta.async.callback.CompletedCallback;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/ZipDataSink.class */
public class ZipDataSink extends FilteredDataSink {
    ByteArrayOutputStream bout;
    ZipOutputStream zop;

    public ZipDataSink(DataSink sink) {
        super(sink);
        this.bout = new ByteArrayOutputStream();
        this.zop = new ZipOutputStream(this.bout);
    }

    public void putNextEntry(ZipEntry ze) throws IOException {
        this.zop.putNextEntry(ze);
    }

    public void closeEntry() throws IOException {
        this.zop.closeEntry();
    }

    protected void report(Exception e) {
        CompletedCallback closed = getClosedCallback();
        if (closed != null) {
            closed.onCompleted(e);
        }
    }

    @Override // com.koushikdutta.async.BufferedDataSink, com.koushikdutta.async.DataSink
    public void end() {
        try {
            this.zop.close();
            setMaxBuffer(Integer.MAX_VALUE);
            write(new ByteBufferList());
            super.end();
        } catch (IOException e) {
            report(e);
        }
    }

    @Override // com.koushikdutta.async.FilteredDataSink
    public ByteBufferList filter(ByteBufferList bb) {
        try {
            if (bb != null) {
                while (bb.size() > 0) {
                    try {
                        ByteBuffer b = bb.remove();
                        ByteBufferList.writeOutputStream(this.zop, b);
                        ByteBufferList.reclaim(b);
                    } catch (IOException e) {
                        report(e);
                        if (bb != null) {
                            bb.recycle();
                        }
                        return null;
                    }
                }
            }
            ByteBufferList ret = new ByteBufferList(this.bout.toByteArray());
            this.bout.reset();
            if (bb != null) {
                bb.recycle();
            }
            return ret;
        } catch (Throwable th) {
            if (bb != null) {
                bb.recycle();
            }
            throw th;
        }
    }
}
