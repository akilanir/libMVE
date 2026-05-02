package com.yalantis.ucrop.task;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.yalantis.ucrop.callback.BitmapLoadCallback;
import com.yalantis.ucrop.util.BitmapLoadUtils;
import java.io.FileDescriptor;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okio.BufferedSource;
import okio.Okio;
import okio.Sink;

/* loaded from: com.yalantis.ucrop.1.5.0.jar:com/yalantis/ucrop/task/BitmapLoadTask.class */
public class BitmapLoadTask extends AsyncTask<Void, Void, BitmapWorkerResult> {
    private static final String TAG = "BitmapWorkerTask";
    private final Context mContext;
    private Uri mInputUri;
    private final Uri mOutputUri;
    private final int mRequiredWidth;
    private final int mRequiredHeight;
    private final BitmapLoadCallback mBitmapLoadCallback;

    /* loaded from: com.yalantis.ucrop.1.5.0.jar:com/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult.class */
    public static class BitmapWorkerResult {
        Bitmap mBitmapResult;
        Exception mBitmapWorkerException;

        public BitmapWorkerResult(@Nullable Bitmap bitmapResult, @Nullable Exception bitmapWorkerException) {
            this.mBitmapResult = bitmapResult;
            this.mBitmapWorkerException = bitmapWorkerException;
        }
    }

    public BitmapLoadTask(@NonNull Context context, @Nullable Uri inputUri, @Nullable Uri outputUri, int requiredWidth, int requiredHeight, BitmapLoadCallback loadCallback) {
        this.mContext = context;
        this.mInputUri = inputUri;
        this.mOutputUri = outputUri;
        this.mRequiredWidth = requiredWidth;
        this.mRequiredHeight = requiredHeight;
        this.mBitmapLoadCallback = loadCallback;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    @NonNull
    public BitmapWorkerResult doInBackground(Void... params) {
        if (this.mInputUri == null || this.mOutputUri == null) {
            return new BitmapWorkerResult(null, new NullPointerException("Uri cannot be null"));
        }
        if ("http".equals(this.mInputUri.getScheme()) || "https".equals(this.mInputUri.getScheme())) {
            try {
                downloadFile(this.mInputUri, this.mOutputUri);
            } catch (IOException | NullPointerException e) {
                Log.e(TAG, "Downloading failed", e);
                return new BitmapWorkerResult(null, e);
            }
        }
        try {
            ParcelFileDescriptor parcelFileDescriptor = this.mContext.getContentResolver().openFileDescriptor(this.mInputUri, "r");
            if (parcelFileDescriptor != null) {
                FileDescriptor fileDescriptor = parcelFileDescriptor.getFileDescriptor();
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inJustDecodeBounds = true;
                BitmapFactory.decodeFileDescriptor(fileDescriptor, null, options);
                if (options.outWidth == -1 || options.outHeight == -1) {
                    return new BitmapWorkerResult(null, new IllegalArgumentException("Bounds for bitmap could not be retrieved from Uri"));
                }
                options.inSampleSize = BitmapLoadUtils.calculateInSampleSize(options, this.mRequiredWidth, this.mRequiredHeight);
                options.inJustDecodeBounds = false;
                Bitmap decodeSampledBitmap = null;
                boolean decodeAttemptSuccess = false;
                while (!decodeAttemptSuccess) {
                    try {
                        decodeSampledBitmap = BitmapFactory.decodeFileDescriptor(fileDescriptor, null, options);
                        decodeAttemptSuccess = true;
                    } catch (OutOfMemoryError error) {
                        Log.e(TAG, "doInBackground: BitmapFactory.decodeFileDescriptor: ", error);
                        options.inSampleSize++;
                    }
                }
                if (decodeSampledBitmap == null) {
                    return new BitmapWorkerResult(null, new IllegalArgumentException("Bitmap could not be decoded from Uri"));
                }
                if (Build.VERSION.SDK_INT >= 16) {
                    BitmapLoadUtils.close(parcelFileDescriptor);
                }
                int exifOrientation = BitmapLoadUtils.getExifOrientation(this.mContext, this.mInputUri);
                int exifDegrees = BitmapLoadUtils.exifToDegrees(exifOrientation);
                int exifTranslation = BitmapLoadUtils.exifToTranslation(exifOrientation);
                Matrix matrix = new Matrix();
                if (exifDegrees != 0) {
                    matrix.preRotate(exifDegrees);
                }
                if (exifTranslation != 1) {
                    matrix.postScale(exifTranslation, 1.0f);
                }
                if (!matrix.isIdentity()) {
                    return new BitmapWorkerResult(BitmapLoadUtils.transformBitmap(decodeSampledBitmap, matrix), null);
                }
                return new BitmapWorkerResult(decodeSampledBitmap, null);
            }
            return new BitmapWorkerResult(null, new NullPointerException("ParcelFileDescriptor was null for given Uri"));
        } catch (FileNotFoundException e2) {
            return new BitmapWorkerResult(null, e2);
        }
    }

    private void downloadFile(@NonNull Uri inputUri, @NonNull Uri outputUri) throws NullPointerException, IOException {
        OkHttpClient client = new OkHttpClient();
        BufferedSource source = null;
        Sink sink = null;
        Response response = null;
        try {
            Request request = new Request.Builder().url(inputUri.toString()).build();
            response = client.newCall(request).execute();
            source = response.body().source();
            OutputStream outputStream = this.mContext.getContentResolver().openOutputStream(outputUri);
            if (outputStream != null) {
                sink = Okio.sink(outputStream);
                source.readAll(sink);
                client.dispatcher().cancelAll();
                this.mInputUri = this.mOutputUri;
                return;
            }
            throw new NullPointerException("OutputStream for given output Uri was null");
        } finally {
            BitmapLoadUtils.close(source);
            BitmapLoadUtils.close(sink);
            if (response != null) {
                BitmapLoadUtils.close(response.body());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(@NonNull BitmapWorkerResult result) {
        if (result.mBitmapWorkerException == null) {
            this.mBitmapLoadCallback.onBitmapLoaded(result.mBitmapResult);
        } else {
            this.mBitmapLoadCallback.onFailure(result.mBitmapWorkerException);
        }
    }
}
