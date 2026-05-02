package com.github.paolorotolo.appintro;

import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Vibrator;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.github.paolorotolo.appintro.ViewPageTransformer;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

/* loaded from: com.github.paolorotolo.appintro.3.4.0.jar:com/github/paolorotolo/appintro/AppIntro.class */
public abstract class AppIntro extends AppCompatActivity {
    public static final int DEFAULT_COLOR = 1;
    private static final int DEFAULT_SCROLL_DURATION_FACTOR = 1;
    protected PagerAdapter mPagerAdapter;
    protected AppIntroViewPager pager;
    protected List<ImageView> dots;
    protected int slidesNumber;
    protected Vibrator mVibrator;
    protected IndicatorController mController;
    protected View skipButton;
    protected View nextButton;
    protected View doneButton;
    protected int savedCurrentItem;
    private static final int PERMISSIONS_REQUEST_ALL_PERMISSIONS = 1;
    private static String TAG = "AppIntro1";
    protected List<Fragment> fragments = new Vector();
    protected boolean isVibrateOn = false;
    protected int vibrateIntensity = 20;
    protected boolean skipButtonEnabled = true;
    protected boolean baseProgressButtonEnabled = true;
    protected boolean progressButtonEnabled = true;
    protected int selectedIndicatorColor = 1;
    protected int unselectedIndicatorColor = 1;
    protected ArrayList<PermissionObject> permissionsArray = new ArrayList<>();

    /* loaded from: com.github.paolorotolo.appintro.3.4.0.jar:com/github/paolorotolo/appintro/AppIntro$TransformType.class */
    enum TransformType {
        FLOW,
        DEPTH,
        ZOOM,
        SLIDE_OVER,
        FADE
    }

    public abstract void init(@Nullable Bundle bundle);

    public abstract void onSkipPressed();

    public abstract void onNextPressed();

    public abstract void onDonePressed();

    public abstract void onSlideChanged();

