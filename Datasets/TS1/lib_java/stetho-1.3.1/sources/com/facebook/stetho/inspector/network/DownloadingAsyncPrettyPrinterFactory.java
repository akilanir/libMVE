package com.facebook.stetho.inspector.network;

import com.facebook.stetho.common.ExceptionUtil;
import com.facebook.stetho.common.Util;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/DownloadingAsyncPrettyPrinterFactory.class */
public abstract class DownloadingAsyncPrettyPrinterFactory implements AsyncPrettyPrinterFactory {
    @Nullable
    protected abstract MatchResult matchAndParseHeader(String str, String str2);

    protected abstract void doPrint(PrintWriter printWriter, InputStream inputStream, String str) throws IOException;

    @Override // com.facebook.stetho.inspector.network.AsyncPrettyPrinterFactory
    public AsyncPrettyPrinter getInstance(String headerName, String headerValue) {
        final MatchResult result = matchAndParseHeader(headerName, headerValue);
        if (result == null) {
            return null;
        }
        String uri = result.getSchemaUri();
        URL schemaURL = parseURL(uri);
        if (schemaURL == null) {
            return getErrorAsyncPrettyPrinter(headerName, headerValue);
        }
        ExecutorService executorService = AsyncPrettyPrinterExecutorHolder.getExecutorService();
        if (executorService == null) {
            return null;
        }
        final Future<String> response = executorService.submit(new Request(schemaURL));
        return new AsyncPrettyPrinter() { // from class: com.facebook.stetho.inspector.network.DownloadingAsyncPrettyPrinterFactory.1
            @Override // com.facebook.stetho.inspector.network.AsyncPrettyPrinter
            public void printTo(PrintWriter output, InputStream payload) throws IOException {
                try {
                    try {
                        String schema = (String) response.get();
                        DownloadingAsyncPrettyPrinterFactory.this.doPrint(output, payload, schema);
                    } catch (ExecutionException e) {
                        Throwable cause = e.getCause();
                        if (IOException.class.isInstance(cause)) {
                            DownloadingAsyncPrettyPrinterFactory.doErrorPrint(output, payload, "Cannot successfully download schema: " + e.getMessage());
                            return;
                        }
                        throw e;
                    }
                } catch (InterruptedException e2) {
                    DownloadingAsyncPrettyPrinterFactory.doErrorPrint(output, payload, "Encountered spurious interrupt while downloading schema for pretty printing: " + e2.getMessage());
                } catch (ExecutionException e3) {
                    Throwable cause2 = e3.getCause();
                    throw ExceptionUtil.propagate(cause2);
                }
            }

            @Override // com.facebook.stetho.inspector.network.AsyncPrettyPrinter
            public PrettyPrinterDisplayType getPrettifiedType() {
                return result.getDisplayType();
            }
        };
    }

    @Nullable
    private static URL parseURL(String uri) {
        try {
            return new URL(uri);
        } catch (MalformedURLException e) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void doErrorPrint(PrintWriter output, InputStream payload, String errorMessage) throws IOException {
        output.print(errorMessage + "\n" + Util.readAsUTF8(payload));
    }

    private static AsyncPrettyPrinter getErrorAsyncPrettyPrinter(final String headerName, final String headerValue) {
        return new AsyncPrettyPrinter() { // from class: com.facebook.stetho.inspector.network.DownloadingAsyncPrettyPrinterFactory.2
            @Override // com.facebook.stetho.inspector.network.AsyncPrettyPrinter
            public void printTo(PrintWriter output, InputStream payload) throws IOException {
                String errorMessage = "[Failed to parse header: " + headerName + " : " + headerValue + " ]";
                DownloadingAsyncPrettyPrinterFactory.doErrorPrint(output, payload, errorMessage);
            }

            @Override // com.facebook.stetho.inspector.network.AsyncPrettyPrinter
            public PrettyPrinterDisplayType getPrettifiedType() {
                return PrettyPrinterDisplayType.TEXT;
            }
        };
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/DownloadingAsyncPrettyPrinterFactory$MatchResult.class */
    protected class MatchResult {
        private final String mSchemaUri;
        private final PrettyPrinterDisplayType mDisplayType;

        public MatchResult(String schemaUri, PrettyPrinterDisplayType displayType) {
            this.mSchemaUri = schemaUri;
            this.mDisplayType = displayType;
        }

        public String getSchemaUri() {
            return this.mSchemaUri;
        }

        public PrettyPrinterDisplayType getDisplayType() {
            return this.mDisplayType;
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/DownloadingAsyncPrettyPrinterFactory$Request.class */
    private static class Request implements Callable<String> {
        private URL url;

        public Request(URL url) {
            this.url = url;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        public String call() throws IOException {
            HttpURLConnection connection = (HttpURLConnection) this.url.openConnection();
            int statusCode = connection.getResponseCode();
            if (statusCode != 200) {
                throw new IOException("Got status code: " + statusCode + " while downloading schema with url: " + this.url.toString());
            }
            InputStream urlStream = connection.getInputStream();
            try {
                String readAsUTF8 = Util.readAsUTF8(urlStream);
                urlStream.close();
                return readAsUTF8;
            } catch (Throwable th) {
                urlStream.close();
                throw th;
            }
        }
    }
}
