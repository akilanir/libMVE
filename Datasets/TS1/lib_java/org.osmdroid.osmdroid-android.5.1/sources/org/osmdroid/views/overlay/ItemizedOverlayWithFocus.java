package org.osmdroid.views.overlay;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import java.util.List;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.ResourceProxy;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.ItemizedIconOverlay;
import org.osmdroid.views.overlay.OverlayItem;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/ItemizedOverlayWithFocus.class */
public class ItemizedOverlayWithFocus<Item extends OverlayItem> extends ItemizedIconOverlay<Item> {
    public static final int DESCRIPTION_BOX_PADDING = 3;
    public static final int DESCRIPTION_BOX_CORNERWIDTH = 3;
    public static final int DESCRIPTION_TITLE_EXTRA_LINE_HEIGHT = 2;
    protected static final int DEFAULTMARKER_BACKGROUNDCOLOR = Color.rgb(101, 185, 74);
    protected static int FONT_SIZE_DP = 14;
    protected static int DESCRIPTION_MAXWIDTH = 600;
    protected static int DESCRIPTION_LINE_HEIGHT = 30;
    protected final int mMarkerFocusedBackgroundColor;
    protected final Paint mMarkerBackgroundPaint;
    protected final Paint mDescriptionPaint;
    protected final Paint mTitlePaint;
    protected Drawable mMarkerFocusedBase;
    protected int mFocusedItemIndex;
    protected boolean mFocusItemsOnTap;
    private final int fontSizePixels;
    private final Point mFocusedScreenCoords;
    private final String UNKNOWN;
    private final Rect mRect;

    public ItemizedOverlayWithFocus(Context ctx, List<Item> aList, ItemizedIconOverlay.OnItemGestureListener<Item> aOnItemTapListener) {
        this(aList, aOnItemTapListener, new DefaultResourceProxyImpl(ctx));
    }

    public ItemizedOverlayWithFocus(List<Item> aList, ItemizedIconOverlay.OnItemGestureListener<Item> aOnItemTapListener, ResourceProxy pResourceProxy) {
        this(aList, pResourceProxy.getDrawable(ResourceProxy.bitmap.marker_default), null, Integer.MIN_VALUE, aOnItemTapListener, pResourceProxy);
    }

    public ItemizedOverlayWithFocus(List<Item> aList, Drawable pMarker, Drawable pMarkerFocused, int pFocusedBackgroundColor, ItemizedIconOverlay.OnItemGestureListener<Item> aOnItemTapListener, ResourceProxy pResourceProxy) {
        super(aList, pMarker, aOnItemTapListener, pResourceProxy);
        this.mFocusedScreenCoords = new Point();
        this.mRect = new Rect();
        this.fontSizePixels = (int) TypedValue.applyDimension(1, FONT_SIZE_DP, pResourceProxy.getDisplayMetrics());
        DESCRIPTION_LINE_HEIGHT = this.fontSizePixels + 5;
        DESCRIPTION_MAXWIDTH = (int) (pResourceProxy.getDisplayMetrics().widthPixels * 0.8d);
        this.UNKNOWN = this.mResourceProxy.getString(ResourceProxy.string.unknown);
        if (pMarkerFocused == null) {
            this.mMarkerFocusedBase = boundToHotspot(this.mResourceProxy.getDrawable(ResourceProxy.bitmap.marker_default_focused_base), OverlayItem.HotspotPlace.BOTTOM_CENTER);
        } else {
            this.mMarkerFocusedBase = pMarkerFocused;
        }
        this.mMarkerFocusedBackgroundColor = pFocusedBackgroundColor != Integer.MIN_VALUE ? pFocusedBackgroundColor : DEFAULTMARKER_BACKGROUNDCOLOR;
        this.mMarkerBackgroundPaint = new Paint();
        this.mDescriptionPaint = new Paint();
        this.mDescriptionPaint.setAntiAlias(true);
        this.mDescriptionPaint.setTextSize(this.fontSizePixels);
        this.mTitlePaint = new Paint();
        this.mTitlePaint.setTextSize(this.fontSizePixels);
        this.mTitlePaint.setFakeBoldText(true);
        this.mTitlePaint.setAntiAlias(true);
        unSetFocusedItem();
    }

    public Item getFocusedItem() {
        if (this.mFocusedItemIndex == Integer.MIN_VALUE) {
            return null;
        }
        return this.mItemList.get(this.mFocusedItemIndex);
    }

    public void setFocusedItem(int pIndex) {
        this.mFocusedItemIndex = pIndex;
    }

    public void unSetFocusedItem() {
        this.mFocusedItemIndex = Integer.MIN_VALUE;
    }

    public void setFocusedItem(Item pItem) {
        int indexFound = this.mItemList.indexOf(pItem);
        if (indexFound < 0) {
            throw new IllegalArgumentException();
        }
        setFocusedItem(indexFound);
    }

