package com.nononsenseapps.filepicker;

import android.R;
import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.LoaderManager;
import android.support.v4.content.Loader;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.util.SortedList;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.TextView;
import android.widget.Toast;
import com.nononsenseapps.filepicker.NewItemFragment;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/* loaded from: com.nononsenseapps.filepicker.2.0.5.jar:com/nononsenseapps/filepicker/AbstractFilePickerFragment.class */
public abstract class AbstractFilePickerFragment<T> extends Fragment implements LoaderManager.LoaderCallbacks<SortedList<T>>, NewItemFragment.OnNewFolderListener, LogicHandler<T> {
    public static final int MODE_FILE = 0;
    public static final int MODE_DIR = 1;
    public static final int MODE_FILE_AND_DIR = 2;
    public static final String KEY_START_PATH = "KEY_START_PATH";
    public static final String KEY_MODE = "KEY_MODE";
    public static final String KEY_ALLOW_DIR_CREATE = "KEY_ALLOW_DIR_CREATE";
    public static final String KEY_ALLOW_MULTIPLE = "KEY_ALLOW_MULTIPLE";
    protected static final String KEY_CURRENT_PATH = "KEY_CURRENT PATH";
    private OnFilePickedListener listener;
    private TextView currentDirView;
    private Toolbar mToolbar;
    private RecyclerView mRecyclerView;
    private LinearLayoutManager mLayoutManager;
    protected int mode = 0;
    protected T currentPath = null;
    protected boolean allowCreateDir = false;
    protected boolean allowMultiple = false;
    private FileItemAdapter<T> mAdapter = null;
    private SortedList<T> mFiles = null;
    protected final HashSet<T> checkedItems = new HashSet<>();
    protected final HashSet<AbstractFilePickerFragment<T>.CheckableViewHolder> checkedVisibleViewHolders = new HashSet<>();

    /* loaded from: com.nononsenseapps.filepicker.2.0.5.jar:com/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener.class */
    public interface OnFilePickedListener {
        void onFilePicked(Uri uri);

        void onFilesPicked(List<Uri> list);

        void onCancelled();
    }

    protected FileItemAdapter<T> getAdapter() {
        return this.mAdapter;
    }

    protected FileItemAdapter<T> getDummyAdapter() {
        return new FileItemAdapter<>(this);
    }

    public AbstractFilePickerFragment() {
        setRetainInstance(true);
    }

