package com.bumptech.glide.load.resource.bitmap;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.media.ExifInterface;
import android.os.Build;
import android.util.Log;
import com.bumptech.glide.gifdecoder.GifDecoder;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/resource/bitmap/TransformationUtils.class */
public final class TransformationUtils {
    private static final String TAG = "TransformationUtils";
    public static final int PAINT_FLAGS = 7;

    private TransformationUtils() {
    }

    public static Bitmap centerCrop(Bitmap recycled, Bitmap toCrop, int width, int height) {
        float scale;
        Bitmap result;
        if (toCrop == null) {
            return null;
        }
        if (toCrop.getWidth() == width && toCrop.getHeight() == height) {
            return toCrop;
        }
        float dx = 0.0f;
        float dy = 0.0f;
        Matrix m = new Matrix();
        if (toCrop.getWidth() * height > width * toCrop.getHeight()) {
            scale = height / toCrop.getHeight();
            dx = (width - (toCrop.getWidth() * scale)) * 0.5f;
        } else {
            scale = width / toCrop.getWidth();
            dy = (height - (toCrop.getHeight() * scale)) * 0.5f;
        }
        m.setScale(scale, scale);
        m.postTranslate((int) (dx + 0.5f), (int) (dy + 0.5f));
        if (recycled != null) {
            result = recycled;
        } else {
            result = Bitmap.createBitmap(width, height, getSafeConfig(toCrop));
        }
        setAlpha(toCrop, result);
        Canvas canvas = new Canvas(result);
        Paint paint = new Paint(7);
        canvas.drawBitmap(toCrop, m, paint);
        return result;
    }

    public static Bitmap fitCenter(Bitmap toFit, BitmapPool pool, int width, int height) {
        if (toFit.getWidth() == width && toFit.getHeight() == height) {
            if (Log.isLoggable(TAG, 2)) {
                Log.v(TAG, "requested target size matches input, returning input");
            }
            return toFit;
        }
        float widthPercentage = width / toFit.getWidth();
        float heightPercentage = height / toFit.getHeight();
        float minPercentage = Math.min(widthPercentage, heightPercentage);
        int targetWidth = (int) (minPercentage * toFit.getWidth());
        int targetHeight = (int) (minPercentage * toFit.getHeight());
        if (toFit.getWidth() == targetWidth && toFit.getHeight() == targetHeight) {
            if (Log.isLoggable(TAG, 2)) {
                Log.v(TAG, "adjusted target size matches input, returning input");
            }
            return toFit;
        }
        Bitmap.Config config = getSafeConfig(toFit);
        Bitmap toReuse = pool.get(targetWidth, targetHeight, config);
        if (toReuse == null) {
            toReuse = Bitmap.createBitmap(targetWidth, targetHeight, config);
        }
        setAlpha(toFit, toReuse);
        if (Log.isLoggable(TAG, 2)) {
            Log.v(TAG, "request: " + width + "x" + height);
            Log.v(TAG, "toFit:   " + toFit.getWidth() + "x" + toFit.getHeight());
            Log.v(TAG, "toReuse: " + toReuse.getWidth() + "x" + toReuse.getHeight());
            Log.v(TAG, "minPct:   " + minPercentage);
        }
        Canvas canvas = new Canvas(toReuse);
        Matrix matrix = new Matrix();
        matrix.setScale(minPercentage, minPercentage);
        Paint paint = new Paint(7);
        canvas.drawBitmap(toFit, matrix, paint);
        return toReuse;
    }

    @TargetApi(12)
    public static void setAlpha(Bitmap toTransform, Bitmap outBitmap) {
        if (Build.VERSION.SDK_INT >= 12 && outBitmap != null) {
            outBitmap.setHasAlpha(toTransform.hasAlpha());
        }
    }

