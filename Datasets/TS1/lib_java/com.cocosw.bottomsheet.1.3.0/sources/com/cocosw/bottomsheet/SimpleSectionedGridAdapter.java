package com.cocosw.bottomsheet;

import android.content.Context;
import android.database.DataSetObserver;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ListAdapter;
import android.widget.TextView;
import java.util.Arrays;
import java.util.Comparator;

/* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/SimpleSectionedGridAdapter.class */
class SimpleSectionedGridAdapter extends BaseAdapter {
    protected static final int TYPE_FILLER = 0;
    protected static final int TYPE_HEADER = 1;
    protected static final int TYPE_HEADER_FILLER = 2;
    private int mSectionResourceId;
    private LayoutInflater mLayoutInflater;
    private ListAdapter mBaseAdapter;
    private Context mContext;
    private View mLastViewSeen;
    private int mHeaderWidth;
    private int mNumColumns;
    private int mWidth;
    private int mColumnWidth;
    private int mHorizontalSpacing;
    private int mStrechMode;
    private int requestedColumnWidth;
    private int requestedHorizontalSpacing;
    private GridView mGridView;
    private int mHeaderLayoutResId;
    private int mHeaderTextViewResId;
    private boolean mValid = true;
    SparseArray<Section> mSections = new SparseArray<>();
    private Section[] mInitialSections = new Section[0];

    /* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section.class */
    public static class Section {
        int firstPosition;
        int sectionedPosition;
        CharSequence title;
        int type = 0;

        public Section(int firstPosition, CharSequence title) {
            this.firstPosition = firstPosition;
            this.title = title;
        }

        public CharSequence getTitle() {
            return this.title;
        }
    }

    public SimpleSectionedGridAdapter(Context context, BaseAdapter baseAdapter, int sectionResourceId, int headerLayoutResId, int headerTextViewResId) {
        this.mLayoutInflater = (LayoutInflater) context.getSystemService("layout_inflater");
        this.mSectionResourceId = sectionResourceId;
        this.mHeaderLayoutResId = headerLayoutResId;
        this.mHeaderTextViewResId = headerTextViewResId;
        this.mBaseAdapter = baseAdapter;
        this.mContext = context;
        this.mBaseAdapter.registerDataSetObserver(new DataSetObserver() { // from class: com.cocosw.bottomsheet.SimpleSectionedGridAdapter.1
            @Override // android.database.DataSetObserver
            public void onChanged() {
                SimpleSectionedGridAdapter.this.mValid = !SimpleSectionedGridAdapter.this.mBaseAdapter.isEmpty();
                SimpleSectionedGridAdapter.this.notifyDataSetChanged();
            }

            @Override // android.database.DataSetObserver
            public void onInvalidated() {
                SimpleSectionedGridAdapter.this.mValid = false;
                SimpleSectionedGridAdapter.this.notifyDataSetInvalidated();
            }
        });
    }

    public void setGridView(GridView gridView) {
        if (!(gridView instanceof PinnedSectionGridView)) {
            throw new IllegalArgumentException("Does your grid view extends PinnedSectionGridView?");
        }
        this.mGridView = gridView;
        this.mStrechMode = gridView.getStretchMode();
        this.mWidth = gridView.getWidth() - (this.mGridView.getPaddingLeft() + this.mGridView.getPaddingRight());
        this.mNumColumns = ((PinnedSectionGridView) gridView).getNumColumns();
        this.requestedColumnWidth = ((PinnedSectionGridView) gridView).getColumnWidth();
        this.requestedHorizontalSpacing = ((PinnedSectionGridView) gridView).getHorizontalSpacing();
    }

