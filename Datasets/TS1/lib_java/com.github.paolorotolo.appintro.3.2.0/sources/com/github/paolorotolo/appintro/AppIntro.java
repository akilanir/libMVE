package com.github.paolorotolo.appintro;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Vibrator;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.view.KeyEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.github.paolorotolo.appintro.ViewPageTransformer;
import java.util.List;
import java.util.Vector;

/* loaded from: com.github.paolorotolo.appintro.3.2.0.jar:com/github/paolorotolo/appintro/AppIntro.class */
public abstract class AppIntro extends AppCompatActivity {
    private PagerAdapter mPagerAdapter;
    private ViewPager pager;
    private List<ImageView> dots;
    private int slidesNumber;
    private Vibrator mVibrator;
    private IndicatorController mController;
    private List<Fragment> fragments = new Vector();
    private boolean isVibrateOn = false;
    private int vibrateIntensity = 20;
    private boolean showSkip = true;
    private boolean showDone = true;

    /* loaded from: com.github.paolorotolo.appintro.3.2.0.jar:com/github/paolorotolo/appintro/AppIntro$TransformType.class */
    enum TransformType {
        FLOW,
        DEPTH,
        ZOOM,
        SLIDE_OVER,
        FADE
    }

    public abstract void init(@Nullable Bundle bundle);

    public abstract void onSkipPressed();

    public abstract void onDonePressed();

    protected final void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(1);
        super.onCreate(savedInstanceState);
        getWindow().setFlags(1024, 1024);
        setContentView(R.layout.intro_layout);
        final TextView skipButton = (TextView) findViewById(R.id.skip);
        final ImageView nextButton = (ImageView) findViewById(R.id.next);
        final TextView doneButton = (TextView) findViewById(R.id.done);
        this.mVibrator = (Vibrator) getSystemService("vibrator");
        skipButton.setOnClickListener(new View.OnClickListener() { // from class: com.github.paolorotolo.appintro.AppIntro.1
            @Override // android.view.View.OnClickListener
            public void onClick(@NonNull View v) {
                if (AppIntro.this.isVibrateOn) {
                    AppIntro.this.mVibrator.vibrate(AppIntro.this.vibrateIntensity);
                }
                AppIntro.this.onSkipPressed();
            }
        });
        nextButton.setOnClickListener(new View.OnClickListener() { // from class: com.github.paolorotolo.appintro.AppIntro.2
            @Override // android.view.View.OnClickListener
            public void onClick(@NonNull View v) {
                if (AppIntro.this.isVibrateOn) {
                    AppIntro.this.mVibrator.vibrate(AppIntro.this.vibrateIntensity);
                }
                AppIntro.this.pager.setCurrentItem(AppIntro.this.pager.getCurrentItem() + 1);
            }
        });
        doneButton.setOnClickListener(new View.OnClickListener() { // from class: com.github.paolorotolo.appintro.AppIntro.3
            @Override // android.view.View.OnClickListener
            public void onClick(@NonNull View v) {
                if (AppIntro.this.isVibrateOn) {
                    AppIntro.this.mVibrator.vibrate(AppIntro.this.vibrateIntensity);
                }
                AppIntro.this.onDonePressed();
            }
        });
        this.mPagerAdapter = new PagerAdapter(super.getSupportFragmentManager(), this.fragments);
        this.pager = findViewById(R.id.view_pager);
        this.pager.setAdapter(this.mPagerAdapter);
        this.pager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() { // from class: com.github.paolorotolo.appintro.AppIntro.4
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            public void onPageSelected(int position) {
                if (AppIntro.this.slidesNumber > 1) {
                    AppIntro.this.mController.selectPosition(position);
                }
                if (position == AppIntro.this.slidesNumber - 1) {
                    skipButton.setVisibility(4);
                    nextButton.setVisibility(8);
                    if (AppIntro.this.showDone) {
                        doneButton.setVisibility(0);
                    } else {
                        doneButton.setVisibility(4);
                    }
                } else {
                    skipButton.setVisibility(0);
                    doneButton.setVisibility(8);
                    nextButton.setVisibility(0);
                }
                if (!AppIntro.this.showSkip) {
                    skipButton.setVisibility(4);
                }
            }

            public void onPageScrollStateChanged(int state) {
            }
        });
        init(savedInstanceState);
        this.slidesNumber = this.fragments.size();
        if (this.slidesNumber == 1) {
            nextButton.setVisibility(8);
            doneButton.setVisibility(0);
        } else {
            initController();
        }
    }

    public ViewPager getPager() {
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
    }

    public void selectDot(int index) {
        Resources res = getResources();
        int i = 0;
        while (i < this.fragments.size()) {
            int drawableId = i == index ? R.drawable.indicator_dot_white : R.drawable.indicator_dot_grey;
            Drawable drawable = res.getDrawable(drawableId);
            this.dots.get(i).setImageDrawable(drawable);
            i++;
        }
        onDotSelected(index);
    }

    public void addSlide(@NonNull Fragment fragment) {
        this.fragments.add(fragment);
        this.mPagerAdapter.notifyDataSetChanged();
    }

    @NonNull
    public List<Fragment> getSlides() {
        return this.mPagerAdapter.getFragments();
    }

    public void setBarColor(@ColorInt int color) {
        LinearLayout bottomBar = (LinearLayout) findViewById(R.id.bottom);
        bottomBar.setBackgroundColor(color);
    }

    public void setSeparatorColor(@ColorInt int color) {
        TextView separator = (TextView) findViewById(R.id.bottom_separator);
        separator.setBackgroundColor(color);
    }

    public void setSkipText(@Nullable String text) {
        TextView skipText = (TextView) findViewById(R.id.skip);
        skipText.setText(text);
    }

    public void setDoneText(@Nullable String text) {
        TextView doneText = (TextView) findViewById(R.id.done);
        doneText.setText(text);
    }

    public void showSkipButton(boolean showButton) {
        this.showSkip = showButton;
        if (!showButton) {
            TextView skip = (TextView) findViewById(R.id.skip);
            skip.setVisibility(4);
        }
    }

    public void showDoneButton(boolean showDone) {
        this.showDone = showDone;
        if (!showDone) {
            TextView done = (TextView) findViewById(R.id.done);
            done.setVisibility(8);
        }
    }

    public void setVibrate(boolean vibrate) {
        this.isVibrateOn = vibrate;
    }

    public void setVibrateIntensity(int intensity) {
        this.vibrateIntensity = intensity;
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

    public void setOffScreenPageLimit(int limit) {
        this.pager.setOffscreenPageLimit(limit);
    }

    public void setProgressIndicator() {
        this.mController = new ProgressIndicatorController();
    }

    public void setCustomIndicator(@NonNull IndicatorController controller) {
        this.mController = controller;
    }

    public void onDotSelected(int index) {
    }

    public boolean onKeyDown(int code, KeyEvent kvent) {
        if (code == 66 || code == 96) {
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
}
