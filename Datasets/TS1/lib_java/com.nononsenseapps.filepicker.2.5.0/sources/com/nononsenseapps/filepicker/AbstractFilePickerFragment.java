package com.nononsenseapps.filepicker;

import android.R;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.NonNull;
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

/* loaded from: com.nononsenseapps.filepicker.2.5.0.jar:com/nononsenseapps/filepicker/AbstractFilePickerFragment.class */
public abstract class AbstractFilePickerFragment<T> extends Fragment implements LoaderManager.LoaderCallbacks<SortedList<T>>, NewItemFragment.OnNewFolderListener, LogicHandler<T> {
    public static final int MODE_FILE = 0;
    public static final int MODE_DIR = 1;
    public static final int MODE_FILE_AND_DIR = 2;
    public static final String KEY_START_PATH = "KEY_START_PATH";
    public static final String KEY_MODE = "KEY_MODE";
    public static final String KEY_ALLOW_DIR_CREATE = "KEY_ALLOW_DIR_CREATE";
    public static final String KEY_ALLOW_MULTIPLE = "KEY_ALLOW_MULTIPLE";
    protected static final String KEY_CURRENT_PATH = "KEY_CURRENT PATH";
    protected OnFilePickedListener mListener;
    protected TextView mCurrentDirView;
    protected int mode = 0;
    protected T mCurrentPath = null;
    protected boolean allowCreateDir = false;
    protected boolean allowMultiple = false;
    protected FileItemAdapter<T> mAdapter = null;
    protected SortedList<T> mFiles = null;
    protected Toast mToast = null;
    protected final HashSet<T> mCheckedItems = new HashSet<>();
    protected final HashSet<AbstractFilePickerFragment<T>.CheckableViewHolder> mCheckedVisibleViewHolders = new HashSet<>();

    /* loaded from: com.nononsenseapps.filepicker.2.5.0.jar:com/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener.class */
    public interface OnFilePickedListener {
        void onFilePicked(Uri uri);

        void onFilesPicked(List<Uri> list);

        void onCancelled();
    }

    public AbstractFilePickerFragment() {
        setRetainInstance(true);
    }

    protected FileItemAdapter<T> getAdapter() {
        return this.mAdapter;
    }

    protected FileItemAdapter<T> getDummyAdapter() {
        return new FileItemAdapter<>(this);
    }

