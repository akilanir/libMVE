package com.devspark.appmsg;

import android.R;
import android.app.Activity;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout;
import android.widget.TextView;

/* loaded from: com.github.johnkil.android-appmsg.appmsg.1.2.0.jar:com/devspark/appmsg/AppMsg.class */
public class AppMsg {
    public static final int LENGTH_STICKY = -1;
    public static final int PRIORITY_LOW = Integer.MIN_VALUE;
    public static final int PRIORITY_NORMAL = 0;
    public static final int PRIORITY_HIGH = Integer.MAX_VALUE;
    private final Activity mActivity;
    private View mView;
    private ViewGroup mParent;
    private ViewGroup.LayoutParams mLayoutParams;
    private boolean mFloating;
    Animation mInAnimation;
    Animation mOutAnimation;
    public static final int LENGTH_LONG = 5000;
    public static final Style STYLE_ALERT = new Style(LENGTH_LONG, R.color.alert);
    public static final int LENGTH_SHORT = 3000;
    public static final Style STYLE_CONFIRM = new Style(LENGTH_SHORT, R.color.confirm);
    public static final Style STYLE_INFO = new Style(LENGTH_SHORT, R.color.info);
    private int mDuration = LENGTH_SHORT;
    int mPriority = 0;

    public AppMsg(Activity activity) {
        this.mActivity = activity;
    }

    public static AppMsg makeText(Activity context, CharSequence text, Style style) {
        return makeText(context, text, style, R.layout.app_msg);
    }

    public static AppMsg makeText(Activity context, CharSequence text, Style style, float textSize) {
        return makeText(context, text, style, R.layout.app_msg, textSize);
    }

    public static AppMsg makeText(Activity context, CharSequence text, Style style, int layoutId) {
        LayoutInflater inflate = (LayoutInflater) context.getSystemService("layout_inflater");
        View v = inflate.inflate(layoutId, (ViewGroup) null);
        return makeText(context, text, style, v, true);
    }

    public static AppMsg makeText(Activity context, CharSequence text, Style style, int layoutId, float textSize) {
        LayoutInflater inflate = (LayoutInflater) context.getSystemService("layout_inflater");
        View v = inflate.inflate(layoutId, (ViewGroup) null);
        return makeText(context, text, style, v, true, textSize);
    }

    public static AppMsg makeText(Activity context, CharSequence text, Style style, View customView) {
        return makeText(context, text, style, customView, false);
    }

    private static AppMsg makeText(Activity context, CharSequence text, Style style, View view, boolean floating) {
        return makeText(context, text, style, view, floating, 0.0f);
    }

    private static AppMsg makeText(Activity context, CharSequence text, Style style, View view, boolean floating, float textSize) {
        AppMsg result = new AppMsg(context);
        view.setBackgroundResource(style.background);
        TextView tv = (TextView) view.findViewById(R.id.message);
        if (textSize > 0.0f) {
            tv.setTextSize(textSize);
        }
        tv.setText(text);
        result.mView = view;
        result.mDuration = style.duration;
        result.mFloating = floating;
        return result;
    }

    public static AppMsg makeText(Activity context, int resId, Style style, View customView, boolean floating) {
        return makeText(context, context.getResources().getText(resId), style, customView, floating);
    }

    public static AppMsg makeText(Activity context, int resId, Style style) throws Resources.NotFoundException {
        return makeText(context, context.getResources().getText(resId), style);
    }

    public static AppMsg makeText(Activity context, int resId, Style style, int layoutId) throws Resources.NotFoundException {
        return makeText(context, context.getResources().getText(resId), style, layoutId);
    }

    public void show() {
        MsgManager manager = MsgManager.obtain(this.mActivity);
        manager.add(this);
    }

    public boolean isShowing() {
        return this.mFloating ? (this.mView == null || this.mView.getParent() == null) ? false : true : this.mView.getVisibility() == 0;
    }

    public void cancel() {
        MsgManager.obtain(this.mActivity).clearMsg(this);
    }

    public static void cancelAll() {
        MsgManager.clearAll();
    }

    public static void cancelAll(Activity activity) {
        MsgManager.release(activity);
    }

    public Activity getActivity() {
        return this.mActivity;
    }

    public void setView(View view) {
        this.mView = view;
    }

    public View getView() {
        return this.mView;
    }

    public void setDuration(int duration) {
        this.mDuration = duration;
    }

    public int getDuration() {
        return this.mDuration;
    }

    public void setText(int resId) {
        setText(this.mActivity.getText(resId));
    }

    public void setText(CharSequence s) {
        if (this.mView == null) {
            throw new RuntimeException("This AppMsg was not created with AppMsg.makeText()");
        }
        TextView tv = (TextView) this.mView.findViewById(R.id.message);
        if (tv == null) {
            throw new RuntimeException("This AppMsg was not created with AppMsg.makeText()");
        }
        tv.setText(s);
    }

    public ViewGroup.LayoutParams getLayoutParams() {
        if (this.mLayoutParams == null) {
            this.mLayoutParams = new ViewGroup.LayoutParams(-1, -2);
        }
        return this.mLayoutParams;
    }

    public AppMsg setLayoutParams(ViewGroup.LayoutParams layoutParams) {
        this.mLayoutParams = layoutParams;
        return this;
    }

    public AppMsg setLayoutGravity(int gravity) {
        this.mLayoutParams = new FrameLayout.LayoutParams(-1, -2, gravity);
        return this;
    }

    public boolean isFloating() {
        return this.mFloating;
    }

    public void setFloating(boolean mFloating) {
        this.mFloating = mFloating;
    }

    public AppMsg setAnimation(int inAnimation, int outAnimation) {
        return setAnimation(AnimationUtils.loadAnimation(this.mActivity, inAnimation), AnimationUtils.loadAnimation(this.mActivity, outAnimation));
    }

    public AppMsg setAnimation(Animation inAnimation, Animation outAnimation) {
        this.mInAnimation = inAnimation;
        this.mOutAnimation = outAnimation;
        return this;
    }

    public int getPriority() {
        return this.mPriority;
    }

    public void setPriority(int priority) {
        this.mPriority = priority;
    }

    public ViewGroup getParent() {
        return this.mParent;
    }

    public void setParent(ViewGroup parent) {
        this.mParent = parent;
    }

    public void setParent(int parentId) {
        setParent((ViewGroup) this.mActivity.findViewById(parentId));
    }

    /* loaded from: com.github.johnkil.android-appmsg.appmsg.1.2.0.jar:com/devspark/appmsg/AppMsg$Style.class */
    public static class Style {
        private final int duration;
        private final int background;

        public Style(int duration, int resId) {
            this.duration = duration;
            this.background = resId;
        }

        public int getDuration() {
            return this.duration;
        }

        public int getBackground() {
            return this.background;
        }

        public boolean equals(Object o) {
            if (!(o instanceof Style)) {
                return false;
            }
            Style style = (Style) o;
            return style.duration == this.duration && style.background == this.background;
        }
    }
}
