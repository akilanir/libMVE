package com.theartofdev.edmodo.cropper;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.media.ExifInterface;
import android.net.Uri;
import android.util.Pair;
import java.io.Closeable;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;

/* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/BitmapUtils.class */
final class BitmapUtils {
    static final Rect EMPTY_RECT = new Rect();
    static final RectF EMPTY_RECT_F = new RectF();
    static final RectF RECT = new RectF();
    static int mMaxTextureSize;
    static Pair<String, WeakReference<Bitmap>> mStateBitmap;

    BitmapUtils() {
    }

    public static RotateBitmapResult rotateBitmapByExif(Bitmap bitmap, Context context, Uri uri) {
        try {
            File file = getFileFromUri(context, uri);
            if (file.exists()) {
                ExifInterface ei = new ExifInterface(file.getAbsolutePath());
                return rotateBitmapByExif(bitmap, ei);
            }
        } catch (Exception e) {
        }
        return new RotateBitmapResult(bitmap, 0);
    }

    public static RotateBitmapResult rotateBitmapByExif(Bitmap bitmap, ExifInterface exif) {
        int degrees;
        int orientation = exif.getAttributeInt("Orientation", 1);
        switch (orientation) {
            case 3:
                degrees = 180;
                break;
            case 6:
                degrees = 90;
                break;
            case 8:
                degrees = 270;
                break;
            default:
                degrees = 0;
                break;
        }
        return new RotateBitmapResult(bitmap, degrees);
    }

    public static DecodeBitmapResult decodeSampledBitmap(Context context, Uri uri, int reqWidth, int reqHeight) {
        try {
            ContentResolver resolver = context.getContentResolver();
            BitmapFactory.Options options = decodeImageForOption(resolver, uri);
            options.inSampleSize = Math.max(calculateInSampleSizeByReqestedSize(options.outWidth, options.outHeight, reqWidth, reqHeight), calculateInSampleSizeByMaxTextureSize(options.outWidth, options.outHeight));
            Bitmap bitmap = decodeImage(resolver, uri, options);
            return new DecodeBitmapResult(bitmap, options.inSampleSize);
        } catch (Exception e) {
            throw new RuntimeException("Failed to load sampled bitmap: " + uri, e);
        }
    }

    public static Bitmap cropBitmap(Bitmap bitmap, float[] points, int degreesRotated, boolean fixAspectRatio, int aspectRatioX, int aspectRatioY) {
        Rect rect = getRectFromPoints(points, bitmap.getWidth(), bitmap.getHeight(), fixAspectRatio, aspectRatioX, aspectRatioY);
        Matrix matrix = new Matrix();
        matrix.setRotate(degreesRotated, bitmap.getWidth() / 2, bitmap.getHeight() / 2);
        Bitmap result = Bitmap.createBitmap(bitmap, rect.left, rect.top, rect.width(), rect.height(), matrix, true);
        if (result == bitmap) {
            result = bitmap.copy(bitmap.getConfig(), false);
        }
        if (degreesRotated % 90 != 0) {
            result = cropForRotatedImage(result, points, rect, degreesRotated, fixAspectRatio, aspectRatioX, aspectRatioY);
        }
        return result;
    }

    public static Bitmap cropBitmap(Context context, Uri loadedImageUri, float[] points, int degreesRotated, int orgWidth, int orgHeight, boolean fixAspectRatio, int aspectRatioX, int aspectRatioY, int reqWidth, int reqHeight) {
        Rect rect = getRectFromPoints(points, orgWidth, orgHeight, fixAspectRatio, aspectRatioX, aspectRatioY);
        int width = reqWidth > 0 ? reqWidth : rect.width();
        int height = reqHeight > 0 ? reqHeight : rect.height();
        Bitmap result = null;
        try {
            result = decodeSampledBitmapRegion(context, loadedImageUri, rect, width, height);
        } catch (Exception e) {
        }
        if (result != null) {
            result = rotateBitmapInt(result, degreesRotated);
            if (degreesRotated % 90 != 0) {
                result = cropForRotatedImage(result, points, rect, degreesRotated, fixAspectRatio, aspectRatioX, aspectRatioY);
            }
        } else {
            try {
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inSampleSize = calculateInSampleSizeByReqestedSize(rect.width(), rect.height(), reqWidth, reqHeight);
                Bitmap fullBitmap = decodeImage(context.getContentResolver(), loadedImageUri, options);
                if (fullBitmap != null) {
                    result = cropBitmap(fullBitmap, points, degreesRotated, fixAspectRatio, aspectRatioX, aspectRatioY);
                    fullBitmap.recycle();
                }
            } catch (Exception e2) {
                throw new RuntimeException("Failed to load sampled bitmap: " + loadedImageUri, e2);
            }
        }
        return result;
    }

