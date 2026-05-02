package uk.co.chrisjenx.calligraphy;

import android.R;
import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.support.v7.widget.Toolbar;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;

/* loaded from: uk.co.chrisjenx.calligraphy.2.1.0.jar:uk/co/chrisjenx/calligraphy/CalligraphyFactory.class */
class CalligraphyFactory {
    private static final String ACTION_BAR_TITLE = "action_bar_title";
    private static final String ACTION_BAR_SUBTITLE = "action_bar_subtitle";
    private final int mAttributeId;

    protected static int[] getStyleForTextView(TextView view) {
        int[] styleIds = {-1, -1};
        if (isActionBarTitle(view)) {
            styleIds[0] = 16843470;
            styleIds[1] = 16843512;
        } else if (isActionBarSubTitle(view)) {
            styleIds[0] = 16843470;
            styleIds[1] = 16843513;
        }
        if (styleIds[0] == -1) {
            styleIds[0] = CalligraphyConfig.get().getClassStyles().containsKey(view.getClass()) ? CalligraphyConfig.get().getClassStyles().get(view.getClass()).intValue() : R.attr.textAppearance;
        }
        return styleIds;
    }

    @SuppressLint({"NewApi"})
    protected static boolean isActionBarTitle(TextView view) {
        if (matchesResourceIdName(view, ACTION_BAR_TITLE)) {
            return true;
        }
        if (parentIsToolbarV7(view)) {
            Toolbar parent = view.getParent();
            return TextUtils.equals(parent.getTitle(), view.getText());
        }
        return false;
    }

    @SuppressLint({"NewApi"})
    protected static boolean isActionBarSubTitle(TextView view) {
        if (matchesResourceIdName(view, ACTION_BAR_SUBTITLE)) {
            return true;
        }
        if (parentIsToolbarV7(view)) {
            Toolbar parent = view.getParent();
            return TextUtils.equals(parent.getSubtitle(), view.getText());
        }
        return false;
    }

    protected static boolean parentIsToolbarV7(View view) {
        return CalligraphyUtils.canCheckForV7Toolbar() && view.getParent() != null && (view.getParent() instanceof Toolbar);
    }

    protected static boolean matchesResourceIdName(View view, String matches) {
        if (view.getId() == -1) {
            return false;
        }
        String resourceEntryName = view.getResources().getResourceEntryName(view.getId());
        return resourceEntryName.equalsIgnoreCase(matches);
    }

    public CalligraphyFactory(int attributeId) {
        this.mAttributeId = attributeId;
    }

    public View onViewCreated(View view, Context context, AttributeSet attrs) {
        if (view != null && view.getTag(R.id.calligraphy_tag_id) != Boolean.TRUE) {
            onViewCreatedInternal(view, context, attrs);
            view.setTag(R.id.calligraphy_tag_id, Boolean.TRUE);
        }
        return view;
    }

    void onViewCreatedInternal(View view, final Context context, AttributeSet attrs) {
        if (view instanceof TextView) {
            if (TypefaceUtils.isLoaded(((TextView) view).getTypeface())) {
                return;
            }
            String textViewFont = CalligraphyUtils.pullFontPathFromView(context, attrs, this.mAttributeId);
            if (TextUtils.isEmpty(textViewFont)) {
                textViewFont = CalligraphyUtils.pullFontPathFromStyle(context, attrs, this.mAttributeId);
            }
            if (TextUtils.isEmpty(textViewFont)) {
                textViewFont = CalligraphyUtils.pullFontPathFromTextAppearance(context, attrs, this.mAttributeId);
            }
            if (TextUtils.isEmpty(textViewFont)) {
                int[] styleForTextView = getStyleForTextView((TextView) view);
                if (styleForTextView[1] != -1) {
                    textViewFont = CalligraphyUtils.pullFontPathFromTheme(context, styleForTextView[0], styleForTextView[1], this.mAttributeId);
                } else {
                    textViewFont = CalligraphyUtils.pullFontPathFromTheme(context, styleForTextView[0], this.mAttributeId);
                }
            }
            boolean deferred = matchesResourceIdName(view, ACTION_BAR_TITLE) || matchesResourceIdName(view, ACTION_BAR_SUBTITLE);
            CalligraphyUtils.applyFontToTextView(context, (TextView) view, CalligraphyConfig.get(), textViewFont, deferred);
        }
        if (CalligraphyUtils.canCheckForV7Toolbar() && (view instanceof Toolbar)) {
            final ViewGroup parent = (ViewGroup) view;
            parent.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: uk.co.chrisjenx.calligraphy.CalligraphyFactory.1
                @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
                @TargetApi(16)
                public void onGlobalLayout() {
                    int childCount = parent.getChildCount();
                    if (childCount != 0) {
                        for (int i = 0; i < childCount; i++) {
                            CalligraphyFactory.this.onViewCreated(parent.getChildAt(i), context, null);
                        }
                    }
                    if (Build.VERSION.SDK_INT < 16) {
                        parent.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                    } else {
                        parent.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                    }
                }
            });
        }
    }

    /* renamed from: uk.co.chrisjenx.calligraphy.CalligraphyFactory$2, reason: invalid class name */
    /* loaded from: uk.co.chrisjenx.calligraphy.2.1.0.jar:uk/co/chrisjenx/calligraphy/CalligraphyFactory$2.class */
    class AnonymousClass2 implements ViewTreeObserver.OnGlobalLayoutListener {
        final /* synthetic */ ViewGroup val$parent;
        final /* synthetic */ Context val$context;

        AnonymousClass2(ViewGroup viewGroup, Context context) {
            this.val$parent = viewGroup;
            this.val$context = context;
        }

        @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
        @TargetApi(16)
        public void onGlobalLayout() {
            int childCount = this.val$parent.getChildCount();
            if (childCount != 0) {
                for (int i = 0; i < childCount; i++) {
                    CalligraphyFactory.this.onViewCreated(this.val$parent.getChildAt(i), this.val$context, null);
                }
            }
            if (Build.VERSION.SDK_INT < 16) {
                this.val$parent.getViewTreeObserver().removeGlobalOnLayoutListener(this);
            } else {
                this.val$parent.getViewTreeObserver().removeOnGlobalLayoutListener(this);
            }
        }
    }
}
