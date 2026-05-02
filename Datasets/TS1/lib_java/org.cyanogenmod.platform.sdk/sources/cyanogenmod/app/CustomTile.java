package cyanogenmod.app;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import java.util.ArrayList;

/* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/CustomTile.class */
public class CustomTile implements Parcelable {
    public PendingIntent onClick;
    public Intent onSettingsClick;
    public Uri onClickUri;
    public String label;
    public String contentDescription;
    public int icon;
    public ExpandedStyle expandedStyle;
    public static final Parcelable.Creator<CustomTile> CREATOR = new Parcelable.Creator<CustomTile>() { // from class: cyanogenmod.app.CustomTile.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public CustomTile createFromParcel(Parcel in) {
            return new CustomTile(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public CustomTile[] newArray(int size) {
            return new CustomTile[size];
        }
    };

    public CustomTile(Parcel parcel) {
        int parcelableVersion = parcel.readInt();
        int parcelableSize = parcel.readInt();
        int startPosition = parcel.dataPosition();
        if (parcelableVersion >= 1) {
            if (parcel.readInt() != 0) {
                this.onClick = (PendingIntent) PendingIntent.CREATOR.createFromParcel(parcel);
            }
            if (parcel.readInt() != 0) {
                this.onSettingsClick = (Intent) Intent.CREATOR.createFromParcel(parcel);
            }
            if (parcel.readInt() != 0) {
                this.onClickUri = (Uri) Uri.CREATOR.createFromParcel(parcel);
            }
            if (parcel.readInt() != 0) {
                this.label = parcel.readString();
            }
            if (parcel.readInt() != 0) {
                this.contentDescription = parcel.readString();
            }
            if (parcel.readInt() != 0) {
                this.expandedStyle = ExpandedStyle.CREATOR.createFromParcel(parcel);
            }
            this.icon = parcel.readInt();
        }
        parcel.setDataPosition(startPosition + parcelableSize);
    }

    public CustomTile() {
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public CustomTile m2clone() {
        CustomTile that = new CustomTile();
        cloneInto(that);
        return that;
    }

    public String toString() {
        StringBuilder b = new StringBuilder();
        String NEW_LINE = System.getProperty("line.separator");
        if (this.onClickUri != null) {
            b.append("onClickUri=" + this.onClickUri.toString() + NEW_LINE);
        }
        if (this.onClick != null) {
            b.append("onClick=" + this.onClick.toString() + NEW_LINE);
        }
        if (this.onSettingsClick != null) {
            b.append("onSettingsClick=" + this.onSettingsClick.toString() + NEW_LINE);
        }
        if (!TextUtils.isEmpty(this.label)) {
            b.append("label=" + this.label + NEW_LINE);
        }
        if (!TextUtils.isEmpty(this.contentDescription)) {
            b.append("contentDescription=" + this.contentDescription + NEW_LINE);
        }
        if (this.expandedStyle != null) {
            b.append("expandedStyle=" + this.expandedStyle + NEW_LINE);
        }
        b.append("icon=" + this.icon + NEW_LINE);
        return b.toString();
    }

    public void cloneInto(CustomTile that) {
        that.onClick = this.onClick;
        that.onSettingsClick = this.onSettingsClick;
        that.onClickUri = this.onClickUri;
        that.label = this.label;
        that.contentDescription = this.contentDescription;
        that.expandedStyle = this.expandedStyle;
        that.icon = this.icon;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        out.writeInt(1);
        int sizePosition = out.dataPosition();
        out.writeInt(0);
        int startPosition = out.dataPosition();
        if (this.onClick != null) {
            out.writeInt(1);
            this.onClick.writeToParcel(out, 0);
        } else {
            out.writeInt(0);
        }
        if (this.onSettingsClick != null) {
            out.writeInt(1);
            this.onSettingsClick.writeToParcel(out, 0);
        } else {
            out.writeInt(0);
        }
        if (this.onClickUri != null) {
            out.writeInt(1);
            this.onClickUri.writeToParcel(out, 0);
        } else {
            out.writeInt(0);
        }
        if (this.label != null) {
            out.writeInt(1);
            out.writeString(this.label);
        } else {
            out.writeInt(0);
        }
        if (this.contentDescription != null) {
            out.writeInt(1);
            out.writeString(this.contentDescription);
        } else {
            out.writeInt(0);
        }
        if (this.expandedStyle != null) {
            out.writeInt(1);
            this.expandedStyle.writeToParcel(out, 0);
        } else {
            out.writeInt(0);
        }
        out.writeInt(this.icon);
        int parcelableSize = out.dataPosition() - startPosition;
        out.setDataPosition(sizePosition);
        out.writeInt(parcelableSize);
        out.setDataPosition(startPosition + parcelableSize);
    }

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/CustomTile$ExpandedStyle.class */
    public static class ExpandedStyle implements Parcelable {
        public static final int NO_STYLE = -1;
        public static final int GRID_STYLE = 0;
        public static final int LIST_STYLE = 1;
        private ExpandedItem[] expandedItems;
        private int styleId;
        public static final Parcelable.Creator<ExpandedStyle> CREATOR = new Parcelable.Creator<ExpandedStyle>() { // from class: cyanogenmod.app.CustomTile.ExpandedStyle.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public ExpandedStyle createFromParcel(Parcel in) {
                return new ExpandedStyle(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public ExpandedStyle[] newArray(int size) {
                return new ExpandedStyle[size];
            }
        };

        private ExpandedStyle() {
            this.styleId = -1;
        }

        private ExpandedStyle(Parcel parcel) {
            int parcelableVersion = parcel.readInt();
            int parcelableSize = parcel.readInt();
            int startPosition = parcel.dataPosition();
            if (parcelableVersion >= 1) {
                if (parcel.readInt() != 0) {
                    this.expandedItems = (ExpandedItem[]) parcel.createTypedArray(ExpandedItem.CREATOR);
                }
                this.styleId = parcel.readInt();
            }
            parcel.setDataPosition(startPosition + parcelableSize);
        }

        public void setBuilder(Builder builder) {
            if (builder != null) {
                builder.setExpandedStyle(this);
            }
        }

        protected void internalSetExpandedItems(ArrayList<? extends ExpandedItem> items) {
            this.expandedItems = new ExpandedItem[items.size()];
            items.toArray(this.expandedItems);
        }

        protected void internalStyleId(int id) {
            this.styleId = id;
        }

        public ExpandedItem[] getExpandedItems() {
            return this.expandedItems;
        }

        public int getStyle() {
            return this.styleId;
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(1);
            int sizePosition = parcel.dataPosition();
            parcel.writeInt(0);
            int startPosition = parcel.dataPosition();
            if (this.expandedItems != null) {
                parcel.writeInt(1);
                parcel.writeTypedArray(this.expandedItems, 0);
            } else {
                parcel.writeInt(0);
            }
            parcel.writeInt(this.styleId);
            int parcelableSize = parcel.dataPosition() - startPosition;
            parcel.setDataPosition(sizePosition);
            parcel.writeInt(parcelableSize);
            parcel.setDataPosition(startPosition + parcelableSize);
        }

        public String toString() {
            StringBuilder b = new StringBuilder();
            String NEW_LINE = System.getProperty("line.separator");
            if (this.expandedItems != null) {
                b.append("expandedItems= " + NEW_LINE);
                ExpandedItem[] arr$ = this.expandedItems;
                for (ExpandedItem item : arr$) {
                    b.append("     item=" + item.toString() + NEW_LINE);
                }
            }
            b.append("styleId=" + this.styleId + NEW_LINE);
            return b.toString();
        }
    }

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/CustomTile$GridExpandedStyle.class */
    public static class GridExpandedStyle extends ExpandedStyle {
        public GridExpandedStyle() {
            super();
            internalStyleId(0);
        }

        public void setGridItems(ArrayList<ExpandedGridItem> expandedGridItems) {
            internalSetExpandedItems(expandedGridItems);
        }
    }

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/CustomTile$ListExpandedStyle.class */
    public static class ListExpandedStyle extends ExpandedStyle {
        public ListExpandedStyle() {
            super();
            internalStyleId(1);
        }

        public void setListItems(ArrayList<ExpandedListItem> expandedListItems) {
            internalSetExpandedItems(expandedListItems);
        }
    }

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/CustomTile$ExpandedItem.class */
    public static class ExpandedItem implements Parcelable {
        public PendingIntent onClickPendingIntent;
        public int itemDrawableResourceId;
        public String itemTitle;
        public String itemSummary;
        public static final Parcelable.Creator<ExpandedItem> CREATOR = new Parcelable.Creator<ExpandedItem>() { // from class: cyanogenmod.app.CustomTile.ExpandedItem.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public ExpandedItem createFromParcel(Parcel in) {
                return new ExpandedItem(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public ExpandedItem[] newArray(int size) {
                return new ExpandedItem[size];
            }
        };

        private ExpandedItem() {
            this.itemSummary = null;
        }

        protected void internalSetItemDrawable(int resourceId) {
            this.itemDrawableResourceId = resourceId;
        }

        protected void internalSetItemSummary(String resourceId) {
            this.itemSummary = resourceId;
        }

        protected void internalSetItemTitle(String title) {
            this.itemTitle = title;
        }

        protected void internalSetOnClickPendingIntent(PendingIntent pendingIntent) {
            this.onClickPendingIntent = pendingIntent;
        }

        protected ExpandedItem(Parcel parcel) {
            this.itemSummary = null;
            int parcelableVersion = parcel.readInt();
            int parcelableSize = parcel.readInt();
            int startPosition = parcel.dataPosition();
            if (parcelableVersion >= 1) {
                if (parcel.readInt() != 0) {
                    this.onClickPendingIntent = (PendingIntent) PendingIntent.CREATOR.createFromParcel(parcel);
                }
                if (parcel.readInt() != 0) {
                    this.itemTitle = parcel.readString();
                }
                if (parcel.readInt() != 0) {
                    this.itemSummary = parcel.readString();
                }
                this.itemDrawableResourceId = parcel.readInt();
            }
            parcel.setDataPosition(startPosition + parcelableSize);
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            out.writeInt(1);
            int sizePosition = out.dataPosition();
            out.writeInt(0);
            int startPosition = out.dataPosition();
            if (this.onClickPendingIntent != null) {
                out.writeInt(1);
                this.onClickPendingIntent.writeToParcel(out, 0);
            } else {
                out.writeInt(0);
            }
            if (!TextUtils.isEmpty(this.itemTitle)) {
                out.writeInt(1);
                out.writeString(this.itemTitle);
            } else {
                out.writeInt(0);
            }
            if (!TextUtils.isEmpty(this.itemSummary)) {
                out.writeInt(1);
                out.writeString(this.itemSummary);
            } else {
                out.writeInt(0);
            }
            out.writeInt(this.itemDrawableResourceId);
            int parcelableSize = out.dataPosition() - startPosition;
            out.setDataPosition(sizePosition);
            out.writeInt(parcelableSize);
            out.setDataPosition(startPosition + parcelableSize);
        }

        public String toString() {
            StringBuilder b = new StringBuilder();
            String NEW_LINE = System.getProperty("line.separator");
            if (this.onClickPendingIntent != null) {
                b.append("onClickPendingIntent= " + this.onClickPendingIntent.toString() + NEW_LINE);
            }
            if (this.itemTitle != null) {
                b.append("itemTitle= " + this.itemTitle.toString() + NEW_LINE);
            }
            if (this.itemSummary != null) {
                b.append("itemSummary= " + this.itemSummary.toString() + NEW_LINE);
            }
            b.append("itemDrawableResourceId=" + this.itemDrawableResourceId + NEW_LINE);
            return b.toString();
        }
    }

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/CustomTile$ExpandedGridItem.class */
    public static class ExpandedGridItem extends ExpandedItem {
        public ExpandedGridItem() {
            super();
        }

        public void setExpandedGridItemTitle(String title) {
            internalSetItemTitle(title);
        }

        public void setExpandedGridItemOnClickIntent(PendingIntent intent) {
            internalSetOnClickPendingIntent(intent);
        }

        public void setExpandedGridItemDrawable(int resourceId) {
            internalSetItemDrawable(resourceId);
        }
    }

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/CustomTile$ExpandedListItem.class */
    public static class ExpandedListItem extends ExpandedItem {
        public ExpandedListItem() {
            super();
        }

        public void setExpandedListItemTitle(String title) {
            internalSetItemTitle(title);
        }

        public void setExpandedListItemSummary(String summary) {
            internalSetItemSummary(summary);
        }

        public void setExpandedListItemOnClickIntent(PendingIntent intent) {
            internalSetOnClickPendingIntent(intent);
        }

        public void setExpandedListItemDrawable(int resourceId) {
            internalSetItemDrawable(resourceId);
        }
    }

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/CustomTile$Builder.class */
    public static class Builder {
        private PendingIntent mOnClick;
        private Intent mOnSettingsClick;
        private Uri mOnClickUri;
        private String mLabel;
        private String mContentDescription;
        private int mIcon;
        private Context mContext;
        private ExpandedStyle mExpandedStyle;

        public Builder(Context context) {
            this.mContext = context;
        }

        public Builder setLabel(String label) {
            this.mLabel = label;
            return this;
        }

        public Builder setLabel(int id) {
            this.mLabel = this.mContext.getString(id);
            return this;
        }

        public Builder setContentDescription(String contentDescription) {
            this.mContentDescription = contentDescription;
            return this;
        }

        public Builder setContentDescription(int id) {
            this.mContentDescription = this.mContext.getString(id);
            return this;
        }

        public Builder setOnClickIntent(PendingIntent intent) {
            this.mOnClick = intent;
            return this;
        }

        public Builder setOnSettingsClickIntent(Intent intent) {
            this.mOnSettingsClick = intent;
            return this;
        }

        public Builder setOnClickUri(Uri uri) {
            this.mOnClickUri = uri;
            return this;
        }

        public Builder setIcon(int drawableId) {
            this.mIcon = drawableId;
            return this;
        }

        public Builder setExpandedStyle(ExpandedStyle expandedStyle) {
            if (this.mExpandedStyle != expandedStyle) {
                this.mExpandedStyle = expandedStyle;
                if (this.mExpandedStyle != null) {
                    expandedStyle.setBuilder(this);
                }
            }
            return this;
        }

        public CustomTile build() {
            CustomTile tile = new CustomTile();
            tile.onClick = this.mOnClick;
            tile.onSettingsClick = this.mOnSettingsClick;
            tile.onClickUri = this.mOnClickUri;
            tile.label = this.mLabel;
            tile.contentDescription = this.mContentDescription;
            tile.expandedStyle = this.mExpandedStyle;
            tile.icon = this.mIcon;
            return tile;
        }
    }
}