    public static Rect getRectFromPoints(float[] points, int imageWidth, int imageHeight, boolean fixAspectRatio, int aspectRatioX, int aspectRatioY) {
        int left = Math.round(Math.max(0.0f, Math.min(Math.min(Math.min(points[0], points[2]), points[4]), points[6])));
        int top = Math.round(Math.max(0.0f, Math.min(Math.min(Math.min(points[1], points[3]), points[5]), points[7])));
        int right = Math.round(Math.min(imageWidth, Math.max(Math.max(Math.max(points[0], points[2]), points[4]), points[6])));
        int bottom = Math.round(Math.min(imageHeight, Math.max(Math.max(Math.max(points[1], points[3]), points[5]), points[7])));
        Rect rect = new Rect(left, top, right, bottom);
        if (fixAspectRatio) {
            fixRectForAspectRatio(rect, aspectRatioX, aspectRatioY);
        }
        return rect;
    }

    public static void fixRectForAspectRatio(Rect rect, int aspectRatioX, int aspectRatioY) {
        if (aspectRatioX == aspectRatioY && rect.width() != rect.height()) {
            if (rect.height() > rect.width()) {
                rect.bottom -= rect.height() - rect.width();
            } else {
                rect.right -= rect.width() - rect.height();
            }
        }
    }

    public static void writeBitmapToUri(Context context, Bitmap bitmap, Uri uri, Bitmap.CompressFormat compressFormat, int compressQuality) throws FileNotFoundException {
        OutputStream outputStream = null;
        try {
            outputStream = context.getContentResolver().openOutputStream(uri);
            bitmap.compress(compressFormat, compressQuality, outputStream);
            closeSafe(outputStream);
        } catch (Throwable th) {
            closeSafe(outputStream);
            throw th;
        }
    }

    private static BitmapFactory.Options decodeImageForOption(ContentResolver resolver, Uri uri) throws FileNotFoundException {
        InputStream stream = null;
        try {
            stream = resolver.openInputStream(uri);
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeStream(stream, EMPTY_RECT, options);
            options.inJustDecodeBounds = false;
            closeSafe(stream);
            return options;
        } catch (Throwable th) {
            closeSafe(stream);
            throw th;
        }
    }

    private static Bitmap decodeImage(ContentResolver resolver, Uri uri, BitmapFactory.Options options) throws FileNotFoundException {
        do {
            InputStream stream = null;
            try {
                try {
                    stream = resolver.openInputStream(uri);
                    Bitmap decodeStream = BitmapFactory.decodeStream(stream, EMPTY_RECT, options);
                    closeSafe(stream);
                    return decodeStream;
                } catch (OutOfMemoryError e) {
                    options.inSampleSize *= 2;
                    closeSafe(stream);
                }
            } catch (Throwable th) {
                closeSafe(stream);
                throw th;
            }
        } while (options.inSampleSize <= 512);
        throw new RuntimeException("Failed to decode image: " + uri);
    }

    private static Bitmap decodeSampledBitmapRegion(Context context, Uri uri, Rect rect, int reqWidth, int reqHeight) {
        InputStream stream = null;
        BitmapRegionDecoder decoder = null;
        try {
            try {
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inSampleSize = calculateInSampleSizeByReqestedSize(rect.width(), rect.height(), reqWidth, reqHeight);
                stream = context.getContentResolver().openInputStream(uri);
                decoder = BitmapRegionDecoder.newInstance(stream, false);
                do {
                    try {
                        Bitmap decodeRegion = decoder.decodeRegion(rect, options);
                        closeSafe(stream);
                        if (decoder != null) {
                            decoder.recycle();
                        }
                        return decodeRegion;
                    } catch (OutOfMemoryError e) {
                        options.inSampleSize *= 2;
                    }
                } while (options.inSampleSize <= 512);
                closeSafe(stream);
                if (decoder != null) {
                    decoder.recycle();
                    return null;
                }
                return null;
            } catch (Exception e2) {
                throw new RuntimeException("Failed to load sampled bitmap: " + uri, e2);
            }
        } catch (Throwable th) {
            closeSafe(stream);
            if (decoder != null) {
                decoder.recycle();
            }
            throw th;
        }
    }

