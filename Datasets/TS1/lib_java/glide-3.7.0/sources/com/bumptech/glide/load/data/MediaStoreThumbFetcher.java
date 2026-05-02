package com.bumptech.glide.load.data;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore;
import android.text.TextUtils;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.resource.bitmap.ImageHeaderParser;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/data/MediaStoreThumbFetcher.class */
public class MediaStoreThumbFetcher implements DataFetcher<InputStream> {
    private static final String TAG = "MediaStoreThumbFetcher";
    private static final int MINI_WIDTH = 512;
    private static final int MINI_HEIGHT = 384;
    private static final ThumbnailStreamOpenerFactory DEFAULT_FACTORY = new ThumbnailStreamOpenerFactory();
    private final Context context;
    private final Uri mediaStoreUri;
    private final DataFetcher<InputStream> defaultFetcher;
    private final int width;
    private final int height;
    private final ThumbnailStreamOpenerFactory factory;
    private InputStream inputStream;

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailQuery.class */
    interface ThumbnailQuery {
        Cursor queryPath(Context context, Uri uri);
    }

    public MediaStoreThumbFetcher(Context context, Uri mediaStoreUri, DataFetcher<InputStream> defaultFetcher, int width, int height) {
        this(context, mediaStoreUri, defaultFetcher, width, height, DEFAULT_FACTORY);
    }

