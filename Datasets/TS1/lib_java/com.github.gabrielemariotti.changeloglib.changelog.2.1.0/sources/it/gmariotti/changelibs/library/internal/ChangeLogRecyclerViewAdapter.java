package it.gmariotti.changelibs.library.internal;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.text.method.LinkMovementMethod;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import it.gmariotti.changelibs.BuildConfig;
import it.gmariotti.changelibs.R;
import it.gmariotti.changelibs.library.Constants;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter.class */
public class ChangeLogRecyclerViewAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
    private static final int TYPE_ROW = 0;
    private static final int TYPE_HEADER = 1;
    private final Context mContext;
    private int mRowLayoutId = Constants.mRowLayoutId;
    private int mRowHeaderLayoutId = Constants.mRowHeaderLayoutId;
    private int mStringVersionHeader = Constants.mStringVersionHeader;
    private List<ChangeLogRow> items;

    public ChangeLogRecyclerViewAdapter(Context mContext, List<ChangeLogRow> items) {
        this.mContext = mContext;
        this.items = items == null ? new ArrayList() : items;
    }

    public void add(LinkedList<ChangeLogRow> rows) {
        int originalPosition = this.items.size();
        this.items.addAll(rows);
        notifyItemRangeInserted(originalPosition, originalPosition + rows.size());
    }

    /* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader.class */
    public static class ViewHolderHeader extends RecyclerView.ViewHolder {
        public TextView versionHeader;
        public TextView dateHeader;

        public ViewHolderHeader(View itemView) {
            super(itemView);
            this.versionHeader = (TextView) itemView.findViewById(R.id.chg_headerVersion);
            this.dateHeader = (TextView) itemView.findViewById(R.id.chg_headerDate);
        }
    }

    /* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow.class */
    public static class ViewHolderRow extends RecyclerView.ViewHolder {
        public TextView textRow;
        public TextView bulletRow;

        public ViewHolderRow(View itemView) {
            super(itemView);
            this.textRow = (TextView) itemView.findViewById(R.id.chg_text);
            this.bulletRow = (TextView) itemView.findViewById(R.id.chg_textbullet);
        }
    }

    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        if (viewType == 1) {
            View viewHeader = LayoutInflater.from(parent.getContext()).inflate(this.mRowHeaderLayoutId, parent, false);
            return new ViewHolderHeader(viewHeader);
        }
        View view = LayoutInflater.from(parent.getContext()).inflate(this.mRowLayoutId, parent, false);
        return new ViewHolderRow(view);
    }

    public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int position) {
        if (isHeader(position)) {
            populateViewHolderHeader((ViewHolderHeader) viewHolder, position);
        } else {
            populateViewHolderRow((ViewHolderRow) viewHolder, position);
        }
    }

    private void populateViewHolderRow(ViewHolderRow viewHolder, int position) {
        ChangeLogRow item = getItem(position);
        if (item != null) {
            if (viewHolder.textRow != null) {
                viewHolder.textRow.setText(Html.fromHtml(item.getChangeText(this.mContext)));
                viewHolder.textRow.setMovementMethod(LinkMovementMethod.getInstance());
            }
            if (viewHolder.bulletRow != null) {
                if (item.isBulletedList()) {
                    viewHolder.bulletRow.setVisibility(0);
                } else {
                    viewHolder.bulletRow.setVisibility(8);
                }
            }
        }
    }

    private void populateViewHolderHeader(ViewHolderHeader viewHolder, int position) {
        ChangeLogRow item = getItem(position);
        if (item != null) {
            if (viewHolder.versionHeader != null) {
                StringBuilder sb = new StringBuilder();
                String versionHeaderString = this.mContext.getString(this.mStringVersionHeader);
                if (versionHeaderString != null) {
                    sb.append(versionHeaderString);
                }
                sb.append(item.versionName);
                viewHolder.versionHeader.setText(sb.toString());
            }
            if (viewHolder.dateHeader != null) {
                if (item.changeDate != null) {
                    viewHolder.dateHeader.setText(item.changeDate);
                    viewHolder.dateHeader.setVisibility(0);
                } else {
                    viewHolder.dateHeader.setText(BuildConfig.FLAVOR);
                    viewHolder.dateHeader.setVisibility(8);
                }
            }
        }
    }

    private boolean isHeader(int position) {
        return getItem(position).isHeader();
    }

    private ChangeLogRow getItem(int position) {
        return this.items.get(position);
    }

    public int getItemViewType(int position) {
        if (isHeader(position)) {
            return 1;
        }
        return 0;
    }

    public int getItemCount() {
        return this.items.size();
    }

    public void setRowLayoutId(int mRowLayoutId) {
        this.mRowLayoutId = mRowLayoutId;
    }

    public void setRowHeaderLayoutId(int mRowHeaderLayoutId) {
        this.mRowHeaderLayoutId = mRowHeaderLayoutId;
    }
}
