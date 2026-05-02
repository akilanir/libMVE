package com.theartofdev.edmodo.cropper;

import android.app.Activity;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.app.Fragment;
import com.theartofdev.edmodo.cropper.CropImageView;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropImage.class */
public final class CropImage {
    static final String CROP_IMAGE_EXTRA_SOURCE = "CROP_IMAGE_EXTRA_SOURCE";
    static final String CROP_IMAGE_EXTRA_OPTIONS = "CROP_IMAGE_EXTRA_OPTIONS";
    static final String CROP_IMAGE_EXTRA_RESULT = "CROP_IMAGE_EXTRA_RESULT";
    public static final int PICK_IMAGE_CHOOSER_REQUEST_CODE = 200;
    public static final int PICK_IMAGE_PERMISSIONS_REQUEST_CODE = 201;
    public static final int CROP_IMAGE_ACTIVITY_REQUEST_CODE = 203;
    public static final int CROP_IMAGE_ACTIVITY_RESULT_ERROR_CODE = 204;

    private CropImage() {
    }

    public static Bitmap toOvalBitmap(Bitmap bitmap) {
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        Bitmap output = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(output);
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        canvas.drawARGB(0, 0, 0, 0);
        paint.setColor(-12434878);
        RectF rect = new RectF(0.0f, 0.0f, width, height);
        canvas.drawOval(rect, paint);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
        canvas.drawBitmap(bitmap, 0.0f, 0.0f, paint);
        bitmap.recycle();
        return output;
    }

    public static void startPickImageActivity(Activity activity) {
        activity.startActivityForResult(getPickImageChooserIntent(activity), PICK_IMAGE_CHOOSER_REQUEST_CODE);
    }

    public static Intent getPickImageChooserIntent(Context context) {
        return getPickImageChooserIntent(context, "Select source", false);
    }

