package org.osmdroid.views.overlay;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.ResourceProxy;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/ItemizedOverlayControlView.class */
public class ItemizedOverlayControlView extends LinearLayout {
    protected ImageButton mPreviousButton;
    protected ImageButton mNextButton;
    protected ImageButton mCenterToButton;
    protected ImageButton mNavToButton;
    protected ItemizedOverlayControlViewListener mLis;

    /* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/ItemizedOverlayControlView$ItemizedOverlayControlViewListener.class */
    public interface ItemizedOverlayControlViewListener {
        void onPrevious();

        void onNext();

        void onCenter();

        void onNavTo();
    }

    public ItemizedOverlayControlView(Context context, AttributeSet attrs) {
        this(context, attrs, new DefaultResourceProxyImpl(context));
    }

    public ItemizedOverlayControlView(Context context, AttributeSet attrs, ResourceProxy pResourceProxy) {
        super(context, attrs);
        this.mPreviousButton = new ImageButton(context);
        this.mPreviousButton.setImageBitmap(pResourceProxy.getBitmap(ResourceProxy.bitmap.previous));
        this.mNextButton = new ImageButton(context);
        this.mNextButton.setImageBitmap(pResourceProxy.getBitmap(ResourceProxy.bitmap.next));
        this.mCenterToButton = new ImageButton(context);
        this.mCenterToButton.setImageBitmap(pResourceProxy.getBitmap(ResourceProxy.bitmap.center));
        this.mNavToButton = new ImageButton(context);
        this.mNavToButton.setImageBitmap(pResourceProxy.getBitmap(ResourceProxy.bitmap.navto_small));
        addView(this.mPreviousButton, new LinearLayout.LayoutParams(-2, -2));
        addView(this.mCenterToButton, new LinearLayout.LayoutParams(-2, -2));
        addView(this.mNavToButton, new LinearLayout.LayoutParams(-2, -2));
        addView(this.mNextButton, new LinearLayout.LayoutParams(-2, -2));
        initViewListeners();
    }

    public void setItemizedOverlayControlViewListener(ItemizedOverlayControlViewListener lis) {
        this.mLis = lis;
    }

    public void setNextEnabled(boolean pEnabled) {
        this.mNextButton.setEnabled(pEnabled);
    }

    public void setPreviousEnabled(boolean pEnabled) {
        this.mPreviousButton.setEnabled(pEnabled);
    }

    public void setNavToVisible(int pVisibility) {
        this.mNavToButton.setVisibility(pVisibility);
    }

    private void initViewListeners() {
        this.mNextButton.setOnClickListener(new View.OnClickListener() { // from class: org.osmdroid.views.overlay.ItemizedOverlayControlView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (ItemizedOverlayControlView.this.mLis != null) {
                    ItemizedOverlayControlView.this.mLis.onNext();
                }
            }
        });
        this.mPreviousButton.setOnClickListener(new View.OnClickListener() { // from class: org.osmdroid.views.overlay.ItemizedOverlayControlView.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (ItemizedOverlayControlView.this.mLis != null) {
                    ItemizedOverlayControlView.this.mLis.onPrevious();
                }
            }
        });
        this.mCenterToButton.setOnClickListener(new View.OnClickListener() { // from class: org.osmdroid.views.overlay.ItemizedOverlayControlView.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (ItemizedOverlayControlView.this.mLis != null) {
                    ItemizedOverlayControlView.this.mLis.onCenter();
                }
            }
        });
        this.mNavToButton.setOnClickListener(new View.OnClickListener() { // from class: org.osmdroid.views.overlay.ItemizedOverlayControlView.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (ItemizedOverlayControlView.this.mLis != null) {
                    ItemizedOverlayControlView.this.mLis.onNavTo();
                }
            }
        });
    }
}
