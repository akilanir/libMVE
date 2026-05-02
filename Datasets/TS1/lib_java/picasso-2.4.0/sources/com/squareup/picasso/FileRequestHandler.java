package com.squareup.picasso;

import android.content.Context;
import android.media.ExifInterface;
import android.net.Uri;
import com.squareup.picasso.Picasso;
import com.squareup.picasso.RequestHandler;
import java.io.IOException;

/* loaded from: picasso-2.4.0.jar:com/squareup/picasso/FileRequestHandler.class */
class FileRequestHandler extends ContentStreamRequestHandler {
    FileRequestHandler(Context context) {
        super(context);
    }

    @Override // com.squareup.picasso.ContentStreamRequestHandler, com.squareup.picasso.RequestHandler
    public boolean canHandleRequest(Request data) {
        return "file".equals(data.uri.getScheme());
    }

    @Override // com.squareup.picasso.ContentStreamRequestHandler, com.squareup.picasso.RequestHandler
    public RequestHandler.Result load(Request data) throws IOException {
        return new RequestHandler.Result(decodeContentStream(data), Picasso.LoadedFrom.DISK, getFileExifRotation(data.uri));
    }

    static int getFileExifRotation(Uri uri) throws IOException {
        ExifInterface exifInterface = new ExifInterface(uri.getPath());
        int orientation = exifInterface.getAttributeInt("Orientation", 1);
        switch (orientation) {
            case 3:
                return 180;
            case 6:
                return 90;
            case 8:
                return 270;
            default:
                return 0;
        }
    }
}
