package com.loopj.android.http;

import android.text.TextUtils;
import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.message.BasicHeader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/SimpleMultipartEntity.class */
class SimpleMultipartEntity implements HttpEntity {
    private static final String LOG_TAG = "SimpleMultipartEntity";
    private static final String STR_CR_LF = "\r\n";
    private static final byte[] CR_LF = STR_CR_LF.getBytes();
    private static final byte[] TRANSFER_ENCODING_BINARY = "Content-Transfer-Encoding: binary\r\n".getBytes();
    private static final char[] MULTIPART_CHARS = "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
    private final String boundary;
    private final byte[] boundaryLine;
    private final byte[] boundaryEnd;
    private final List<FilePart> fileParts = new ArrayList();
    private final ByteArrayOutputStream out = new ByteArrayOutputStream();
    private final ResponseHandlerInterface progressHandler;
    private boolean isRepeatable;
    private long bytesWritten;
    private long totalSize;

    public SimpleMultipartEntity(ResponseHandlerInterface progressHandler) {
        StringBuilder buf = new StringBuilder();
        Random rand = new Random();
        for (int i = 0; i < 30; i++) {
            buf.append(MULTIPART_CHARS[rand.nextInt(MULTIPART_CHARS.length)]);
        }
        this.boundary = buf.toString();
        this.boundaryLine = ("--" + this.boundary + STR_CR_LF).getBytes();
        this.boundaryEnd = ("--" + this.boundary + "--" + STR_CR_LF).getBytes();
        this.progressHandler = progressHandler;
    }

    public void addPart(String key, String value, String contentType) {
        try {
            this.out.write(this.boundaryLine);
            this.out.write(createContentDisposition(key));
            this.out.write(createContentType(contentType));
            this.out.write(CR_LF);
            this.out.write(value.getBytes());
            this.out.write(CR_LF);
        } catch (IOException e) {
            AsyncHttpClient.log.e(LOG_TAG, "addPart ByteArrayOutputStream exception", e);
        }
    }

    public void addPartWithCharset(String key, String value, String charset) {
        if (charset == null) {
            charset = AsyncHttpResponseHandler.DEFAULT_CHARSET;
        }
        addPart(key, value, "text/plain; charset=" + charset);
    }

    public void addPart(String key, String value) {
        addPartWithCharset(key, value, null);
    }

    public void addPart(String key, File file) {
        addPart(key, file, (String) null);
    }

    public void addPart(String key, File file, String type) {
        this.fileParts.add(new FilePart(key, file, normalizeContentType(type)));
    }

    public void addPart(String key, File file, String type, String customFileName) {
        this.fileParts.add(new FilePart(key, file, normalizeContentType(type), customFileName));
    }

    public void addPart(String key, String streamName, InputStream inputStream, String type) throws IOException {
        this.out.write(this.boundaryLine);
        this.out.write(createContentDisposition(key, streamName));
        this.out.write(createContentType(type));
        this.out.write(TRANSFER_ENCODING_BINARY);
        this.out.write(CR_LF);
        byte[] tmp = new byte[4096];
        while (true) {
            int l = inputStream.read(tmp);
            if (l != -1) {
                this.out.write(tmp, 0, l);
            } else {
                this.out.write(CR_LF);
                this.out.flush();
                return;
            }
        }
    }

