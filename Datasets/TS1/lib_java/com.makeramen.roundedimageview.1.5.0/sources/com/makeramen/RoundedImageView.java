package com.makeramen;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;
import android.util.AttributeSet;
import android.util.Log;
import android.widget.ImageView;

/* loaded from: com.makeramen.roundedimageview.1.5.0.jar:com/makeramen/RoundedImageView.class */
public class RoundedImageView extends ImageView {
    private static final int TILE_MODE_UNDEFINED = -2;
    private static final int TILE_MODE_CLAMP = 0;
    private static final int TILE_MODE_REPEAT = 1;
    private static final int TILE_MODE_MIRROR = 2;
    public static final String TAG = "RoundedImageView";
    public static final float DEFAULT_RADIUS = 0.0f;
    public static final float DEFAULT_BORDER_WIDTH = 0.0f;
    public static final Shader.TileMode DEFAULT_TILE_MODE;
    private static final ImageView.ScaleType[] SCALE_TYPES;
    private float cornerRadius;
    private float borderWidth;
    private ColorStateList borderColor;
    private boolean isOval;
    private boolean mutateBackground;
    private Shader.TileMode tileModeX;
    private Shader.TileMode tileModeY;
    private int mResource;
    private Drawable mDrawable;
    private Drawable mBackgroundDrawable;
    private ImageView.ScaleType mScaleType;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !RoundedImageView.class.desiredAssertionStatus();
        DEFAULT_TILE_MODE = Shader.TileMode.CLAMP;
        SCALE_TYPES = new ImageView.ScaleType[]{ImageView.ScaleType.MATRIX, ImageView.ScaleType.FIT_XY, ImageView.ScaleType.FIT_START, ImageView.ScaleType.FIT_CENTER, ImageView.ScaleType.FIT_END, ImageView.ScaleType.CENTER, ImageView.ScaleType.CENTER_CROP, ImageView.ScaleType.CENTER_INSIDE};
    }

    public RoundedImageView(Context context) {
        super(context);
        this.cornerRadius = 0.0f;
        this.borderWidth = 0.0f;
        this.borderColor = ColorStateList.valueOf(RoundedDrawable.DEFAULT_BORDER_COLOR);
        this.isOval = false;
        this.mutateBackground = false;
        this.tileModeX = DEFAULT_TILE_MODE;
        this.tileModeY = DEFAULT_TILE_MODE;
    }

    public RoundedImageView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public RoundedImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.cornerRadius = 0.0f;
        this.borderWidth = 0.0f;
        this.borderColor = ColorStateList.valueOf(RoundedDrawable.DEFAULT_BORDER_COLOR);
        this.isOval = false;
        this.mutateBackground = false;
        this.tileModeX = DEFAULT_TILE_MODE;
        this.tileModeY = DEFAULT_TILE_MODE;
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.RoundedImageView, defStyle, 0);
        int index = a.getInt(R.styleable.RoundedImageView_android_scaleType, -1);
        if (index >= 0) {
            setScaleType(SCALE_TYPES[index]);
        } else {
            setScaleType(ImageView.ScaleType.FIT_CENTER);
        }
        this.cornerRadius = a.getDimensionPixelSize(R.styleable.RoundedImageView_riv_corner_radius, -1);
        this.borderWidth = a.getDimensionPixelSize(R.styleable.RoundedImageView_riv_border_width, -1);
        if (this.cornerRadius < 0.0f) {
            this.cornerRadius = 0.0f;
        }
        if (this.borderWidth < 0.0f) {
            this.borderWidth = 0.0f;
        }
        this.borderColor = a.getColorStateList(R.styleable.RoundedImageView_riv_border_color);
        if (this.borderColor == null) {
            this.borderColor = ColorStateList.valueOf(RoundedDrawable.DEFAULT_BORDER_COLOR);
        }
        this.mutateBackground = a.getBoolean(R.styleable.RoundedImageView_riv_mutate_background, false);
        this.isOval = a.getBoolean(R.styleable.RoundedImageView_riv_oval, false);
        int tileMode = a.getInt(R.styleable.RoundedImageView_riv_tile_mode, TILE_MODE_UNDEFINED);
        if (tileMode != TILE_MODE_UNDEFINED) {
            setTileModeX(parseTileMode(tileMode));
            setTileModeY(parseTileMode(tileMode));
        }
        int tileModeX = a.getInt(R.styleable.RoundedImageView_riv_tile_mode_x, TILE_MODE_UNDEFINED);
        if (tileModeX != TILE_MODE_UNDEFINED) {
            setTileModeX(parseTileMode(tileModeX));
        }
        int tileModeY = a.getInt(R.styleable.RoundedImageView_riv_tile_mode_y, TILE_MODE_UNDEFINED);
        if (tileModeY != TILE_MODE_UNDEFINED) {
            setTileModeY(parseTileMode(tileModeY));
        }
        updateDrawableAttrs();
        updateBackgroundDrawableAttrs(true);
        a.recycle();
    }

    private static Shader.TileMode parseTileMode(int tileMode) {
        switch (tileMode) {
            case 0:
                return Shader.TileMode.CLAMP;
            case 1:
                return Shader.TileMode.REPEAT;
            case TILE_MODE_MIRROR /* 2 */:
                return Shader.TileMode.MIRROR;
            default:
                return null;
        }
    }

    @Override // android.widget.ImageView, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        invalidate();
    }

    @Override // android.widget.ImageView
    public ImageView.ScaleType getScaleType() {
        return this.mScaleType;
    }

    @Override // android.widget.ImageView
    public void setScaleType(ImageView.ScaleType scaleType) {
        if (!$assertionsDisabled && scaleType == null) {
            throw new AssertionError();
        }
        if (this.mScaleType != scaleType) {
            this.mScaleType = scaleType;
            switch (AnonymousClass1.$SwitchMap$android$widget$ImageView$ScaleType[scaleType.ordinal()]) {
                case 1:
                case TILE_MODE_MIRROR /* 2 */:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                    super.setScaleType(ImageView.ScaleType.FIT_XY);
                    break;
                default:
                    super.setScaleType(scaleType);
                    break;
            }
            updateDrawableAttrs();
            updateBackgroundDrawableAttrs(false);
            invalidate();
        }
    }

    /* renamed from: com.makeramen.RoundedImageView$1, reason: invalid class name */
    /* loaded from: com.makeramen.roundedimageview.1.5.0.jar:com/makeramen/RoundedImageView$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$android$widget$ImageView$ScaleType = new int[ImageView.ScaleType.values().length];

        static {
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.CENTER.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.CENTER_CROP.ordinal()] = RoundedImageView.TILE_MODE_MIRROR;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.CENTER_INSIDE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_CENTER.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_START.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_END.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_XY.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
        }
    }

    @Override // android.widget.ImageView
    public void setImageDrawable(Drawable drawable) {
        this.mResource = 0;
        this.mDrawable = RoundedDrawable.fromDrawable(drawable);
        updateDrawableAttrs();
        super.setImageDrawable(this.mDrawable);
    }

    @Override // android.widget.ImageView
    public void setImageBitmap(Bitmap bm) {
        this.mResource = 0;
        this.mDrawable = RoundedDrawable.fromBitmap(bm);
        updateDrawableAttrs();
        super.setImageDrawable(this.mDrawable);
    }

    @Override // android.widget.ImageView
    public void setImageResource(int resId) {
        if (this.mResource != resId) {
            this.mResource = resId;
            this.mDrawable = resolveResource();
            updateDrawableAttrs();
            super.setImageDrawable(this.mDrawable);
        }
    }

    @Override // android.widget.ImageView
    public void setImageURI(Uri uri) {
        super.setImageURI(uri);
        setImageDrawable(getDrawable());
    }

    private Drawable resolveResource() {
        Resources rsrc = getResources();
        if (rsrc == null) {
            return null;
        }
        Drawable d = null;
        if (this.mResource != 0) {
            try {
                d = rsrc.getDrawable(this.mResource);
            } catch (Exception e) {
                Log.w(TAG, "Unable to find resource: " + this.mResource, e);
                this.mResource = 0;
            }
        }
        return RoundedDrawable.fromDrawable(d);
    }

    @Override // android.view.View
    public void setBackground(Drawable background) {
        setBackgroundDrawable(background);
    }

    private void updateDrawableAttrs() {
        updateAttrs(this.mDrawable);
    }

    private void updateBackgroundDrawableAttrs(boolean convert) {
        if (this.mutateBackground) {
            if (convert) {
                this.mBackgroundDrawable = RoundedDrawable.fromDrawable(this.mBackgroundDrawable);
            }
            updateAttrs(this.mBackgroundDrawable);
        }
    }

    private void updateAttrs(Drawable drawable) {
        if (drawable == null) {
            return;
        }
        if (drawable instanceof RoundedDrawable) {
            ((RoundedDrawable) drawable).setScaleType(this.mScaleType).setCornerRadius(this.cornerRadius).setBorderWidth(this.borderWidth).setBorderColor(this.borderColor).setOval(this.isOval).setTileModeX(this.tileModeX).setTileModeY(this.tileModeY);
            return;
        }
        if (drawable instanceof LayerDrawable) {
            LayerDrawable ld = (LayerDrawable) drawable;
            int layers = ld.getNumberOfLayers();
            for (int i = 0; i < layers; i++) {
                updateAttrs(ld.getDrawable(i));
            }
        }
    }

    @Override // android.view.View
    @Deprecated
    public void setBackgroundDrawable(Drawable background) {
        this.mBackgroundDrawable = background;
        updateBackgroundDrawableAttrs(true);
        super.setBackgroundDrawable(this.mBackgroundDrawable);
    }

    public float getCornerRadius() {
        return this.cornerRadius;
    }

    public void setCornerRadius(int resId) {
        setCornerRadius(getResources().getDimension(resId));
    }

    public void setCornerRadius(float radius) {
        if (this.cornerRadius == radius) {
            return;
        }
        this.cornerRadius = radius;
        updateDrawableAttrs();
        updateBackgroundDrawableAttrs(false);
    }

    public float getBorderWidth() {
        return this.borderWidth;
    }

    public void setBorderWidth(int resId) {
        setBorderWidth(getResources().getDimension(resId));
    }

    public void setBorderWidth(float width) {
        if (this.borderWidth == width) {
            return;
        }
        this.borderWidth = width;
        updateDrawableAttrs();
        updateBackgroundDrawableAttrs(false);
        invalidate();
    }

    public int getBorderColor() {
        return this.borderColor.getDefaultColor();
    }

    public void setBorderColor(int color) {
        setBorderColor(ColorStateList.valueOf(color));
    }

    public ColorStateList getBorderColors() {
        return this.borderColor;
    }

    public void setBorderColor(ColorStateList colors) {
        if (this.borderColor.equals(colors)) {
            return;
        }
        this.borderColor = colors != null ? colors : ColorStateList.valueOf(RoundedDrawable.DEFAULT_BORDER_COLOR);
        updateDrawableAttrs();
        updateBackgroundDrawableAttrs(false);
        if (this.borderWidth > 0.0f) {
            invalidate();
        }
    }

    public boolean isOval() {
        return this.isOval;
    }

    public void setOval(boolean oval) {
        this.isOval = oval;
        updateDrawableAttrs();
        updateBackgroundDrawableAttrs(false);
        invalidate();
    }

    public Shader.TileMode getTileModeX() {
        return this.tileModeX;
    }

    public void setTileModeX(Shader.TileMode tileModeX) {
        if (this.tileModeX == tileModeX) {
            return;
        }
        this.tileModeX = tileModeX;
        updateDrawableAttrs();
        updateBackgroundDrawableAttrs(false);
        invalidate();
    }

    public Shader.TileMode getTileModeY() {
        return this.tileModeY;
    }

    public void setTileModeY(Shader.TileMode tileModeY) {
        if (this.tileModeY == tileModeY) {
            return;
        }
        this.tileModeY = tileModeY;
        updateDrawableAttrs();
        updateBackgroundDrawableAttrs(false);
        invalidate();
    }

    public boolean mutatesBackground() {
        return this.mutateBackground;
    }

    public void mutateBackground(boolean mutate) {
        if (this.mutateBackground == mutate) {
            return;
        }
        this.mutateBackground = mutate;
        updateBackgroundDrawableAttrs(true);
        invalidate();
    }
}