    public void setArgs(String startPath, int mode, boolean allowMultiple, boolean allowDirCreate) {
        Bundle b = new Bundle();
        if (startPath != null) {
            b.putString(KEY_START_PATH, startPath);
        }
        b.putBoolean(KEY_ALLOW_DIR_CREATE, allowDirCreate);
        b.putBoolean(KEY_ALLOW_MULTIPLE, allowMultiple);
        b.putInt(KEY_MODE, mode);
        setArguments(b);
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_filepicker, container, false);
        this.mToolbar = view.findViewById(R.id.picker_toolbar);
        getActivity().setSupportActionBar(this.mToolbar);
        this.mRecyclerView = view.findViewById(R.id.list);
        this.mRecyclerView.setHasFixedSize(true);
        this.mLayoutManager = new LinearLayoutManager(getActivity());
        this.mRecyclerView.setLayoutManager(this.mLayoutManager);
        this.mAdapter = new FileItemAdapter<>(this);
        this.mRecyclerView.setAdapter(this.mAdapter);
        view.findViewById(R.id.button_cancel).setOnClickListener(new View.OnClickListener() { // from class: com.nononsenseapps.filepicker.AbstractFilePickerFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (AbstractFilePickerFragment.this.listener != null) {
                    AbstractFilePickerFragment.this.listener.onCancelled();
                }
            }
        });
        view.findViewById(R.id.button_ok).setOnClickListener(new View.OnClickListener() { // from class: com.nononsenseapps.filepicker.AbstractFilePickerFragment.2
            /* JADX WARN: Multi-variable type inference failed */
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (AbstractFilePickerFragment.this.listener == null) {
                    return;
                }
                if ((AbstractFilePickerFragment.this.allowMultiple || AbstractFilePickerFragment.this.mode == 0) && AbstractFilePickerFragment.this.checkedItems.isEmpty()) {
                    Toast.makeText((Context) AbstractFilePickerFragment.this.getActivity(), R.string.select_something_first, 0).show();
                    return;
                }
                if (AbstractFilePickerFragment.this.allowMultiple) {
                    AbstractFilePickerFragment.this.listener.onFilesPicked(AbstractFilePickerFragment.this.toUri((Iterable) AbstractFilePickerFragment.this.checkedItems));
                    return;
                }
                if (AbstractFilePickerFragment.this.mode == 0) {
                    AbstractFilePickerFragment.this.listener.onFilePicked(AbstractFilePickerFragment.this.toUri((AbstractFilePickerFragment) AbstractFilePickerFragment.this.getFirstCheckedItem()));
                    return;
                }
                if (AbstractFilePickerFragment.this.mode == 1) {
                    AbstractFilePickerFragment.this.listener.onFilePicked(AbstractFilePickerFragment.this.toUri((AbstractFilePickerFragment) AbstractFilePickerFragment.this.currentPath));
                } else if (AbstractFilePickerFragment.this.checkedItems.isEmpty()) {
                    AbstractFilePickerFragment.this.listener.onFilePicked(AbstractFilePickerFragment.this.toUri((AbstractFilePickerFragment) AbstractFilePickerFragment.this.currentPath));
                } else {
                    AbstractFilePickerFragment.this.listener.onFilePicked(AbstractFilePickerFragment.this.toUri((AbstractFilePickerFragment) AbstractFilePickerFragment.this.getFirstCheckedItem()));
                }
            }
        });
        this.currentDirView = (TextView) view.findViewById(R.id.current_dir);
        if (this.currentPath != null) {
            this.currentDirView.setText(getFullPath(this.currentPath));
        }
        return view;
    }

    public T getFirstCheckedItem() {
        Iterator i$ = this.checkedItems.iterator();
        if (i$.hasNext()) {
            T file = i$.next();
            return file;
        }
        return null;
    }

    protected List<Uri> toUri(Iterable<T> files) {
        ArrayList<Uri> uris = new ArrayList<>();
        for (T file : files) {
            uris.add(toUri((AbstractFilePickerFragment<T>) file));
        }
        return uris;
    }

    public boolean isCheckable(T data) {
        boolean checkable;
        if (isDir(data)) {
            checkable = (this.mode == 1 && this.allowMultiple) || (this.mode == 2 && this.allowMultiple);
        } else {
            checkable = this.mode != 1;
        }
        return checkable;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        try {
            this.listener = (OnFilePickedListener) activity;
        } catch (ClassCastException e) {
            throw new ClassCastException(activity.toString() + " must implement OnFilePickedListener");
        }
    }

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
    }

    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        if (this.currentPath == null) {
            if (savedInstanceState != null) {
                this.mode = savedInstanceState.getInt(KEY_MODE, this.mode);
                this.allowCreateDir = savedInstanceState.getBoolean(KEY_ALLOW_DIR_CREATE, this.allowCreateDir);
                this.allowMultiple = savedInstanceState.getBoolean(KEY_ALLOW_MULTIPLE, this.allowMultiple);
                this.currentPath = getPath(savedInstanceState.getString(KEY_CURRENT_PATH));
            } else if (getArguments() != null) {
                this.mode = getArguments().getInt(KEY_MODE, this.mode);
                this.allowCreateDir = getArguments().getBoolean(KEY_ALLOW_DIR_CREATE, this.allowCreateDir);
                this.allowMultiple = getArguments().getBoolean(KEY_ALLOW_MULTIPLE, this.allowMultiple);
                if (getArguments().containsKey(KEY_START_PATH)) {
                    this.currentPath = getPath(getArguments().getString(KEY_START_PATH));
                }
            }
            if (this.currentPath == null) {
                this.currentPath = getRoot();
            }
        }
        refresh();
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.picker_actions, menu);
        MenuItem item = menu.findItem(R.id.action_createdir);
        item.setVisible(this.allowCreateDir && this.mode == 1);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (R.id.action_createdir == menuItem.getItemId()) {
            AppCompatActivity activity = getActivity();
            if (activity instanceof AppCompatActivity) {
                NewFolderFragment.showDialog(activity.getSupportFragmentManager(), this);
                return true;
            }
            return true;
        }
        return false;
    }

    public void onSaveInstanceState(Bundle b) {
        super.onSaveInstanceState(b);
        b.putString(KEY_CURRENT_PATH, this.currentPath.toString());
        b.putBoolean(KEY_ALLOW_MULTIPLE, this.allowMultiple);
        b.putBoolean(KEY_ALLOW_DIR_CREATE, this.allowCreateDir);
        b.putInt(KEY_MODE, this.mode);
    }

    public void onDetach() {
        super.onDetach();
        this.listener = null;
    }

    protected void refresh() {
        getLoaderManager().restartLoader(0, (Bundle) null, this);
    }

    public Loader<SortedList<T>> onCreateLoader(int id, Bundle args) {
        return getLoader();
    }

    public void onLoadFinished(Loader<SortedList<T>> loader, SortedList<T> data) {
        this.checkedItems.clear();
        this.checkedVisibleViewHolders.clear();
        this.mFiles = data;
        this.mAdapter.setList(data);
        this.currentDirView.setText(getFullPath(this.currentPath));
    }

    public void onLoaderReset(Loader<SortedList<T>> loader) {
        this.mAdapter.setList(null);
        this.mFiles = null;
    }

    @Override // com.nononsenseapps.filepicker.LogicHandler
    public int getItemViewType(int position, T data) {
        if (isCheckable(data)) {
            return 2;
        }
        return 1;
    }

    @Override // com.nononsenseapps.filepicker.LogicHandler
    public void onBindHeaderViewHolder(AbstractFilePickerFragment<T>.HeaderViewHolder viewHolder) {
        viewHolder.text.setText("..");
    }

    @Override // com.nononsenseapps.filepicker.LogicHandler
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        switch (viewType) {
            case 0:
                View v = LayoutInflater.from(getActivity()).inflate(R.layout.filepicker_listitem_dir, parent, false);
                return new HeaderViewHolder(v);
            case 1:
            default:
                View v2 = LayoutInflater.from(getActivity()).inflate(R.layout.filepicker_listitem_dir, parent, false);
                return new DirViewHolder(v2);
            case 2:
                View v3 = LayoutInflater.from(getActivity()).inflate(R.layout.filepicker_listitem_checkable, parent, false);
                return new CheckableViewHolder(v3);
        }
    }

    @Override // com.nononsenseapps.filepicker.LogicHandler
    public void onBindViewHolder(AbstractFilePickerFragment<T>.DirViewHolder vh, int position, T data) {
        vh.file = data;
        vh.icon.setVisibility(isDir(data) ? 0 : 8);
        vh.text.setText(getName(data));
        if (isCheckable(data)) {
            if (this.checkedItems.contains(data)) {
                this.checkedVisibleViewHolders.add((CheckableViewHolder) vh);
                ((CheckableViewHolder) vh).checkbox.setChecked(true);
            } else {
                this.checkedVisibleViewHolders.remove(vh);
                ((CheckableViewHolder) vh).checkbox.setChecked(false);
            }
        }
    }

    /* loaded from: com.nononsenseapps.filepicker.2.0.5.jar:com/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder.class */
    public class HeaderViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        final TextView text;

        public HeaderViewHolder(View v) {
            super(v);
            v.setOnClickListener(this);
            this.text = (TextView) v.findViewById(R.id.text1);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            AbstractFilePickerFragment.this.currentPath = AbstractFilePickerFragment.this.getParent(AbstractFilePickerFragment.this.currentPath);
            AbstractFilePickerFragment.this.checkedItems.clear();
            AbstractFilePickerFragment.this.checkedVisibleViewHolders.clear();
            AbstractFilePickerFragment.this.refresh();
        }
    }

    /* loaded from: com.nononsenseapps.filepicker.2.0.5.jar:com/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder.class */
    public class DirViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener, View.OnLongClickListener {
        public View icon;
        public TextView text;
        public T file;

        public DirViewHolder(View v) {
            super(v);
            v.setOnClickListener(this);
            v.setOnLongClickListener(this);
            this.icon = v.findViewById(R.id.item_icon);
            this.text = (TextView) v.findViewById(R.id.text1);
        }

        public void onClick(View v) {
            if (AbstractFilePickerFragment.this.isDir(this.file)) {
                AbstractFilePickerFragment.this.currentPath = this.file;
                AbstractFilePickerFragment.this.checkedItems.clear();
                AbstractFilePickerFragment.this.checkedVisibleViewHolders.clear();
                AbstractFilePickerFragment.this.refresh();
            }
        }

        public boolean onLongClick(View v) {
            return false;
        }
    }

    /* loaded from: com.nononsenseapps.filepicker.2.0.5.jar:com/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder.class */
    public class CheckableViewHolder extends AbstractFilePickerFragment<T>.DirViewHolder {
        public CheckBox checkbox;

        public CheckableViewHolder(View v) {
            super(v);
            this.checkbox = (CheckBox) v.findViewById(R.id.checkbox);
            this.checkbox.setOnClickListener(new View.OnClickListener() { // from class: com.nononsenseapps.filepicker.AbstractFilePickerFragment.CheckableViewHolder.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v2) {
                    CheckableViewHolder.this.onLongClick(v2);
                }
            });
        }

        @Override // com.nononsenseapps.filepicker.AbstractFilePickerFragment.DirViewHolder, android.view.View.OnClickListener
        public void onClick(View v) {
            if (AbstractFilePickerFragment.this.isDir(this.file)) {
                AbstractFilePickerFragment.this.currentPath = this.file;
                AbstractFilePickerFragment.this.checkedItems.clear();
                AbstractFilePickerFragment.this.checkedVisibleViewHolders.clear();
                AbstractFilePickerFragment.this.refresh();
                return;
            }
            onLongClick(v);
        }

        @Override // com.nononsenseapps.filepicker.AbstractFilePickerFragment.DirViewHolder, android.view.View.OnLongClickListener
        public boolean onLongClick(View v) {
            if (AbstractFilePickerFragment.this.checkedItems.contains(this.file)) {
                this.checkbox.setChecked(false);
                AbstractFilePickerFragment.this.checkedItems.remove(this.file);
                AbstractFilePickerFragment.this.checkedVisibleViewHolders.remove(this);
                return true;
            }
            if (!AbstractFilePickerFragment.this.allowMultiple) {
                AbstractFilePickerFragment.this.clearSelections();
            }
            this.checkbox.setChecked(true);
            AbstractFilePickerFragment.this.checkedItems.add(this.file);
            AbstractFilePickerFragment.this.checkedVisibleViewHolders.add(this);
            return true;
        }
    }

    public void clearSelections() {
        Iterator i$ = this.checkedVisibleViewHolders.iterator();
        while (i$.hasNext()) {
            AbstractFilePickerFragment<T>.CheckableViewHolder vh = i$.next();
            vh.checkbox.setChecked(false);
        }
        this.checkedVisibleViewHolders.clear();
        this.checkedItems.clear();
    }
}
