package com.nononsenseapps.filepicker;

import android.content.Context;
import android.net.Uri;
import android.os.FileObserver;
import android.support.annotation.NonNull;
import android.support.v4.content.AsyncTaskLoader;
import android.support.v4.content.ContextCompat;
import android.support.v4.content.Loader;
import android.support.v7.util.SortedList;
import android.support.v7.widget.util.SortedListAdapterCallback;
import android.widget.Toast;
import java.io.File;

/* loaded from: com.nononsenseapps.filepicker.2.5.0.jar:com/nononsenseapps/filepicker/FilePickerFragment.class */
public class FilePickerFragment extends AbstractFilePickerFragment<File> {
    protected static final int PERMISSIONS_REQUEST_WRITE_EXTERNAL_STORAGE = 1;
    protected boolean showHiddenItems = false;

    public void showHiddenItems(boolean showHiddenItems) {
        this.showHiddenItems = showHiddenItems;
    }

    public boolean areHiddenItemsShown() {
        return this.showHiddenItems;
    }

    @Override // com.nononsenseapps.filepicker.AbstractFilePickerFragment
    protected boolean hasPermission() {
        return 0 == ContextCompat.checkSelfPermission(getContext(), "android.permission.WRITE_EXTERNAL_STORAGE");
    }

    @Override // com.nononsenseapps.filepicker.AbstractFilePickerFragment
    protected void handlePermission() {
        requestPermissions(new String[]{"android.permission.WRITE_EXTERNAL_STORAGE"}, 1);
    }

    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        if (permissions.length == 0) {
            if (this.mListener != null) {
                this.mListener.onCancelled();
            }
        } else {
            if (0 == grantResults[0]) {
                refresh();
                return;
            }
            Toast.makeText(getContext(), R.string.nnf_permission_external_write_denied, 0).show();
            if (this.mListener != null) {
                this.mListener.onCancelled();
            }
        }
    }

    @Override // com.nononsenseapps.filepicker.LogicHandler
    public boolean isDir(File path) {
        return path.isDirectory();
    }

    @Override // com.nononsenseapps.filepicker.LogicHandler
    public String getName(File path) {
        return path.getName();
    }

    @Override // com.nononsenseapps.filepicker.LogicHandler
    public File getParent(File from) {
        if (from.getPath().equals(getRoot().getPath())) {
            return from;
        }
        if (from.getParentFile() != null) {
            if (from.isFile()) {
                return getParent(from.getParentFile());
            }
            return from.getParentFile();
        }
        return from;
    }

    @Override // com.nononsenseapps.filepicker.LogicHandler
    public File getPath(String path) {
        return new File(path);
    }

    @Override // com.nononsenseapps.filepicker.LogicHandler
    public String getFullPath(File path) {
        return path.getPath();
    }

    @Override // com.nononsenseapps.filepicker.LogicHandler
    public File getRoot() {
        return new File("/");
    }

    @Override // com.nononsenseapps.filepicker.LogicHandler
    public Uri toUri(File file) {
        return Uri.fromFile(file);
    }

    @Override // com.nononsenseapps.filepicker.LogicHandler
    public Loader<SortedList<File>> getLoader() {
        return new AsyncTaskLoader<SortedList<File>>(getActivity()) { // from class: com.nononsenseapps.filepicker.FilePickerFragment.1
            FileObserver fileObserver;

            /* JADX WARN: Multi-variable type inference failed */
            /* renamed from: loadInBackground, reason: merged with bridge method [inline-methods] */
            public SortedList<File> m0loadInBackground() {
                File[] listFiles = ((File) FilePickerFragment.this.mCurrentPath).listFiles();
                int initCap = listFiles == null ? 0 : listFiles.length;
                SortedList<File> files = new SortedList<>(File.class, new SortedListAdapterCallback<File>(FilePickerFragment.this.getDummyAdapter()) { // from class: com.nononsenseapps.filepicker.FilePickerFragment.1.1
                    public int compare(File lhs, File rhs) {
                        return FilePickerFragment.this.compareFiles(lhs, rhs);
                    }

                    public boolean areContentsTheSame(File file, File file2) {
                        return file.getAbsolutePath().equals(file2.getAbsolutePath()) && file.isFile() == file2.isFile();
                    }

                    public boolean areItemsTheSame(File file, File file2) {
                        return areContentsTheSame(file, file2);
                    }
                }, initCap);
                files.beginBatchedUpdates();
                if (listFiles != null) {
                    for (File f : listFiles) {
                        if (FilePickerFragment.this.isItemVisible(f)) {
                            files.add(f);
                        }
                    }
                }
                files.endBatchedUpdates();
                return files;
            }

            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Type inference failed for: r1v2, types: [T, java.io.File] */
            protected void onStartLoading() {
                super.onStartLoading();
                if (FilePickerFragment.this.mCurrentPath == 0 || !((File) FilePickerFragment.this.mCurrentPath).isDirectory()) {
                    FilePickerFragment.this.mCurrentPath = FilePickerFragment.this.getRoot();
                }
                this.fileObserver = new FileObserver(((File) FilePickerFragment.this.mCurrentPath).getPath(), 960) { // from class: com.nononsenseapps.filepicker.FilePickerFragment.1.2
                    @Override // android.os.FileObserver
                    public void onEvent(int event, String path) {
                        onContentChanged();
                    }
                };
                this.fileObserver.startWatching();
                forceLoad();
            }

            protected void onReset() {
                super.onReset();
                if (this.fileObserver != null) {
                    this.fileObserver.stopWatching();
                    this.fileObserver = null;
                }
            }
        };
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [T, java.io.File] */
    @Override // com.nononsenseapps.filepicker.NewItemFragment.OnNewFolderListener
    public void onNewFolder(String name) {
        ?? file = new File((File) this.mCurrentPath, name);
        if (file.mkdir()) {
            this.mCurrentPath = file;
            refresh();
        } else {
            Toast.makeText((Context) getActivity(), R.string.nnf_create_folder_error, 0).show();
        }
    }

    protected boolean isItemVisible(File file) {
        if (this.showHiddenItems || !file.isHidden()) {
            return isDir(file) || this.mode == 0 || this.mode == 2;
        }
        return false;
    }

    protected int compareFiles(File lhs, File rhs) {
        if (lhs.isDirectory() && !rhs.isDirectory()) {
            return -1;
        }
        if (rhs.isDirectory() && !lhs.isDirectory()) {
            return 1;
        }
        return lhs.getName().compareToIgnoreCase(rhs.getName());
    }
}
