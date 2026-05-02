package it.gmariotti.changelibs.library.view;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.AsyncTask;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.util.Log;
import android.widget.Toast;
import it.gmariotti.changelibs.R;
import it.gmariotti.changelibs.library.Constants;
import it.gmariotti.changelibs.library.Util;
import it.gmariotti.changelibs.library.internal.ChangeLog;
import it.gmariotti.changelibs.library.internal.ChangeLogRecyclerViewAdapter;
import it.gmariotti.changelibs.library.parser.XmlParser;

/* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/view/ChangeLogRecyclerView.class */
public class ChangeLogRecyclerView extends RecyclerView {
    protected int mRowLayoutId;
    protected int mRowHeaderLayoutId;
    protected int mChangeLogFileResourceId;
    protected String mChangeLogFileResourceUrl;
    protected static String TAG = "ChangeLogRecyclerView";
    protected ChangeLogRecyclerViewAdapter mAdapter;

    public ChangeLogRecyclerView(Context context) {
        this(context, null);
    }

    public ChangeLogRecyclerView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public ChangeLogRecyclerView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mRowLayoutId = Constants.mRowLayoutId;
        this.mRowHeaderLayoutId = Constants.mRowHeaderLayoutId;
        this.mChangeLogFileResourceId = Constants.mChangeLogFileResourceId;
        this.mChangeLogFileResourceUrl = null;
        init(attrs, defStyle);
    }

    @TargetApi(21)
    protected void init(AttributeSet attrs, int defStyle) {
        initAttrs(attrs, defStyle);
        initAdapter();
        initLayoutManager();
    }

    protected void initLayoutManager() {
        LinearLayoutManager layoutManager = new LinearLayoutManager(getContext());
        layoutManager.setOrientation(1);
        setLayoutManager(layoutManager);
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
            this.mAdapter = new ChangeLogRecyclerViewAdapter(getContext(), chg.getRows());
            this.mAdapter.setRowLayoutId(this.mRowLayoutId);
            this.mAdapter.setRowHeaderLayoutId(this.mRowHeaderLayoutId);
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

    /* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/view/ChangeLogRecyclerView$ParseAsyncTask.class */
    protected class ParseAsyncTask extends AsyncTask<Void, Void, ChangeLog> {
        private ChangeLogRecyclerViewAdapter mAdapter;
        private XmlParser mParse;

        public ParseAsyncTask(ChangeLogRecyclerViewAdapter adapter, XmlParser parse) {
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
                Log.e(ChangeLogRecyclerView.TAG, ChangeLogRecyclerView.this.getResources().getString(R.string.changelog_internal_error_parsing), e);
                return null;
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(ChangeLog chg) {
            if (chg != null) {
                this.mAdapter.add(chg.getRows());
            }
        }
    }
}
