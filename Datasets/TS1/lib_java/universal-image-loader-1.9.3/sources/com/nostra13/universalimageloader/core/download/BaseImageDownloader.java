package com.nostra13.universalimageloader.core.download;

import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.provider.ContactsContract;
import android.provider.MediaStore;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;
import com.nostra13.universalimageloader.core.assist.ContentLengthInputStream;
import com.nostra13.universalimageloader.core.download.ImageDownloader;
import com.nostra13.universalimageloader.utils.IoUtils;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/download/BaseImageDownloader.class */
public class BaseImageDownloader implements ImageDownloader {
    public static final int DEFAULT_HTTP_CONNECT_TIMEOUT = 5000;
    public static final int DEFAULT_HTTP_READ_TIMEOUT = 20000;
    protected static final int BUFFER_SIZE = 32768;
    protected static final String ALLOWED_URI_CHARS = "@#&=*+-_.,:!?()/~'%";
    protected static final int MAX_REDIRECT_COUNT = 5;
    protected static final String CONTENT_CONTACTS_URI_PREFIX = "content://com.android.contacts/";
    private static final String ERROR_UNSUPPORTED_SCHEME = "UIL doesn't support scheme(protocol) by default [%s]. You should implement this support yourself (BaseImageDownloader.getStreamFromOtherSource(...))";
    protected final Context context;
    protected final int connectTimeout;
    protected final int readTimeout;

    public BaseImageDownloader(Context context) {
        this.context = context.getApplicationContext();
        this.connectTimeout = DEFAULT_HTTP_CONNECT_TIMEOUT;
        this.readTimeout = DEFAULT_HTTP_READ_TIMEOUT;
    }

    public BaseImageDownloader(Context context, int connectTimeout, int readTimeout) {
        this.context = context.getApplicationContext();
        this.connectTimeout = connectTimeout;
        this.readTimeout = readTimeout;
    }

    /* renamed from: com.nostra13.universalimageloader.core.download.BaseImageDownloader$1, reason: invalid class name */
    /* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/download/BaseImageDownloader$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme = new int[ImageDownloader.Scheme.values().length];

        static {
            try {
                $SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[ImageDownloader.Scheme.HTTP.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[ImageDownloader.Scheme.HTTPS.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[ImageDownloader.Scheme.FILE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[ImageDownloader.Scheme.CONTENT.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[ImageDownloader.Scheme.ASSETS.ordinal()] = BaseImageDownloader.MAX_REDIRECT_COUNT;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[ImageDownloader.Scheme.DRAWABLE.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[ImageDownloader.Scheme.UNKNOWN.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
        }
    }

    @Override // com.nostra13.universalimageloader.core.download.ImageDownloader
    public InputStream getStream(String imageUri, Object extra) throws IOException {
        switch (AnonymousClass1.$SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[ImageDownloader.Scheme.ofUri(imageUri).ordinal()]) {
            case 1:
            case 2:
                return getStreamFromNetwork(imageUri, extra);
            case ImageLoaderConfiguration.Builder.DEFAULT_THREAD_POOL_SIZE /* 3 */:
                return getStreamFromFile(imageUri, extra);
            case ImageLoaderConfiguration.Builder.DEFAULT_THREAD_PRIORITY /* 4 */:
                return getStreamFromContent(imageUri, extra);
            case MAX_REDIRECT_COUNT /* 5 */:
                return getStreamFromAssets(imageUri, extra);
            case 6:
                return getStreamFromDrawable(imageUri, extra);
            case 7:
            default:
                return getStreamFromOtherSource(imageUri, extra);
        }
    }

    protected InputStream getStreamFromNetwork(String imageUri, Object extra) throws IOException {
        HttpURLConnection conn = createConnection(imageUri, extra);
        for (int redirectCount = 0; conn.getResponseCode() / 100 == 3 && redirectCount < MAX_REDIRECT_COUNT; redirectCount++) {
            conn = createConnection(conn.getHeaderField("Location"), extra);
        }
        try {
            InputStream imageStream = conn.getInputStream();
            return new ContentLengthInputStream(new BufferedInputStream(imageStream, 32768), conn.getContentLength());
        } catch (IOException e) {
            IoUtils.readAndCloseStream(conn.getErrorStream());
            throw e;
        }
    }

    protected HttpURLConnection createConnection(String url, Object extra) throws IOException {
        String encodedUrl = Uri.encode(url, ALLOWED_URI_CHARS);
        HttpURLConnection conn = (HttpURLConnection) new URL(encodedUrl).openConnection();
        conn.setConnectTimeout(this.connectTimeout);
        conn.setReadTimeout(this.readTimeout);
        return conn;
    }

    protected InputStream getStreamFromFile(String imageUri, Object extra) throws IOException {
        String filePath = ImageDownloader.Scheme.FILE.crop(imageUri);
        return new ContentLengthInputStream(new BufferedInputStream(new FileInputStream(filePath), 32768), (int) new File(filePath).length());
    }

    protected InputStream getStreamFromContent(String imageUri, Object extra) throws FileNotFoundException {
        ContentResolver res = this.context.getContentResolver();
        Uri uri = Uri.parse(imageUri);
        if (isVideoUri(uri)) {
            Long origId = Long.valueOf(uri.getLastPathSegment());
            Bitmap bitmap = MediaStore.Video.Thumbnails.getThumbnail(res, origId.longValue(), 1, null);
            if (bitmap != null) {
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                bitmap.compress(Bitmap.CompressFormat.PNG, 0, bos);
                return new ByteArrayInputStream(bos.toByteArray());
            }
        } else if (imageUri.startsWith(CONTENT_CONTACTS_URI_PREFIX)) {
            return ContactsContract.Contacts.openContactPhotoInputStream(res, uri);
        }
        return res.openInputStream(uri);
    }

    protected InputStream getStreamFromAssets(String imageUri, Object extra) throws IOException {
        String filePath = ImageDownloader.Scheme.ASSETS.crop(imageUri);
        return this.context.getAssets().open(filePath);
    }

    protected InputStream getStreamFromDrawable(String imageUri, Object extra) {
        String drawableIdString = ImageDownloader.Scheme.DRAWABLE.crop(imageUri);
        int drawableId = Integer.parseInt(drawableIdString);
        return this.context.getResources().openRawResource(drawableId);
    }

    protected InputStream getStreamFromOtherSource(String imageUri, Object extra) throws IOException {
        throw new UnsupportedOperationException(String.format(ERROR_UNSUPPORTED_SCHEME, imageUri));
    }

    private boolean isVideoUri(Uri uri) {
        String mimeType = this.context.getContentResolver().getType(uri);
        if (mimeType == null) {
            return false;
        }
        return mimeType.startsWith("video/");
    }
}