    public void setArgs(String startPath, int mode, boolean allowMultiple, boolean allowDirCreate) {
        Bundle b = getArguments();
        if (b == null) {
            b = new Bundle();
        }
        if (startPath != null) {
            b.putString(KEY_START_PATH, startPath);
        }
        b.putBoolean(KEY_ALLOW_DIR_CREATE, allowDirCreate);
        b.putBoolean(KEY_ALLOW_MULTIPLE, allowMultiple);
        b.putInt(KEY_MODE, mode);
        setArguments(b);
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.nnf_fragment_filepicker, container, false);
        Toolbar toolbar = view.findViewById(R.id.nnf_picker_toolbar);
        if (toolbar != null) {
            setupToolbar(toolbar);
        }
        RecyclerView mRecyclerView = view.findViewById(R.id.list);
        mRecyclerView.setHasFixedSize(true);
        LinearLayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
        mRecyclerView.setLayoutManager(mLayoutManager);
        this.mAdapter = new FileItemAdapter<>(this);
        mRecyclerView.setAdapter(this.mAdapter);
        view.findViewById(R.id.nnf_button_cancel).setOnClickListener(new View.OnClickListener() { // from class: com.nononsenseapps.filepicker.AbstractFilePickerFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                AbstractFilePickerFragment.this.onClickCancel(v);
            }
        });
        view.findViewById(R.id.nnf_button_ok).setOnClickListener(new View.OnClickListener() { // from class: com.nononsenseapps.filepicker.AbstractFilePickerFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                AbstractFilePickerFragment.this.onClickOk(v);
            }
        });
        this.mCurrentDirView = (TextView) view.findViewById(R.id.nnf_current_dir);
        if (this.mCurrentPath != null && this.mCurrentDirView != null) {
            this.mCurrentDirView.setText(getFullPath(this.mCurrentPath));
        }
        return view;
    }

    public void onClickCancel(View view) {
        if (this.mListener != null) {
            this.mListener.onCancelled();
        }
    }

    public void onClickOk(View view) {
        if (this.mListener == null) {
            return;
        }
        if ((this.allowMultiple || this.mode == 0) && this.mCheckedItems.isEmpty()) {
            if (this.mToast == null) {
                this.mToast = Toast.makeText((Context) getActivity(), R.string.nnf_select_something_first, 0);
            }
            this.mToast.show();
        } else {
            if (this.allowMultiple) {
                this.mListener.onFilesPicked(toUri((Iterable) this.mCheckedItems));
                return;
            }
            if (this.mode == 0) {
                this.mListener.onFilePicked(toUri((AbstractFilePickerFragment<T>) getFirstCheckedItem()));
                return;
            }
            if (this.mode == 1) {
                this.mListener.onFilePicked(toUri((AbstractFilePickerFragment<T>) this.mCurrentPath));
            } else if (this.mCheckedItems.isEmpty()) {
                this.mListener.onFilePicked(toUri((AbstractFilePickerFragment<T>) this.mCurrentPath));
            } else {
                this.mListener.onFilePicked(toUri((AbstractFilePickerFragment<T>) getFirstCheckedItem()));
            }
        }
    }

    protected void setupToolbar(Toolbar toolbar) {
        getActivity().setSupportActionBar(toolbar);
    }

    public T getFirstCheckedItem() {
        Iterator i$ = this.mCheckedItems.iterator();
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
    public void onAttach(Context context) {
        super.onAttach(context);
        try {
            this.mListener = (OnFilePickedListener) context;
        } catch (ClassCastException e) {
            throw new ClassCastException(context.toString() + " must implement OnFilePickedListener");
        }
    }

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
    }

    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        if (this.mCurrentPath == null) {
            if (savedInstanceState != null) {
                this.mode = savedInstanceState.getInt(KEY_MODE, this.mode);
                this.allowCreateDir = savedInstanceState.getBoolean(KEY_ALLOW_DIR_CREATE, this.allowCreateDir);
                this.allowMultiple = savedInstanceState.getBoolean(KEY_ALLOW_MULTIPLE, this.allowMultiple);
                this.mCurrentPath = getPath(savedInstanceState.getString(KEY_CURRENT_PATH));
            } else if (getArguments() != null) {
                this.mode = getArguments().getInt(KEY_MODE, this.mode);
                this.allowCreateDir = getArguments().getBoolean(KEY_ALLOW_DIR_CREATE, this.allowCreateDir);
                this.allowMultiple = getArguments().getBoolean(KEY_ALLOW_MULTIPLE, this.allowMultiple);
                if (getArguments().containsKey(KEY_START_PATH)) {
                    this.mCurrentPath = getPath(getArguments().getString(KEY_START_PATH));
                }
            }
            if (this.mCurrentPath == null) {
                this.mCurrentPath = getRoot();
            }
        }
        refresh();
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.picker_actions, menu);
        MenuItem item = menu.findItem(R.id.nnf_action_createdir);
        item.setVisible(this.allowCreateDir);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (R.id.nnf_action_createdir == menuItem.getItemId()) {
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
        b.putString(KEY_CURRENT_PATH, this.mCurrentPath.toString());
        b.putBoolean(KEY_ALLOW_MULTIPLE, this.allowMultiple);
        b.putBoolean(KEY_ALLOW_DIR_CREATE, this.allowCreateDir);
        b.putInt(KEY_MODE, this.mode);
    }

    public void onDetach() {
        super.onDetach();
        this.mListener = null;
    }

    protected void refresh() {
        if (hasPermission()) {
            getLoaderManager().restartLoader(0, (Bundle) null, this);
        } else {
            handlePermission();
        }
    }

    protected void handlePermission() {
    }

    protected boolean hasPermission() {
        return true;
    }

    public Loader<SortedList<T>> onCreateLoader(int id, Bundle args) {
        return getLoader();
    }

    public void onLoadFinished(Loader<SortedList<T>> loader, SortedList<T> data) {
        this.mCheckedItems.clear();
        this.mCheckedVisibleViewHolders.clear();
        this.mFiles = data;
        this.mAdapter.setList(data);
        if (this.mCurrentDirView != null) {
            this.mCurrentDirView.setText(getFullPath(this.mCurrentPath));
        }
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
                View v = LayoutInflater.from(getActivity()).inflate(R.layout.nnf_filepicker_listitem_dir, parent, false);
                return new HeaderViewHolder(v);
            case 1:
            default:
                View v2 = LayoutInflater.from(getActivity()).inflate(R.layout.nnf_filepicker_listitem_dir, parent, false);
                return new DirViewHolder(v2);
            case 2:
                View v3 = LayoutInflater.from(getActivity()).inflate(R.layout.nnf_filepicker_listitem_checkable, parent, false);
                return new CheckableViewHolder(v3);
        }
    }

    @Override // com.nononsenseapps.filepicker.LogicHandler
    public void onBindViewHolder(AbstractFilePickerFragment<T>.DirViewHolder vh, int position, T data) {
        vh.file = data;
        vh.icon.setVisibility(isDir(data) ? 0 : 8);
        vh.text.setText(getName(data));
        if (isCheckable(data)) {
            if (this.mCheckedItems.contains(data)) {
                this.mCheckedVisibleViewHolders.add((CheckableViewHolder) vh);
                ((CheckableViewHolder) vh).checkbox.setChecked(true);
            } else {
                this.mCheckedVisibleViewHolders.remove(vh);
                ((CheckableViewHolder) vh).checkbox.setChecked(false);
            }
        }
    }

    public void clearSelections() {
        Iterator i$ = this.mCheckedVisibleViewHolders.iterator();
        while (i$.hasNext()) {
            AbstractFilePickerFragment<T>.CheckableViewHolder vh = i$.next();
            vh.checkbox.setChecked(false);
        }
        this.mCheckedVisibleViewHolders.clear();
        this.mCheckedItems.clear();
    }

    public void onClickHeader(View view, AbstractFilePickerFragment<T>.HeaderViewHolder viewHolder) {
        goUp();
    }

    public void goUp() {
        goToDir(getParent(this.mCurrentPath));
    }

    public void onClickDir(View view, AbstractFilePickerFragment<T>.DirViewHolder viewHolder) {
        if (isDir(viewHolder.file)) {
            goToDir(viewHolder.file);
        }
    }

    public void goToDir(@NonNull T file) {
        this.mCurrentPath = file;
        this.mCheckedItems.clear();
        this.mCheckedVisibleViewHolders.clear();
        refresh();
    }

    public boolean onLongClickDir(View view, AbstractFilePickerFragment<T>.DirViewHolder viewHolder) {
        return false;
    }

    public void onClickCheckable(View view, AbstractFilePickerFragment<T>.CheckableViewHolder viewHolder) {
        if (isDir(viewHolder.file)) {
            goToDir(viewHolder.file);
        } else {
            onLongClickCheckable(view, viewHolder);
        }
    }

    public boolean onLongClickCheckable(View view, AbstractFilePickerFragment<T>.CheckableViewHolder viewHolder) {
        onClickCheckBox(viewHolder);
        return true;
    }

    public void onClickCheckBox(AbstractFilePickerFragment<T>.CheckableViewHolder viewHolder) {
        if (this.mCheckedItems.contains(viewHolder.file)) {
            viewHolder.checkbox.setChecked(false);
            this.mCheckedItems.remove(viewHolder.file);
            this.mCheckedVisibleViewHolders.remove(viewHolder);
        } else {
            if (!this.allowMultiple) {
                clearSelections();
            }
            viewHolder.checkbox.setChecked(true);
            this.mCheckedItems.add(viewHolder.file);
            this.mCheckedVisibleViewHolders.add(viewHolder);
        }
    }

    /* loaded from: com.nononsenseapps.filepicker.2.5.0.jar:com/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder.class */
    public class HeaderViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        final TextView text;

        public HeaderViewHolder(View v) {
            super(v);
            v.setOnClickListener(this);
            this.text = (TextView) v.findViewById(R.id.text1);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            AbstractFilePickerFragment.this.onClickHeader(v, this);
        }
    }

    /* loaded from: com.nononsenseapps.filepicker.2.5.0.jar:com/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder.class */
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
            AbstractFilePickerFragment.this.onClickDir(v, this);
        }

        public boolean onLongClick(View v) {
            return AbstractFilePickerFragment.this.onLongClickDir(v, this);
        }
    }

    /* loaded from: com.nononsenseapps.filepicker.2.5.0.jar:com/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder.class */
    public class CheckableViewHolder extends AbstractFilePickerFragment<T>.DirViewHolder {
        public CheckBox checkbox;

        public CheckableViewHolder(View v) {
            super(v);
            this.checkbox = (CheckBox) v.findViewById(R.id.checkbox);
            this.checkbox.setOnClickListener(new View.OnClickListener() { // from class: com.nononsenseapps.filepicker.AbstractFilePickerFragment.CheckableViewHolder.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v2) {
                    AbstractFilePickerFragment.this.onClickCheckBox(CheckableViewHolder.this);
                }
            });
        }

        @Override // com.nononsenseapps.filepicker.AbstractFilePickerFragment.DirViewHolder, android.view.View.OnClickListener
        public void onClick(View v) {
            AbstractFilePickerFragment.this.onClickCheckable(v, this);
        }

        @Override // com.nononsenseapps.filepicker.AbstractFilePickerFragment.DirViewHolder, android.view.View.OnLongClickListener
        public boolean onLongClick(View v) {
            return AbstractFilePickerFragment.this.onLongClickCheckable(v, this);
        }
    }
}
