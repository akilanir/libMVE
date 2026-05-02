package org.ligi.axt.converter;

import android.annotation.TargetApi;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.provider.DocumentsContract;
import android.provider.MediaStore;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import org.ligi.axt.AXT;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/converter/ImageFromIntentUriToFileConverter.class */
public class ImageFromIntentUriToFileConverter {
    final Context context;

    public ImageFromIntentUriToFileConverter(Context context) {
        this.context = context;
    }

    public File extract(Uri selectedImage) {
        String[] filePathColumn = {"_data", "_display_name"};
        Cursor cursor = this.context.getContentResolver().query(selectedImage, filePathColumn, null, null, null);
        if (selectedImage.toString().startsWith("content://com.android.gallery3d.provider")) {
            selectedImage = Uri.parse(selectedImage.toString().replace("com.android.gallery3d", "com.google.android.gallery3d"));
        }
        if (cursor != null) {
            cursor.moveToFirst();
            int columnIndex = cursor.getColumnIndex("_data");
            if (selectedImage.toString().startsWith("content://com.google.android.gallery3d")) {
                int columnIndex2 = cursor.getColumnIndex("_display_name");
                if (columnIndex2 != -1) {
                    return getBitmap("image_file_name.jpg", selectedImage);
                }
                return null;
            }
            String filePath = cursor.getString(columnIndex);
            if (filePath == null && Build.VERSION.SDK_INT >= 19) {
                filePath = getFilePathForKITKAT(selectedImage);
            }
            cursor.close();
            return new File(filePath);
        }
        if (selectedImage.toString().length() > 0) {
            return getBitmap("image_file_name.jpg", selectedImage);
        }
        return null;
    }

    @TargetApi(19)
    private String getFilePathForKITKAT(Uri selectedImage) {
        String wholeID = DocumentsContract.getDocumentId(selectedImage);
        String id = wholeID.split(":")[1];
        String[] column = {"_data"};
        Cursor innerCursor = this.context.getContentResolver().query(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, column, "_id=?", new String[]{id}, null);
        int columnIndex = innerCursor.getColumnIndex(column[0]);
        if (innerCursor.moveToFirst()) {
            return innerCursor.getString(columnIndex);
        }
        return null;
    }

    private File getBitmap(String tag, Uri url) {
        File cacheDir = this.context.getCacheDir();
        if (!cacheDir.exists()) {
            cacheDir.mkdirs();
        }
        File f = new File(cacheDir, tag);
        try {
            InputStream is = getInputStreamByURL(url);
            AXT.at(is).toFile(f);
            return f;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    private InputStream getInputStreamByURL(Uri url) throws IOException {
        if (url.toString().startsWith("content://com.google.android.gallery3d")) {
            return this.context.getContentResolver().openInputStream(url);
        }
        return new URL(url.toString()).openStream();
    }
}