    @Deprecated
    @TargetApi(5)
    public static int getOrientation(String pathToOriginal) {
        try {
            ExifInterface exif = new ExifInterface(pathToOriginal);
            int orientation = exif.getAttributeInt("Orientation", 0);
            return getExifOrientationDegrees(orientation);
        } catch (Exception e) {
            if (Log.isLoggable(TAG, 6)) {
                Log.e(TAG, "Unable to get orientation for image with path=" + pathToOriginal, e);
            }
            return 0;
        }
    }

    @Deprecated
    public static Bitmap orientImage(String pathToOriginal, Bitmap imageToOrient) {
        int degreesToRotate = getOrientation(pathToOriginal);
        return rotateImage(imageToOrient, degreesToRotate);
    }

    public static Bitmap rotateImage(Bitmap imageToOrient, int degreesToRotate) {
        Bitmap result = imageToOrient;
        if (degreesToRotate != 0) {
            try {
                Matrix matrix = new Matrix();
                matrix.setRotate(degreesToRotate);
                result = Bitmap.createBitmap(imageToOrient, 0, 0, imageToOrient.getWidth(), imageToOrient.getHeight(), matrix, true);
            } catch (Exception e) {
                if (Log.isLoggable(TAG, 6)) {
                    Log.e(TAG, "Exception when trying to orient image", e);
                }
            }
        }
        return result;
    }

    public static int getExifOrientationDegrees(int exifOrientation) {
        int degreesToRotate;
        switch (exifOrientation) {
            case GifDecoder.STATUS_PARTIAL_DECODE /* 3 */:
            case 4:
                degreesToRotate = 180;
                break;
            case 5:
            case 6:
                degreesToRotate = 90;
                break;
            case PAINT_FLAGS /* 7 */:
            case 8:
                degreesToRotate = 270;
                break;
            default:
                degreesToRotate = 0;
                break;
        }
        return degreesToRotate;
    }

    public static Bitmap rotateImageExif(Bitmap toOrient, BitmapPool pool, int exifOrientation) {
        Matrix matrix = new Matrix();
        initializeMatrixForRotation(exifOrientation, matrix);
        if (matrix.isIdentity()) {
            return toOrient;
        }
        RectF newRect = new RectF(0.0f, 0.0f, toOrient.getWidth(), toOrient.getHeight());
        matrix.mapRect(newRect);
        int newWidth = Math.round(newRect.width());
        int newHeight = Math.round(newRect.height());
        Bitmap.Config config = getSafeConfig(toOrient);
        Bitmap result = pool.get(newWidth, newHeight, config);
        if (result == null) {
            result = Bitmap.createBitmap(newWidth, newHeight, config);
        }
        matrix.postTranslate(-newRect.left, -newRect.top);
        Canvas canvas = new Canvas(result);
        Paint paint = new Paint(7);
        canvas.drawBitmap(toOrient, matrix, paint);
        return result;
    }

    private static Bitmap.Config getSafeConfig(Bitmap bitmap) {
        return bitmap.getConfig() != null ? bitmap.getConfig() : Bitmap.Config.ARGB_8888;
    }

    static void initializeMatrixForRotation(int exifOrientation, Matrix matrix) {
        switch (exifOrientation) {
            case 2:
                matrix.setScale(-1.0f, 1.0f);
                break;
            case GifDecoder.STATUS_PARTIAL_DECODE /* 3 */:
                matrix.setRotate(180.0f);
                break;
            case 4:
                matrix.setRotate(180.0f);
                matrix.postScale(-1.0f, 1.0f);
                break;
            case 5:
                matrix.setRotate(90.0f);
                matrix.postScale(-1.0f, 1.0f);
                break;
            case 6:
                matrix.setRotate(90.0f);
                break;
            case PAINT_FLAGS /* 7 */:
                matrix.setRotate(-90.0f);
                matrix.postScale(-1.0f, 1.0f);
                break;
            case 8:
                matrix.setRotate(-90.0f);
                break;
        }
    }
}