    private static Bitmap cropForRotatedImage(Bitmap bitmap, float[] points, Rect rect, int degreesRotated, boolean fixAspectRatio, int aspectRatioX, int aspectRatioY) {
        if (degreesRotated % 90 != 0) {
            int adjLeft = 0;
            int adjTop = 0;
            int width = 0;
            int height = 0;
            double rads = Math.toRadians(degreesRotated);
            int compareTo = (degreesRotated < 90 || (degreesRotated > 180 && degreesRotated < 270)) ? rect.left : rect.right;
            int i = 0;
            while (true) {
                if (i >= points.length) {
                    break;
                }
                if (((int) points[i]) != compareTo) {
                    i += 2;
                } else {
                    adjLeft = (int) Math.abs(Math.sin(rads) * (rect.bottom - points[i + 1]));
                    adjTop = (int) Math.abs(Math.cos(rads) * (points[i + 1] - rect.top));
                    width = (int) Math.abs((points[i + 1] - rect.top) / Math.sin(rads));
                    height = (int) Math.abs((rect.bottom - points[i + 1]) / Math.cos(rads));
                    break;
                }
            }
            rect.set(adjLeft, adjTop, adjLeft + width, adjTop + height);
            if (fixAspectRatio) {
                fixRectForAspectRatio(rect, aspectRatioX, aspectRatioY);
            }
            bitmap = Bitmap.createBitmap(bitmap, rect.left, rect.top, rect.width(), rect.height());
            bitmap.recycle();
        }
        return bitmap;
    }

    private static int calculateInSampleSizeByReqestedSize(int width, int height, int reqWidth, int reqHeight) {
        int inSampleSize = 1;
        if (height > reqHeight || width > reqWidth) {
            while ((height / 2) / inSampleSize > reqHeight && (width / 2) / inSampleSize > reqWidth) {
                inSampleSize *= 2;
            }
        }
        return inSampleSize;
    }

    private static int calculateInSampleSizeByMaxTextureSize(int width, int height) {
        int inSampleSize = 1;
        if (mMaxTextureSize == 0) {
            mMaxTextureSize = getMaxTextureSize();
        }
        if (mMaxTextureSize > 0) {
            while (true) {
                if (height / inSampleSize <= mMaxTextureSize && width / inSampleSize <= mMaxTextureSize) {
                    break;
                }
                inSampleSize *= 2;
            }
        }
        return inSampleSize;
    }

    private static File getFileFromUri(Context context, Uri uri) {
        File file = new File(uri.getPath());
        if (file.exists()) {
            return file;
        }
        Cursor cursor = null;
        try {
            String[] proj = {"_data"};
            cursor = context.getContentResolver().query(uri, proj, null, null, null);
            int column_index = cursor.getColumnIndexOrThrow("_data");
            cursor.moveToFirst();
            String realPath = cursor.getString(column_index);
            file = new File(realPath);
            if (cursor != null) {
                cursor.close();
            }
        } catch (Exception e) {
            if (cursor != null) {
                cursor.close();
            }
        } catch (Throwable th) {
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
        return file;
    }

    private static Bitmap rotateBitmapInt(Bitmap bitmap, int degrees) {
        if (degrees > 0) {
            Matrix matrix = new Matrix();
            matrix.setRotate(degrees);
            Bitmap newBitmap = Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, false);
            if (newBitmap != bitmap) {
                bitmap.recycle();
            }
            return newBitmap;
        }
        return bitmap;
    }

    private static int getMaxTextureSize() {
        try {
            EGL10 egl = (EGL10) EGLContext.getEGL();
            EGLDisplay display = egl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            int[] version = new int[2];
            egl.eglInitialize(display, version);
            int[] totalConfigurations = new int[1];
            egl.eglGetConfigs(display, null, 0, totalConfigurations);
            EGLConfig[] configurationsList = new EGLConfig[totalConfigurations[0]];
            egl.eglGetConfigs(display, configurationsList, totalConfigurations[0], totalConfigurations);
            int[] textureSize = new int[1];
            int maximumTextureSize = 0;
            for (int i = 0; i < totalConfigurations[0]; i++) {
                egl.eglGetConfigAttrib(display, configurationsList[i], 12332, textureSize);
                if (maximumTextureSize < textureSize[0]) {
                    maximumTextureSize = textureSize[0];
                }
            }
            egl.eglTerminate(display);
            return Math.max(maximumTextureSize, 2048);
        } catch (Exception e) {
            return 2048;
        }
    }

    private static void closeSafe(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
            }
        }
    }

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/BitmapUtils$DecodeBitmapResult.class */
    public static final class DecodeBitmapResult {
        public final Bitmap bitmap;
        public final int sampleSize;

        DecodeBitmapResult(Bitmap bitmap, int sampleSize) {
            this.sampleSize = sampleSize;
            this.bitmap = bitmap;
        }
    }

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult.class */
    public static final class RotateBitmapResult {
        public final Bitmap bitmap;
        public final int degrees;

        RotateBitmapResult(Bitmap bitmap, int degrees) {
            this.bitmap = bitmap;
            this.degrees = degrees;
        }
    }
}
