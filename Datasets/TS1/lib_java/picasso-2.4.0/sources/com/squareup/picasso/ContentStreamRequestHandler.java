package com.squareup.picasso;

import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import com.squareup.picasso.Picasso;
import com.squareup.picasso.RequestHandler;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: picasso-2.4.0.jar:com/squareup/picasso/ContentStreamRequestHandler.class */
class ContentStreamRequestHandler extends RequestHandler {
    final Context context;

    ContentStreamRequestHandler(Context context) {
        this.context = context;
    }

    @Override // com.squareup.picasso.RequestHandler
    public boolean canHandleRequest(Request data) {
        return "content".equals(data.uri.getScheme());
    }

    @Override // com.squareup.picasso.RequestHandler
    public RequestHandler.Result load(Request data) throws IOException {
        return new RequestHandler.Result(decodeContentStream(data), Picasso.LoadedFrom.DISK);
    }

    protected Bitmap decodeContentStream(Request data) throws IOException {
        ContentResolver contentResolver = this.context.getContentResolver();
        BitmapFactory.Options options = createBitmapOptions(data);
        if (requiresInSampleSize(options)) {
            InputStream is = null;
            try {
                is = contentResolver.openInputStream(data.uri);
                BitmapFactory.decodeStream(is, null, options);
                Utils.closeQuietly(is);
                calculateInSampleSize(data.targetWidth, data.targetHeight, options, data);
            } catch (Throwable th) {
                Utils.closeQuietly(is);
                throw th;
            }
        }
        InputStream is2 = contentResolver.openInputStream(data.uri);
        try {
            Bitmap decodeStream = BitmapFactory.decodeStream(is2, null, options);
            Utils.closeQuietly(is2);
            return decodeStream;
        } catch (Throwable th2) {
            Utils.closeQuietly(is2);
            throw th2;
        }
    }
}
