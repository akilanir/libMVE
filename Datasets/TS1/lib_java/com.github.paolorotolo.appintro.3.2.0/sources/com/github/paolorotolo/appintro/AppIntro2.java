package com.github.paolorotolo.appintro;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Vibrator;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.view.KeyEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.github.paolorotolo.appintro.ViewPageTransformer;
import java.util.List;
import java.util.Vector;

/* loaded from: com.github.paolorotolo.appintro.3.2.0.jar:com/github/paolorotolo/appintro/AppIntro2.class */
public abstract class AppIntro2 extends AppCompatActivity {
    private PagerAdapter mPagerAdapter;
    private ViewPager pager;
    private List<ImageView> dots;
    private int slidesNumber;
    private Vibrator mVibrator;
    private IndicatorController mController;
    private List<Fragment> fragments = new Vector();
    private boolean isVibrateOn = false;
    private int vibrateIntensity = 20;
    private boolean showDone = true;

    /* loaded from: com.github.paolorotolo.appintro.3.2.0.jar:com/github/paolorotolo/appintro/AppIntro2$TransformType.class */
    enum TransformType {
        FLOW,
        DEPTH,
        ZOOM,
        SLIDE_OVER,
        FADE
    }

    public abstract void init(@Nullable Bundle bundle);

    public abstract void onDonePressed();

    protected final void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(1);
        super.onCreate(savedInstanceState);
        getWindow().setFlags(1024, 1024);
        setContentView(R.layout.intro_layout2);
        final ImageView nextButton = (ImageView) findViewById(R.id.next);
        final ImageView doneButton = (ImageView) findViewById(R.id.done);
        this.mVibrator = (Vibrator) getSystemService("vibrator");
        nextButton.setOnClickListener(new View.OnClickListener() { // from class: com.github.paolorotolo.appintro.AppIntro2.1
            @Override // android.view.View.OnClickListener
            public void onClick(@NonNull View v) {
                if (AppIntro2.this.isVibrateOn) {
                    AppIntro2.this.mVibrator.vibrate(AppIntro2.this.vibrateIntensity);
                }
                AppIntro2.this.pager.setCurrentItem(AppIntro2.this.pager.getCurrentItem() + 1);
            }
        });
        doneButton.setOnClickListener(new View.OnClickListener() { // from class: com.github.paolorotolo.appintro.AppIntro2.2
            @Override // android.view.View.OnClickListener
            public void onClick(@NonNull View v) {
                if (AppIntro2.this.isVibrateOn) {
                    AppIntro2.this.mVibrator.vibrate(AppIntro2.this.vibrateIntensity);
                }
                AppIntro2.this.onDonePressed();
            }
        });
        this.mPagerAdapter = new PagerAdapter(super.getSupportFragmentManager(), this.fragments);
        this.pager = findViewById(R.id.view_pager);
        this.pager.setAdapter(this.mPagerAdapter);
        this.pager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() { // from class: com.github.paolorotolo.appintro.AppIntro2.3
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            public void onPageSelected(int position) {
                if (AppIntro2.this.slidesNumber > 1) {
                    AppIntro2.this.mController.selectPosition(position);
                }
                if (position == AppIntro2.this.slidesNumber - 1) {
                    nextButton.setVisibility(8);
                    if (AppIntro2.this.showDone) {
                        doneButton.setVisibility(0);
                        return;
                    } else {
                        doneButton.setVisibility(4);
                        return;
                    }
                }
                doneButton.setVisibility(8);
                nextButton.setVisibility(0);
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

    public void showDoneButton(boolean showDone) {
        this.showDone = showDone;
        if (!showDone) {
            ImageView done = (ImageView) findViewById(R.id.done);
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

    public boolean onKeyDown(int code, KeyEvent kevent) {
        if (code == 66 || code == 96) {
            ViewPager vp = findViewById(R.id.view_pager);
            if (vp.getCurrentItem() == vp.getAdapter().getCount() - 1) {
                onDonePressed();
                return false;
            }
            vp.setCurrentItem(vp.getCurrentItem() + 1);
            return false;
        }
        return super.onKeyDown(code, kevent);
    }
}
