package mehdi.sakout.fancybuttons;

import android.R;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: com.github.medyo.fancybuttons.1.5.jar:mehdi/sakout/fancybuttons/FancyButton.class */
public class FancyButton extends LinearLayout {
    private Context mContext;
    private int mDefaultBackgroundColor;
    private int mFocusBackgroundColor;
    private int mDefaultTextColor;
    private int mDefaultIconColor;
    private int mTextPosition;
    private int mDefaultTextSize;
    private int mDefaultTextGravity;
    private String mText;
    private Drawable mIconResource;
    private int mFontIconSize;
    private String mFontIcon;
    private int mIconPosition;
    private int mIconPaddingLeft;
    private int mIconPaddingRight;
    private int mIconPaddingTop;
    private int mIconPaddingBottom;
    private int mBorderColor;
    private int mBorderWidth;
    private int mRadius;
    private Typeface mTextTypeFace;
    private Typeface mIconTypeFace;
    public static final int POSITION_LEFT = 1;
    public static final int POSITION_RIGHT = 2;
    public static final int POSITION_TOP = 3;
    public static final int POSITION_BOTTOM = 4;
    private String mDefaultIconFont;
    private String mDefaultTextFont;
    private ImageView mIconView;
    private TextView mFontIconView;
    private TextView mTextView;
    private boolean mGhost;

    public FancyButton(Context context) {
        super(context);
        this.mDefaultBackgroundColor = -16777216;
        this.mFocusBackgroundColor = 0;
        this.mDefaultTextColor = -1;
        this.mDefaultIconColor = -1;
        this.mTextPosition = 1;
        this.mDefaultTextSize = Utils.spToPx(getContext(), 15.0f);
        this.mDefaultTextGravity = 17;
        this.mText = null;
        this.mIconResource = null;
        this.mFontIconSize = Utils.spToPx(getContext(), 15.0f);
        this.mFontIcon = null;
        this.mIconPosition = 1;
        this.mIconPaddingLeft = 10;
        this.mIconPaddingRight = 10;
        this.mIconPaddingTop = 0;
        this.mIconPaddingBottom = 0;
        this.mBorderColor = 0;
        this.mBorderWidth = 0;
        this.mRadius = 0;
        this.mTextTypeFace = null;
        this.mIconTypeFace = null;
        this.mDefaultIconFont = "fontawesome.ttf";
        this.mDefaultTextFont = "robotoregular.ttf";
        this.mGhost = false;
        this.mContext = context;
        this.mTextTypeFace = Typeface.createFromAsset(this.mContext.getAssets(), String.format("fonts/%s", this.mDefaultTextFont));
        this.mIconTypeFace = Typeface.createFromAsset(this.mContext.getAssets(), String.format("iconfonts/%s", this.mDefaultIconFont));
        initializeFancyButton();
    }