    private String normalizeContentType(String type) {
        return type == null ? RequestParams.APPLICATION_OCTET_STREAM : type;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public byte[] createContentType(String type) {
        String result = "Content-Type: " + normalizeContentType(type) + STR_CR_LF;
        return result.getBytes();
    }

    private byte[] createContentDisposition(String key) {
        return ("Content-Disposition: form-data; name=\"" + key + "\"" + STR_CR_LF).getBytes();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public byte[] createContentDisposition(String key, String fileName) {
        return ("Content-Disposition: form-data; name=\"" + key + "\"; filename=\"" + fileName + "\"" + STR_CR_LF).getBytes();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateProgress(long count) {
        this.bytesWritten += count;
        this.progressHandler.sendProgressMessage(this.bytesWritten, this.totalSize);
    }

    public long getContentLength() {
        long contentLen = this.out.size();
        for (FilePart filePart : this.fileParts) {
            long len = filePart.getTotalLength();
            if (len < 0) {
                return -1L;
            }
            contentLen += len;
        }
        return contentLen + this.boundaryEnd.length;
    }

    public Header getContentType() {
        return new BasicHeader(AsyncHttpClient.HEADER_CONTENT_TYPE, "multipart/form-data; boundary=" + this.boundary);
    }

    public boolean isChunked() {
        return false;
    }

    public void setIsRepeatable(boolean isRepeatable) {
        this.isRepeatable = isRepeatable;
    }

    public boolean isRepeatable() {
        return this.isRepeatable;
    }

    public boolean isStreaming() {
        return false;
    }

    public void writeTo(OutputStream outstream) throws IOException {
        this.bytesWritten = 0L;
        this.totalSize = (int) getContentLength();
        this.out.writeTo(outstream);
        updateProgress(this.out.size());
        for (FilePart filePart : this.fileParts) {
            filePart.writeTo(outstream);
        }
        outstream.write(this.boundaryEnd);
        updateProgress(this.boundaryEnd.length);
    }

    public Header getContentEncoding() {
        return null;
    }

    public void consumeContent() throws IOException, UnsupportedOperationException {
        if (isStreaming()) {
            throw new UnsupportedOperationException("Streaming entity does not implement #consumeContent()");
        }
    }

    public InputStream getContent() throws IOException, UnsupportedOperationException {
        throw new UnsupportedOperationException("getContent() is not supported. Use writeTo() instead.");
    }

    /* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/SimpleMultipartEntity$FilePart.class */
    private class FilePart {
        public final File file;
        public final byte[] header;

        public FilePart(String key, File file, String type, String customFileName) {
            this.header = createHeader(key, TextUtils.isEmpty(customFileName) ? file.getName() : customFileName, type);
            this.file = file;
        }

        public FilePart(String key, File file, String type) {
            this.header = createHeader(key, file.getName(), type);
            this.file = file;
        }

        private byte[] createHeader(String key, String filename, String type) {
            ByteArrayOutputStream headerStream = new ByteArrayOutputStream();
            try {
                headerStream.write(SimpleMultipartEntity.this.boundaryLine);
                headerStream.write(SimpleMultipartEntity.this.createContentDisposition(key, filename));
                headerStream.write(SimpleMultipartEntity.this.createContentType(type));
                headerStream.write(SimpleMultipartEntity.TRANSFER_ENCODING_BINARY);
                headerStream.write(SimpleMultipartEntity.CR_LF);
            } catch (IOException e) {
                AsyncHttpClient.log.e(SimpleMultipartEntity.LOG_TAG, "createHeader ByteArrayOutputStream exception", e);
            }
            return headerStream.toByteArray();
        }

        public long getTotalLength() {
            long streamLength = this.file.length() + SimpleMultipartEntity.CR_LF.length;
            return this.header.length + streamLength;
        }

        public void writeTo(OutputStream out) throws IOException {
            out.write(this.header);
            SimpleMultipartEntity.this.updateProgress(this.header.length);
            FileInputStream inputStream = new FileInputStream(this.file);
            byte[] tmp = new byte[4096];
            while (true) {
                int bytesRead = inputStream.read(tmp);
                if (bytesRead != -1) {
                    out.write(tmp, 0, bytesRead);
                    SimpleMultipartEntity.this.updateProgress(bytesRead);
                } else {
                    out.write(SimpleMultipartEntity.CR_LF);
                    SimpleMultipartEntity.this.updateProgress(SimpleMultipartEntity.CR_LF.length);
                    out.flush();
                    AsyncHttpClient.silentCloseInputStream(inputStream);
                    return;
                }
            }
        }
    }
}