    private int getHeaderSize() {
        if (this.mHeaderWidth > 0) {
            return this.mHeaderWidth;
        }
        if (this.mWidth != this.mGridView.getWidth()) {
            this.mStrechMode = this.mGridView.getStretchMode();
            this.mWidth = ((PinnedSectionGridView) this.mGridView).getAvailableWidth() - (this.mGridView.getPaddingLeft() + this.mGridView.getPaddingRight());
            this.mNumColumns = ((PinnedSectionGridView) this.mGridView).getNumColumns();
            this.requestedColumnWidth = ((PinnedSectionGridView) this.mGridView).getColumnWidth();
            this.requestedHorizontalSpacing = ((PinnedSectionGridView) this.mGridView).getHorizontalSpacing();
        }
        int spaceLeftOver = (this.mWidth - (this.mNumColumns * this.requestedColumnWidth)) - ((this.mNumColumns - TYPE_HEADER) * this.requestedHorizontalSpacing);
        switch (this.mStrechMode) {
            case 0:
                this.mWidth -= spaceLeftOver;
                this.mColumnWidth = this.requestedColumnWidth;
                this.mHorizontalSpacing = this.requestedHorizontalSpacing;
                break;
            case TYPE_HEADER /* 1 */:
                this.mColumnWidth = this.requestedColumnWidth;
                if (this.mNumColumns > TYPE_HEADER) {
                    this.mHorizontalSpacing = this.requestedHorizontalSpacing + (spaceLeftOver / (this.mNumColumns - TYPE_HEADER));
                    break;
                } else {
                    this.mHorizontalSpacing = this.requestedHorizontalSpacing + spaceLeftOver;
                    break;
                }
            case TYPE_HEADER_FILLER /* 2 */:
                this.mColumnWidth = this.requestedColumnWidth + (spaceLeftOver / this.mNumColumns);
                this.mHorizontalSpacing = this.requestedHorizontalSpacing;
                break;
            case 3:
                this.mColumnWidth = this.requestedColumnWidth;
                this.mHorizontalSpacing = this.requestedHorizontalSpacing;
                this.mWidth = (this.mWidth - spaceLeftOver) + (TYPE_HEADER_FILLER * this.mHorizontalSpacing);
                break;
        }
        this.mHeaderWidth = this.mWidth + ((this.mNumColumns - TYPE_HEADER) * (this.mColumnWidth + this.mHorizontalSpacing));
        return this.mHeaderWidth;
    }

    public void setSections(Section... sections) {
        this.mInitialSections = sections;
        setSections();
    }

    public void setSections() {
        this.mSections.clear();
        getHeaderSize();
        Arrays.sort(this.mInitialSections, new Comparator<Section>() { // from class: com.cocosw.bottomsheet.SimpleSectionedGridAdapter.2
            @Override // java.util.Comparator
            public int compare(Section o, Section o1) {
                if (o.firstPosition == o1.firstPosition) {
                    return 0;
                }
                if (o.firstPosition < o1.firstPosition) {
                    return -1;
                }
                return SimpleSectionedGridAdapter.TYPE_HEADER;
            }
        });
        int offset = 0;
        for (int i = 0; i < this.mInitialSections.length; i += TYPE_HEADER) {
            Section section = this.mInitialSections[i];
            for (int j = 0; j < this.mNumColumns - TYPE_HEADER; j += TYPE_HEADER) {
                Section sectionAdd = new Section(section.firstPosition, section.title);
                sectionAdd.type = TYPE_HEADER_FILLER;
                sectionAdd.sectionedPosition = sectionAdd.firstPosition + offset;
                this.mSections.append(sectionAdd.sectionedPosition, sectionAdd);
                offset += TYPE_HEADER;
            }
            Section sectionAdd2 = new Section(section.firstPosition, section.title);
            sectionAdd2.type = TYPE_HEADER;
            sectionAdd2.sectionedPosition = sectionAdd2.firstPosition + offset;
            this.mSections.append(sectionAdd2.sectionedPosition, sectionAdd2);
            offset += TYPE_HEADER;
            if (i < this.mInitialSections.length - TYPE_HEADER) {
                int nextPos = this.mInitialSections[i + TYPE_HEADER].firstPosition;
                int itemsCount = nextPos - section.firstPosition;
                int dummyCount = this.mNumColumns - (itemsCount % this.mNumColumns);
                if (this.mNumColumns != dummyCount) {
                    for (int k = 0; k < dummyCount; k += TYPE_HEADER) {
                        Section sectionAdd3 = new Section(section.firstPosition, section.title);
                        sectionAdd3.type = 0;
                        sectionAdd3.sectionedPosition = nextPos + offset;
                        this.mSections.append(sectionAdd3.sectionedPosition, sectionAdd3);
                        offset += TYPE_HEADER;
                    }
                }
            }
        }
        notifyDataSetChanged();
    }

