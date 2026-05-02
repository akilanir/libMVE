package com.github.curioustechizen.ago;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Handler;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.format.DateUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;

/*  JADX ERROR: NullPointerException in pass: ClassModifier
    java.lang.NullPointerException: Cannot invoke "java.util.List.forEach(java.util.function.Consumer)" because "blocks" is null
    	at jadx.core.utils.BlockUtils.collectAllInsns(BlockUtils.java:1029)
    	at jadx.core.dex.visitors.ClassModifier.removeBridgeMethod(ClassModifier.java:245)
    	at jadx.core.dex.visitors.ClassModifier.removeSyntheticMethods(ClassModifier.java:160)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1511)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:65)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:58)
    */
/* loaded from: com.github.curioustechizen.android-ago.library.1.3.1.jar:com/github/curioustechizen/ago/RelativeTimeTextView.class */
public class RelativeTimeTextView extends TextView {
    private long mReferenceTime;
    private String mText;
    private String mPrefix;
    private String mSuffix;
    private Handler mHandler;
    private UpdateTimeRunnable mUpdateTimeTask;
    private boolean isUpdateTaskRunning;

    public RelativeTimeTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mHandler = new Handler();
        this.isUpdateTaskRunning = false;
        init(context, attrs);
    }

    public RelativeTimeTextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mHandler = new Handler();
        this.isUpdateTaskRunning = false;
        init(context, attrs);
    }

    private void init(Context context, AttributeSet attrs) {
        TypedArray a = context.getTheme().obtainStyledAttributes(attrs, R.styleable.RelativeTimeTextView, 0, 0);
        try {
            this.mText = a.getString(R.styleable.RelativeTimeTextView_reference_time);
            this.mPrefix = a.getString(R.styleable.RelativeTimeTextView_relative_time_prefix);
            this.mSuffix = a.getString(R.styleable.RelativeTimeTextView_relative_time_suffix);
            this.mPrefix = this.mPrefix == null ? BuildConfig.FLAVOR : this.mPrefix;
            this.mSuffix = this.mSuffix == null ? BuildConfig.FLAVOR : this.mSuffix;
            a.recycle();
            try {
                this.mReferenceTime = Long.valueOf(this.mText).longValue();
            } catch (NumberFormatException e) {
                this.mReferenceTime = -1L;
            }
            setReferenceTime(this.mReferenceTime);
        } catch (Throwable th) {
            a.recycle();
            throw th;
        }
    }

    public String getPrefix() {
        return this.mPrefix;
    }

    public void setPrefix(String prefix) {
        this.mPrefix = prefix;
        updateTextDisplay();
    }

    public String getSuffix() {
        return this.mSuffix;
    }

    public void setSuffix(String suffix) {
        this.mSuffix = suffix;
        updateTextDisplay();
    }

    public void setReferenceTime(long referenceTime) {
        this.mReferenceTime = referenceTime;
        stopTaskForPeriodicallyUpdatingRelativeTime();
        this.mUpdateTimeTask = new UpdateTimeRunnable(this, this.mReferenceTime);
        startTaskForPeriodicallyUpdatingRelativeTime();
        updateTextDisplay();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateTextDisplay() {
        if (this.mReferenceTime == -1) {
            return;
        }
        setText(this.mPrefix + ((Object) getRelativeTimeDisplayString()) + this.mSuffix);
    }

    private CharSequence getRelativeTimeDisplayString() {
        long now = System.currentTimeMillis();
        long difference = now - this.mReferenceTime;
        return (difference < 0 || difference > 60000) ? DateUtils.getRelativeTimeSpanString(this.mReferenceTime, now, 60000L, 262144) : getResources().getString(R.string.just_now);
    }

    @Override // android.widget.TextView, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        startTaskForPeriodicallyUpdatingRelativeTime();
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        stopTaskForPeriodicallyUpdatingRelativeTime();
    }

    @Override // android.widget.TextView, android.view.View
    protected void onVisibilityChanged(View changedView, int visibility) {
        super.onVisibilityChanged(changedView, visibility);
        if (visibility == 8 || visibility == 4) {
            stopTaskForPeriodicallyUpdatingRelativeTime();
        } else {
            startTaskForPeriodicallyUpdatingRelativeTime();
        }
    }

    private void startTaskForPeriodicallyUpdatingRelativeTime() {
        this.mHandler.post(this.mUpdateTimeTask);
        this.isUpdateTaskRunning = true;
    }

    private void stopTaskForPeriodicallyUpdatingRelativeTime() {
        if (this.isUpdateTaskRunning) {
            this.mHandler.removeCallbacks(this.mUpdateTimeTask);
            this.isUpdateTaskRunning = false;
        }
    }

    /* JADX WARN: Failed to check method for inline after forced processcom.github.curioustechizen.ago.RelativeTimeTextView.SavedState.access$002(com.github.curioustechizen.ago.RelativeTimeTextView$SavedState, long):long */
    @Override // android.widget.TextView, android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState ss = new SavedState(superState);
        SavedState.access$002(ss, this.mReferenceTime);
        return ss;
    }

    @Override // android.widget.TextView, android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        if (!(state instanceof SavedState)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState ss = (SavedState) state;
        this.mReferenceTime = ss.referenceTime;
        super.onRestoreInstanceState(ss.getSuperState());
    }

    /* loaded from: com.github.curioustechizen.android-ago.library.1.3.1.jar:com/github/curioustechizen/ago/RelativeTimeTextView$SavedState.class */
    public static class SavedState extends View.BaseSavedState {
        private long referenceTime;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.github.curioustechizen.ago.RelativeTimeTextView.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in, null);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };

        /*  JADX ERROR: Failed to decode insn: 0x0002: MOVE_MULTI
            java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
            	at java.base/java.lang.System.arraycopy(Native Method)
            	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
            	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
            	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
            	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
            	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
            	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
            	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
            	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:464)
            	at jadx.core.ProcessClass.process(ProcessClass.java:69)
            	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
            	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
            	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
            	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
            */
        static /* synthetic */ long access$002(com.github.curioustechizen.ago.RelativeTimeTextView.SavedState r6, long r7) {
            /*
                r0 = r6
                r1 = r7
                // decode failed: arraycopy: source index -1 out of bounds for object array[6]
                r0.referenceTime = r1
                return r-1
            */
            throw new UnsupportedOperationException("Method not decompiled: com.github.curioustechizen.ago.RelativeTimeTextView.SavedState.access$002(com.github.curioustechizen.ago.RelativeTimeTextView$SavedState, long):long");
        }

        /* synthetic */ SavedState(Parcel x0, AnonymousClass1 x1) {
            this(x0);
        }

        public SavedState(Parcelable superState) {
            super(superState);
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeLong(this.referenceTime);
        }

        static {
        }

        private SavedState(Parcel in) {
            super(in);
            this.referenceTime = in.readLong();
        }
    }

    /* loaded from: com.github.curioustechizen.android-ago.library.1.3.1.jar:com/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable.class */
    private class UpdateTimeRunnable implements Runnable {
        private long mRefTime;
        final /* synthetic */ RelativeTimeTextView this$0;

        UpdateTimeRunnable(RelativeTimeTextView relativeTimeTextView, long refTime) {
            this.this$0 = relativeTimeTextView;
            this.mRefTime = refTime;
        }

        @Override // java.lang.Runnable
        public void run() {
            long difference = Math.abs(System.currentTimeMillis() - this.mRefTime);
            long interval = 60000;
            if (difference > 604800000) {
                interval = 604800000;
            } else if (difference > 86400000) {
                interval = 86400000;
            } else if (difference > 3600000) {
                interval = 3600000;
            }
            this.this$0.updateTextDisplay();
            this.this$0.mHandler.postDelayed(this, interval);
        }
    }
}
