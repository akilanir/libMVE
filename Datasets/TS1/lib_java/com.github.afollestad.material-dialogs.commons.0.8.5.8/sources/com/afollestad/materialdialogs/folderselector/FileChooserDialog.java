package com.afollestad.materialdialogs.folderselector;

import android.app.Activity;
import android.app.Dialog;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.webkit.MimeTypeMap;
import com.afollestad.materialdialogs.DialogAction;
import com.afollestad.materialdialogs.MaterialDialog;
import com.afollestad.materialdialogs.commons.R;
import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.8.jar:com/afollestad/materialdialogs/folderselector/FileChooserDialog.class */
public class FileChooserDialog extends DialogFragment implements MaterialDialog.ListCallback {
    private static final String DEFAULT_TAG = "[MD_FILE_SELECTOR]";
    private File parentFolder;
    private File[] parentContents;
    private boolean canGoUp = true;
    private FileCallback mCallback;

    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.8.jar:com/afollestad/materialdialogs/folderselector/FileChooserDialog$FileCallback.class */
    public interface FileCallback {
        void onFileSelection(@NonNull FileChooserDialog fileChooserDialog, @NonNull File file);
    }

    String[] getContentsArray() {
        if (this.parentContents == null) {
            return new String[0];
        }
        String[] results = new String[this.parentContents.length + (this.canGoUp ? 1 : 0)];
        if (this.canGoUp) {
            results[0] = "...";
        }
        for (int i = 0; i < this.parentContents.length; i++) {
            results[this.canGoUp ? i + 1 : i] = this.parentContents[i].getName();
        }
        return results;
    }

    File[] listFiles(String mimeType) {
        File[] contents = this.parentFolder.listFiles();
        List<File> results = new ArrayList<>();
        if (contents != null) {
            MimeTypeMap mimeTypeMap = MimeTypeMap.getSingleton();
            for (File fi : contents) {
                if (fi.isDirectory()) {
                    results.add(fi);
                } else if (fileIsMimeType(fi, mimeType, mimeTypeMap)) {
                    results.add(fi);
                }
            }
            Collections.sort(results, new FileSorter());
            return (File[]) results.toArray(new File[results.size()]);
        }
        return null;
    }

    boolean fileIsMimeType(File file, String mimeType, MimeTypeMap mimeTypeMap) {
        int fileTypeDelimiter;
        if (mimeType == null || mimeType.equals("*/*")) {
            return true;
        }
        String filename = file.toURI().toString();
        int dotPos = filename.lastIndexOf(46);
        if (dotPos == -1) {
            return false;
        }
        String fileExtension = filename.substring(dotPos + 1);
        String fileType = mimeTypeMap.getMimeTypeFromExtension(fileExtension);
        if (fileType == null) {
            return false;
        }
        if (fileType.equals(mimeType)) {
            return true;
        }
        int mimeTypeDelimiter = mimeType.lastIndexOf(47);
        if (mimeTypeDelimiter == -1) {
            return false;
        }
        String mimeTypeMainType = mimeType.substring(0, mimeTypeDelimiter);
        String mimeTypeSubtype = mimeType.substring(mimeTypeDelimiter + 1);
        if (!mimeTypeSubtype.equals("*") || (fileTypeDelimiter = fileType.lastIndexOf(47)) == -1) {
            return false;
        }
        String fileTypeMainType = fileType.substring(0, fileTypeDelimiter);
        if (fileTypeMainType.equals(mimeTypeMainType)) {
            return true;
        }
        return false;
    }

