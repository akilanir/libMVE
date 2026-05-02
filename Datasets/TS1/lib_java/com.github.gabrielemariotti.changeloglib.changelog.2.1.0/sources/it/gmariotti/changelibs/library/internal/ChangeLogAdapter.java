package it.gmariotti.changelibs.library.internal;

import android.content.Context;
import android.text.Html;
import android.text.method.LinkMovementMethod;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import it.gmariotti.changelibs.BuildConfig;
import it.gmariotti.changelibs.R;
import it.gmariotti.changelibs.library.Constants;
import java.util.List;

/* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/internal/ChangeLogAdapter.class */
public class ChangeLogAdapter extends ArrayAdapter<ChangeLogRow> {
    protected static final int TYPE_ROW = 0;
    protected static final int TYPE_HEADER = 1;
    private int mRowLayoutId;
    private int mRowHeaderLayoutId;
    private int mStringVersionHeader;
    private final Context mContext;

    public ChangeLogAdapter(Context context, List<ChangeLogRow> items) {
        super(context, 0, items);
        this.mRowLayoutId = Constants.mRowLayoutId;
        this.mRowHeaderLayoutId = Constants.mRowHeaderLayoutId;
        this.mStringVersionHeader = Constants.mStringVersionHeader;
        this.mContext = context;
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean isEnabled(int position) {
        return false;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        ChangeLogRow item = getItem(position);
        View view = convertView;
        int viewType = getItemViewType(position);
        LayoutInflater mInflater = (LayoutInflater) this.mContext.getSystemService("layout_inflater");
        switch (viewType) {
            case 0:
                ViewHolderRow viewHolder = null;
                if (view != null) {
                    Object obj = view.getTag();
                    if (obj instanceof ViewHolderRow) {
                        viewHolder = (ViewHolderRow) obj;
                    } else {
                        viewHolder = null;
                    }
                }
                if (view == null || viewHolder == null) {
                    int layout = this.mRowLayoutId;
                    view = mInflater.inflate(layout, parent, false);
                    TextView textText = (TextView) view.findViewById(R.id.chg_text);
                    TextView bulletText = (TextView) view.findViewById(R.id.chg_textbullet);
                    viewHolder = new ViewHolderRow(textText, bulletText);
                    view.setTag(viewHolder);
                }
                if (item != null && viewHolder != null) {
                    if (viewHolder.text != null) {
                        viewHolder.text.setText(Html.fromHtml(item.getChangeText(this.mContext)));
                        viewHolder.text.setMovementMethod(LinkMovementMethod.getInstance());
                    }
                    if (viewHolder.bulletText != null) {
                        if (item.isBulletedList()) {
                            viewHolder.bulletText.setVisibility(0);
                            break;
                        } else {
                            viewHolder.bulletText.setVisibility(8);
                            break;
                        }
                    }
                }
                break;
            case 1:
                ViewHolderHeader viewHolderHeader = null;
                if (view != null) {
                    Object obj2 = view.getTag();
                    if (obj2 instanceof ViewHolderHeader) {
                        viewHolderHeader = (ViewHolderHeader) obj2;
                    } else {
                        viewHolderHeader = null;
                    }
                }
                if (view == null || viewHolderHeader == null) {
                    int layout2 = this.mRowHeaderLayoutId;
                    view = mInflater.inflate(layout2, parent, false);
                    TextView textHeader = (TextView) view.findViewById(R.id.chg_headerVersion);
                    TextView textDate = (TextView) view.findViewById(R.id.chg_headerDate);
                    viewHolderHeader = new ViewHolderHeader(textHeader, textDate);
                    view.setTag(viewHolderHeader);
                }
                if (item != null && viewHolderHeader != null) {
                    if (viewHolderHeader.version != null) {
                        StringBuilder sb = new StringBuilder();
                        String versionHeaderString = getContext().getString(this.mStringVersionHeader);
                        if (versionHeaderString != null) {
                            sb.append(versionHeaderString);
                        }
                        sb.append(item.versionName);
                        viewHolderHeader.version.setText(sb.toString());
                    }
                    if (viewHolderHeader.date != null) {
                        if (item.changeDate != null) {
                            viewHolderHeader.date.setText(item.changeDate);
                            viewHolderHeader.date.setVisibility(0);
                            break;
                        } else {
                            viewHolderHeader.date.setText(BuildConfig.FLAVOR);
                            viewHolderHeader.date.setVisibility(8);
                            break;
                        }
                    }
                }
                break;
        }
        return view;
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getViewTypeCount() {
        return 2;
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getItemViewType(int position) {
        if (getItem(position).isHeader()) {
            return 1;
        }
        return 0;
    }

    /* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader.class */
    static class ViewHolderHeader {
        TextView version;
        TextView date;

        public ViewHolderHeader(TextView version, TextView date) {
            this.version = version;
            this.date = date;
        }
    }

    /* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow.class */
    static class ViewHolderRow {
        TextView text;
        TextView bulletText;

        public ViewHolderRow(TextView text, TextView bulletText) {
            this.text = text;
            this.bulletText = bulletText;
        }
    }

    public int getmRowLayoutId() {
        return this.mRowLayoutId;
    }

    public void setmRowLayoutId(int mRowLayoutId) {
        this.mRowLayoutId = mRowLayoutId;
    }

    public int getmRowHeaderLayoutId() {
        return this.mRowHeaderLayoutId;
    }

    public void setmRowHeaderLayoutId(int mRowHeaderLayoutId) {
        this.mRowHeaderLayoutId = mRowHeaderLayoutId;
    }

    public int getmStringVersionHeader() {
        return this.mStringVersionHeader;
    }

    public void setmStringVersionHeader(int mStringVersionHeader) {
        this.mStringVersionHeader = mStringVersionHeader;
    }
}
