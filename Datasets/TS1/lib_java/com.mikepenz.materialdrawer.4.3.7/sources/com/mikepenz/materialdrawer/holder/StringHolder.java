package com.mikepenz.materialdrawer.holder;

import android.content.Context;
import android.support.annotation.StringRes;
import android.widget.TextView;
import com.mikepenz.materialdrawer.BuildConfig;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/holder/StringHolder.class */
public class StringHolder {
    private String mText;
    private int mTextRes;

    public StringHolder(String text) {
        this.mTextRes = -1;
        this.mText = text;
    }

    public StringHolder(@StringRes int textRes) {
        this.mTextRes = -1;
        this.mTextRes = textRes;
    }

    public String getText() {
        return this.mText;
    }

    public int getTextRes() {
        return this.mTextRes;
    }

    public void applyTo(TextView textView) {
        if (this.mText != null) {
            textView.setText(this.mText);
        } else if (this.mTextRes != -1) {
            textView.setText(this.mTextRes);
        } else {
            textView.setText(BuildConfig.FLAVOR);
        }
    }

    public boolean applyToOrHide(TextView textView) {
        if (this.mText != null) {
            textView.setText(this.mText);
            textView.setVisibility(0);
            return true;
        }
        if (this.mTextRes != -1) {
            textView.setText(this.mTextRes);
            textView.setVisibility(0);
            return true;
        }
        textView.setVisibility(8);
        return false;
    }

    public String getText(Context ctx) {
        if (this.mText != null) {
            return this.mText;
        }
        if (this.mTextRes != -1) {
            return ctx.getString(this.mTextRes);
        }
        return null;
    }

    public static void applyTo(StringHolder text, TextView textView) {
        if (text != null && textView != null) {
            text.applyTo(textView);
        }
    }

    public static boolean applyToOrHide(StringHolder text, TextView textView) {
        if (text != null && textView != null) {
            return text.applyToOrHide(textView);
        }
        if (textView != null) {
            textView.setVisibility(8);
            return false;
        }
        return false;
    }

    public String toString() {
        return this.mText;
    }
}