    public void setFocusItemsOnTap(boolean doit) {
        this.mFocusItemsOnTap = doit;
    }

    @Override // org.osmdroid.views.overlay.ItemizedIconOverlay
    protected boolean onSingleTapUpHelper(int index, Item item, MapView mapView) {
        if (this.mFocusItemsOnTap) {
            this.mFocusedItemIndex = index;
            mapView.postInvalidate();
        }
        return this.mOnItemGestureListener.onItemSingleTapUp(index, item);
    }

    @Override // org.osmdroid.views.overlay.ItemizedOverlay, org.osmdroid.views.overlay.Overlay
    public void draw(Canvas c, MapView osmv, boolean shadow) {
        super.draw(c, osmv, shadow);
        if (shadow || this.mFocusedItemIndex == Integer.MIN_VALUE) {
            return;
        }
        Item focusedItem = this.mItemList.get(this.mFocusedItemIndex);
        Drawable markerFocusedBase = focusedItem.getMarker(4);
        if (markerFocusedBase == null) {
            markerFocusedBase = this.mMarkerFocusedBase;
        }
        osmv.getProjection().toPixels(focusedItem.getPoint(), this.mFocusedScreenCoords);
        markerFocusedBase.copyBounds(this.mRect);
        this.mRect.offset(this.mFocusedScreenCoords.x, this.mFocusedScreenCoords.y);
        String itemTitle = focusedItem.getTitle() == null ? this.UNKNOWN : focusedItem.getTitle();
        String itemDescription = focusedItem.getSnippet() == null ? this.UNKNOWN : focusedItem.getSnippet();
        float[] widths = new float[itemDescription.length()];
        this.mDescriptionPaint.getTextWidths(itemDescription, widths);
        StringBuilder sb = new StringBuilder();
        int maxWidth = 0;
        int curLineWidth = 0;
        int lastStop = 0;
        int lastwhitespace = 0;
        int i = 0;
        while (i < widths.length) {
            if (!Character.isLetter(itemDescription.charAt(i))) {
                lastwhitespace = i;
            }
            float charwidth = widths[i];
            if (curLineWidth + charwidth > DESCRIPTION_MAXWIDTH) {
                i = lastStop == lastwhitespace ? i - 1 : lastwhitespace;
                sb.append(itemDescription.subSequence(lastStop, i));
                sb.append('\n');
                lastStop = i;
                maxWidth = Math.max(maxWidth, curLineWidth);
                curLineWidth = 0;
            }
            curLineWidth = (int) (curLineWidth + charwidth);
            i++;
        }
        if (i != lastStop) {
            String rest = itemDescription.substring(lastStop, i);
            maxWidth = Math.max(maxWidth, (int) this.mDescriptionPaint.measureText(rest));
            sb.append(rest);
        }
        String[] lines = sb.toString().split("\n");
        int titleWidth = (int) this.mDescriptionPaint.measureText(itemTitle);
        int descWidth = Math.min(Math.max(maxWidth, titleWidth), DESCRIPTION_MAXWIDTH);
        int descBoxLeft = ((this.mRect.left - (descWidth / 2)) - 3) + (this.mRect.width() / 2);
        int descBoxRight = descBoxLeft + descWidth + 6;
        int descBoxBottom = this.mRect.top;
        int descBoxTop = ((descBoxBottom - 2) - ((lines.length + 1) * DESCRIPTION_LINE_HEIGHT)) - 6;
        this.mMarkerBackgroundPaint.setColor(-16777216);
        c.drawRoundRect(new RectF(descBoxLeft - 1, descBoxTop - 1, descBoxRight + 1, descBoxBottom + 1), 3.0f, 3.0f, this.mDescriptionPaint);
        this.mMarkerBackgroundPaint.setColor(this.mMarkerFocusedBackgroundColor);
        c.drawRoundRect(new RectF(descBoxLeft, descBoxTop, descBoxRight, descBoxBottom), 3.0f, 3.0f, this.mMarkerBackgroundPaint);
        int descLeft = descBoxLeft + 3;
        int descTextLineBottom = descBoxBottom - 3;
        for (int j = lines.length - 1; j >= 0; j--) {
            c.drawText(lines[j].trim(), descLeft, descTextLineBottom, this.mDescriptionPaint);
            descTextLineBottom -= DESCRIPTION_LINE_HEIGHT;
        }
        c.drawText(itemTitle, descLeft, descTextLineBottom - 2, this.mTitlePaint);
        c.drawLine(descBoxLeft, descTextLineBottom, descBoxRight, descTextLineBottom, this.mDescriptionPaint);
        Overlay.drawAt(c, markerFocusedBase, this.mFocusedScreenCoords.x, this.mFocusedScreenCoords.y, false, osmv.getMapOrientation());
    }
}
