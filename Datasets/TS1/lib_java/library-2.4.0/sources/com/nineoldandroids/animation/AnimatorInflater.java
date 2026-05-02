package com.nineoldandroids.animation;

import android.R;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.util.Xml;
import android.view.animation.AnimationUtils;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: library-2.4.0.jar:com/nineoldandroids/animation/AnimatorInflater.class */
public class AnimatorInflater {
    private static final int AnimatorSet_ordering = 0;
    private static final int PropertyAnimator_propertyName = 0;
    private static final int Animator_interpolator = 0;
    private static final int Animator_duration = 1;
    private static final int Animator_startOffset = 2;
    private static final int Animator_repeatCount = 3;
    private static final int Animator_repeatMode = 4;
    private static final int Animator_valueFrom = 5;
    private static final int Animator_valueTo = 6;
    private static final int Animator_valueType = 7;
    private static final int TOGETHER = 0;
    private static final int VALUE_TYPE_FLOAT = 0;
    private static final int[] AnimatorSet = {R.attr.ordering};
    private static final int[] PropertyAnimator = {R.attr.propertyName};
    private static final int[] Animator = {R.attr.interpolator, R.attr.duration, R.attr.startOffset, R.attr.repeatCount, R.attr.repeatMode, R.attr.valueFrom, R.attr.valueTo, R.attr.valueType};

    public static Animator loadAnimator(Context context, int id) throws Resources.NotFoundException {
        XmlResourceParser parser = null;
        try {
            try {
                try {
                    parser = context.getResources().getAnimation(id);
                    Animator createAnimatorFromXml = createAnimatorFromXml(context, parser);
                    if (parser != null) {
                        parser.close();
                    }
                    return createAnimatorFromXml;
                } catch (IOException ex) {
                    Resources.NotFoundException rnf = new Resources.NotFoundException("Can't load animation resource ID #0x" + Integer.toHexString(id));
                    rnf.initCause(ex);
                    throw rnf;
                }
            } catch (XmlPullParserException ex2) {
                Resources.NotFoundException rnf2 = new Resources.NotFoundException("Can't load animation resource ID #0x" + Integer.toHexString(id));
                rnf2.initCause(ex2);
                throw rnf2;
            }
        } catch (Throwable th) {
            if (parser != null) {
                parser.close();
            }
            throw th;
        }
    }

