package com.android.volley.toolbox;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.widget.ImageView;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.NetworkResponse;
import com.android.volley.ParseError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyLog;

/* loaded from: com.mcxiaoke.volley.library.1.0.19.jar:com/android/volley/toolbox/ImageRequest.class */
public class ImageRequest extends Request<Bitmap> {
    private static final int IMAGE_TIMEOUT_MS = 1000;
    private static final int IMAGE_MAX_RETRIES = 2;
    private static final float IMAGE_BACKOFF_MULT = 2.0f;
    private final Response.Listener<Bitmap> mListener;
    private final Bitmap.Config mDecodeConfig;
    private final int mMaxWidth;
    private final int mMaxHeight;
    private ImageView.ScaleType mScaleType;
    private static final Object sDecodeLock = new Object();

    public ImageRequest(String url, Response.Listener<Bitmap> listener, int maxWidth, int maxHeight, ImageView.ScaleType scaleType, Bitmap.Config decodeConfig, Response.ErrorListener errorListener) {
        super(0, url, errorListener);
        setRetryPolicy(new DefaultRetryPolicy(IMAGE_TIMEOUT_MS, 2, IMAGE_BACKOFF_MULT));
        this.mListener = listener;
        this.mDecodeConfig = decodeConfig;
        this.mMaxWidth = maxWidth;
        this.mMaxHeight = maxHeight;
        this.mScaleType = scaleType;
    }

    @Deprecated
    public ImageRequest(String url, Response.Listener<Bitmap> listener, int maxWidth, int maxHeight, Bitmap.Config decodeConfig, Response.ErrorListener errorListener) {
        this(url, listener, maxWidth, maxHeight, ImageView.ScaleType.CENTER_INSIDE, decodeConfig, errorListener);
    }

    @Override // com.android.volley.Request
    public Request.Priority getPriority() {
        return Request.Priority.LOW;
    }

    private static int getResizedDimension(int maxPrimary, int maxSecondary, int actualPrimary, int actualSecondary, ImageView.ScaleType scaleType) {
        if (maxPrimary == 0 && maxSecondary == 0) {
            return actualPrimary;
        }
        if (scaleType == ImageView.ScaleType.FIT_XY) {
            if (maxPrimary == 0) {
                return actualPrimary;
            }
            return maxPrimary;
        }
        if (maxPrimary == 0) {
            return (int) (actualPrimary * (maxSecondary / actualSecondary));
        }
        if (maxSecondary == 0) {
            return maxPrimary;
        }
        double ratio = actualSecondary / actualPrimary;
        int resized = maxPrimary;
        if (scaleType == ImageView.ScaleType.CENTER_CROP) {
            if (resized * ratio < maxSecondary) {
                resized = (int) (maxSecondary / ratio);
            }
            return resized;
        }
        if (resized * ratio > maxSecondary) {
            resized = (int) (maxSecondary / ratio);
        }
        return resized;
    }

    @Override // com.android.volley.Request
    protected Response<Bitmap> parseNetworkResponse(NetworkResponse response) {
        Response<Bitmap> doParse;
        synchronized (sDecodeLock) {
            try {
                doParse = doParse(response);
            } catch (OutOfMemoryError e) {
                VolleyLog.e("Caught OOM for %d byte image, url=%s", Integer.valueOf(response.data.length), getUrl());
                return Response.error(new ParseError(e));
            }
        }
        return doParse;
    }

    private Response<Bitmap> doParse(NetworkResponse response) {
        Bitmap bitmap;
        byte[] data = response.data;
        BitmapFactory.Options decodeOptions = new BitmapFactory.Options();
        if (this.mMaxWidth == 0 && this.mMaxHeight == 0) {
            decodeOptions.inPreferredConfig = this.mDecodeConfig;
            bitmap = BitmapFactory.decodeByteArray(data, 0, data.length, decodeOptions);
        } else {
            decodeOptions.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(data, 0, data.length, decodeOptions);
            int actualWidth = decodeOptions.outWidth;
            int actualHeight = decodeOptions.outHeight;
            int desiredWidth = getResizedDimension(this.mMaxWidth, this.mMaxHeight, actualWidth, actualHeight, this.mScaleType);
            int desiredHeight = getResizedDimension(this.mMaxHeight, this.mMaxWidth, actualHeight, actualWidth, this.mScaleType);
            decodeOptions.inJustDecodeBounds = false;
            decodeOptions.inSampleSize = findBestSampleSize(actualWidth, actualHeight, desiredWidth, desiredHeight);
            Bitmap tempBitmap = BitmapFactory.decodeByteArray(data, 0, data.length, decodeOptions);
            if (tempBitmap != null && (tempBitmap.getWidth() > desiredWidth || tempBitmap.getHeight() > desiredHeight)) {
                bitmap = Bitmap.createScaledBitmap(tempBitmap, desiredWidth, desiredHeight, true);
                tempBitmap.recycle();
            } else {
                bitmap = tempBitmap;
            }
        }
        if (bitmap == null) {
            return Response.error(new ParseError(response));
        }
        return Response.success(bitmap, HttpHeaderParser.parseCacheHeaders(response));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.android.volley.Request
    public void deliverResponse(Bitmap response) {
        this.mListener.onResponse(response);
    }

    static int findBestSampleSize(int actualWidth, int actualHeight, int desiredWidth, int desiredHeight) {
        double wr = actualWidth / desiredWidth;
        double hr = actualHeight / desiredHeight;
        double ratio = Math.min(wr, hr);
        float f = 1.0f;
        while (true) {
            float n = f;
            if (n * IMAGE_BACKOFF_MULT <= ratio) {
                f = n * IMAGE_BACKOFF_MULT;
            } else {
                return (int) n;
            }
        }
    }
}