    MediaStoreThumbFetcher(Context context, Uri mediaStoreUri, DataFetcher<InputStream> defaultFetcher, int width, int height, ThumbnailStreamOpenerFactory factory) {
        this.context = context;
        this.mediaStoreUri = mediaStoreUri;
        this.defaultFetcher = defaultFetcher;
        this.width = width;
        this.height = height;
        this.factory = factory;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.load.data.DataFetcher
    public InputStream loadData(Priority priority) throws Exception {
        ThumbnailStreamOpener fetcher = this.factory.build(this.mediaStoreUri, this.width, this.height);
        if (fetcher != null) {
            this.inputStream = openThumbInputStream(fetcher);
        }
        if (this.inputStream == null) {
            this.inputStream = this.defaultFetcher.loadData(priority);
        }
        return this.inputStream;
    }

    private InputStream openThumbInputStream(ThumbnailStreamOpener fetcher) {
        InputStream result = null;
        try {
            result = fetcher.open(this.context, this.mediaStoreUri);
        } catch (FileNotFoundException e) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to find thumbnail file", e);
            }
        }
        int orientation = -1;
        if (result != null) {
            orientation = fetcher.getOrientation(this.context, this.mediaStoreUri);
        }
        if (orientation != -1) {
            result = new ExifOrientationStream(result, orientation);
        }
        return result;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void cleanup() {
        if (this.inputStream != null) {
            try {
                this.inputStream.close();
            } catch (IOException e) {
            }
        }
        this.defaultFetcher.cleanup();
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public String getId() {
        return this.mediaStoreUri.toString();
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void cancel() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isMediaStoreUri(Uri uri) {
        return uri != null && "content".equals(uri.getScheme()) && "media".equals(uri.getAuthority());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isMediaStoreVideo(Uri uri) {
        return isMediaStoreUri(uri) && uri.getPathSegments().contains("video");
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService.class */
    static class FileService {
        FileService() {
        }

        public boolean exists(File file) {
            return file.exists();
        }

        public long length(File file) {
            return file.length();
        }

        public File get(String path) {
            return new File(path);
        }
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailStreamOpener.class */
    static class ThumbnailStreamOpener {
        private static final FileService DEFAULT_SERVICE = new FileService();
        private final FileService service;
        private ThumbnailQuery query;

        public ThumbnailStreamOpener(ThumbnailQuery query) {
            this(DEFAULT_SERVICE, query);
        }

        public ThumbnailStreamOpener(FileService service, ThumbnailQuery query) {
            this.service = service;
            this.query = query;
        }

        public int getOrientation(Context context, Uri uri) {
            int orientation = -1;
            InputStream is = null;
            try {
                try {
                    is = context.getContentResolver().openInputStream(uri);
                    orientation = new ImageHeaderParser(is).getOrientation();
                    if (is != null) {
                        try {
                            is.close();
                        } catch (IOException e) {
                        }
                    }
                } catch (Throwable th) {
                    if (is != null) {
                        try {
                            is.close();
                        } catch (IOException e2) {
                        }
                    }
                    throw th;
                }
            } catch (IOException e3) {
                if (Log.isLoggable(MediaStoreThumbFetcher.TAG, 3)) {
                    Log.d(MediaStoreThumbFetcher.TAG, "Failed to open uri: " + uri, e3);
                }
                if (is != null) {
                    try {
                        is.close();
                    } catch (IOException e4) {
                    }
                }
            }
            return orientation;
        }

        public InputStream open(Context context, Uri uri) throws FileNotFoundException {
            Uri thumbnailUri = null;
            InputStream inputStream = null;
            Cursor cursor = this.query.queryPath(context, uri);
            if (cursor != null) {
                try {
                    if (cursor.moveToFirst()) {
                        thumbnailUri = parseThumbUri(cursor);
                    }
                } finally {
                    if (cursor != null) {
                        cursor.close();
                    }
                }
            }
            if (thumbnailUri != null) {
                inputStream = context.getContentResolver().openInputStream(thumbnailUri);
            }
            return inputStream;
        }

        private Uri parseThumbUri(Cursor cursor) {
            Uri result = null;
            String path = cursor.getString(0);
            if (!TextUtils.isEmpty(path)) {
                File file = this.service.get(path);
                if (this.service.exists(file) && this.service.length(file) > 0) {
                    result = Uri.fromFile(file);
                }
            }
            return result;
        }
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/data/MediaStoreThumbFetcher$ImageThumbnailQuery.class */
    static class ImageThumbnailQuery implements ThumbnailQuery {
        private static final String[] PATH_PROJECTION = {"_data"};
        private static final String PATH_SELECTION = "kind = 1 AND image_id = ?";

        ImageThumbnailQuery() {
        }

        @Override // com.bumptech.glide.load.data.MediaStoreThumbFetcher.ThumbnailQuery
        public Cursor queryPath(Context context, Uri uri) {
            String imageId = uri.getLastPathSegment();
            return context.getContentResolver().query(MediaStore.Images.Thumbnails.EXTERNAL_CONTENT_URI, PATH_PROJECTION, PATH_SELECTION, new String[]{imageId}, null);
        }
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/data/MediaStoreThumbFetcher$VideoThumbnailQuery.class */
    static class VideoThumbnailQuery implements ThumbnailQuery {
        private static final String[] PATH_PROJECTION = {"_data"};
        private static final String PATH_SELECTION = "kind = 1 AND video_id = ?";

        VideoThumbnailQuery() {
        }

        @Override // com.bumptech.glide.load.data.MediaStoreThumbFetcher.ThumbnailQuery
        public Cursor queryPath(Context context, Uri uri) {
            String videoId = uri.getLastPathSegment();
            return context.getContentResolver().query(MediaStore.Video.Thumbnails.EXTERNAL_CONTENT_URI, PATH_PROJECTION, PATH_SELECTION, new String[]{videoId}, null);
        }
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailStreamOpenerFactory.class */
    static class ThumbnailStreamOpenerFactory {
        ThumbnailStreamOpenerFactory() {
        }

        public ThumbnailStreamOpener build(Uri uri, int width, int height) {
            if (MediaStoreThumbFetcher.isMediaStoreUri(uri) && width <= MediaStoreThumbFetcher.MINI_WIDTH && height <= MediaStoreThumbFetcher.MINI_HEIGHT) {
                if (MediaStoreThumbFetcher.isMediaStoreVideo(uri)) {
                    return new ThumbnailStreamOpener(new VideoThumbnailQuery());
                }
                return new ThumbnailStreamOpener(new ImageThumbnailQuery());
            }
            return null;
        }
    }
}
