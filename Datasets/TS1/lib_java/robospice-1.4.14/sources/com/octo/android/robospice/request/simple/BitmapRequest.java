package com.octo.android.robospice.request.simple;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import com.octo.android.robospice.request.ProgressByteProcessor;
import com.octo.android.robospice.request.SpiceRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import org.apache.commons.io.IOUtils;
import roboguice.util.temp.Ln;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/simple/BitmapRequest.class */
public class BitmapRequest extends SpiceRequest<Bitmap> implements IBitmapRequest {
    private static final int BUF_SIZE = 4096;
    private String url;
    private BitmapFactory.Options options;
    private File cacheFile;
    private int height;
    private int width;

    public BitmapRequest(String url, File cacheFile) {
        this(url, new BitmapFactory.Options(), cacheFile);
    }

    public BitmapRequest(String url, BitmapFactory.Options options, File cacheFile) {
        super(Bitmap.class);
        this.height = -1;
        this.width = -1;
        this.url = url;
        this.options = options;
        this.cacheFile = cacheFile;
    }

    public BitmapRequest(String url, int width, int height, File cacheFile) {
        super(Bitmap.class);
        this.height = -1;
        this.width = -1;
        this.url = url;
        this.width = width;
        this.height = height;
        this.cacheFile = cacheFile;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.request.SpiceRequest
    public Bitmap loadDataFromNetwork() throws Exception {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(this.url).openConnection();
            processStream(httpURLConnection.getContentLength(), httpURLConnection.getInputStream());
            if (this.width != -1 && this.height != -1) {
                this.options = new BitmapFactory.Options();
                this.options.inJustDecodeBounds = true;
                BitmapFactory.decodeFile(this.cacheFile.getAbsolutePath(), this.options);
                this.options.inSampleSize = calculateInSampleSize(this.options, this.width, this.height);
                this.options.inJustDecodeBounds = false;
                this.options.inPurgeable = true;
                return BitmapFactory.decodeFile(this.cacheFile.getAbsolutePath(), this.options);
            }
            return BitmapFactory.decodeFile(this.cacheFile.getAbsolutePath(), this.options);
        } catch (MalformedURLException e) {
            Ln.e(e, "Unable to create URL", new Object[0]);
            throw e;
        } catch (IOException e2) {
            Ln.e(e2, "Unable to download binary", new Object[0]);
            throw e2;
        }
    }

    protected final String getUrl() {
        return this.url;
    }

    @Override // com.octo.android.robospice.request.simple.IBitmapRequest
    public File getCacheFile() {
        return this.cacheFile;
    }

    public void processStream(int contentLength, InputStream inputStream) throws IOException {
        OutputStream fileOutputStream = null;
        try {
            boolean isTouchedNow = this.cacheFile.setLastModified(System.currentTimeMillis());
            if (!isTouchedNow) {
                Ln.d("Modification time of file %s could not be changed normally ", new Object[]{this.cacheFile.getAbsolutePath()});
            }
            fileOutputStream = new FileOutputStream(this.cacheFile);
            readBytes(inputStream, new ProgressByteProcessor(this, fileOutputStream, contentLength));
            IOUtils.closeQuietly(fileOutputStream);
        } catch (Throwable th) {
            IOUtils.closeQuietly(fileOutputStream);
            throw th;
        }
    }

    protected void readBytes(InputStream in, ProgressByteProcessor processor) throws IOException {
        int amt;
        byte[] buf = new byte[BUF_SIZE];
        do {
            try {
                amt = in.read(buf);
                if (amt == -1) {
                    break;
                }
            } finally {
                IOUtils.closeQuietly(in);
            }
        } while (processor.processBytes(buf, 0, amt));
    }

    private static int calculateInSampleSize(BitmapFactory.Options options, int reqWidth, int reqHeight) {
        int height = options.outHeight;
        int width = options.outWidth;
        int inSampleSize = 1;
        if (height > reqHeight || width > reqWidth) {
            if (width > height) {
                inSampleSize = Math.round(height / reqHeight);
            } else {
                inSampleSize = Math.round(width / reqWidth);
            }
        }
        return inSampleSize;
    }
}