    public FancyButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mDefaultBackgroundColor = -16777216;
        this.mFocusBackgroundColor = 0;
        this.mDefaultTextColor = -1;
        this.mDefaultIconColor = -1;
        this.mTextPosition = 1;
        this.mDefaultTextSize = Utils.spToPx(getContext(), 15.0f);
        this.mDefaultTextGravity = 17;
        this.mText = null;
        this.mIconResource = null;
        this.mFontIconSize = Utils.spToPx(getContext(), 15.0f);
        this.mFontIcon = null;
        this.mIconPosition = 1;
        this.mIconPaddingLeft = 10;
        this.mIconPaddingRight = 10;
        this.mIconPaddingTop = 0;
        this.mIconPaddingBottom = 0;
        this.mBorderColor = 0;
        this.mBorderWidth = 0;
        this.mRadius = 0;
        this.mTextTypeFace = null;
        this.mIconTypeFace = null;
        this.mDefaultIconFont = "fontawesome.ttf";
        this.mDefaultTextFont = "robotoregular.ttf";
        this.mGhost = false;
        this.mContext = context;
        TypedArray attrsArray = context.obtainStyledAttributes(attrs, R.styleable.FancyButtonsAttrs, 0, 0);
        initAttributsArray(attrsArray);
        attrsArray.recycle();
        initializeFancyButton();
    }

    private void initializeFancyButton() {
        initializeButtonContainer();
        this.mTextView = setupTextView();
        this.mIconView = setupIconView();
        this.mFontIconView = setupFontIconView();
        if (this.mIconView == null && this.mFontIconView == null && this.mTextView == null) {
            Button tempTextView = new Button(this.mContext);
            tempTextView.setText("Fancy Button");
            addView(tempTextView);
            return;
        }
        removeAllViews();
        setupBackground();
        ArrayList<View> views = new ArrayList<>();
        if (this.mIconPosition == 1 || this.mIconPosition == 3) {
            if (this.mIconView != null) {
                views.add(this.mIconView);
            }
            if (this.mFontIconView != null) {
                views.add(this.mFontIconView);
            }
            if (this.mTextView != null) {
                views.add(this.mTextView);
            }
        } else {
            if (this.mTextView != null) {
                views.add(this.mTextView);
            }
            if (this.mIconView != null) {
                views.add(this.mIconView);
            }
            if (this.mFontIconView != null) {
                views.add(this.mFontIconView);
            }
        }
        Iterator<View> it = views.iterator();
        while (it.hasNext()) {
            View view = it.next();
            addView(view);
        }
    }

    private TextView setupTextView() {
        if (this.mText != null) {
            TextView textView = new TextView(this.mContext);
            textView.setText(this.mText);
            textView.setGravity(this.mDefaultTextGravity);
            textView.setTextColor(this.mDefaultTextColor);
            textView.setTextSize(Utils.pxToSp(getContext(), this.mDefaultTextSize));
            textView.setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
            if (!isInEditMode() && this.mTextTypeFace != null) {
                textView.setTypeface(this.mTextTypeFace);
            }
            return textView;
        }
        return null;
    }

    private TextView setupFontIconView() {
        if (this.mFontIcon != null) {
            TextView fontIconView = new TextView(this.mContext);
            fontIconView.setTextColor(this.mDefaultIconColor);
            LinearLayout.LayoutParams iconTextViewParams = new LinearLayout.LayoutParams(-2, -2);
            iconTextViewParams.rightMargin = this.mIconPaddingRight;
            iconTextViewParams.leftMargin = this.mIconPaddingLeft;
            iconTextViewParams.topMargin = this.mIconPaddingTop;
            iconTextViewParams.bottomMargin = this.mIconPaddingBottom;
            if (this.mTextView != null) {
                if (this.mIconPosition == 3 || this.mIconPosition == 4) {
                    iconTextViewParams.gravity = 17;
                    fontIconView.setGravity(17);
                } else {
                    fontIconView.setGravity(16);
                    iconTextViewParams.gravity = 16;
                }
            } else {
                iconTextViewParams.gravity = 17;
                fontIconView.setGravity(16);
            }
            fontIconView.setLayoutParams(iconTextViewParams);
            if (!isInEditMode()) {
                fontIconView.setTextSize(Utils.pxToSp(getContext(), this.mFontIconSize));
                fontIconView.setText(this.mFontIcon);
                fontIconView.setTypeface(this.mIconTypeFace);
            } else {
                fontIconView.setTextSize(Utils.pxToSp(getContext(), this.mFontIconSize));
                fontIconView.setText("O");
            }
            return fontIconView;
        }
        return null;
    }

    private ImageView setupIconView() {
        if (this.mIconResource != null) {
            ImageView iconView = new ImageView(this.mContext);
            iconView.setImageDrawable(this.mIconResource);
            iconView.setPadding(this.mIconPaddingLeft, this.mIconPaddingTop, this.mIconPaddingRight, this.mIconPaddingBottom);
            LinearLayout.LayoutParams iconViewParams = new LinearLayout.LayoutParams(-2, -2);
            if (this.mTextView != null) {
                if (this.mIconPosition == 3 || this.mIconPosition == 4) {
                    iconViewParams.gravity = 17;
                } else {
                    iconViewParams.gravity = 8388611;
                }
                iconViewParams.rightMargin = 10;
                iconViewParams.leftMargin = 10;
            } else {
                iconViewParams.gravity = 16;
            }
            iconView.setLayoutParams(iconViewParams);
            return iconView;
        }
        return null;
    }

    private void initAttributsArray(TypedArray attrsArray) {
        this.mDefaultBackgroundColor = attrsArray.getColor(R.styleable.FancyButtonsAttrs_fb_defaultColor, this.mDefaultBackgroundColor);
        this.mFocusBackgroundColor = attrsArray.getColor(R.styleable.FancyButtonsAttrs_fb_focusColor, this.mFocusBackgroundColor);
        this.mDefaultTextColor = attrsArray.getColor(R.styleable.FancyButtonsAttrs_fb_textColor, this.mDefaultTextColor);
        this.mDefaultIconColor = attrsArray.getColor(R.styleable.FancyButtonsAttrs_fb_iconColor, this.mDefaultTextColor);
        this.mDefaultTextSize = (int) attrsArray.getDimension(R.styleable.FancyButtonsAttrs_fb_textSize, this.mDefaultTextSize);
        this.mDefaultTextGravity = attrsArray.getInt(R.styleable.FancyButtonsAttrs_fb_textGravity, this.mDefaultTextGravity);
        this.mBorderColor = attrsArray.getColor(R.styleable.FancyButtonsAttrs_fb_borderColor, this.mBorderColor);
        this.mBorderWidth = (int) attrsArray.getDimension(R.styleable.FancyButtonsAttrs_fb_borderWidth, this.mBorderWidth);
        this.mRadius = (int) attrsArray.getDimension(R.styleable.FancyButtonsAttrs_fb_radius, this.mRadius);
        this.mFontIconSize = (int) attrsArray.getDimension(R.styleable.FancyButtonsAttrs_fb_fontIconSize, this.mFontIconSize);
        this.mIconPaddingLeft = (int) attrsArray.getDimension(R.styleable.FancyButtonsAttrs_fb_iconPaddingLeft, this.mIconPaddingLeft);
        this.mIconPaddingRight = (int) attrsArray.getDimension(R.styleable.FancyButtonsAttrs_fb_iconPaddingRight, this.mIconPaddingRight);
        this.mIconPaddingTop = (int) attrsArray.getDimension(R.styleable.FancyButtonsAttrs_fb_iconPaddingTop, this.mIconPaddingTop);
        this.mIconPaddingBottom = (int) attrsArray.getDimension(R.styleable.FancyButtonsAttrs_fb_iconPaddingBottom, this.mIconPaddingBottom);
        this.mGhost = attrsArray.getBoolean(R.styleable.FancyButtonsAttrs_fb_ghost, this.mGhost);
        String text = attrsArray.getString(R.styleable.FancyButtonsAttrs_fb_text);
        this.mIconPosition = attrsArray.getInt(R.styleable.FancyButtonsAttrs_fb_iconPosition, this.mIconPosition);
        String fontIcon = attrsArray.getString(R.styleable.FancyButtonsAttrs_fb_fontIconResource);
        String iconFontFamily = attrsArray.getString(R.styleable.FancyButtonsAttrs_fb_iconFont);
        String textFontFamily = attrsArray.getString(R.styleable.FancyButtonsAttrs_fb_textFont);
        try {
            this.mIconResource = attrsArray.getDrawable(R.styleable.FancyButtonsAttrs_fb_iconResource);
        } catch (Exception e) {
            this.mIconResource = null;
        }
        if (fontIcon != null) {
            this.mFontIcon = fontIcon;
        }
        if (text != null) {
            this.mText = text;
        }
        if (!isInEditMode()) {
            if (iconFontFamily != null) {
                try {
                    this.mIconTypeFace = Typeface.createFromAsset(this.mContext.getAssets(), String.format("iconfonts/%s", iconFontFamily));
                } catch (Exception e2) {
                    Log.e("Fancy", e2.getMessage());
                    this.mIconTypeFace = Typeface.createFromAsset(this.mContext.getAssets(), String.format("iconfonts/%s", this.mDefaultIconFont));
                }
            } else {
                this.mIconTypeFace = Typeface.createFromAsset(this.mContext.getAssets(), String.format("iconfonts/%s", this.mDefaultIconFont));
            }
            if (textFontFamily != null) {
                try {
                    this.mTextTypeFace = Typeface.createFromAsset(this.mContext.getAssets(), String.format("fonts/%s", textFontFamily));
                    return;
                } catch (Exception e3) {
                    this.mTextTypeFace = Typeface.createFromAsset(this.mContext.getAssets(), String.format("fonts/%s", this.mDefaultTextFont));
                    return;
                }
            }
            this.mTextTypeFace = Typeface.createFromAsset(this.mContext.getAssets(), String.format("fonts/%s", this.mDefaultTextFont));
        }
    }

    @SuppressLint({"NewApi"})
    private void setupBackground() {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setCornerRadius(this.mRadius);
        if (this.mGhost) {
            drawable.setColor(getResources().getColor(R.color.transparent));
        } else {
            drawable.setColor(this.mDefaultBackgroundColor);
        }
        if (this.mBorderColor != 0) {
            drawable.setStroke(this.mBorderWidth, this.mBorderColor);
        }
        GradientDrawable drawable2 = new GradientDrawable();
        drawable2.setCornerRadius(this.mRadius);
        if (this.mGhost) {
            drawable2.setColor(getResources().getColor(R.color.transparent));
        } else {
            drawable2.setColor(this.mFocusBackgroundColor);
        }
        if (this.mBorderColor != 0) {
            if (this.mGhost) {
                drawable2.setStroke(this.mBorderWidth, this.mFocusBackgroundColor);
            } else {
                drawable2.setStroke(this.mBorderWidth, this.mBorderColor);
            }
        }
        StateListDrawable states = new StateListDrawable();
        if (this.mFocusBackgroundColor != 0) {
            states.addState(new int[]{R.attr.state_pressed}, drawable2);
            states.addState(new int[]{R.attr.state_focused}, drawable2);
        }
        states.addState(new int[0], drawable);
        if (Build.VERSION.SDK_INT < 16) {
            setBackgroundDrawable(states);
        } else {
            setBackground(states);
        }
    }

    private void initializeButtonContainer() {
        if (this.mIconPosition == 3 || this.mIconPosition == 4) {
            setOrientation(1);
        } else {
            setOrientation(0);
        }
        LinearLayout.LayoutParams containerParams = new LinearLayout.LayoutParams(-2, -2);
        setLayoutParams(containerParams);
        setGravity(17);
        setClickable(true);
        setFocusable(true);
        if (this.mIconResource == null && this.mFontIcon == null && getPaddingLeft() == 0 && getPaddingRight() == 0 && getPaddingTop() == 0 && getPaddingBottom() == 0) {
            setPadding(20, 20, 20, 20);
        }
    }

    public void setText(String text) {
        this.mText = text;
        if (this.mTextView == null) {
            initializeFancyButton();
        } else {
            this.mTextView.setText(text);
        }
    }

    public void setTextColor(int color) {
        this.mDefaultTextColor = color;
        if (this.mTextView == null) {
            initializeFancyButton();
        } else {
            this.mTextView.setTextColor(color);
        }
    }

    public void setIconColor(int color) {
        if (this.mFontIconView != null) {
            this.mFontIconView.setTextColor(color);
        }
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        this.mDefaultBackgroundColor = color;
        if (this.mIconView != null || this.mFontIconView != null || this.mTextView != null) {
            setupBackground();
        }
    }

    public void setFocusBackgroundColor(int color) {
        this.mFocusBackgroundColor = color;
        if (this.mIconView != null || this.mFontIconView != null || this.mTextView != null) {
            setupBackground();
        }
    }

    public void setTextSize(int textSize) {
        this.mDefaultTextSize = Utils.spToPx(getContext(), textSize);
        if (this.mTextView != null) {
            this.mTextView.setTextSize(textSize);
        }
    }

    public void setTextGravity(int gravity) {
        this.mDefaultTextGravity = gravity;
        if (this.mTextView != null) {
            this.mTextView.setGravity(gravity);
        }
    }

    public void setIconPadding(int paddingLeft, int paddingTop, int paddingRight, int paddingBottom) {
        this.mIconPaddingLeft = paddingLeft;
        this.mIconPaddingTop = paddingTop;
        this.mIconPaddingRight = paddingRight;
        this.mIconPaddingBottom = paddingBottom;
        if (this.mIconView != null) {
            this.mIconView.setPadding(this.mIconPaddingLeft, this.mIconPaddingTop, this.mIconPaddingRight, this.mIconPaddingBottom);
        }
        if (this.mFontIconView != null) {
            this.mFontIconView.setPadding(this.mIconPaddingLeft, this.mIconPaddingTop, this.mIconPaddingRight, this.mIconPaddingBottom);
        }
    }

    public void setIconResource(int drawable) {
        this.mIconResource = this.mContext.getResources().getDrawable(drawable);
        if (this.mIconView == null || this.mFontIconView != null) {
            this.mFontIconView = null;
            initializeFancyButton();
        } else {
            this.mIconView.setImageDrawable(this.mIconResource);
        }
    }

    public void setIconResource(String icon) {
        this.mFontIcon = icon;
        if (this.mFontIconView == null) {
            this.mIconView = null;
            initializeFancyButton();
        } else {
            this.mFontIconView.setText(icon);
        }
    }

    public void setFontIconSize(int iconSize) {
        this.mFontIconSize = Utils.spToPx(getContext(), iconSize);
        if (this.mFontIconView != null) {
            this.mFontIconView.setTextSize(iconSize);
        }
    }

    public void setIconPosition(int position) {
        if (position > 0 && position < 5) {
            this.mIconPosition = position;
        } else {
            this.mIconPosition = 1;
        }
        initializeFancyButton();
    }

    public void setBorderColor(int color) {
        this.mBorderColor = color;
        if (this.mIconView != null || this.mFontIconView != null || this.mTextView != null) {
            setupBackground();
        }
    }

    public void setBorderWidth(int width) {
        this.mBorderWidth = width;
        if (this.mIconView != null || this.mFontIconView != null || this.mTextView != null) {
            setupBackground();
        }
    }

    public void setRadius(int radius) {
        this.mRadius = radius;
        if (this.mIconView != null || this.mFontIconView != null || this.mTextView != null) {
            setupBackground();
        }
    }

    public void setCustomTextFont(String fontName) {
        try {
            this.mTextTypeFace = Typeface.createFromAsset(this.mContext.getAssets(), String.format("fonts/%s", fontName));
        } catch (Exception e) {
            Log.e("FancyButtons", e.getMessage());
            this.mTextTypeFace = Typeface.createFromAsset(this.mContext.getAssets(), String.format("fonts/%s", this.mDefaultTextFont));
        }
        if (this.mTextView == null) {
            initializeFancyButton();
        } else {
            this.mTextView.setTypeface(this.mTextTypeFace);
        }
    }

    public void setCustomIconFont(String fontName) {
        try {
            this.mIconTypeFace = Typeface.createFromAsset(this.mContext.getAssets(), String.format("iconfonts/%s", fontName));
        } catch (Exception e) {
            Log.e("FancyButtons", e.getMessage());
            this.mIconTypeFace = Typeface.createFromAsset(this.mContext.getAssets(), String.format("iconfonts/%s", this.mDefaultIconFont));
        }
        if (this.mFontIconView == null) {
            initializeFancyButton();
        } else {
            this.mFontIconView.setTypeface(this.mIconTypeFace);
        }
    }

    public void setGhost(boolean ghost) {
        this.mGhost = ghost;
        if (this.mIconView != null || this.mFontIconView != null || this.mTextView != null) {
            setupBackground();
        }
    }

    public CharSequence getText() {
        if (this.mTextView != null) {
            return this.mTextView.getText();
        }
        return BuildConfig.FLAVOR;
    }

    public TextView getTextViewObject() {
        return this.mTextView;
    }

    public TextView getIconFontObject() {
        return this.mFontIconView;
    }

    public ImageView getIconImageObject() {
        return this.mIconView;
    }
}
