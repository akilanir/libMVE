package android.support.v7.widget;

import android.content.Context;

/* loaded from: com.android.support.cardview-v7.23.1.1.jar:android/support/v7/widget/CardViewImpl.class */
interface CardViewImpl {
    void initialize(CardViewDelegate cardViewDelegate, Context context, int i, float f, float f2, float f3);

    void setRadius(CardViewDelegate cardViewDelegate, float f);

    float getRadius(CardViewDelegate cardViewDelegate);

    void setElevation(CardViewDelegate cardViewDelegate, float f);

    float getElevation(CardViewDelegate cardViewDelegate);

    void initStatic();

    void setMaxElevation(CardViewDelegate cardViewDelegate, float f);

    float getMaxElevation(CardViewDelegate cardViewDelegate);

    float getMinWidth(CardViewDelegate cardViewDelegate);

    float getMinHeight(CardViewDelegate cardViewDelegate);

    void updatePadding(CardViewDelegate cardViewDelegate);

    void onCompatPaddingChanged(CardViewDelegate cardViewDelegate);

    void onPreventCornerOverlapChanged(CardViewDelegate cardViewDelegate);

    void setBackgroundColor(CardViewDelegate cardViewDelegate, int i);
}
