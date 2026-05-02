package com.theartofdev.edmodo.cropper;

import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.AsyncTask;
import android.util.DisplayMetrics;
import com.theartofdev.edmodo.cropper.BitmapUtils;
import java.lang.ref.WeakReference;

/* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask.class */
final class BitmapLoadingWorkerTask extends AsyncTask<Void, Void, Result> {
    private final WeakReference<CropImageView> mCropImageViewReference;
    private final Uri mUri;
    private final Context mContext;
    private final int mWidth;
    private final int mHeight;

    public BitmapLoadingWorkerTask(CropImageView cropImageView, Uri uri) {
        this.mUri = uri;
        this.mCropImageViewReference = new WeakReference<>(cropImageView);
        this.mContext = cropImageView.getContext();
        DisplayMetrics metrics = cropImageView.getResources().getDisplayMetrics();
        double densityAdj = metrics.density > 1.0f ? 1.0f / metrics.density : 1.0d;
        this.mWidth = (int) (metrics.widthPixels * densityAdj);
        this.mHeight = (int) (metrics.heightPixels * densityAdj);
    }

    public Uri getUri() {
        return this.mUri;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public Result doInBackground(Void... params) {
        try {
            if (!isCancelled()) {
                BitmapUtils.DecodeBitmapResult decodeResult = BitmapUtils.decodeSampledBitmap(this.mContext, this.mUri, this.mWidth, this.mHeight);
                if (!isCancelled()) {
                    BitmapUtils.RotateBitmapResult rotateResult = BitmapUtils.rotateBitmapByExif(decodeResult.bitmap, this.mContext, this.mUri);
                    return new Result(this.mUri, rotateResult.bitmap, decodeResult.sampleSize, rotateResult.degrees);
                }
                return null;
            }
            return null;
        } catch (Exception e) {
            return new Result(this.mUri, e);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(Result result) {
        CropImageView cropImageView;
        if (result != null) {
            boolean completeCalled = false;
            if (!isCancelled() && (cropImageView = this.mCropImageViewReference.get()) != null) {
                completeCalled = true;
                cropImageView.onSetImageUriAsyncComplete(result);
            }
            if (!completeCalled && result.bitmap != null) {
                result.bitmap.recycle();
            }
        }
    }

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result.class */
    public static final class Result {
        public final Uri uri;
        public final Bitmap bitmap;
        public final int loadSampleSize;
        public final int degreesRotated;
        public final Exception error;

        Result(Uri uri, Bitmap bitmap, int loadSampleSize, int degreesRotated) {
            this.uri = uri;
            this.bitmap = bitmap;
            this.loadSampleSize = loadSampleSize;
            this.degreesRotated = degreesRotated;
            this.error = null;
        }

        Result(Uri uri, Exception error) {
            this.uri = uri;
            this.bitmap = null;
            this.loadSampleSize = 0;
            this.degreesRotated = 0;
            this.error = error;
        }
    }
}
