package com.theartofdev.edmodo.cropper;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Pair;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ProgressBar;
import com.theartofdev.edmodo.cropper.BitmapCroppingWorkerTask;
import com.theartofdev.edmodo.cropper.BitmapLoadingWorkerTask;
import com.theartofdev.edmodo.cropper.BitmapUtils;
import com.theartofdev.edmodo.cropper.CropOverlayView;
import java.lang.ref.WeakReference;
import java.util.UUID;

/* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropImageView.class */
public class CropImageView extends FrameLayout {
    private final ImageView mImageView;
    private final CropOverlayView mCropOverlayView;
    private final Matrix mImageMatrix;
    private final Matrix mImageInverseMatrix;
    private final ProgressBar mProgressBar;
    private final RectF mImageRect;
    private CropImageAnimation mAnimation;
    private Bitmap mBitmap;
    private int mDegreesRotated;
    private int mLayoutWidth;
    private int mLayoutHeight;
    private int mImageResource;
    private ScaleType mScaleType;
    private boolean mShowCropOverlay;
    private boolean mShowProgressBar;
    private boolean mAutoZoomEnabled;
    private int mMaxZoom;
    private WeakReference<OnSetImageUriCompleteListener> mOnSetImageUriCompleteListener;
    private WeakReference<OnGetCroppedImageCompleteListener> mOnGetCroppedImageCompleteListener;
    private WeakReference<OnSaveCroppedImageCompleteListener> mOnSaveCroppedImageCompleteListener;
    private Uri mLoadedImageUri;
    private int mLoadedSampleSize;
    private float mZoom;
    private float mZoomOffsetX;
    private float mZoomOffsetY;
    private RectF mRestoreCropWindowRect;
    private WeakReference<BitmapLoadingWorkerTask> mBitmapLoadingWorkerTask;
    private WeakReference<BitmapCroppingWorkerTask> mBitmapCroppingWorkerTask;

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropImageView$CropShape.class */
    public enum CropShape {
        RECTANGLE,
        OVAL
    }

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropImageView$Guidelines.class */
    public enum Guidelines {
        OFF,
        ON_TOUCH,
        ON
    }

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropImageView$OnGetCroppedImageCompleteListener.class */
    public interface OnGetCroppedImageCompleteListener {
        void onGetCroppedImageComplete(CropImageView cropImageView, Bitmap bitmap, Exception exc);
    }

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropImageView$OnSaveCroppedImageCompleteListener.class */
    public interface OnSaveCroppedImageCompleteListener {
        void onSaveCroppedImageComplete(CropImageView cropImageView, Uri uri, Exception exc);
    }

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropImageView$OnSetImageUriCompleteListener.class */
    public interface OnSetImageUriCompleteListener {
        void onSetImageUriComplete(CropImageView cropImageView, Uri uri, Exception exc);
    }

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropImageView$ScaleType.class */
    public enum ScaleType {
        FIT_CENTER,
        CENTER,
        CENTER_CROP,
        CENTER_INSIDE
    }

    public CropImageView(Context context) {
        this(context, null);
    }

