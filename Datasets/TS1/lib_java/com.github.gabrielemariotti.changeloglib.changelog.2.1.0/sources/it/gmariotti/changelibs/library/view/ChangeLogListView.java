package it.gmariotti.changelibs.library.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.AsyncTask;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.Toast;
import it.gmariotti.changelibs.R;
import it.gmariotti.changelibs.library.Constants;
import it.gmariotti.changelibs.library.Util;
import it.gmariotti.changelibs.library.internal.ChangeLog;
import it.gmariotti.changelibs.library.internal.ChangeLogAdapter;
import it.gmariotti.changelibs.library.internal.ChangeLogRow;
import it.gmariotti.changelibs.library.parser.XmlParser;
import java.util.Iterator;

/* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/view/ChangeLogListView.class */
public class ChangeLogListView extends ListView implements AdapterView.OnItemClickListener {
    protected int mRowLayoutId;
    protected int mRowHeaderLayoutId;
    protected int mChangeLogFileResourceId;
    protected String mChangeLogFileResourceUrl;
    protected static String TAG = "ChangeLogListView";
    protected ChangeLogAdapter mAdapter;

    public ChangeLogListView(Context context) {
        this(context, null);
    }

    public ChangeLogListView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public ChangeLogListView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mRowLayoutId = Constants.mRowLayoutId;
        this.mRowHeaderLayoutId = Constants.mRowHeaderLayoutId;
        this.mChangeLogFileResourceId = Constants.mChangeLogFileResourceId;
        this.mChangeLogFileResourceUrl = null;
        if (Build.VERSION.SDK_INT >= 21) {
            setNestedScrollingEnabled(true);
        }
        init(attrs, defStyle);
    }

    protected void init(AttributeSet attrs, int defStyle) {
        initAttrs(attrs, defStyle);
        initAdapter();
        setDividerHeight(0);
    }

    protected void initAttrs(AttributeSet attrs, int defStyle) {
        TypedArray a = getContext().getTheme().obtainStyledAttributes(attrs, R.styleable.ChangeLogListView, defStyle, defStyle);
        try {
            this.mRowLayoutId = a.getResourceId(R.styleable.ChangeLogListView_rowLayoutId, this.mRowLayoutId);
            this.mRowHeaderLayoutId = a.getResourceId(R.styleable.ChangeLogListView_rowHeaderLayoutId, this.mRowHeaderLayoutId);
            this.mChangeLogFileResourceId = a.getResourceId(R.styleable.ChangeLogListView_changeLogFileResourceId, this.mChangeLogFileResourceId);
            this.mChangeLogFileResourceUrl = a.getString(R.styleable.ChangeLogListView_changeLogFileResourceUrl);
            a.recycle();
        } catch (Throwable th) {
            a.recycle();
            throw th;
        }
    }

    protected void initAdapter() {
        XmlParser parse;
        try {
            if (this.mChangeLogFileResourceUrl != null) {
                parse = new XmlParser(getContext(), this.mChangeLogFileResourceUrl);
            } else {
                parse = new XmlParser(getContext(), this.mChangeLogFileResourceId);
            }
            ChangeLog chg = new ChangeLog();
            this.mAdapter = new ChangeLogAdapter(getContext(), chg.getRows());
            this.mAdapter.setmRowLayoutId(this.mRowLayoutId);
            this.mAdapter.setmRowHeaderLayoutId(this.mRowHeaderLayoutId);
            if (this.mChangeLogFileResourceUrl == null || (this.mChangeLogFileResourceUrl != null && Util.isConnected(getContext()))) {
                new ParseAsyncTask(this.mAdapter, parse).execute(new Void[0]);
            } else {
                Toast.makeText(getContext(), R.string.changelog_internal_error_internet_connection, 1).show();
            }
            setAdapter(this.mAdapter);
        } catch (Exception e) {
            Log.e(TAG, getResources().getString(R.string.changelog_internal_error_parsing), e);
        }
    }

    /* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask.class */
    protected class ParseAsyncTask extends AsyncTask<Void, Void, ChangeLog> {
        private ChangeLogAdapter mAdapter;
        private XmlParser mParse;

        public ParseAsyncTask(ChangeLogAdapter adapter, XmlParser parse) {
            this.mAdapter = adapter;
            this.mParse = parse;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public ChangeLog doInBackground(Void... params) {
            try {
                if (this.mParse != null) {
                    ChangeLog chg = this.mParse.readChangeLogFile();
                    return chg;
                }
                return null;
            } catch (Exception e) {
                Log.e(ChangeLogListView.TAG, ChangeLogListView.this.getResources().getString(R.string.changelog_internal_error_parsing), e);
                return null;
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(ChangeLog chg) {
            if (chg != null) {
                if (Build.VERSION.SDK_INT >= 11) {
                    this.mAdapter.addAll(chg.getRows());
                } else if (chg.getRows() != null) {
                    Iterator i$ = chg.getRows().iterator();
                    while (i$.hasNext()) {
                        ChangeLogRow row = i$.next();
                        this.mAdapter.add(row);
                    }
                }
                this.mAdapter.notifyDataSetChanged();
            }
        }
    }

    public void setAdapter(ChangeLogAdapter adapter) {
        super.setAdapter((ListAdapter) adapter);
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
    }
}