    @NonNull
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        if (Build.VERSION.SDK_INT >= 23 && ActivityCompat.checkSelfPermission(getActivity(), "android.permission.READ_EXTERNAL_STORAGE") != 0) {
            return new MaterialDialog.Builder(getActivity()).title(R.string.md_error_label).content(R.string.md_storage_perm_error).positiveText(android.R.string.ok).build();
        }
        if (getArguments() == null || !getArguments().containsKey("builder")) {
            throw new IllegalStateException("You must create a FileChooserDialog using the Builder.");
        }
        if (!getArguments().containsKey("current_path")) {
            getArguments().putString("current_path", getBuilder().mInitialPath);
        }
        this.parentFolder = new File(getArguments().getString("current_path"));
        this.parentContents = listFiles(getBuilder().mMimeType);
        return new MaterialDialog.Builder(getActivity()).title(this.parentFolder.getAbsolutePath()).items(getContentsArray()).itemsCallback(this).onNegative(new MaterialDialog.SingleButtonCallback() { // from class: com.afollestad.materialdialogs.folderselector.FileChooserDialog.1
            public void onClick(@NonNull MaterialDialog dialog, @NonNull DialogAction which) {
                dialog.dismiss();
            }
        }).autoDismiss(false).negativeText(getBuilder().mCancelButton).positiveText(getBuilder().mChooseButton).build();
    }

    public void onSelection(MaterialDialog materialDialog, View view, int i, CharSequence s) {
        if (this.canGoUp && i == 0) {
            this.parentFolder = this.parentFolder.getParentFile();
            if (this.parentFolder.getAbsolutePath().equals("/storage/emulated")) {
                this.parentFolder = this.parentFolder.getParentFile();
            }
            this.canGoUp = this.parentFolder.getParent() != null;
        } else {
            this.parentFolder = this.parentContents[this.canGoUp ? i - 1 : i];
            this.canGoUp = true;
            if (this.parentFolder.getAbsolutePath().equals("/storage/emulated")) {
                this.parentFolder = Environment.getExternalStorageDirectory();
            }
        }
        if (this.parentFolder.isFile()) {
            this.mCallback.onFileSelection(this, this.parentFolder);
            dismiss();
            return;
        }
        this.parentContents = listFiles(getBuilder().mMimeType);
        MaterialDialog dialog = getDialog();
        dialog.setTitle(this.parentFolder.getAbsolutePath());
        getArguments().putString("current_path", this.parentFolder.getAbsolutePath());
        dialog.setItems(getContentsArray());
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.mCallback = (FileCallback) activity;
    }

    public void show(FragmentActivity context) {
        String tag = getBuilder().mTag;
        DialogFragment findFragmentByTag = context.getSupportFragmentManager().findFragmentByTag(tag);
        if (findFragmentByTag != null) {
            findFragmentByTag.dismiss();
            context.getSupportFragmentManager().beginTransaction().remove(findFragmentByTag).commit();
        }
        show(context.getSupportFragmentManager(), tag);
    }

    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.8.jar:com/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder.class */
    public static class Builder implements Serializable {

        @NonNull
        protected final transient AppCompatActivity mContext;
        protected String mTag;

        @StringRes
        protected int mCancelButton = android.R.string.cancel;

        @StringRes
        protected int mChooseButton = R.string.md_choose_label;
        protected String mInitialPath = Environment.getExternalStorageDirectory().getAbsolutePath();
        protected String mMimeType = null;

        public <ActivityType extends AppCompatActivity & FileCallback> Builder(@NonNull ActivityType context) {
            this.mContext = context;
        }

        @NonNull
        public Builder cancelButton(@StringRes int text) {
            this.mCancelButton = text;
            return this;
        }

        @NonNull
        public Builder chooseButton(@StringRes int text) {
            this.mChooseButton = text;
            return this;
        }

        @NonNull
        public Builder initialPath(@Nullable String initialPath) {
            if (initialPath == null) {
                initialPath = File.separator;
            }
            this.mInitialPath = initialPath;
            return this;
        }

        @NonNull
        public Builder mimeType(@Nullable String type) {
            this.mMimeType = type;
            return this;
        }

        @NonNull
        public Builder tag(@Nullable String tag) {
            if (tag == null) {
                tag = FileChooserDialog.DEFAULT_TAG;
            }
            this.mTag = tag;
            return this;
        }

        @NonNull
        public FileChooserDialog build() {
            FileChooserDialog dialog = new FileChooserDialog();
            Bundle args = new Bundle();
            args.putSerializable("builder", this);
            dialog.setArguments(args);
            return dialog;
        }

        @NonNull
        public FileChooserDialog show() {
            FileChooserDialog dialog = build();
            dialog.show(this.mContext);
            return dialog;
        }
    }

    @NonNull
    public String getInitialPath() {
        return getBuilder().mInitialPath;
    }

    @NonNull
    private Builder getBuilder() {
        return (Builder) getArguments().getSerializable("builder");
    }

    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.8.jar:com/afollestad/materialdialogs/folderselector/FileChooserDialog$FileSorter.class */
    private static class FileSorter implements Comparator<File> {
        private FileSorter() {
        }

        @Override // java.util.Comparator
        public int compare(File lhs, File rhs) {
            if (lhs.isDirectory() && !rhs.isDirectory()) {
                return -1;
            }
            if (!lhs.isDirectory() && rhs.isDirectory()) {
                return 1;
            }
            return lhs.getName().compareTo(rhs.getName());
        }
    }
}