    public int positionToSectionedPosition(int position) {
        int offset = 0;
        for (int i = 0; i < this.mSections.size() && this.mSections.valueAt(i).firstPosition <= position; i += TYPE_HEADER) {
            offset += TYPE_HEADER;
        }
        return position + offset;
    }

    public int sectionedPositionToPosition(int sectionedPosition) {
        if (isSectionHeaderPosition(sectionedPosition)) {
            return -1;
        }
        int offset = 0;
        for (int i = 0; i < this.mSections.size() && this.mSections.valueAt(i).sectionedPosition <= sectionedPosition; i += TYPE_HEADER) {
            offset--;
        }
        return sectionedPosition + offset;
    }

    public boolean isSectionHeaderPosition(int position) {
        return this.mSections.get(position) != null;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        if (this.mValid) {
            return this.mBaseAdapter.getCount() + this.mSections.size();
        }
        return 0;
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return isSectionHeaderPosition(position) ? this.mSections.get(position) : this.mBaseAdapter.getItem(sectionedPositionToPosition(position));
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return isSectionHeaderPosition(position) ? Integer.MAX_VALUE - this.mSections.indexOfKey(position) : this.mBaseAdapter.getItemId(sectionedPositionToPosition(position));
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getItemViewType(int position) {
        return isSectionHeaderPosition(position) ? getViewTypeCount() - TYPE_HEADER : this.mBaseAdapter.getItemViewType(sectionedPositionToPosition(position));
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean isEnabled(int position) {
        if (isSectionHeaderPosition(position)) {
            return false;
        }
        return this.mBaseAdapter.isEnabled(sectionedPositionToPosition(position));
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getViewTypeCount() {
        return this.mBaseAdapter.getViewTypeCount() + TYPE_HEADER;
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean areAllItemsEnabled() {
        return this.mBaseAdapter.areAllItemsEnabled();
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public boolean hasStableIds() {
        return this.mBaseAdapter.hasStableIds();
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public boolean isEmpty() {
        return this.mBaseAdapter.isEmpty();
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        if (isSectionHeaderPosition(position)) {
            if (null == convertView || null == convertView.findViewById(this.mHeaderLayoutResId)) {
                convertView = this.mLayoutInflater.inflate(this.mSectionResourceId, parent, false);
            }
            switch (this.mSections.get(position).type) {
                case TYPE_HEADER /* 1 */:
                    HeaderLayout header = (HeaderLayout) convertView.findViewById(this.mHeaderLayoutResId);
                    if (!TextUtils.isEmpty(this.mSections.get(position).title)) {
                        TextView view = (TextView) convertView.findViewById(this.mHeaderTextViewResId);
                        view.setText(this.mSections.get(position).title);
                    }
                    header.setHeaderWidth(getHeaderSize());
                    break;
                case TYPE_HEADER_FILLER /* 2 */:
                    HeaderLayout header2 = (HeaderLayout) convertView.findViewById(this.mHeaderLayoutResId);
                    if (!TextUtils.isEmpty(this.mSections.get(position).title)) {
                        TextView view2 = (TextView) convertView.findViewById(this.mHeaderTextViewResId);
                        view2.setText(this.mSections.get(position).title);
                    }
                    header2.setHeaderWidth(0);
                    break;
                default:
                    convertView = getFillerView(this.mLastViewSeen);
                    break;
            }
        } else {
            convertView = this.mBaseAdapter.getView(sectionedPositionToPosition(position), convertView, parent);
            this.mLastViewSeen = convertView;
        }
        return convertView;
    }

    private FillerView getFillerView(View lastViewSeen) {
        FillerView fillerView = new FillerView(this.mContext);
        fillerView.setMeasureTarget(lastViewSeen);
        return fillerView;
    }

    public int getHeaderLayoutResId() {
        return this.mHeaderLayoutResId;
    }

    /* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/SimpleSectionedGridAdapter$ViewHolder.class */
    public static class ViewHolder {
        public static <T extends View> T get(View view, int i) {
            SparseArray sparseArray = (SparseArray) view.getTag();
            if (sparseArray == null) {
                sparseArray = new SparseArray();
                view.setTag(sparseArray);
            }
            View view2 = (View) sparseArray.get(i);
            if (view2 == null) {
                view2 = view.findViewById(i);
                sparseArray.put(i, view2);
            }
            return (T) view2;
        }
    }
}