    public static Intent getPickImageChooserIntent(Context context, CharSequence title, boolean includeDocuments) {
        Intent target;
        Uri outputFileUri = getCaptureImageOutputUri(context);
        List<Intent> allIntents = new ArrayList<>();
        PackageManager packageManager = context.getPackageManager();
        Intent captureIntent = new Intent("android.media.action.IMAGE_CAPTURE");
        List<ResolveInfo> listCam = packageManager.queryIntentActivities(captureIntent, 0);
        for (ResolveInfo res : listCam) {
            Intent intent = new Intent(captureIntent);
            intent.setComponent(new ComponentName(res.activityInfo.packageName, res.activityInfo.name));
            intent.setPackage(res.activityInfo.packageName);
            if (outputFileUri != null) {
                intent.putExtra("output", outputFileUri);
            }
            allIntents.add(intent);
        }
        Intent galleryIntent = new Intent("android.intent.action.GET_CONTENT");
        galleryIntent.setType("image/*");
        List<ResolveInfo> listGallery = packageManager.queryIntentActivities(galleryIntent, 0);
        for (ResolveInfo res2 : listGallery) {
            Intent intent2 = new Intent(galleryIntent);
            intent2.setComponent(new ComponentName(res2.activityInfo.packageName, res2.activityInfo.name));
            intent2.setPackage(res2.activityInfo.packageName);
            allIntents.add(intent2);
        }
        if (!includeDocuments) {
            Iterator<Intent> it = allIntents.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Intent intent3 = it.next();
                if (intent3.getComponent().getClassName().equals("com.android.documentsui.DocumentsActivity")) {
                    allIntents.remove(intent3);
                    break;
                }
            }
        }
        if (Build.VERSION.SDK_INT >= 23) {
            target = new Intent();
        } else {
            target = allIntents.get(allIntents.size() - 1);
            allIntents.remove(allIntents.size() - 1);
        }
        Intent chooserIntent = Intent.createChooser(target, title);
        chooserIntent.putExtra("android.intent.extra.INITIAL_INTENTS", (Parcelable[]) allIntents.toArray(new Parcelable[allIntents.size()]));
        return chooserIntent;
    }

    public static Uri getCaptureImageOutputUri(Context context) {
        Uri outputFileUri = null;
        File getImage = context.getExternalCacheDir();
        if (getImage != null) {
            outputFileUri = Uri.fromFile(new File(getImage.getPath(), "pickImageResult.jpeg"));
        }
        return outputFileUri;
    }

    public static Uri getPickImageResultUri(Context context, Intent data) {
        boolean isCamera = true;
        if (data != null && data.getData() != null) {
            String action = data.getAction();
            isCamera = action != null && action.equals("android.media.action.IMAGE_CAPTURE");
        }
        return (isCamera || data.getData() == null) ? getCaptureImageOutputUri(context) : data.getData();
    }

    public static boolean isReadExternalStoragePermissionsRequired(Context context, Uri uri) {
        return Build.VERSION.SDK_INT >= 23 && context.checkSelfPermission("android.permission.READ_EXTERNAL_STORAGE") != 0 && isUriRequiresPermissions(context, uri);
    }

    public static boolean isUriRequiresPermissions(Context context, Uri uri) {
        try {
            ContentResolver resolver = context.getContentResolver();
            InputStream stream = resolver.openInputStream(uri);
            stream.close();
            return false;
        } catch (Exception e) {
            return true;
        }
    }

    public static ActivityBuilder activity(Uri uri) {
        if (uri == null || uri.equals(Uri.EMPTY)) {
            throw new IllegalArgumentException("Uri must be non null or empty");
        }
        return new ActivityBuilder(uri);
    }

    public static ActivityResult getActivityResult(Intent data) {
        if (data != null) {
            return (ActivityResult) data.getParcelableExtra(CROP_IMAGE_EXTRA_RESULT);
        }
        return null;
    }

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropImage$ActivityBuilder.class */
    public static final class ActivityBuilder {
        private final Uri mSource;
        private final CropImageOptions mOptions;

        private ActivityBuilder(Uri source) {
            this.mSource = source;
            this.mOptions = new CropImageOptions();
        }

        public Intent getIntent(Context context) {
            this.mOptions.validate();
            Intent intent = new Intent();
            intent.setClass(context, CropImageActivity.class);
            intent.putExtra(CropImage.CROP_IMAGE_EXTRA_SOURCE, this.mSource);
            intent.putExtra(CropImage.CROP_IMAGE_EXTRA_OPTIONS, this.mOptions);
            return intent;
        }

        public void start(Activity activity) {
            this.mOptions.validate();
            activity.startActivityForResult(getIntent(activity), CropImage.CROP_IMAGE_ACTIVITY_REQUEST_CODE);
        }

        public void start(Context context, Fragment fragment) {
            fragment.startActivityForResult(getIntent(context), CropImage.CROP_IMAGE_ACTIVITY_REQUEST_CODE);
        }

        public ActivityBuilder setCropShape(CropImageView.CropShape cropShape) {
            this.mOptions.cropShape = cropShape;
            return this;
        }

        public ActivityBuilder setSnapRadius(float snapRadius) {
            this.mOptions.snapRadius = snapRadius;
            return this;
        }

        public ActivityBuilder setTouchRadius(float touchRadius) {
            this.mOptions.touchRadius = touchRadius;
            return this;
        }

        public ActivityBuilder setGuidelines(CropImageView.Guidelines guidelines) {
            this.mOptions.guidelines = guidelines;
            return this;
        }

        public ActivityBuilder setScaleType(CropImageView.ScaleType scaleType) {
            this.mOptions.scaleType = scaleType;
            return this;
        }

        public ActivityBuilder setShowCropOverlay(boolean showCropOverlay) {
            this.mOptions.showCropOverlay = showCropOverlay;
            return this;
        }

        public ActivityBuilder setAutoZoomEnabled(boolean autoZoomEnabled) {
            this.mOptions.autoZoomEnabled = autoZoomEnabled;
            return this;
        }

        public ActivityBuilder setMaxZoom(int maxZoom) {
            this.mOptions.maxZoom = maxZoom;
            return this;
        }

        public ActivityBuilder setInitialCropWindowPaddingRatio(float initialCropWindowPaddingRatio) {
            this.mOptions.initialCropWindowPaddingRatio = initialCropWindowPaddingRatio;
            return this;
        }

        public ActivityBuilder setFixAspectRatio(boolean fixAspectRatio) {
            this.mOptions.fixAspectRatio = fixAspectRatio;
            return this;
        }

        public ActivityBuilder setAspectRatio(int aspectRatioX, int aspectRatioY) {
            this.mOptions.aspectRatioX = aspectRatioX;
            this.mOptions.aspectRatioY = aspectRatioY;
            return this;
        }

        public ActivityBuilder setBorderLineThickness(float borderLineThickness) {
            this.mOptions.borderLineThickness = borderLineThickness;
            return this;
        }

        public ActivityBuilder setBorderLineColor(int borderLineColor) {
            this.mOptions.borderLineColor = borderLineColor;
            return this;
        }

        public ActivityBuilder setBorderCornerThickness(float borderCornerThickness) {
            this.mOptions.borderCornerThickness = borderCornerThickness;
            return this;
        }

        public ActivityBuilder setBorderCornerOffset(float borderCornerOffset) {
            this.mOptions.borderCornerOffset = borderCornerOffset;
            return this;
        }

        public ActivityBuilder setBorderCornerLength(float borderCornerLength) {
            this.mOptions.borderCornerLength = borderCornerLength;
            return this;
        }

        public ActivityBuilder setBorderCornerColor(int borderCornerColor) {
            this.mOptions.borderCornerColor = borderCornerColor;
            return this;
        }

        public ActivityBuilder setGuidelinesThickness(float guidelinesThickness) {
            this.mOptions.guidelinesThickness = guidelinesThickness;
            return this;
        }

        public ActivityBuilder setGuidelinesColor(int guidelinesColor) {
            this.mOptions.guidelinesColor = guidelinesColor;
            return this;
        }

        public ActivityBuilder setBackgroundColor(int backgroundColor) {
            this.mOptions.backgroundColor = backgroundColor;
            return this;
        }

        public ActivityBuilder setMinCropWindowSize(int minCropWindowWidth, int minCropWindowHeight) {
            this.mOptions.minCropWindowWidth = minCropWindowWidth;
            this.mOptions.minCropWindowHeight = minCropWindowHeight;
            return this;
        }

        public ActivityBuilder setMinCropResultSize(int minCropResultWidth, int minCropResultHeight) {
            this.mOptions.minCropResultWidth = minCropResultWidth;
            this.mOptions.minCropResultHeight = minCropResultHeight;
            return this;
        }

        public ActivityBuilder setMaxCropResultSize(int maxCropResultWidth, int maxCropResultHeight) {
            this.mOptions.maxCropResultWidth = maxCropResultWidth;
            this.mOptions.maxCropResultHeight = maxCropResultHeight;
            return this;
        }

        public ActivityBuilder setActivityTitle(String activityTitle) {
            this.mOptions.activityTitle = activityTitle;
            return this;
        }

        public ActivityBuilder setActivityMenuIconColor(int activityMenuIconColor) {
            this.mOptions.activityMenuIconColor = activityMenuIconColor;
            return this;
        }

        public ActivityBuilder setOutputUri(Uri outputUri) {
            this.mOptions.outputUri = outputUri;
            return this;
        }

        public ActivityBuilder setOutputCompressFormat(Bitmap.CompressFormat outputCompressFormat) {
            this.mOptions.outputCompressFormat = outputCompressFormat;
            return this;
        }

        public ActivityBuilder setOutputCompressQuality(int outputCompressQuality) {
            this.mOptions.outputCompressQuality = outputCompressQuality;
            return this;
        }

        public ActivityBuilder setRequestedSize(int reqWidth, int reqHeight) {
            this.mOptions.outputRequestWidth = reqWidth;
            this.mOptions.outputRequestHeight = reqHeight;
            return this;
        }

        public ActivityBuilder setNoOutputImage(boolean noOutputImage) {
            this.mOptions.noOutputImage = noOutputImage;
            return this;
        }

        public ActivityBuilder setInitialCropWindowRectangle(Rect initialCropWindowRectangle) {
            this.mOptions.initialCropWindowRectangle = initialCropWindowRectangle;
            return this;
        }

        public ActivityBuilder setInitialRotation(int initialRotation) {
            this.mOptions.initialRotation = initialRotation;
            return this;
        }

        public ActivityBuilder setAllowRotation(boolean allowRotation) {
            this.mOptions.allowRotation = allowRotation;
            return this;
        }
    }

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropImage$ActivityResult.class */
    public static final class ActivityResult implements Parcelable {
        public static final Parcelable.Creator<ActivityResult> CREATOR = new Parcelable.Creator<ActivityResult>() { // from class: com.theartofdev.edmodo.cropper.CropImage.ActivityResult.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public ActivityResult createFromParcel(Parcel in) {
                return new ActivityResult(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public ActivityResult[] newArray(int size) {
                return new ActivityResult[size];
            }
        };
        private final Uri mUri;
        private final Exception mError;
        private final float[] mCropPoints;
        private final Rect mCropRect;
        private final int mRotation;

        ActivityResult(Uri uri, Exception error, float[] cropPoints, Rect cropRect, int rotation) {
            this.mUri = uri;
            this.mError = error;
            this.mCropPoints = cropPoints;
            this.mCropRect = cropRect;
            this.mRotation = rotation;
        }

        protected ActivityResult(Parcel in) {
            this.mUri = (Uri) in.readParcelable(Uri.class.getClassLoader());
            this.mError = (Exception) in.readSerializable();
            this.mCropPoints = in.createFloatArray();
            this.mCropRect = (Rect) in.readParcelable(Rect.class.getClassLoader());
            this.mRotation = in.readInt();
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeParcelable(this.mUri, flags);
            dest.writeSerializable(this.mError);
            dest.writeFloatArray(this.mCropPoints);
            dest.writeParcelable(this.mCropRect, flags);
            dest.writeInt(this.mRotation);
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        public boolean isSuccessful() {
            return this.mError == null;
        }

        public Uri getUri() {
            return this.mUri;
        }

        public Exception getError() {
            return this.mError;
        }

        public float[] getCropPoints() {
            return this.mCropPoints;
        }

        public Rect getCropRect() {
            return this.mCropRect;
        }

        public int getRotation() {
            return this.mRotation;
        }
    }
}
