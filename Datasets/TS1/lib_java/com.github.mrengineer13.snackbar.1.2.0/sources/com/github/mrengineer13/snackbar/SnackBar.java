package com.github.mrengineer13.snackbar;

import android.R;
import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/* loaded from: com.github.mrengineer13.snackbar.1.2.0.jar:com/github/mrengineer13/snackbar/SnackBar.class */
public class SnackBar {
    public static final short LONG_SNACK = 5000;
    public static final short MED_SNACK = 3500;
    public static final short SHORT_SNACK = 2000;
    public static final short PERMANENT_SNACK = 0;
    private SnackContainer mSnackContainer;
    private View mParentView;
    private OnMessageClickListener mClickListener;
    private OnVisibilityChangeListener mVisibilityChangeListener;
    private final View.OnClickListener mButtonListener = new View.OnClickListener() { // from class: com.github.mrengineer13.snackbar.SnackBar.1
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (SnackBar.this.mClickListener != null && SnackBar.this.mSnackContainer.isShowing()) {
                SnackBar.this.mClickListener.onMessageClick(SnackBar.this.mSnackContainer.peek().mToken);
            }
            SnackBar.this.mSnackContainer.hide();
        }
    };

    /* loaded from: com.github.mrengineer13.snackbar.1.2.0.jar:com/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener.class */
    public interface OnMessageClickListener {
        void onMessageClick(Parcelable parcelable);
    }

    /* loaded from: com.github.mrengineer13.snackbar.1.2.0.jar:com/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener.class */
    public interface OnVisibilityChangeListener {
        void onShow(int i);

        void onHide(int i);
    }

    /* loaded from: com.github.mrengineer13.snackbar.1.2.0.jar:com/github/mrengineer13/snackbar/SnackBar$Style.class */
    public enum Style {
        DEFAULT,
        ALERT,
        CONFIRM,
        INFO
    }

    public SnackBar(Activity activity) {
        ViewGroup container = (ViewGroup) activity.findViewById(R.id.content);
        View v = activity.getLayoutInflater().inflate(R.layout.sb__snack, container, false);
        init(container, v);
    }

    public SnackBar(Context context, View v) {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService("layout_inflater");
        inflater.inflate(R.layout.sb__snack_container, (ViewGroup) v);
        View snackLayout = inflater.inflate(R.layout.sb__snack, (ViewGroup) v, false);
        init((ViewGroup) v, snackLayout);
    }

    private void init(ViewGroup container, View v) {
        this.mSnackContainer = (SnackContainer) container.findViewById(R.id.snackContainer);
        if (this.mSnackContainer == null) {
            this.mSnackContainer = new SnackContainer(container);
        }
        this.mParentView = v;
        TextView snackBtn = (TextView) v.findViewById(R.id.snackButton);
        snackBtn.setOnClickListener(this.mButtonListener);
    }

    /* loaded from: com.github.mrengineer13.snackbar.1.2.0.jar:com/github/mrengineer13/snackbar/SnackBar$Builder.class */
    public static class Builder {
        private SnackBar mSnackBar;
        private Context mContext;
        private String mMessage;
        private String mActionMessage;
        private Parcelable mToken;
        private ColorStateList mTextColor;
        private ColorStateList mBackgroundColor;
        private int mHeight;
        private boolean mClear;
        private boolean mAnimateClear;
        private Typeface mTypeFace;
        private int mActionIcon = 0;
        private short mDuration = 3500;

        public Builder(Activity activity) {
            this.mContext = activity.getApplicationContext();
            this.mSnackBar = new SnackBar(activity);
        }

        public Builder(Context context, View v) {
            this.mContext = context;
            this.mSnackBar = new SnackBar(context, v);
        }

        public Builder withMessage(String message) {
            this.mMessage = message;
            return this;
        }

        public Builder withMessageId(int messageId) {
            this.mMessage = this.mContext.getString(messageId);
            return this;
        }

        public Builder withActionMessage(String actionMessage) {
            this.mActionMessage = actionMessage;
            return this;
        }

        public Builder withActionMessageId(int actionMessageResId) {
            if (actionMessageResId > 0) {
                this.mActionMessage = this.mContext.getString(actionMessageResId);
            }
            return this;
        }

        public Builder withActionIconId(int id) {
            this.mActionIcon = id;
            return this;
        }

        public Builder withStyle(Style style) {
            this.mTextColor = getActionTextColor(style);
            return this;
        }

        public Builder withToken(Parcelable token) {
            this.mToken = token;
            return this;
        }

        public Builder withDuration(Short duration) {
            this.mDuration = duration.shortValue();
            return this;
        }

        public Builder withTextColorId(int colorId) {
            ColorStateList color = this.mContext.getResources().getColorStateList(colorId);
            this.mTextColor = color;
            return this;
        }

        public Builder withBackgroundColorId(int colorId) {
            ColorStateList color = this.mContext.getResources().getColorStateList(colorId);
            this.mBackgroundColor = color;
            return this;
        }

        public Builder withSnackBarHeight(int height) {
            this.mHeight = height;
            return this;
        }

        public Builder withOnClickListener(OnMessageClickListener onClickListener) {
            this.mSnackBar.setOnClickListener(onClickListener);
            return this;
        }

        public Builder withVisibilityChangeListener(OnVisibilityChangeListener visibilityChangeListener) {
            this.mSnackBar.setOnVisibilityChangeListener(visibilityChangeListener);
            return this;
        }

        public Builder withClearQueued() {
            return withClearQueued(true);
        }

        public Builder withClearQueued(boolean animate) {
            this.mAnimateClear = animate;
            this.mClear = true;
            return this;
        }

        public Builder withTypeFace(Typeface typeFace) {
            this.mTypeFace = typeFace;
            return this;
        }

        public SnackBar show() {
            Snack message = new Snack(this.mMessage, this.mActionMessage != null ? this.mActionMessage.toUpperCase() : null, this.mActionIcon, this.mToken, this.mDuration, this.mTextColor != null ? this.mTextColor : getActionTextColor(Style.DEFAULT), this.mBackgroundColor != null ? this.mBackgroundColor : this.mContext.getResources().getColorStateList(R.color.sb__snack_bkgnd), this.mHeight != 0 ? this.mHeight : 0, this.mTypeFace);
            if (this.mClear) {
                this.mSnackBar.clear(this.mAnimateClear);
            }
            this.mSnackBar.showMessage(message);
            return this.mSnackBar;
        }

        private ColorStateList getActionTextColor(Style style) {
            switch (style) {
                case ALERT:
                    return this.mContext.getResources().getColorStateList(R.color.sb__button_text_color_red);
                case INFO:
                    return this.mContext.getResources().getColorStateList(R.color.sb__button_text_color_yellow);
                case CONFIRM:
                    return this.mContext.getResources().getColorStateList(R.color.sb__button_text_color_green);
                case DEFAULT:
                    return this.mContext.getResources().getColorStateList(R.color.sb__default_button_text_color);
                default:
                    return this.mContext.getResources().getColorStateList(R.color.sb__default_button_text_color);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showMessage(Snack message) {
        this.mSnackContainer.showSnack(message, this.mParentView, this.mVisibilityChangeListener);
    }

    public int getHeight() {
        this.mParentView.measure(View.MeasureSpec.makeMeasureSpec(this.mParentView.getWidth(), 1073741824), View.MeasureSpec.makeMeasureSpec(this.mParentView.getHeight(), Integer.MIN_VALUE));
        return this.mParentView.getMeasuredHeight();
    }

    public View getContainerView() {
        return this.mParentView;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public SnackBar setOnClickListener(OnMessageClickListener listener) {
        this.mClickListener = listener;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public SnackBar setOnVisibilityChangeListener(OnVisibilityChangeListener listener) {
        this.mVisibilityChangeListener = listener;
        return this;
    }

    public void clear(boolean animate) {
        this.mSnackContainer.clearSnacks(animate);
    }

    public void clear() {
        clear(true);
    }

    public void hide() {
        this.mSnackContainer.hide();
        clear();
    }

    public void onRestoreInstanceState(Bundle state) {
        this.mSnackContainer.restoreState(state, this.mParentView);
    }

    public Bundle onSaveInstanceState() {
        return this.mSnackContainer.saveState();
    }
}