    public CropImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mImageMatrix = new Matrix();
        this.mImageInverseMatrix = new Matrix();
        this.mImageRect = new RectF();
        this.mShowCropOverlay = true;
        this.mShowProgressBar = true;
        this.mAutoZoomEnabled = true;
        this.mLoadedSampleSize = 1;
        this.mZoom = 1.0f;
        CropImageOptions options = null;
        Intent intent = context instanceof Activity ? ((Activity) context).getIntent() : null;
        options = intent != null ? (CropImageOptions) intent.getParcelableExtra("CROP_IMAGE_EXTRA_OPTIONS") : options;
        if (options == null) {
            options = new CropImageOptions();
            if (attrs != null) {
                TypedArray ta = context.obtainStyledAttributes(attrs, R.styleable.CropImageView, 0, 0);
                try {
                    options.fixAspectRatio = ta.getBoolean(R.styleable.CropImageView_cropFixAspectRatio, options.fixAspectRatio);
                    options.aspectRatioX = ta.getInteger(R.styleable.CropImageView_cropAspectRatioX, options.aspectRatioX);
                    options.aspectRatioY = ta.getInteger(R.styleable.CropImageView_cropAspectRatioY, options.aspectRatioY);
                    options.scaleType = ScaleType.values()[ta.getInt(R.styleable.CropImageView_cropScaleType, options.scaleType.ordinal())];
                    options.autoZoomEnabled = ta.getBoolean(R.styleable.CropImageView_cropAutoZoomEnabled, options.autoZoomEnabled);
                    options.maxZoom = ta.getInteger(R.styleable.CropImageView_cropMaxZoom, options.maxZoom);
                    options.cropShape = CropShape.values()[ta.getInt(R.styleable.CropImageView_cropShape, options.cropShape.ordinal())];
                    options.guidelines = Guidelines.values()[ta.getInt(R.styleable.CropImageView_cropGuidelines, options.guidelines.ordinal())];
                    options.snapRadius = ta.getDimension(R.styleable.CropImageView_cropSnapRadius, options.snapRadius);
                    options.touchRadius = ta.getDimension(R.styleable.CropImageView_cropTouchRadius, options.touchRadius);
                    options.initialCropWindowPaddingRatio = ta.getFloat(R.styleable.CropImageView_cropInitialCropWindowPaddingRatio, options.initialCropWindowPaddingRatio);
                    options.borderLineThickness = ta.getDimension(R.styleable.CropImageView_cropBorderLineThickness, options.borderLineThickness);
                    options.borderLineColor = ta.getInteger(R.styleable.CropImageView_cropBorderLineColor, options.borderLineColor);
                    options.borderCornerThickness = ta.getDimension(R.styleable.CropImageView_cropBorderCornerThickness, options.borderCornerThickness);
                    options.borderCornerOffset = ta.getDimension(R.styleable.CropImageView_cropBorderCornerOffset, options.borderCornerOffset);
                    options.borderCornerLength = ta.getDimension(R.styleable.CropImageView_cropBorderCornerLength, options.borderCornerLength);
                    options.borderCornerColor = ta.getInteger(R.styleable.CropImageView_cropBorderCornerColor, options.borderCornerColor);
                    options.guidelinesThickness = ta.getDimension(R.styleable.CropImageView_cropGuidelinesThickness, options.guidelinesThickness);
                    options.guidelinesColor = ta.getInteger(R.styleable.CropImageView_cropGuidelinesColor, options.guidelinesColor);
                    options.backgroundColor = ta.getInteger(R.styleable.CropImageView_cropBackgroundColor, options.backgroundColor);
                    options.showCropOverlay = ta.getBoolean(R.styleable.CropImageView_cropShowCropOverlay, this.mShowCropOverlay);
                    options.showProgressBar = ta.getBoolean(R.styleable.CropImageView_cropShowProgressBar, this.mShowProgressBar);
                    options.borderCornerThickness = ta.getDimension(R.styleable.CropImageView_cropBorderCornerThickness, options.borderCornerThickness);
                    options.minCropWindowWidth = (int) ta.getDimension(R.styleable.CropImageView_cropMinCropWindowWidth, options.minCropWindowWidth);
                    options.minCropWindowHeight = (int) ta.getDimension(R.styleable.CropImageView_cropMinCropWindowHeight, options.minCropWindowHeight);
                    options.minCropResultWidth = (int) ta.getFloat(R.styleable.CropImageView_cropMinCropResultWidthPX, options.minCropResultWidth);
                    options.minCropResultHeight = (int) ta.getFloat(R.styleable.CropImageView_cropMinCropResultHeightPX, options.minCropResultHeight);
                    options.maxCropResultWidth = (int) ta.getFloat(R.styleable.CropImageView_cropMaxCropResultWidthPX, options.maxCropResultWidth);
                    options.maxCropResultHeight = (int) ta.getFloat(R.styleable.CropImageView_cropMaxCropResultHeightPX, options.maxCropResultHeight);
                    ta.recycle();
                } catch (Throwable th) {
                    ta.recycle();
                    throw th;
                }
            }
        }
        options.validate();
        this.mScaleType = options.scaleType;
        this.mAutoZoomEnabled = options.autoZoomEnabled;
        this.mMaxZoom = options.maxZoom;
        this.mShowCropOverlay = options.showCropOverlay;
        this.mShowProgressBar = options.showProgressBar;
        LayoutInflater inflater = LayoutInflater.from(context);
        View v = inflater.inflate(R.layout.crop_image_view, (ViewGroup) this, true);
        this.mImageView = (ImageView) v.findViewById(R.id.ImageView_image);
        this.mImageView.setScaleType(ImageView.ScaleType.MATRIX);
        this.mCropOverlayView = (CropOverlayView) v.findViewById(R.id.CropOverlayView);
        this.mCropOverlayView.setCropWindowChangeListener(new CropOverlayView.CropWindowChangeListener() { // from class: com.theartofdev.edmodo.cropper.CropImageView.1
            @Override // com.theartofdev.edmodo.cropper.CropOverlayView.CropWindowChangeListener
            public void onCropWindowChanged(boolean inProgress) {
                CropImageView.this.handleCropWindowChanged(inProgress, true);
            }
        });
        this.mCropOverlayView.setInitialAttributeValues(options);
        this.mProgressBar = (ProgressBar) v.findViewById(R.id.CropProgressBar);
        setProgressBarVisibility();
    }

    public ScaleType getScaleType() {
        return this.mScaleType;
    }

    public void setScaleType(ScaleType scaleType) {
        if (scaleType != this.mScaleType) {
            this.mScaleType = scaleType;
            this.mZoom = 1.0f;
            this.mZoomOffsetY = 0.0f;
            this.mZoomOffsetX = 0.0f;
            this.mCropOverlayView.resetCropOverlayView();
            requestLayout();
        }
    }

    public CropShape getCropShape() {
        return this.mCropOverlayView.getCropShape();
    }

    public void setCropShape(CropShape cropShape) {
        this.mCropOverlayView.setCropShape(cropShape);
    }

    public boolean isAutoZoomEnabled() {
        return this.mAutoZoomEnabled;
    }

    public void setAutoZoomEnabled(boolean autoZoomEnabled) {
        if (this.mAutoZoomEnabled != autoZoomEnabled) {
            this.mAutoZoomEnabled = autoZoomEnabled;
            handleCropWindowChanged(false, false);
            this.mCropOverlayView.invalidate();
        }
    }

    public int getMaxZoom() {
        return this.mMaxZoom;
    }

    public void setMaxZoom(int maxZoom) {
        if (this.mMaxZoom != maxZoom && maxZoom > 0) {
            this.mMaxZoom = maxZoom;
            handleCropWindowChanged(false, false);
            this.mCropOverlayView.invalidate();
        }
    }

    public int getRotatedDegrees() {
        return this.mDegreesRotated;
    }

    public void setRotatedDegrees(int degrees) {
        if (this.mDegreesRotated != degrees) {
            rotateImage(degrees - this.mDegreesRotated);
        }
    }

    public boolean isFixAspectRatio() {
        return this.mCropOverlayView.isFixAspectRatio();
    }

    public void setFixedAspectRatio(boolean fixAspectRatio) {
        this.mCropOverlayView.setFixedAspectRatio(fixAspectRatio);
    }

    public Guidelines getGuidelines() {
        return this.mCropOverlayView.getGuidelines();
    }

    public void setGuidelines(Guidelines guidelines) {
        this.mCropOverlayView.setGuidelines(guidelines);
    }

    public Pair<Integer, Integer> getAspectRatio() {
        return new Pair<>(Integer.valueOf(this.mCropOverlayView.getAspectRatioX()), Integer.valueOf(this.mCropOverlayView.getAspectRatioY()));
    }

    public void setAspectRatio(int aspectRatioX, int aspectRatioY) {
        this.mCropOverlayView.setAspectRatioX(aspectRatioX);
        this.mCropOverlayView.setAspectRatioY(aspectRatioY);
    }

    public void setSnapRadius(float snapRadius) {
        if (snapRadius >= 0.0f) {
            this.mCropOverlayView.setSnapRadius(snapRadius);
        }
    }

    public boolean isShowProgressBar() {
        return this.mShowProgressBar;
    }

    public void setShowProgressBar(boolean showProgressBar) {
        if (this.mShowProgressBar != showProgressBar) {
            this.mShowProgressBar = showProgressBar;
            setProgressBarVisibility();
        }
    }

    public boolean isShowCropOverlay() {
        return this.mShowCropOverlay;
    }

    public void setShowCropOverlay(boolean showCropOverlay) {
        if (this.mShowCropOverlay != showCropOverlay) {
            this.mShowCropOverlay = showCropOverlay;
            setCropOverlayVisibility();
        }
    }

    public int getImageResource() {
        return this.mImageResource;
    }

    public Uri getImageUri() {
        return this.mLoadedImageUri;
    }

    public Rect getCropRect() {
        if (this.mBitmap != null) {
            float[] points = getCropPoints();
            int orgWidth = this.mBitmap.getWidth() * this.mLoadedSampleSize;
            int orgHeight = this.mBitmap.getHeight() * this.mLoadedSampleSize;
            return BitmapUtils.getRectFromPoints(points, orgWidth, orgHeight, this.mCropOverlayView.isFixAspectRatio(), this.mCropOverlayView.getAspectRatioX(), this.mCropOverlayView.getAspectRatioY());
        }
        return null;
    }

    public float[] getCropPoints() {
        RectF cropWindowRect = this.mCropOverlayView.getCropWindowRect();
        float[] points = new float[8];
        points[0] = cropWindowRect.left;
        points[1] = cropWindowRect.top;
        points[2] = cropWindowRect.right;
        points[3] = cropWindowRect.top;
        points[4] = cropWindowRect.right;
        points[5] = cropWindowRect.bottom;
        points[6] = cropWindowRect.left;
        points[7] = cropWindowRect.bottom;
        this.mImageMatrix.invert(this.mImageInverseMatrix);
        this.mImageInverseMatrix.mapPoints(points);
        for (int i = 0; i < points.length; i++) {
            int i2 = i;
            points[i2] = points[i2] * this.mLoadedSampleSize;
        }
        return points;
    }

    public void setCropRect(Rect rect) {
        this.mCropOverlayView.setInitialCropWindowRect(rect);
    }

    public void resetCropRect() {
        this.mZoom = 1.0f;
        this.mZoomOffsetX = 0.0f;
        this.mZoomOffsetY = 0.0f;
        this.mDegreesRotated = 0;
        applyImageMatrix(getWidth(), getHeight(), false, false);
        this.mCropOverlayView.resetCropWindowRect();
    }

    public Bitmap getCroppedImage() {
        return getCroppedImage(0, 0);
    }

    public Bitmap getCroppedImage(int reqWidth, int reqHeight) {
        Bitmap croppedBitmap = null;
        if (this.mBitmap != null) {
            this.mImageView.clearAnimation();
            if (this.mLoadedImageUri != null && this.mLoadedSampleSize > 1) {
                int orgWidth = this.mBitmap.getWidth() * this.mLoadedSampleSize;
                int orgHeight = this.mBitmap.getHeight() * this.mLoadedSampleSize;
                croppedBitmap = BitmapUtils.cropBitmap(getContext(), this.mLoadedImageUri, getCropPoints(), this.mDegreesRotated, orgWidth, orgHeight, this.mCropOverlayView.isFixAspectRatio(), this.mCropOverlayView.getAspectRatioX(), this.mCropOverlayView.getAspectRatioY(), reqWidth, reqHeight);
            } else {
                croppedBitmap = BitmapUtils.cropBitmap(this.mBitmap, getCropPoints(), this.mDegreesRotated, this.mCropOverlayView.isFixAspectRatio(), this.mCropOverlayView.getAspectRatioX(), this.mCropOverlayView.getAspectRatioY());
            }
        }
        return croppedBitmap;
    }

    public void getCroppedImageAsync() {
        getCroppedImageAsync(0, 0);
    }

    public void getCroppedImageAsync(int reqWidth, int reqHeight) {
        if (this.mOnGetCroppedImageCompleteListener == null) {
            throw new IllegalArgumentException("OnGetCroppedImageCompleteListener is not set");
        }
        startCropWorkerTask(reqWidth, reqHeight, null, null, 0);
    }

    public void saveCroppedImageAsync(Uri saveUri) {
        saveCroppedImageAsync(saveUri, Bitmap.CompressFormat.JPEG, 90, 0, 0);
    }

    public void saveCroppedImageAsync(Uri saveUri, Bitmap.CompressFormat saveCompressFormat, int saveCompressQuality) {
        saveCroppedImageAsync(saveUri, saveCompressFormat, saveCompressQuality, 0, 0);
    }

    public void saveCroppedImageAsync(Uri saveUri, Bitmap.CompressFormat saveCompressFormat, int saveCompressQuality, int reqWidth, int reqHeight) {
        if (this.mOnSaveCroppedImageCompleteListener == null) {
            throw new IllegalArgumentException("mOnSaveCroppedImageCompleteListener is not set");
        }
        startCropWorkerTask(reqWidth, reqHeight, saveUri, saveCompressFormat, saveCompressQuality);
    }

    public void setOnSetImageUriCompleteListener(OnSetImageUriCompleteListener listener) {
        this.mOnSetImageUriCompleteListener = listener != null ? new WeakReference<>(listener) : null;
    }

    public void setOnGetCroppedImageCompleteListener(OnGetCroppedImageCompleteListener listener) {
        this.mOnGetCroppedImageCompleteListener = listener != null ? new WeakReference<>(listener) : null;
    }

    public void setOnSaveCroppedImageCompleteListener(OnSaveCroppedImageCompleteListener listener) {
        this.mOnSaveCroppedImageCompleteListener = listener != null ? new WeakReference<>(listener) : null;
    }

    public void setImageBitmap(Bitmap bitmap) {
        this.mCropOverlayView.setInitialCropWindowRect(null);
        setBitmap(bitmap, true);
    }

    public void setImageBitmap(Bitmap bitmap, ExifInterface exif) {
        Bitmap setBitmap;
        if (bitmap != null && exif != null) {
            BitmapUtils.RotateBitmapResult result = BitmapUtils.rotateBitmapByExif(bitmap, exif);
            setBitmap = result.bitmap;
            this.mDegreesRotated = result.degrees;
        } else {
            setBitmap = bitmap;
        }
        this.mCropOverlayView.setInitialCropWindowRect(null);
        setBitmap(setBitmap, true);
    }

    public void setImageResource(int resId) {
        if (resId != 0) {
            this.mCropOverlayView.setInitialCropWindowRect(null);
            Bitmap bitmap = BitmapFactory.decodeResource(getResources(), resId);
            setBitmap(bitmap, true);
            this.mImageResource = resId;
        }
    }

    public void setImageUriAsync(Uri uri) {
        if (uri != null) {
            BitmapLoadingWorkerTask currentTask = this.mBitmapLoadingWorkerTask != null ? this.mBitmapLoadingWorkerTask.get() : null;
            if (currentTask != null) {
                currentTask.cancel(true);
            }
            clearImage(true);
            this.mCropOverlayView.setInitialCropWindowRect(null);
            this.mBitmapLoadingWorkerTask = new WeakReference<>(new BitmapLoadingWorkerTask(this, uri));
            this.mBitmapLoadingWorkerTask.get().execute(new Void[0]);
            setProgressBarVisibility();
        }
    }

    public void clearImage() {
        clearImage(true);
        this.mCropOverlayView.setInitialCropWindowRect(null);
    }

    public void rotateImage(int degrees) {
        if (this.mBitmap != null) {
            if (degrees % 90 == 0) {
                BitmapUtils.RECT.set(this.mCropOverlayView.getCropWindowRect());
                this.mImageMatrix.invert(this.mImageInverseMatrix);
                this.mImageInverseMatrix.mapRect(BitmapUtils.RECT);
                this.mZoom = 1.0f;
                this.mZoomOffsetX = 0.0f;
                this.mZoomOffsetY = 0.0f;
                this.mDegreesRotated += degrees;
                this.mDegreesRotated = this.mDegreesRotated >= 0 ? this.mDegreesRotated % 360 : (this.mDegreesRotated % 360) + 360;
                applyImageMatrix(getWidth(), getHeight(), true, false);
                this.mImageMatrix.mapRect(BitmapUtils.RECT);
                this.mCropOverlayView.resetCropOverlayView();
                this.mCropOverlayView.setCropWindowRect(BitmapUtils.RECT);
                applyImageMatrix(getWidth(), getHeight(), true, false);
                handleCropWindowChanged(false, false);
                return;
            }
            this.mDegreesRotated += degrees;
            this.mDegreesRotated = this.mDegreesRotated >= 0 ? this.mDegreesRotated % 360 : (this.mDegreesRotated % 360) + 360;
            this.mZoom = 1.0f;
            this.mZoomOffsetY = 0.0f;
            this.mZoomOffsetX = 0.0f;
            this.mCropOverlayView.resetCropOverlayView();
            applyImageMatrix(getWidth(), getHeight(), true, false);
        }
    }

    void onSetImageUriAsyncComplete(BitmapLoadingWorkerTask.Result result) {
        this.mBitmapLoadingWorkerTask = null;
        setProgressBarVisibility();
        if (result.error == null) {
            setBitmap(result.bitmap, true);
            this.mLoadedImageUri = result.uri;
            this.mLoadedSampleSize = result.loadSampleSize;
            this.mDegreesRotated = result.degreesRotated;
        }
        OnSetImageUriCompleteListener listener = this.mOnSetImageUriCompleteListener != null ? this.mOnSetImageUriCompleteListener.get() : null;
        if (listener != null) {
            listener.onSetImageUriComplete(this, result.uri, result.error);
        }
    }

    void onImageCroppingAsyncComplete(BitmapCroppingWorkerTask.Result result) {
        this.mBitmapCroppingWorkerTask = null;
        setProgressBarVisibility();
        if (result.isSave) {
            OnSaveCroppedImageCompleteListener listener = this.mOnSaveCroppedImageCompleteListener != null ? this.mOnSaveCroppedImageCompleteListener.get() : null;
            if (listener != null) {
                listener.onSaveCroppedImageComplete(this, result.uri, result.error);
                return;
            }
            return;
        }
        OnGetCroppedImageCompleteListener listener2 = this.mOnGetCroppedImageCompleteListener != null ? this.mOnGetCroppedImageCompleteListener.get() : null;
        if (listener2 != null) {
            listener2.onGetCroppedImageComplete(this, result.bitmap, result.error);
        }
    }

    private void setBitmap(Bitmap bitmap, boolean clearFull) {
        if (this.mBitmap == null || !this.mBitmap.equals(bitmap)) {
            this.mImageView.clearAnimation();
            clearImage(clearFull);
            this.mBitmap = bitmap;
            this.mImageView.setImageBitmap(this.mBitmap);
            applyImageMatrix(getWidth(), getHeight(), true, false);
            if (this.mCropOverlayView != null) {
                this.mCropOverlayView.resetCropOverlayView();
                setCropOverlayVisibility();
            }
        }
    }

    private void clearImage(boolean full) {
        if (this.mBitmap != null && (this.mImageResource > 0 || this.mLoadedImageUri != null)) {
            this.mBitmap.recycle();
        }
        this.mBitmap = null;
        if (full) {
            this.mImageResource = 0;
            this.mLoadedImageUri = null;
            this.mLoadedSampleSize = 1;
            this.mDegreesRotated = 0;
            this.mZoom = 1.0f;
            this.mZoomOffsetX = 0.0f;
            this.mZoomOffsetY = 0.0f;
            this.mImageMatrix.reset();
            this.mImageView.setImageBitmap(null);
            setCropOverlayVisibility();
        }
    }

    public void startCropWorkerTask(int reqWidth, int reqHeight, Uri saveUri, Bitmap.CompressFormat saveCompressFormat, int saveCompressQuality) {
        this.mImageView.clearAnimation();
        BitmapCroppingWorkerTask currentTask = this.mBitmapCroppingWorkerTask != null ? this.mBitmapCroppingWorkerTask.get() : null;
        if (currentTask != null) {
            currentTask.cancel(true);
        }
        int orgWidth = this.mBitmap.getWidth() * this.mLoadedSampleSize;
        int orgHeight = this.mBitmap.getHeight() * this.mLoadedSampleSize;
        if (this.mLoadedImageUri != null && this.mLoadedSampleSize > 1) {
            this.mBitmapCroppingWorkerTask = new WeakReference<>(new BitmapCroppingWorkerTask(this, this.mLoadedImageUri, getCropPoints(), this.mDegreesRotated, orgWidth, orgHeight, this.mCropOverlayView.isFixAspectRatio(), this.mCropOverlayView.getAspectRatioX(), this.mCropOverlayView.getAspectRatioY(), reqWidth, reqHeight, saveUri, saveCompressFormat, saveCompressQuality));
        } else {
            this.mBitmapCroppingWorkerTask = new WeakReference<>(new BitmapCroppingWorkerTask(this, this.mBitmap, getCropPoints(), this.mDegreesRotated, this.mCropOverlayView.isFixAspectRatio(), this.mCropOverlayView.getAspectRatioX(), this.mCropOverlayView.getAspectRatioY(), saveUri, saveCompressFormat, saveCompressQuality));
        }
        this.mBitmapCroppingWorkerTask.get().execute(new Void[0]);
        setProgressBarVisibility();
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        BitmapLoadingWorkerTask task;
        Bundle bundle = new Bundle();
        bundle.putParcelable("instanceState", super.onSaveInstanceState());
        bundle.putParcelable("LOADED_IMAGE_URI", this.mLoadedImageUri);
        bundle.putInt("LOADED_IMAGE_RESOURCE", this.mImageResource);
        if (this.mLoadedImageUri == null && this.mImageResource < 1) {
            bundle.putParcelable("SET_BITMAP", this.mBitmap);
        }
        if (this.mLoadedImageUri != null && this.mBitmap != null) {
            String key = UUID.randomUUID().toString();
            BitmapUtils.mStateBitmap = new Pair<>(key, new WeakReference(this.mBitmap));
            bundle.putString("LOADED_IMAGE_STATE_BITMAP_KEY", key);
        }
        if (this.mBitmapLoadingWorkerTask != null && (task = this.mBitmapLoadingWorkerTask.get()) != null) {
            bundle.putParcelable("LOADING_IMAGE_URI", task.getUri());
        }
        bundle.putInt("LOADED_SAMPLE_SIZE", this.mLoadedSampleSize);
        bundle.putInt("DEGREES_ROTATED", this.mDegreesRotated);
        bundle.putParcelable("INITIAL_CROP_RECT", this.mCropOverlayView.getInitialCropWindowRect());
        BitmapUtils.RECT.set(this.mCropOverlayView.getCropWindowRect());
        this.mImageMatrix.invert(this.mImageInverseMatrix);
        this.mImageInverseMatrix.mapRect(BitmapUtils.RECT);
        bundle.putParcelable("CROP_WINDOW_RECT", BitmapUtils.RECT);
        bundle.putString("CROP_SHAPE", this.mCropOverlayView.getCropShape().name());
        bundle.putBoolean("CROP_AUTO_ZOOM_ENABLED", this.mAutoZoomEnabled);
        bundle.putInt("CROP_MAX_ZOOM", this.mMaxZoom);
        return bundle;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        if (state instanceof Bundle) {
            Bundle bundle = (Bundle) state;
            Uri uri = (Uri) bundle.getParcelable("LOADED_IMAGE_URI");
            if (uri != null) {
                String key = bundle.getString("LOADED_IMAGE_STATE_BITMAP_KEY");
                if (key != null) {
                    Bitmap stateBitmap = (BitmapUtils.mStateBitmap == null || !((String) BitmapUtils.mStateBitmap.first).equals(key)) ? null : (Bitmap) ((WeakReference) BitmapUtils.mStateBitmap.second).get();
                    if (stateBitmap != null && !stateBitmap.isRecycled()) {
                        BitmapUtils.mStateBitmap = null;
                        setBitmap(stateBitmap, true);
                        this.mLoadedImageUri = uri;
                        this.mLoadedSampleSize = bundle.getInt("LOADED_SAMPLE_SIZE");
                    }
                }
                if (this.mLoadedImageUri == null) {
                    setImageUriAsync(uri);
                }
            } else {
                int resId = bundle.getInt("LOADED_IMAGE_RESOURCE");
                if (resId > 0) {
                    setImageResource(resId);
                } else {
                    Bitmap bitmap = (Bitmap) bundle.getParcelable("SET_BITMAP");
                    if (bitmap != null) {
                        setBitmap(bitmap, true);
                    } else {
                        Uri uri2 = (Uri) bundle.getParcelable("LOADING_IMAGE_URI");
                        if (uri2 != null) {
                            setImageUriAsync(uri2);
                        }
                    }
                }
            }
            this.mDegreesRotated = bundle.getInt("DEGREES_ROTATED");
            this.mCropOverlayView.setInitialCropWindowRect((Rect) bundle.getParcelable("INITIAL_CROP_RECT"));
            this.mRestoreCropWindowRect = (RectF) bundle.getParcelable("CROP_WINDOW_RECT");
            this.mCropOverlayView.setCropShape(CropShape.valueOf(bundle.getString("CROP_SHAPE")));
            this.mAutoZoomEnabled = bundle.getBoolean("CROP_AUTO_ZOOM_ENABLED");
            this.mMaxZoom = bundle.getInt("CROP_MAX_ZOOM");
            super.onRestoreInstanceState(bundle.getParcelable("instanceState"));
            return;
        }
        super.onRestoreInstanceState(state);
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int desiredHeight;
        int desiredWidth;
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
        if (this.mBitmap != null) {
            if (heightSize == 0) {
                heightSize = this.mBitmap.getHeight();
            }
            double viewToBitmapWidthRatio = Double.POSITIVE_INFINITY;
            double viewToBitmapHeightRatio = Double.POSITIVE_INFINITY;
            if (widthSize < this.mBitmap.getWidth()) {
                viewToBitmapWidthRatio = widthSize / this.mBitmap.getWidth();
            }
            if (heightSize < this.mBitmap.getHeight()) {
                viewToBitmapHeightRatio = heightSize / this.mBitmap.getHeight();
            }
            if (viewToBitmapWidthRatio == Double.POSITIVE_INFINITY && viewToBitmapHeightRatio == Double.POSITIVE_INFINITY) {
                desiredWidth = this.mBitmap.getWidth();
                desiredHeight = this.mBitmap.getHeight();
            } else if (viewToBitmapWidthRatio <= viewToBitmapHeightRatio) {
                desiredWidth = widthSize;
                desiredHeight = (int) (this.mBitmap.getHeight() * viewToBitmapWidthRatio);
            } else {
                desiredHeight = heightSize;
                desiredWidth = (int) (this.mBitmap.getWidth() * viewToBitmapHeightRatio);
            }
            int width = getOnMeasureSpec(widthMode, widthSize, desiredWidth);
            int height = getOnMeasureSpec(heightMode, heightSize, desiredHeight);
            this.mLayoutWidth = width;
            this.mLayoutHeight = height;
            setMeasuredDimension(this.mLayoutWidth, this.mLayoutHeight);
            return;
        }
        setMeasuredDimension(widthSize, heightSize);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        super.onLayout(changed, l, t, r, b);
        if (this.mLayoutWidth > 0 && this.mLayoutHeight > 0) {
            ViewGroup.LayoutParams origParams = getLayoutParams();
            origParams.width = this.mLayoutWidth;
            origParams.height = this.mLayoutHeight;
            setLayoutParams(origParams);
            if (this.mBitmap != null) {
                applyImageMatrix(r - l, b - t, false, false);
                if (this.mBitmap != null && this.mRestoreCropWindowRect != null) {
                    this.mImageMatrix.mapRect(this.mRestoreCropWindowRect);
                    this.mCropOverlayView.setCropWindowRect(this.mRestoreCropWindowRect);
                    this.mRestoreCropWindowRect = null;
                    handleCropWindowChanged(false, false);
                    return;
                }
                return;
            }
            updateBitmapRect(BitmapUtils.EMPTY_RECT_F);
            return;
        }
        updateBitmapRect(BitmapUtils.EMPTY_RECT_F);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleCropWindowChanged(boolean inProgress, boolean animate) {
        int width = getWidth();
        int height = getHeight();
        if (this.mBitmap != null && width > 0 && height > 0) {
            RectF cropRect = this.mCropOverlayView.getCropWindowRect();
            if (inProgress) {
                if (cropRect.left < 0.0f || cropRect.top < 0.0f || cropRect.right > width || cropRect.bottom > height) {
                    applyImageMatrix(width, height, false, false);
                    return;
                }
                return;
            }
            if (this.mAutoZoomEnabled || this.mZoom > 1.0f) {
                float newZoom = 0.0f;
                if (this.mZoom < this.mMaxZoom && cropRect.width() < width * 0.5f && cropRect.height() < height * 0.5f) {
                    newZoom = Math.min(this.mMaxZoom, Math.min(width / ((cropRect.width() / this.mZoom) / 0.64f), height / ((cropRect.height() / this.mZoom) / 0.64f)));
                }
                if (this.mZoom > 1.0f && (cropRect.width() > width * 0.65f || cropRect.height() > height * 0.65f)) {
                    newZoom = Math.max(1.0f, Math.min(width / ((cropRect.width() / this.mZoom) / 0.51f), height / ((cropRect.height() / this.mZoom) / 0.51f)));
                }
                if (!this.mAutoZoomEnabled) {
                    newZoom = 1.0f;
                }
                if (newZoom > 0.0f && newZoom != this.mZoom) {
                    if (animate) {
                        if (this.mAnimation == null) {
                            this.mAnimation = new CropImageAnimation(this.mImageView, this.mCropOverlayView);
                        }
                        this.mAnimation.setStartState(this.mImageRect, this.mImageMatrix);
                    }
                    updateCropRectByZoomChange(newZoom / this.mZoom);
                    this.mZoom = newZoom;
                    applyImageMatrix(width, height, true, animate);
                }
            }
        }
    }

    private void updateCropRectByZoomChange(float zoomChange) {
        RectF cropRect = this.mCropOverlayView.getCropWindowRect();
        float xCenterOffset = (getWidth() / 2) - cropRect.centerX();
        float yCenterOffset = (getHeight() / 2) - cropRect.centerY();
        cropRect.offset(xCenterOffset - (xCenterOffset * zoomChange), yCenterOffset - (yCenterOffset * zoomChange));
        cropRect.inset((cropRect.width() - (cropRect.width() * zoomChange)) / 2.0f, (cropRect.height() - (cropRect.height() * zoomChange)) / 2.0f);
        this.mCropOverlayView.setCropWindowRect(cropRect);
    }

    private void applyImageMatrix(float width, float height, boolean center, boolean animate) {
        if (this.mBitmap != null && width > 0.0f && height > 0.0f) {
            this.mImageMatrix.reset();
            this.mImageRect.set(0.0f, 0.0f, this.mBitmap.getWidth(), this.mBitmap.getHeight());
            this.mImageMatrix.postTranslate((width - this.mImageRect.width()) / 2.0f, (height - this.mImageRect.height()) / 2.0f);
            mapImageRectangleByImageMatrix(this.mImageRect);
            if (this.mDegreesRotated > 0) {
                this.mImageMatrix.postRotate(this.mDegreesRotated, this.mImageRect.centerX(), this.mImageRect.centerY());
                mapImageRectangleByImageMatrix(this.mImageRect);
            }
            float scale = Math.min(width / this.mImageRect.width(), height / this.mImageRect.height());
            if (this.mScaleType == ScaleType.FIT_CENTER || ((this.mScaleType == ScaleType.CENTER_INSIDE && scale < 1.0f) || (scale > 1.0f && this.mAutoZoomEnabled))) {
                this.mImageMatrix.postScale(scale, scale, this.mImageRect.centerX(), this.mImageRect.centerY());
                mapImageRectangleByImageMatrix(this.mImageRect);
            }
            this.mImageMatrix.postScale(this.mZoom, this.mZoom, this.mImageRect.centerX(), this.mImageRect.centerY());
            mapImageRectangleByImageMatrix(this.mImageRect);
            RectF cropRect = this.mCropOverlayView.getCropWindowRect();
            cropRect.offset((-this.mZoomOffsetX) * this.mZoom, (-this.mZoomOffsetY) * this.mZoom);
            if (center) {
                this.mZoomOffsetX = width > this.mImageRect.width() ? 0.0f : Math.max(Math.min((width / 2.0f) - cropRect.centerX(), -this.mImageRect.left), getWidth() - this.mImageRect.right) / this.mZoom;
                this.mZoomOffsetY = height > this.mImageRect.height() ? 0.0f : Math.max(Math.min((height / 2.0f) - cropRect.centerY(), -this.mImageRect.top), getHeight() - this.mImageRect.bottom) / this.mZoom;
            } else {
                this.mZoomOffsetX = Math.min(Math.max(this.mZoomOffsetX * this.mZoom, -cropRect.left), (-cropRect.right) + width) / this.mZoom;
                this.mZoomOffsetY = Math.min(Math.max(this.mZoomOffsetY * this.mZoom, -cropRect.top), (-cropRect.bottom) + height) / this.mZoom;
            }
            this.mImageMatrix.postTranslate(this.mZoomOffsetX * this.mZoom, this.mZoomOffsetY * this.mZoom);
            cropRect.offset(this.mZoomOffsetX * this.mZoom, this.mZoomOffsetY * this.mZoom);
            this.mCropOverlayView.setCropWindowRect(cropRect);
            mapImageRectangleByImageMatrix(this.mImageRect);
            if (animate) {
                this.mAnimation.setEndState(this.mImageRect, this.mImageMatrix);
                this.mImageView.startAnimation(this.mAnimation);
            } else {
                this.mImageView.setImageMatrix(this.mImageMatrix);
            }
            updateBitmapRect(this.mImageRect);
        }
    }

    private void mapImageRectangleByImageMatrix(RectF imgRect) {
        imgRect.set(0.0f, 0.0f, this.mBitmap.getWidth(), this.mBitmap.getHeight());
        this.mImageMatrix.mapRect(imgRect);
    }

    private static int getOnMeasureSpec(int measureSpecMode, int measureSpecSize, int desiredSize) {
        int spec;
        if (measureSpecMode == 1073741824) {
            spec = measureSpecSize;
        } else if (measureSpecMode == Integer.MIN_VALUE) {
            spec = Math.min(desiredSize, measureSpecSize);
        } else {
            spec = desiredSize;
        }
        return spec;
    }

    private void setCropOverlayVisibility() {
        if (this.mCropOverlayView != null) {
            this.mCropOverlayView.setVisibility((!this.mShowCropOverlay || this.mBitmap == null) ? 4 : 0);
        }
    }

    private void setProgressBarVisibility() {
        boolean visible = this.mShowProgressBar && ((this.mBitmap == null && this.mBitmapLoadingWorkerTask != null) || this.mBitmapCroppingWorkerTask != null);
        this.mProgressBar.setVisibility(visible ? 0 : 4);
    }

    private void updateBitmapRect(RectF bitmapRect) {
        if (this.mBitmap != null && bitmapRect.width() > 0.0f && bitmapRect.height() > 0.0f) {
            float scaleFactorWidth = (this.mBitmap.getWidth() * this.mLoadedSampleSize) / bitmapRect.width();
            float scaleFactorHeight = (this.mBitmap.getHeight() * this.mLoadedSampleSize) / bitmapRect.height();
            this.mCropOverlayView.setCropWindowLimits(getWidth(), getHeight(), scaleFactorWidth, scaleFactorHeight);
        }
        this.mCropOverlayView.setBitmapRect(bitmapRect, getWidth(), getHeight());
    }
}