    private static Animator createAnimatorFromXml(Context c, XmlPullParser parser) throws XmlPullParserException, IOException {
        return createAnimatorFromXml(c, parser, Xml.asAttributeSet(parser), null, 0);
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x00fe, code lost:
    
        if (r9 == null) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0103, code lost:
    
        if (r12 == null) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0106, code lost:
    
        r0 = new com.nineoldandroids.animation.Animator[r12.size()];
        r16 = 0;
        r0 = r12.iterator();
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0121, code lost:
    
        if (r0.hasNext() == false) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0124, code lost:
    
        r1 = r16;
        r16 = r16 + 1;
        r0[r1] = r0.next();
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x013f, code lost:
    
        if (r10 != 0) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0142, code lost:
    
        r9.playTogether(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x014b, code lost:
    
        r9.playSequentially(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0153, code lost:
    
        return r11;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static com.nineoldandroids.animation.Animator createAnimatorFromXml(android.content.Context r6, org.xmlpull.v1.XmlPullParser r7, android.util.AttributeSet r8, com.nineoldandroids.animation.AnimatorSet r9, int r10) throws org.xmlpull.v1.XmlPullParserException, java.io.IOException {
        /*
            Method dump skipped, instructions count: 340
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.nineoldandroids.animation.AnimatorInflater.createAnimatorFromXml(android.content.Context, org.xmlpull.v1.XmlPullParser, android.util.AttributeSet, com.nineoldandroids.animation.AnimatorSet, int):com.nineoldandroids.animation.Animator");
    }

    private static ObjectAnimator loadObjectAnimator(Context context, AttributeSet attrs) throws Resources.NotFoundException {
        ObjectAnimator anim = new ObjectAnimator();
        loadAnimator(context, attrs, anim);
        TypedArray a = context.obtainStyledAttributes(attrs, PropertyAnimator);
        String propertyName = a.getString(0);
        anim.setPropertyName(propertyName);
        a.recycle();
        return anim;
    }

    private static ValueAnimator loadAnimator(Context context, AttributeSet attrs, ValueAnimator anim) throws Resources.NotFoundException {
        int valueTo;
        int valueFrom;
        int valueTo2;
        float valueTo3;
        float valueFrom2;
        float valueTo4;
        TypedArray a = context.obtainStyledAttributes(attrs, Animator);
        long duration = a.getInt(1, 0);
        long startDelay = a.getInt(2, 0);
        int valueType = a.getInt(Animator_valueType, 0);
        if (anim == null) {
            anim = new ValueAnimator();
        }
        boolean getFloats = valueType == 0;
        TypedValue tvFrom = a.peekValue(Animator_valueFrom);
        boolean hasFrom = tvFrom != null;
        int fromType = hasFrom ? tvFrom.type : 0;
        TypedValue tvTo = a.peekValue(Animator_valueTo);
        boolean hasTo = tvTo != null;
        int toType = hasTo ? tvTo.type : 0;
        if ((hasFrom && fromType >= 28 && fromType <= 31) || (hasTo && toType >= 28 && toType <= 31)) {
            getFloats = false;
            anim.setEvaluator(new ArgbEvaluator());
        }
        if (getFloats) {
            if (hasFrom) {
                if (fromType == Animator_valueFrom) {
                    valueFrom2 = a.getDimension(Animator_valueFrom, 0.0f);
                } else {
                    valueFrom2 = a.getFloat(Animator_valueFrom, 0.0f);
                }
                if (hasTo) {
                    if (toType == Animator_valueFrom) {
                        valueTo4 = a.getDimension(Animator_valueTo, 0.0f);
                    } else {
                        valueTo4 = a.getFloat(Animator_valueTo, 0.0f);
                    }
                    anim.setFloatValues(valueFrom2, valueTo4);
                } else {
                    anim.setFloatValues(valueFrom2);
                }
            } else {
                if (toType == Animator_valueFrom) {
                    valueTo3 = a.getDimension(Animator_valueTo, 0.0f);
                } else {
                    valueTo3 = a.getFloat(Animator_valueTo, 0.0f);
                }
                anim.setFloatValues(valueTo3);
            }
        } else if (hasFrom) {
            if (fromType == Animator_valueFrom) {
                valueFrom = (int) a.getDimension(Animator_valueFrom, 0.0f);
            } else if (fromType >= 28 && fromType <= 31) {
                valueFrom = a.getColor(Animator_valueFrom, 0);
            } else {
                valueFrom = a.getInt(Animator_valueFrom, 0);
            }
            if (hasTo) {
                if (toType == Animator_valueFrom) {
                    valueTo2 = (int) a.getDimension(Animator_valueTo, 0.0f);
                } else if (toType >= 28 && toType <= 31) {
                    valueTo2 = a.getColor(Animator_valueTo, 0);
                } else {
                    valueTo2 = a.getInt(Animator_valueTo, 0);
                }
                anim.setIntValues(valueFrom, valueTo2);
            } else {
                anim.setIntValues(valueFrom);
            }
        } else if (hasTo) {
            if (toType == Animator_valueFrom) {
                valueTo = (int) a.getDimension(Animator_valueTo, 0.0f);
            } else if (toType >= 28 && toType <= 31) {
                valueTo = a.getColor(Animator_valueTo, 0);
            } else {
                valueTo = a.getInt(Animator_valueTo, 0);
            }
            anim.setIntValues(valueTo);
        }
        anim.setDuration(duration);
        anim.setStartDelay(startDelay);
        if (a.hasValue(Animator_repeatCount)) {
            anim.setRepeatCount(a.getInt(Animator_repeatCount, 0));
        }
        if (a.hasValue(Animator_repeatMode)) {
            anim.setRepeatMode(a.getInt(Animator_repeatMode, 1));
        }
        int resID = a.getResourceId(0, 0);
        if (resID > 0) {
            anim.setInterpolator(AnimationUtils.loadInterpolator(context, resID));
        }
        a.recycle();
        return anim;
    }
}