    protected final void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(1);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.intro_layout);
        this.skipButton = findViewById(R.id.skip);
        this.nextButton = findViewById(R.id.next);
        this.doneButton = findViewById(R.id.done);
        this.mVibrator = (Vibrator) getSystemService("vibrator");
        this.mPagerAdapter = new PagerAdapter(getSupportFragmentManager(), this.fragments);
        this.pager = (AppIntroViewPager) findViewById(R.id.view_pager);
        this.pager.setAdapter(this.mPagerAdapter);
        if (savedInstanceState != null) {
            restoreLockingState(savedInstanceState);
        }
        this.skipButton.setOnClickListener(new View.OnClickListener() { // from class: com.github.paolorotolo.appintro.AppIntro.1
            @Override // android.view.View.OnClickListener
            public void onClick(@NonNull View v) {
                if (AppIntro.this.isVibrateOn) {
                    AppIntro.this.mVibrator.vibrate(AppIntro.this.vibrateIntensity);
                }
                AppIntro.this.onSkipPressed();
            }
        });
        this.nextButton.setOnClickListener(new View.OnClickListener() { // from class: com.github.paolorotolo.appintro.AppIntro.2
            @Override // android.view.View.OnClickListener
            public void onClick(@NonNull View v) {
                if (AppIntro.this.isVibrateOn) {
                    AppIntro.this.mVibrator.vibrate(AppIntro.this.vibrateIntensity);
                }
                boolean requestPermission = false;
                int position = 0;
                if (0 < AppIntro.this.permissionsArray.size()) {
                    requestPermission = AppIntro.this.pager.getCurrentItem() + 1 == AppIntro.this.permissionsArray.get(0).getPosition();
                    position = 0;
                }
                if (requestPermission) {
                    if (Build.VERSION.SDK_INT >= 23) {
                        AppIntro.this.requestPermissions(AppIntro.this.permissionsArray.get(position).getPermission(), 1);
                        AppIntro.this.permissionsArray.remove(position);
                        return;
                    } else {
                        AppIntro.this.pager.setCurrentItem(AppIntro.this.pager.getCurrentItem() + 1);
                        AppIntro.this.onNextPressed();
                        return;
                    }
                }
                AppIntro.this.pager.setCurrentItem(AppIntro.this.pager.getCurrentItem() + 1);
                AppIntro.this.onNextPressed();
            }
        });
        this.doneButton.setOnClickListener(new View.OnClickListener() { // from class: com.github.paolorotolo.appintro.AppIntro.3
            @Override // android.view.View.OnClickListener
            public void onClick(@NonNull View v) {
                if (AppIntro.this.isVibrateOn) {
                    AppIntro.this.mVibrator.vibrate(AppIntro.this.vibrateIntensity);
                }
                AppIntro.this.onDonePressed();
            }
        });
        this.pager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() { // from class: com.github.paolorotolo.appintro.AppIntro.4
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            public void onPageSelected(int position) {
                if (AppIntro.this.slidesNumber > 1) {
                    AppIntro.this.mController.selectPosition(position);
                }
                if (!AppIntro.this.pager.isNextPagingEnabled() && AppIntro.this.pager.getCurrentItem() != AppIntro.this.pager.getLockPage()) {
                    AppIntro.this.setProgressButtonEnabled(AppIntro.this.baseProgressButtonEnabled);
                    AppIntro.this.pager.setNextPagingEnabled(true);
                } else {
                    AppIntro.this.setProgressButtonEnabled(AppIntro.this.progressButtonEnabled);
                }
                AppIntro.this.setButtonState(AppIntro.this.skipButton, AppIntro.this.skipButtonEnabled);
                AppIntro.this.onSlideChanged();
            }

            public void onPageScrollStateChanged(int state) {
            }
        });
        this.pager.setCurrentItem(this.savedCurrentItem);
        setScrollDurationFactor(1);
        init(savedInstanceState);
        this.slidesNumber = this.fragments.size();
        if (this.slidesNumber == 1) {
            setProgressButtonEnabled(this.progressButtonEnabled);
        } else {
            initController();
        }
    }

    protected void setScrollDurationFactor(int factor) {
        this.pager.setScrollDurationFactor(factor);
    }

    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putBoolean("baseProgressButtonEnabled", this.baseProgressButtonEnabled);
        outState.putBoolean("progressButtonEnabled", this.progressButtonEnabled);
        outState.putBoolean("skipButtonEnabled", this.skipButtonEnabled);
        outState.putBoolean("nextEnabled", this.pager.isPagingEnabled());
        outState.putBoolean("nextPagingEnabled", this.pager.isNextPagingEnabled());
        outState.putInt("lockPage", this.pager.getLockPage());
        outState.putInt("currentItem", this.pager.getCurrentItem());
    }

    protected void restoreLockingState(Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);
        this.baseProgressButtonEnabled = savedInstanceState.getBoolean("baseProgressButtonEnabled");
        this.progressButtonEnabled = savedInstanceState.getBoolean("progressButtonEnabled");
        this.skipButtonEnabled = savedInstanceState.getBoolean("skipButtonEnabled");
        this.savedCurrentItem = savedInstanceState.getInt("currentItem");
        this.pager.setPagingEnabled(savedInstanceState.getBoolean("nextEnabled"));
        this.pager.setNextPagingEnabled(savedInstanceState.getBoolean("nextPagingEnabled"));
        this.pager.setLockPage(savedInstanceState.getInt("lockPage"));
    }

    public AppIntroViewPager getPager() {
        return this.pager;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void initController() {
        if (this.mController == null) {
            this.mController = new DefaultIndicatorController();
        }
        FrameLayout indicatorContainer = (FrameLayout) findViewById(R.id.indicator_container);
        indicatorContainer.addView(this.mController.newInstance(this));
        this.mController.initialize(this.slidesNumber);
        if (this.selectedIndicatorColor != 1) {
            this.mController.setSelectedIndicatorColor(this.selectedIndicatorColor);
        }
        if (this.unselectedIndicatorColor != 1) {
            this.mController.setUnselectedIndicatorColor(this.unselectedIndicatorColor);
        }
    }

    public void addSlide(@NonNull Fragment fragment) {
        this.fragments.add(fragment);
        this.mPagerAdapter.notifyDataSetChanged();
    }

    @NonNull
    public List<Fragment> getSlides() {
        return this.mPagerAdapter.getFragments();
    }

    public boolean isProgressButtonEnabled() {
        return this.progressButtonEnabled;
    }

    public boolean isSkipButtonEnabled() {
        return this.skipButtonEnabled;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setButtonState(View button, boolean show) {
        if (show) {
            button.setVisibility(0);
        } else {
            button.setVisibility(4);
        }
    }

    public void setOffScreenPageLimit(int limit) {
        this.pager.setOffscreenPageLimit(limit);
    }

    public boolean onKeyDown(int code, KeyEvent kvent) {
        if (code == 66 || code == 96 || code == 23) {
            ViewPager vp = findViewById(R.id.view_pager);
            if (vp.getCurrentItem() == vp.getAdapter().getCount() - 1) {
                onDonePressed();
                return false;
            }
            vp.setCurrentItem(vp.getCurrentItem() + 1);
            return false;
        }
        return super.onKeyDown(code, kvent);
    }

    public void setProgressButtonEnabled(boolean progressButtonEnabled) {
        this.progressButtonEnabled = progressButtonEnabled;
        if (progressButtonEnabled) {
            if (this.pager.getCurrentItem() == this.slidesNumber - 1) {
                setButtonState(this.nextButton, false);
                setButtonState(this.doneButton, true);
                return;
            } else {
                setButtonState(this.nextButton, true);
                setButtonState(this.doneButton, false);
                return;
            }
        }
        setButtonState(this.nextButton, false);
        setButtonState(this.doneButton, false);
    }

    public void setBarColor(@ColorInt int color) {
        LinearLayout bottomBar = (LinearLayout) findViewById(R.id.bottom);
        bottomBar.setBackgroundColor(color);
    }

    public void setSeparatorColor(@ColorInt int color) {
        TextView separator = (TextView) findViewById(R.id.bottom_separator);
        separator.setBackgroundColor(color);
    }

    public void setSkipText(@Nullable CharSequence text) {
        TextView skipText = (TextView) findViewById(R.id.skip);
        skipText.setText(text);
    }

    public void setDoneText(@Nullable CharSequence text) {
        TextView doneText = (TextView) findViewById(R.id.done);
        doneText.setText(text);
    }

    public void setColorDoneText(@ColorInt int colorDoneText) {
        TextView doneText = (TextView) findViewById(R.id.done);
        doneText.setTextColor(colorDoneText);
    }

    public void setColorSkipButton(@ColorInt int colorSkipButton) {
        TextView skip = (TextView) findViewById(R.id.skip);
        skip.setTextColor(colorSkipButton);
    }

    public void setImageNextButton(@DrawableRes Drawable imageNextButton) {
        ImageView nextButton = (ImageView) findViewById(R.id.next);
        nextButton.setImageDrawable(imageNextButton);
    }

    public void setNavBarColor(String Color) {
        if (Build.VERSION.SDK_INT >= 21) {
            getWindow().setNavigationBarColor(Color.parseColor(Color));
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void setNavBarColor(@ColorRes int color) {
        if (Build.VERSION.SDK_INT >= 21) {
            getWindow().setNavigationBarColor(ContextCompat.getColor(this, color));
        }
    }

    public void showStatusBar(boolean isVisible) {
        if (!isVisible) {
            getWindow().setFlags(1024, 1024);
        } else {
            getWindow().clearFlags(1024);
        }
    }

    public void showSkipButton(boolean showButton) {
        this.skipButtonEnabled = showButton;
        setButtonState(this.skipButton, showButton);
    }

    @Deprecated
    public void showDoneButton(boolean showDone) {
        setProgressButtonEnabled(showDone);
    }

    public void setVibrate(boolean vibrationEnabled) {
        this.isVibrateOn = vibrationEnabled;
    }

    public void setVibrateIntensity(int intensity) {
        this.vibrateIntensity = intensity;
    }

    public void setProgressIndicator() {
        this.mController = new ProgressIndicatorController();
    }

    public void setCustomIndicator(@NonNull IndicatorController controller) {
        this.mController = controller;
    }

    public void setFadeAnimation() {
        this.pager.setPageTransformer(true, new ViewPageTransformer(ViewPageTransformer.TransformType.FADE));
    }

    public void setZoomAnimation() {
        this.pager.setPageTransformer(true, new ViewPageTransformer(ViewPageTransformer.TransformType.ZOOM));
    }

    public void setFlowAnimation() {
        this.pager.setPageTransformer(true, new ViewPageTransformer(ViewPageTransformer.TransformType.FLOW));
    }

    public void setSlideOverAnimation() {
        this.pager.setPageTransformer(true, new ViewPageTransformer(ViewPageTransformer.TransformType.SLIDE_OVER));
    }

    public void setDepthAnimation() {
        this.pager.setPageTransformer(true, new ViewPageTransformer(ViewPageTransformer.TransformType.DEPTH));
    }

    public void setCustomTransformer(@Nullable ViewPager.PageTransformer transformer) {
        this.pager.setPageTransformer(true, transformer);
    }

    public void setIndicatorColor(int selectedIndicatorColor, int unselectedIndicatorColor) {
        this.selectedIndicatorColor = selectedIndicatorColor;
        this.unselectedIndicatorColor = unselectedIndicatorColor;
        if (this.mController != null) {
            if (selectedIndicatorColor != 1) {
                this.mController.setSelectedIndicatorColor(selectedIndicatorColor);
            }
            if (unselectedIndicatorColor != 1) {
                this.mController.setUnselectedIndicatorColor(unselectedIndicatorColor);
            }
        }
    }

    public void setNextPageSwipeLock(boolean lockEnable) {
        if (lockEnable) {
            this.baseProgressButtonEnabled = this.progressButtonEnabled;
            setProgressButtonEnabled(!lockEnable);
        } else {
            setProgressButtonEnabled(this.baseProgressButtonEnabled);
        }
        this.pager.setNextPagingEnabled(!lockEnable);
    }

    public void setSwipeLock(boolean lockEnable) {
        if (lockEnable) {
            this.baseProgressButtonEnabled = this.progressButtonEnabled;
        } else {
            setProgressButtonEnabled(this.baseProgressButtonEnabled);
        }
        this.pager.setPagingEnabled(!lockEnable);
    }

    public void askForPermissions(String[] permissions, int slidesNumber) {
        if (Build.VERSION.SDK_INT >= 23) {
            if (slidesNumber == 0) {
                Toast.makeText(getBaseContext(), "Invalid Slide Number", 0).show();
                return;
            }
            PermissionObject permission = new PermissionObject(permissions, slidesNumber);
            this.permissionsArray.add(permission);
            setSwipeLock(true);
        }
    }

    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        switch (requestCode) {
            case 1:
                this.pager.setCurrentItem(this.pager.getCurrentItem() + 1);
                break;
            default:
                Log.e(TAG, "Unexpected request code");
                break;
        }
    }
}
