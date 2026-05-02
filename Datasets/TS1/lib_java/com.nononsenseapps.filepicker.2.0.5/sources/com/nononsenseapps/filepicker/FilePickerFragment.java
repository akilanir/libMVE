package com.nononsenseapps.filepicker;

import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.os.FileObserver;
import android.support.v4.content.AsyncTaskLoader;
import android.support.v4.content.Loader;
import android.support.v7.util.SortedList;
import android.support.v7.widget.util.SortedListAdapterCallback;
import android.widget.Toast;
import java.io.File;

/* loaded from: com.nononsenseapps.filepicker.2.0.5.jar:com/nononsenseapps/filepicker/FilePickerFragment.class */
public class FilePickerFragment extends AbstractFilePickerFragment<File> {
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
        return Environment.getExternalStorageDirectory();
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
                File[] listFiles = ((File) FilePickerFragment.this.currentPath).listFiles();
                int initCap = listFiles == null ? 0 : listFiles.length;
                SortedList<File> files = new SortedList<>(File.class, new SortedListAdapterCallback<File>(FilePickerFragment.this.getDummyAdapter()) { // from class: com.nononsenseapps.filepicker.FilePickerFragment.1.1
                    public int compare(File lhs, File rhs) {
                        if (lhs.isDirectory() && !rhs.isDirectory()) {
                            return -1;
                        }
                        if (rhs.isDirectory() && !lhs.isDirectory()) {
                            return 1;
                        }
                        return lhs.getName().toLowerCase().compareTo(rhs.getName().toLowerCase());
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
                        if (FilePickerFragment.this.mode == 0 || FilePickerFragment.this.mode == 2 || f.isDirectory()) {
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
                if (FilePickerFragment.this.currentPath == 0 || !((File) FilePickerFragment.this.currentPath).isDirectory()) {
                    FilePickerFragment.this.currentPath = FilePickerFragment.this.getRoot();
                }
                this.fileObserver = new FileObserver(((File) FilePickerFragment.this.currentPath).getPath(), 960) { // from class: com.nononsenseapps.filepicker.FilePickerFragment.1.2
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
        ?? file = new File((File) this.currentPath, name);
        if (file.mkdir()) {
            this.currentPath = file;
            refresh();
        } else {
            Toast.makeText((Context) getActivity(), R.string.create_folder_error, 0).show();
        }
    }
}
