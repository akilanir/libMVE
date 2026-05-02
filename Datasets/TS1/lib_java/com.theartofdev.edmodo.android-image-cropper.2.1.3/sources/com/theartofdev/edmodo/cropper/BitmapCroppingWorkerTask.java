package com.theartofdev.edmodo.cropper;

import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.AsyncTask;
import java.lang.ref.WeakReference;

/* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask.class */
final class BitmapCroppingWorkerTask extends AsyncTask<Void, Void, Result> {
    private final WeakReference<CropImageView> mCropImageViewReference;
    private final Bitmap mBitmap;
    private final Uri mUri;
    private final Context mContext;
    private final float[] mCropPoints;
    private final int mDegreesRotated;
    private final int mOrgWidth;
    private final int mOrgHeight;
    private final boolean mFixAspectRatio;
    private final int mAspectRatioX;
    private final int mAspectRatioY;
    private final int mReqWidth;
    private final int mReqHeight;
    private final Uri mSaveUri;
    private final Bitmap.CompressFormat mSaveCompressFormat;
    private final int mSaveCompressQuality;

    public BitmapCroppingWorkerTask(CropImageView cropImageView, Bitmap bitmap, float[] cropPoints, int degreesRotated, boolean fixAspectRatio, int aspectRatioX, int aspectRatioY, Uri saveUri, Bitmap.CompressFormat saveCompressFormat, int saveCompressQuality) {
        this.mCropImageViewReference = new WeakReference<>(cropImageView);
        this.mContext = cropImageView.getContext();
        this.mBitmap = bitmap;
        this.mCropPoints = cropPoints;
        this.mUri = null;
        this.mDegreesRotated = degreesRotated;
        this.mFixAspectRatio = fixAspectRatio;
        this.mAspectRatioX = aspectRatioX;
        this.mAspectRatioY = aspectRatioY;
        this.mSaveUri = saveUri;
        this.mSaveCompressFormat = saveCompressFormat;
        this.mSaveCompressQuality = saveCompressQuality;
        this.mOrgWidth = 0;
        this.mOrgHeight = 0;
        this.mReqWidth = 0;
        this.mReqHeight = 0;
    }

    public BitmapCroppingWorkerTask(CropImageView cropImageView, Uri uri, float[] cropPoints, int degreesRotated, int orgWidth, int orgHeight, boolean fixAspectRatio, int aspectRatioX, int aspectRatioY, int reqWidth, int reqHeight, Uri saveUri, Bitmap.CompressFormat saveCompressFormat, int saveCompressQuality) {
        this.mCropImageViewReference = new WeakReference<>(cropImageView);
        this.mContext = cropImageView.getContext();
        this.mUri = uri;
        this.mCropPoints = cropPoints;
        this.mDegreesRotated = degreesRotated;
        this.mFixAspectRatio = fixAspectRatio;
        this.mAspectRatioX = aspectRatioX;
        this.mAspectRatioY = aspectRatioY;
        this.mOrgWidth = orgWidth;
        this.mOrgHeight = orgHeight;
        this.mReqWidth = reqWidth;
        this.mReqHeight = reqHeight;
        this.mSaveUri = saveUri;
        this.mSaveCompressFormat = saveCompressFormat;
        this.mSaveCompressQuality = saveCompressQuality;
        this.mBitmap = null;
    }

    public Uri getUri() {
        return this.mUri;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public Result doInBackground(Void... params) {
        try {
            if (!isCancelled()) {
                Bitmap bitmap = null;
                if (this.mUri != null) {
                    bitmap = BitmapUtils.cropBitmap(this.mContext, this.mUri, this.mCropPoints, this.mDegreesRotated, this.mOrgWidth, this.mOrgHeight, this.mFixAspectRatio, this.mAspectRatioX, this.mAspectRatioY, this.mReqWidth, this.mReqHeight);
                } else if (this.mBitmap != null) {
                    bitmap = BitmapUtils.cropBitmap(this.mBitmap, this.mCropPoints, this.mDegreesRotated, this.mFixAspectRatio, this.mAspectRatioX, this.mAspectRatioY);
                }
                if (this.mSaveUri == null) {
                    return new Result(bitmap);
                }
                BitmapUtils.writeBitmapToUri(this.mContext, bitmap, this.mSaveUri, this.mSaveCompressFormat, this.mSaveCompressQuality);
                bitmap.recycle();
                return new Result(this.mSaveUri);
            }
            return null;
        } catch (Exception e) {
            return new Result(e, this.mSaveUri != null);
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
                cropImageView.onImageCroppingAsyncComplete(result);
            }
            if (!completeCalled && result.bitmap != null) {
                result.bitmap.recycle();
            }
        }
    }

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result.class */
    public static final class Result {
        public final Bitmap bitmap;
        public final Uri uri;
        public final Exception error;
        public final boolean isSave;

        Result(Bitmap bitmap) {
            this.bitmap = bitmap;
            this.uri = null;
            this.error = null;
            this.isSave = false;
        }

        Result(Uri uri) {
            this.bitmap = null;
            this.uri = uri;
            this.error = null;
            this.isSave = true;
        }

        Result(Exception error, boolean isSave) {
            this.bitmap = null;
            this.uri = null;
            this.error = error;
            this.isSave = isSave;
        }
    }
}
