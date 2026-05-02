package com.yalantis.ucrop;

import android.annotation.TargetApi;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.ColorInt;
import android.support.annotation.IdRes;
import android.support.annotation.NonNull;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.text.TextUtils;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.yalantis.ucrop.UCrop;
import com.yalantis.ucrop.callback.BitmapCropCallback;
import com.yalantis.ucrop.util.SelectedStateListDrawable;
import com.yalantis.ucrop.view.CropImageView;
import com.yalantis.ucrop.view.GestureCropImageView;
import com.yalantis.ucrop.view.OverlayView;
import com.yalantis.ucrop.view.TransformImageView;
import com.yalantis.ucrop.view.UCropView;
import com.yalantis.ucrop.view.widget.AspectRatioTextView;
import com.yalantis.ucrop.view.widget.HorizontalProgressWheelView;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.yalantis.ucrop.1.5.0.jar:com/yalantis/ucrop/UCropActivity.class */
public class UCropActivity extends AppCompatActivity {
    public static final int DEFAULT_COMPRESS_QUALITY = 90;
    public static final Bitmap.CompressFormat DEFAULT_COMPRESS_FORMAT = Bitmap.CompressFormat.JPEG;
    public static final int NONE = 0;
    public static final int SCALE = 1;
    public static final int ROTATE = 2;
    public static final int ALL = 3;
    private static final String TAG = "UCropActivity";
    private static final int TABS_COUNT = 3;
    private static final int SCALE_WIDGET_SENSITIVITY_COEFFICIENT = 15000;
    private static final int ROTATE_WIDGET_SENSITIVITY_COEFFICIENT = 42;
    private String mToolbarTitle;
    private int mToolbarColor;
    private int mStatusBarColor;
    private int mActiveWidgetColor;
    private int mToolbarWidgetColor;
    private int mLogoColor;
    private boolean mShowBottomControls;
    private UCropView mUCropView;
    private GestureCropImageView mGestureCropImageView;
    private OverlayView mOverlayView;
    private ViewGroup mWrapperStateAspectRatio;
    private ViewGroup mWrapperStateRotate;
    private ViewGroup mWrapperStateScale;
    private ViewGroup mLayoutAspectRatio;
    private ViewGroup mLayoutRotate;
    private ViewGroup mLayoutScale;
    private TextView mTextViewRotateAngle;
    private TextView mTextViewScalePercent;
    private View mBlockingView;
    private Uri mOutputUri;
    private boolean mShowLoader = true;
    private List<ViewGroup> mCropAspectRatioViews = new ArrayList();
    private Bitmap.CompressFormat mCompressFormat = DEFAULT_COMPRESS_FORMAT;
    private int mCompressQuality = 90;
    private int[] mAllowedGestures = {1, 2, 3};
    private TransformImageView.TransformImageListener mImageListener = new TransformImageView.TransformImageListener() { // from class: com.yalantis.ucrop.UCropActivity.1
        @Override // com.yalantis.ucrop.view.TransformImageView.TransformImageListener
        public void onRotate(float currentAngle) {
            UCropActivity.this.setAngleText(currentAngle);
        }

        @Override // com.yalantis.ucrop.view.TransformImageView.TransformImageListener
        public void onScale(float currentScale) {
            UCropActivity.this.setScaleText(currentScale);
        }

        @Override // com.yalantis.ucrop.view.TransformImageView.TransformImageListener
        public void onLoadComplete() {
            UCropActivity.this.mUCropView.animate().alpha(1.0f).setDuration(300L).setInterpolator(new AccelerateInterpolator());
            UCropActivity.this.mBlockingView.setClickable(false);
            UCropActivity.this.mShowLoader = false;
            UCropActivity.this.supportInvalidateOptionsMenu();
        }

        @Override // com.yalantis.ucrop.view.TransformImageView.TransformImageListener
        public void onLoadFailure(@NonNull Exception e) {
            UCropActivity.this.setResultException(e);
            UCropActivity.this.finish();
        }
    };
    private final View.OnClickListener mStateClickListener = new View.OnClickListener() { // from class: com.yalantis.ucrop.UCropActivity.7
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (!v.isSelected()) {
                UCropActivity.this.setWidgetState(v.getId());
            }
        }
    };

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: com.yalantis.ucrop.1.5.0.jar:com/yalantis/ucrop/UCropActivity$GestureTypes.class */
    public @interface GestureTypes {
    }

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.ucrop_activity_photobox);
        Intent intent = getIntent();
        setupViews(intent);
        setImageData(intent);
        setInitialState();
        addBlockingView();
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.ucrop_menu_activity, menu);
        MenuItem menuItemLoader = menu.findItem(R.id.menu_loader);
        Drawable menuItemLoaderIcon = menuItemLoader.getIcon();
        if (menuItemLoaderIcon != null) {
            try {
                menuItemLoaderIcon.mutate();
                menuItemLoaderIcon.setColorFilter(this.mToolbarWidgetColor, PorterDuff.Mode.SRC_ATOP);
                menuItemLoader.setIcon(menuItemLoaderIcon);
            } catch (IllegalStateException e) {
                Log.e(TAG, String.format("%s - %s", e.getMessage(), getString(R.string.ucrop_mutate_exception_hint)));
            }
            ((Animatable) menuItemLoader.getIcon()).start();
        }
        MenuItem menuItemCrop = menu.findItem(R.id.menu_crop);
        Drawable menuItemCropIcon = menuItemCrop.getIcon();
        if (menuItemCropIcon != null) {
            menuItemCropIcon.mutate();
            menuItemCropIcon.setColorFilter(this.mToolbarWidgetColor, PorterDuff.Mode.SRC_ATOP);
            menuItemCrop.setIcon(menuItemCropIcon);
            return true;
        }
        return true;
    }

    public boolean onPrepareOptionsMenu(Menu menu) {
        menu.findItem(R.id.menu_crop).setVisible(!this.mShowLoader);
        menu.findItem(R.id.menu_loader).setVisible(this.mShowLoader);
        return super.onPrepareOptionsMenu(menu);
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.menu_crop) {
            cropAndSaveImage();
        } else if (item.getItemId() == 16908332) {
            onBackPressed();
        }
        return super.onOptionsItemSelected(item);
    }

    protected void onStop() {
        super.onStop();
        if (this.mGestureCropImageView != null) {
            this.mGestureCropImageView.cancelAllAnimations();
        }
    }

    private void setImageData(@NonNull Intent intent) {
        Uri inputUri = (Uri) intent.getParcelableExtra(UCrop.EXTRA_INPUT_URI);
        this.mOutputUri = (Uri) intent.getParcelableExtra(UCrop.EXTRA_OUTPUT_URI);
        processOptions(intent);
        if (inputUri != null && this.mOutputUri != null) {
            try {
                this.mGestureCropImageView.setImageUri(inputUri, this.mOutputUri);
            } catch (Exception e) {
                setResultException(e);
                finish();
            }
        } else {
            setResultException(new NullPointerException(getString(R.string.ucrop_error_input_data_is_absent)));
            finish();
        }
        if (intent.getBooleanExtra(UCrop.EXTRA_ASPECT_RATIO_SET, false)) {
            if (this.mShowBottomControls) {
                this.mWrapperStateAspectRatio.setVisibility(8);
            }
            float aspectRatioX = intent.getFloatExtra(UCrop.EXTRA_ASPECT_RATIO_X, 0.0f);
            float aspectRatioY = intent.getFloatExtra(UCrop.EXTRA_ASPECT_RATIO_Y, 0.0f);
            if (aspectRatioX > 0.0f && aspectRatioY > 0.0f) {
                this.mGestureCropImageView.setTargetAspectRatio(aspectRatioX / aspectRatioY);
            } else {
                this.mGestureCropImageView.setTargetAspectRatio(0.0f);
            }
        }
        if (intent.getBooleanExtra(UCrop.EXTRA_MAX_SIZE_SET, false)) {
            int maxSizeX = intent.getIntExtra(UCrop.EXTRA_MAX_SIZE_X, 0);
            int maxSizeY = intent.getIntExtra(UCrop.EXTRA_MAX_SIZE_Y, 0);
            if (maxSizeX > 0 && maxSizeY > 0) {
                this.mGestureCropImageView.setMaxResultImageSizeX(maxSizeX);
                this.mGestureCropImageView.setMaxResultImageSizeY(maxSizeY);
            } else {
                Log.w(TAG, "EXTRA_MAX_SIZE_X and EXTRA_MAX_SIZE_Y must be greater than 0");
            }
        }
    }

    private void processOptions(@NonNull Intent intent) {
        String compressionFormatName = intent.getStringExtra(UCrop.Options.EXTRA_COMPRESSION_FORMAT_NAME);
        Bitmap.CompressFormat compressFormat = null;
        if (!TextUtils.isEmpty(compressionFormatName)) {
            compressFormat = Bitmap.CompressFormat.valueOf(compressionFormatName);
        }
        this.mCompressFormat = compressFormat == null ? DEFAULT_COMPRESS_FORMAT : compressFormat;
        this.mCompressQuality = intent.getIntExtra(UCrop.Options.EXTRA_COMPRESSION_QUALITY, 90);
        int[] allowedGestures = intent.getIntArrayExtra(UCrop.Options.EXTRA_ALLOWED_GESTURES);
        if (allowedGestures != null && allowedGestures.length == 3) {
            this.mAllowedGestures = allowedGestures;
        }
        this.mGestureCropImageView.setMaxBitmapSize(intent.getIntExtra(UCrop.Options.EXTRA_MAX_BITMAP_SIZE, 0));
        this.mGestureCropImageView.setMaxScaleMultiplier(intent.getFloatExtra(UCrop.Options.EXTRA_MAX_SCALE_MULTIPLIER, 10.0f));
        this.mGestureCropImageView.setImageToWrapCropBoundsAnimDuration(intent.getIntExtra(UCrop.Options.EXTRA_IMAGE_TO_CROP_BOUNDS_ANIM_DURATION, CropImageView.DEFAULT_IMAGE_TO_CROP_BOUNDS_ANIM_DURATION));
        this.mOverlayView.setFreestyleCropEnabled(intent.getBooleanExtra(UCrop.Options.EXTRA_FREE_STYLE_CROP, false));
        this.mOverlayView.setDimmedColor(intent.getIntExtra(UCrop.Options.EXTRA_DIMMED_LAYER_COLOR, getResources().getColor(R.color.ucrop_color_default_dimmed)));
        this.mOverlayView.setOvalDimmedLayer(intent.getBooleanExtra(UCrop.Options.EXTRA_OVAL_DIMMED_LAYER, false));
        this.mOverlayView.setShowCropFrame(intent.getBooleanExtra(UCrop.Options.EXTRA_SHOW_CROP_FRAME, true));
        this.mOverlayView.setCropFrameColor(intent.getIntExtra(UCrop.Options.EXTRA_CROP_FRAME_COLOR, getResources().getColor(R.color.ucrop_color_default_crop_frame)));
        this.mOverlayView.setCropFrameStrokeWidth(intent.getIntExtra(UCrop.Options.EXTRA_CROP_FRAME_STROKE_WIDTH, getResources().getDimensionPixelSize(R.dimen.ucrop_default_crop_frame_stoke_width)));
        this.mOverlayView.setShowCropGrid(intent.getBooleanExtra(UCrop.Options.EXTRA_SHOW_CROP_GRID, true));
        this.mOverlayView.setCropGridRowCount(intent.getIntExtra(UCrop.Options.EXTRA_CROP_GRID_ROW_COUNT, 2));
        this.mOverlayView.setCropGridColumnCount(intent.getIntExtra(UCrop.Options.EXTRA_CROP_GRID_COLUMN_COUNT, 2));
        this.mOverlayView.setCropGridColor(intent.getIntExtra(UCrop.Options.EXTRA_CROP_GRID_COLOR, getResources().getColor(R.color.ucrop_color_default_crop_grid)));
        this.mOverlayView.setCropGridStrokeWidth(intent.getIntExtra(UCrop.Options.EXTRA_CROP_GRID_STROKE_WIDTH, getResources().getDimensionPixelSize(R.dimen.ucrop_default_crop_grid_stoke_width)));
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void setupViews(@NonNull Intent intent) {
        this.mStatusBarColor = intent.getIntExtra(UCrop.Options.EXTRA_STATUS_BAR_COLOR, ContextCompat.getColor(this, R.color.ucrop_color_statusbar));
        this.mToolbarColor = intent.getIntExtra(UCrop.Options.EXTRA_TOOL_BAR_COLOR, ContextCompat.getColor(this, R.color.ucrop_color_toolbar));
        this.mActiveWidgetColor = intent.getIntExtra(UCrop.Options.EXTRA_UCROP_COLOR_WIDGET_ACTIVE, ContextCompat.getColor(this, R.color.ucrop_color_widget_active));
        this.mToolbarWidgetColor = intent.getIntExtra(UCrop.Options.EXTRA_UCROP_WIDGET_COLOR_TOOLBAR, ContextCompat.getColor(this, R.color.ucrop_color_toolbar_widget));
        this.mToolbarTitle = intent.getStringExtra(UCrop.Options.EXTRA_UCROP_TITLE_TEXT_TOOLBAR);
        this.mToolbarTitle = !TextUtils.isEmpty(this.mToolbarTitle) ? this.mToolbarTitle : getResources().getString(R.string.ucrop_label_edit_photo);
        this.mLogoColor = intent.getIntExtra(UCrop.Options.EXTRA_UCROP_LOGO_COLOR, ContextCompat.getColor(this, R.color.ucrop_color_default_logo));
        this.mShowBottomControls = !intent.getBooleanExtra(UCrop.Options.EXTRA_HIDE_BOTTOM_CONTROLS, false);
        if (this.mShowBottomControls) {
            ViewGroup photoBox = (ViewGroup) findViewById(R.id.ucrop_photobox);
            View.inflate(this, R.layout.ucrop_controls, photoBox);
        }
        setupAppBar();
        initiateRootViews();
        if (this.mShowBottomControls) {
            setupAspectRatioWidget();
            setupRotateWidget();
            setupScaleWidget();
            setupStatesWrapper();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void setupAppBar() {
        setStatusBarColor(this.mStatusBarColor);
        Toolbar toolbar = findViewById(R.id.toolbar);
        toolbar.setBackgroundColor(this.mToolbarColor);
        toolbar.setTitleTextColor(this.mToolbarWidgetColor);
        TextView toolbarTitle = (TextView) toolbar.findViewById(R.id.toolbar_title);
        toolbarTitle.setTextColor(this.mToolbarWidgetColor);
        toolbarTitle.setText(this.mToolbarTitle);
        Drawable stateButtonDrawable = ContextCompat.getDrawable(this, R.drawable.ucrop_ic_cross).mutate();
        stateButtonDrawable.setColorFilter(this.mToolbarWidgetColor, PorterDuff.Mode.SRC_ATOP);
        toolbar.setNavigationIcon(stateButtonDrawable);
        setSupportActionBar(toolbar);
        ActionBar actionBar = getSupportActionBar();
        if (actionBar != null) {
            actionBar.setDisplayShowTitleEnabled(false);
        }
    }

    private void initiateRootViews() {
        this.mUCropView = (UCropView) findViewById(R.id.ucrop);
        this.mGestureCropImageView = this.mUCropView.getCropImageView();
        this.mOverlayView = this.mUCropView.getOverlayView();
        this.mGestureCropImageView.setTransformImageListener(this.mImageListener);
        if (this.mShowBottomControls) {
            this.mWrapperStateAspectRatio = (ViewGroup) findViewById(R.id.state_aspect_ratio);
            this.mWrapperStateAspectRatio.setOnClickListener(this.mStateClickListener);
            this.mWrapperStateRotate = (ViewGroup) findViewById(R.id.state_rotate);
            this.mWrapperStateRotate.setOnClickListener(this.mStateClickListener);
            this.mWrapperStateScale = (ViewGroup) findViewById(R.id.state_scale);
            this.mWrapperStateScale.setOnClickListener(this.mStateClickListener);
            this.mLayoutAspectRatio = (ViewGroup) findViewById(R.id.layout_aspect_ratio);
            this.mLayoutRotate = (ViewGroup) findViewById(R.id.layout_rotate_wheel);
            this.mLayoutScale = (ViewGroup) findViewById(R.id.layout_scale_wheel);
        }
        ((ImageView) findViewById(R.id.image_view_logo)).setColorFilter(this.mLogoColor, PorterDuff.Mode.SRC_ATOP);
    }

    private void setupStatesWrapper() {
        ImageView stateScaleImageView = (ImageView) findViewById(R.id.image_view_state_scale);
        ImageView stateRotateImageView = (ImageView) findViewById(R.id.image_view_state_rotate);
        ImageView stateAspectRatioImageView = (ImageView) findViewById(R.id.image_view_state_aspect_ratio);
        stateScaleImageView.setImageDrawable(new SelectedStateListDrawable(stateScaleImageView.getDrawable(), this.mActiveWidgetColor));
        stateRotateImageView.setImageDrawable(new SelectedStateListDrawable(stateRotateImageView.getDrawable(), this.mActiveWidgetColor));
        stateAspectRatioImageView.setImageDrawable(new SelectedStateListDrawable(stateAspectRatioImageView.getDrawable(), this.mActiveWidgetColor));
    }

    @TargetApi(21)
    private void setStatusBarColor(@ColorInt int color) {
        if (Build.VERSION.SDK_INT >= 21 && getWindow() != null) {
            getWindow().setStatusBarColor(color);
        }
    }

    private void setupAspectRatioWidget() {
        ((AspectRatioTextView) ((ViewGroup) findViewById(R.id.crop_aspect_ratio_1_1)).getChildAt(0)).setActiveColor(this.mActiveWidgetColor);
        ((AspectRatioTextView) ((ViewGroup) findViewById(R.id.crop_aspect_ratio_3_4)).getChildAt(0)).setActiveColor(this.mActiveWidgetColor);
        ((AspectRatioTextView) ((ViewGroup) findViewById(R.id.crop_aspect_ratio_original)).getChildAt(0)).setActiveColor(this.mActiveWidgetColor);
        ((AspectRatioTextView) ((ViewGroup) findViewById(R.id.crop_aspect_ratio_3_2)).getChildAt(0)).setActiveColor(this.mActiveWidgetColor);
        ((AspectRatioTextView) ((ViewGroup) findViewById(R.id.crop_aspect_ratio_16_9)).getChildAt(0)).setActiveColor(this.mActiveWidgetColor);
        this.mCropAspectRatioViews.add((ViewGroup) findViewById(R.id.crop_aspect_ratio_1_1));
        this.mCropAspectRatioViews.add((ViewGroup) findViewById(R.id.crop_aspect_ratio_3_4));
        this.mCropAspectRatioViews.add((ViewGroup) findViewById(R.id.crop_aspect_ratio_original));
        this.mCropAspectRatioViews.add((ViewGroup) findViewById(R.id.crop_aspect_ratio_3_2));
        this.mCropAspectRatioViews.add((ViewGroup) findViewById(R.id.crop_aspect_ratio_16_9));
        this.mCropAspectRatioViews.get(2).setSelected(true);
        for (ViewGroup cropAspectRatioView : this.mCropAspectRatioViews) {
            cropAspectRatioView.setOnClickListener(new View.OnClickListener() { // from class: com.yalantis.ucrop.UCropActivity.2
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    UCropActivity.this.mGestureCropImageView.setTargetAspectRatio(((AspectRatioTextView) ((ViewGroup) v).getChildAt(0)).getAspectRatio(v.isSelected()));
                    UCropActivity.this.mGestureCropImageView.setImageToWrapCropBounds();
                    if (!v.isSelected()) {
                        for (ViewGroup cropAspectRatioView2 : UCropActivity.this.mCropAspectRatioViews) {
                            cropAspectRatioView2.setSelected(cropAspectRatioView2 == v);
                        }
                    }
                }
            });
        }
    }

    private void setupRotateWidget() {
        this.mTextViewRotateAngle = (TextView) findViewById(R.id.text_view_rotate);
        ((HorizontalProgressWheelView) findViewById(R.id.rotate_scroll_wheel)).setScrollingListener(new HorizontalProgressWheelView.ScrollingListener() { // from class: com.yalantis.ucrop.UCropActivity.3
            @Override // com.yalantis.ucrop.view.widget.HorizontalProgressWheelView.ScrollingListener
            public void onScroll(float delta, float totalDistance) {
                UCropActivity.this.mGestureCropImageView.postRotate(delta / 42.0f);
            }

            @Override // com.yalantis.ucrop.view.widget.HorizontalProgressWheelView.ScrollingListener
            public void onScrollEnd() {
                UCropActivity.this.mGestureCropImageView.setImageToWrapCropBounds();
            }

            @Override // com.yalantis.ucrop.view.widget.HorizontalProgressWheelView.ScrollingListener
            public void onScrollStart() {
                UCropActivity.this.mGestureCropImageView.cancelAllAnimations();
            }
        });
        ((HorizontalProgressWheelView) findViewById(R.id.rotate_scroll_wheel)).setMiddleLineColor(this.mActiveWidgetColor);
        findViewById(R.id.wrapper_reset_rotate).setOnClickListener(new View.OnClickListener() { // from class: com.yalantis.ucrop.UCropActivity.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                UCropActivity.this.resetRotation();
            }
        });
        findViewById(R.id.wrapper_rotate_by_angle).setOnClickListener(new View.OnClickListener() { // from class: com.yalantis.ucrop.UCropActivity.5
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                UCropActivity.this.rotateByAngle(90);
            }
        });
    }

    private void setupScaleWidget() {
        this.mTextViewScalePercent = (TextView) findViewById(R.id.text_view_scale);
        ((HorizontalProgressWheelView) findViewById(R.id.scale_scroll_wheel)).setScrollingListener(new HorizontalProgressWheelView.ScrollingListener() { // from class: com.yalantis.ucrop.UCropActivity.6
            @Override // com.yalantis.ucrop.view.widget.HorizontalProgressWheelView.ScrollingListener
            public void onScroll(float delta, float totalDistance) {
                if (delta > 0.0f) {
                    UCropActivity.this.mGestureCropImageView.zoomInImage(UCropActivity.this.mGestureCropImageView.getCurrentScale() + (delta * ((UCropActivity.this.mGestureCropImageView.getMaxScale() - UCropActivity.this.mGestureCropImageView.getMinScale()) / 15000.0f)));
                } else {
                    UCropActivity.this.mGestureCropImageView.zoomOutImage(UCropActivity.this.mGestureCropImageView.getCurrentScale() + (delta * ((UCropActivity.this.mGestureCropImageView.getMaxScale() - UCropActivity.this.mGestureCropImageView.getMinScale()) / 15000.0f)));
                }
            }

            @Override // com.yalantis.ucrop.view.widget.HorizontalProgressWheelView.ScrollingListener
            public void onScrollEnd() {
                UCropActivity.this.mGestureCropImageView.setImageToWrapCropBounds();
            }

            @Override // com.yalantis.ucrop.view.widget.HorizontalProgressWheelView.ScrollingListener
            public void onScrollStart() {
                UCropActivity.this.mGestureCropImageView.cancelAllAnimations();
            }
        });
        ((HorizontalProgressWheelView) findViewById(R.id.scale_scroll_wheel)).setMiddleLineColor(this.mActiveWidgetColor);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAngleText(float angle) {
        if (this.mTextViewRotateAngle != null) {
            this.mTextViewRotateAngle.setText(String.format("%.1f°", Float.valueOf(angle)));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setScaleText(float scale) {
        if (this.mTextViewScalePercent != null) {
            this.mTextViewScalePercent.setText(String.format("%d%%", Integer.valueOf((int) (scale * 100.0f))));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void resetRotation() {
        this.mGestureCropImageView.postRotate(-this.mGestureCropImageView.getCurrentAngle());
        this.mGestureCropImageView.setImageToWrapCropBounds();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void rotateByAngle(int angle) {
        this.mGestureCropImageView.postRotate(angle);
        this.mGestureCropImageView.setImageToWrapCropBounds();
    }

    private void setInitialState() {
        if (this.mShowBottomControls) {
            if (this.mWrapperStateAspectRatio.getVisibility() == 0) {
                setWidgetState(R.id.state_aspect_ratio);
                return;
            } else {
                setWidgetState(R.id.state_scale);
                return;
            }
        }
        setAllowedGestures(2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setWidgetState(@IdRes int stateViewId) {
        if (this.mShowBottomControls) {
            this.mWrapperStateAspectRatio.setSelected(stateViewId == R.id.state_aspect_ratio);
            this.mWrapperStateRotate.setSelected(stateViewId == R.id.state_rotate);
            this.mWrapperStateScale.setSelected(stateViewId == R.id.state_scale);
            this.mLayoutAspectRatio.setVisibility(stateViewId == R.id.state_aspect_ratio ? 0 : 8);
            this.mLayoutRotate.setVisibility(stateViewId == R.id.state_rotate ? 0 : 8);
            this.mLayoutScale.setVisibility(stateViewId == R.id.state_scale ? 0 : 8);
        }
        if (stateViewId == R.id.state_scale) {
            setAllowedGestures(0);
        } else if (stateViewId == R.id.state_rotate) {
            setAllowedGestures(1);
        } else {
            setAllowedGestures(2);
        }
    }

    private void setAllowedGestures(int tab) {
        this.mGestureCropImageView.setScaleEnabled(this.mAllowedGestures[tab] == 3 || this.mAllowedGestures[tab] == 1);
        this.mGestureCropImageView.setRotateEnabled(this.mAllowedGestures[tab] == 3 || this.mAllowedGestures[tab] == 2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void addBlockingView() {
        if (this.mBlockingView == null) {
            this.mBlockingView = new View(this);
            RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(-1, -1);
            lp.addRule(3, R.id.toolbar);
            this.mBlockingView.setLayoutParams(lp);
            this.mBlockingView.setClickable(true);
        }
        ((RelativeLayout) findViewById(R.id.ucrop_photobox)).addView(this.mBlockingView);
    }

    protected void cropAndSaveImage() {
        this.mBlockingView.setClickable(true);
        this.mShowLoader = true;
        supportInvalidateOptionsMenu();
        this.mGestureCropImageView.cropAndSaveImage(this.mCompressFormat, this.mCompressQuality, this.mOutputUri, new BitmapCropCallback() { // from class: com.yalantis.ucrop.UCropActivity.8
            @Override // com.yalantis.ucrop.callback.BitmapCropCallback
            public void onBitmapCropped() {
                UCropActivity.this.setResultUri(UCropActivity.this.mOutputUri, UCropActivity.this.mGestureCropImageView.getTargetAspectRatio());
                UCropActivity.this.finish();
            }

            @Override // com.yalantis.ucrop.callback.BitmapCropCallback
            public void onCropFailure(@NonNull Exception bitmapCropException) {
                UCropActivity.this.setResultException(bitmapCropException);
                UCropActivity.this.finish();
            }
        });
    }

    protected void setResultUri(Uri uri, float resultAspectRatio) {
        setResult(-1, new Intent().putExtra(UCrop.EXTRA_OUTPUT_URI, uri).putExtra(UCrop.EXTRA_OUTPUT_CROP_ASPECT_RATIO, resultAspectRatio));
    }

    protected void setResultException(Throwable throwable) {
        setResult(96, new Intent().putExtra(UCrop.EXTRA_ERROR, throwable));
    }
}
