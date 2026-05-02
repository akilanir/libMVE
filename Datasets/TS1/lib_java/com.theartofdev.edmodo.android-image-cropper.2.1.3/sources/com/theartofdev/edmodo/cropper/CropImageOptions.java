package com.theartofdev.edmodo.cropper;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import com.theartofdev.edmodo.cropper.CropImageView;

/* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropImageOptions.class */
final class CropImageOptions implements Parcelable {
    public static final Parcelable.Creator<CropImageOptions> CREATOR = new Parcelable.Creator<CropImageOptions>() { // from class: com.theartofdev.edmodo.cropper.CropImageOptions.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public CropImageOptions createFromParcel(Parcel in) {
            return new CropImageOptions(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public CropImageOptions[] newArray(int size) {
            return new CropImageOptions[size];
        }
    };
    public CropImageView.CropShape cropShape;
    public float snapRadius;
    public float touchRadius;
    public CropImageView.Guidelines guidelines;
    public CropImageView.ScaleType scaleType;
    public boolean showCropOverlay;
    public boolean showProgressBar;
    public boolean autoZoomEnabled;
    public int maxZoom;
    public float initialCropWindowPaddingRatio;
    public boolean fixAspectRatio;
    public int aspectRatioX;
    public int aspectRatioY;
    public float borderLineThickness;
    public int borderLineColor;
    public float borderCornerThickness;
    public float borderCornerOffset;
    public float borderCornerLength;
    public int borderCornerColor;
    public float guidelinesThickness;
    public int guidelinesColor;
    public int backgroundColor;
    public int minCropWindowWidth;
    public int minCropWindowHeight;
    public int minCropResultWidth;
    public int minCropResultHeight;
    public int maxCropResultWidth;
    public int maxCropResultHeight;
    public String activityTitle;
    public int activityMenuIconColor;
    public Uri outputUri;
    public Bitmap.CompressFormat outputCompressFormat;
    public int outputCompressQuality;
    public int outputRequestWidth;
    public int outputRequestHeight;
    public boolean noOutputImage;
    public Rect initialCropWindowRectangle;
    public int initialRotation;
    public boolean allowRotation;

    public CropImageOptions() {
        DisplayMetrics dm = Resources.getSystem().getDisplayMetrics();
        this.cropShape = CropImageView.CropShape.RECTANGLE;
        this.snapRadius = TypedValue.applyDimension(1, 3.0f, dm);
        this.touchRadius = TypedValue.applyDimension(1, 24.0f, dm);
        this.guidelines = CropImageView.Guidelines.ON_TOUCH;
        this.scaleType = CropImageView.ScaleType.FIT_CENTER;
        this.showCropOverlay = true;
        this.showProgressBar = true;
        this.autoZoomEnabled = true;
        this.maxZoom = 4;
        this.initialCropWindowPaddingRatio = 0.1f;
        this.fixAspectRatio = false;
        this.aspectRatioX = 1;
        this.aspectRatioY = 1;
        this.borderLineThickness = TypedValue.applyDimension(1, 3.0f, dm);
        this.borderLineColor = Color.argb(170, 255, 255, 255);
        this.borderCornerThickness = TypedValue.applyDimension(1, 2.0f, dm);
        this.borderCornerOffset = TypedValue.applyDimension(1, 5.0f, dm);
        this.borderCornerLength = TypedValue.applyDimension(1, 14.0f, dm);
        this.borderCornerColor = -1;
        this.guidelinesThickness = TypedValue.applyDimension(1, 1.0f, dm);
        this.guidelinesColor = Color.argb(170, 255, 255, 255);
        this.backgroundColor = Color.argb(119, 0, 0, 0);
        this.minCropWindowWidth = (int) TypedValue.applyDimension(1, 42.0f, dm);
        this.minCropWindowHeight = (int) TypedValue.applyDimension(1, 42.0f, dm);
        this.minCropResultWidth = 40;
        this.minCropResultHeight = 40;
        this.maxCropResultWidth = 99999;
        this.maxCropResultHeight = 99999;
        this.activityTitle = BuildConfig.FLAVOR;
        this.activityMenuIconColor = 0;
        this.outputUri = Uri.EMPTY;
        this.outputCompressFormat = Bitmap.CompressFormat.JPEG;
        this.outputCompressQuality = 90;
        this.outputRequestWidth = 0;
        this.outputRequestHeight = 0;
        this.noOutputImage = false;
        this.initialCropWindowRectangle = null;
        this.initialRotation = -1;
        this.allowRotation = true;
    }

    protected CropImageOptions(Parcel in) {
        this.cropShape = CropImageView.CropShape.values()[in.readInt()];
        this.snapRadius = in.readFloat();
        this.touchRadius = in.readFloat();
        this.guidelines = CropImageView.Guidelines.values()[in.readInt()];
        this.scaleType = CropImageView.ScaleType.values()[in.readInt()];
        this.showCropOverlay = in.readByte() != 0;
        this.showProgressBar = in.readByte() != 0;
        this.autoZoomEnabled = in.readByte() != 0;
        this.maxZoom = in.readInt();
        this.initialCropWindowPaddingRatio = in.readFloat();
        this.fixAspectRatio = in.readByte() != 0;
        this.aspectRatioX = in.readInt();
        this.aspectRatioY = in.readInt();
        this.borderLineThickness = in.readFloat();
        this.borderLineColor = in.readInt();
        this.borderCornerThickness = in.readFloat();
        this.borderCornerOffset = in.readFloat();
        this.borderCornerLength = in.readFloat();
        this.borderCornerColor = in.readInt();
        this.guidelinesThickness = in.readFloat();
        this.guidelinesColor = in.readInt();
        this.backgroundColor = in.readInt();
        this.minCropWindowWidth = in.readInt();
        this.minCropWindowHeight = in.readInt();
        this.minCropResultWidth = in.readInt();
        this.minCropResultHeight = in.readInt();
        this.maxCropResultWidth = in.readInt();
        this.maxCropResultHeight = in.readInt();
        this.activityTitle = in.readString();
        this.activityMenuIconColor = in.readInt();
        this.outputUri = (Uri) in.readParcelable(Uri.class.getClassLoader());
        this.outputCompressFormat = Bitmap.CompressFormat.valueOf(in.readString());
        this.outputCompressQuality = in.readInt();
        this.outputRequestWidth = in.readInt();
        this.outputRequestHeight = in.readInt();
        this.noOutputImage = in.readByte() != 0;
        this.initialCropWindowRectangle = (Rect) in.readParcelable(Rect.class.getClassLoader());
        this.initialRotation = in.readInt();
        this.allowRotation = in.readByte() != 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.cropShape.ordinal());
        dest.writeFloat(this.snapRadius);
        dest.writeFloat(this.touchRadius);
        dest.writeInt(this.guidelines.ordinal());
        dest.writeInt(this.scaleType.ordinal());
        dest.writeByte((byte) (this.showCropOverlay ? 1 : 0));
        dest.writeByte((byte) (this.showProgressBar ? 1 : 0));
        dest.writeByte((byte) (this.autoZoomEnabled ? 1 : 0));
        dest.writeInt(this.maxZoom);
        dest.writeFloat(this.initialCropWindowPaddingRatio);
        dest.writeByte((byte) (this.fixAspectRatio ? 1 : 0));
        dest.writeInt(this.aspectRatioX);
        dest.writeInt(this.aspectRatioY);
        dest.writeFloat(this.borderLineThickness);
        dest.writeInt(this.borderLineColor);
        dest.writeFloat(this.borderCornerThickness);
        dest.writeFloat(this.borderCornerOffset);
        dest.writeFloat(this.borderCornerLength);
        dest.writeInt(this.borderCornerColor);
        dest.writeFloat(this.guidelinesThickness);
        dest.writeInt(this.guidelinesColor);
        dest.writeInt(this.backgroundColor);
        dest.writeInt(this.minCropWindowWidth);
        dest.writeInt(this.minCropWindowHeight);
        dest.writeInt(this.minCropResultWidth);
        dest.writeInt(this.minCropResultHeight);
        dest.writeInt(this.maxCropResultWidth);
        dest.writeInt(this.maxCropResultHeight);
        dest.writeString(this.activityTitle);
        dest.writeInt(this.activityMenuIconColor);
        dest.writeParcelable(this.outputUri, flags);
        dest.writeString(this.outputCompressFormat.name());
        dest.writeInt(this.outputCompressQuality);
        dest.writeInt(this.outputRequestWidth);
        dest.writeInt(this.outputRequestHeight);
        dest.writeInt(this.noOutputImage ? 1 : 0);
        dest.writeParcelable(this.initialCropWindowRectangle, flags);
        dest.writeInt(this.initialRotation);
        dest.writeByte((byte) (this.allowRotation ? 1 : 0));
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public void validate() {
        if (this.maxZoom < 0) {
            throw new IllegalArgumentException("Cannot set max zoom to a number < 1");
        }
        if (this.touchRadius < 0.0f) {
            throw new IllegalArgumentException("Cannot set touch radius value to a number <= 0 ");
        }
        if (this.initialCropWindowPaddingRatio < 0.0f || this.initialCropWindowPaddingRatio >= 0.5d) {
            throw new IllegalArgumentException("Cannot set initial crop window padding value to a number < 0 or >= 0.5");
        }
        if (this.aspectRatioX <= 0) {
            throw new IllegalArgumentException("Cannot set aspect ratio value to a number less than or equal to 0.");
        }
        if (this.aspectRatioY <= 0) {
            throw new IllegalArgumentException("Cannot set aspect ratio value to a number less than or equal to 0.");
        }
        if (this.borderLineThickness < 0.0f) {
            throw new IllegalArgumentException("Cannot set line thickness value to a number less than 0.");
        }
        if (this.borderCornerThickness < 0.0f) {
            throw new IllegalArgumentException("Cannot set corner thickness value to a number less than 0.");
        }
        if (this.guidelinesThickness < 0.0f) {
            throw new IllegalArgumentException("Cannot set guidelines thickness value to a number less than 0.");
        }
        if (this.minCropWindowHeight < 0) {
            throw new IllegalArgumentException("Cannot set min crop window height value to a number < 0 ");
        }
        if (this.minCropResultWidth < 0) {
            throw new IllegalArgumentException("Cannot set min crop result width value to a number < 0 ");
        }
        if (this.minCropResultHeight < 0) {
            throw new IllegalArgumentException("Cannot set min crop result height value to a number < 0 ");
        }
        if (this.maxCropResultWidth < this.minCropResultWidth) {
            throw new IllegalArgumentException("Cannot set max crop result width to smaller value than min crop result width");
        }
        if (this.maxCropResultHeight < this.minCropResultHeight) {
            throw new IllegalArgumentException("Cannot set max crop result height to smaller value than min crop result height");
        }
        if (this.outputRequestWidth < 0) {
            throw new IllegalArgumentException("Cannot set request width value to a number < 0 ");
        }
        if (this.outputRequestHeight < 0) {
            throw new IllegalArgumentException("Cannot set request height value to a number < 0 ");
        }
    }
}
