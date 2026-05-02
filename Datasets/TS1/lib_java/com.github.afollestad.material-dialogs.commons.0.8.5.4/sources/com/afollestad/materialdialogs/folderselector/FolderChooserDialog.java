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
import com.afollestad.materialdialogs.DialogAction;
import com.afollestad.materialdialogs.MaterialDialog;
import com.afollestad.materialdialogs.commons.R;
import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.4.jar:com/afollestad/materialdialogs/folderselector/FolderChooserDialog.class */
public class FolderChooserDialog extends DialogFragment implements MaterialDialog.ListCallback {
    private static final String DEFAULT_TAG = "[MD_FOLDER_SELECTOR]";
    private File parentFolder;
    private File[] parentContents;
    private boolean canGoUp = true;
    private FolderCallback mCallback;

    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.4.jar:com/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderCallback.class */
    public interface FolderCallback {
        void onFolderSelection(@NonNull FolderChooserDialog folderChooserDialog, @NonNull File file);
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

    File[] listFiles() {
        File[] contents = this.parentFolder.listFiles();
        List<File> results = new ArrayList<>();
        if (contents != null) {
            for (File fi : contents) {
                if (fi.isDirectory()) {
                    results.add(fi);
                }
            }
            Collections.sort(results, new FolderSorter());
            return (File[]) results.toArray(new File[results.size()]);
        }
        return null;
    }

    @NonNull
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        if (Build.VERSION.SDK_INT >= 23 && ActivityCompat.checkSelfPermission(getActivity(), "android.permission.READ_EXTERNAL_STORAGE") != 0) {
            return new MaterialDialog.Builder(getActivity()).title(R.string.md_error_label).content(R.string.md_storage_perm_error).positiveText(android.R.string.ok).build();
        }
        if (getArguments() == null || !getArguments().containsKey("builder")) {
            throw new IllegalStateException("You must create a FolderChooserDialog using the Builder.");
        }
        if (!getArguments().containsKey("current_path")) {
            getArguments().putString("current_path", getBuilder().mInitialPath);
        }
        this.parentFolder = new File(getArguments().getString("current_path"));
        this.parentContents = listFiles();
        return new MaterialDialog.Builder(getActivity()).title(this.parentFolder.getAbsolutePath()).items(getContentsArray()).itemsCallback(this).onPositive(new MaterialDialog.SingleButtonCallback() { // from class: com.afollestad.materialdialogs.folderselector.FolderChooserDialog.2
            public void onClick(@NonNull MaterialDialog dialog, @NonNull DialogAction which) {
                dialog.dismiss();
                FolderChooserDialog.this.mCallback.onFolderSelection(FolderChooserDialog.this, FolderChooserDialog.this.parentFolder);
            }
        }).onNegative(new MaterialDialog.SingleButtonCallback() { // from class: com.afollestad.materialdialogs.folderselector.FolderChooserDialog.1
            public void onClick(@NonNull MaterialDialog dialog, @NonNull DialogAction which) {
                dialog.dismiss();
            }
        }).autoDismiss(false).positiveText(getBuilder().mChooseButton).negativeText(getBuilder().mCancelButton).build();
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
        this.parentContents = listFiles();
        MaterialDialog dialog = getDialog();
        dialog.setTitle(this.parentFolder.getAbsolutePath());
        getArguments().putString("current_path", this.parentFolder.getAbsolutePath());
        dialog.setItems(getContentsArray());
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.mCallback = (FolderCallback) activity;
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

    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.4.jar:com/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder.class */
    public static class Builder implements Serializable {

        @NonNull
        protected final transient AppCompatActivity mContext;

        @StringRes
        protected int mChooseButton = R.string.md_choose_label;

        @StringRes
        protected int mCancelButton = android.R.string.cancel;
        protected String mInitialPath = Environment.getExternalStorageDirectory().getAbsolutePath();
        protected String mTag;

        public <ActivityType extends AppCompatActivity & FolderCallback> Builder(@NonNull ActivityType context) {
            this.mContext = context;
        }

        @NonNull
        public Builder chooseButton(@StringRes int text) {
            this.mChooseButton = text;
            return this;
        }

        @NonNull
        public Builder cancelButton(@StringRes int text) {
            this.mCancelButton = text;
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
        public Builder tag(@Nullable String tag) {
            if (tag == null) {
                tag = FolderChooserDialog.DEFAULT_TAG;
            }
            this.mTag = tag;
            return this;
        }

        @NonNull
        public FolderChooserDialog build() {
            FolderChooserDialog dialog = new FolderChooserDialog();
            Bundle args = new Bundle();
            args.putSerializable("builder", this);
            dialog.setArguments(args);
            return dialog;
        }

        @NonNull
        public FolderChooserDialog show() {
            FolderChooserDialog dialog = build();
            dialog.show(this.mContext);
            return dialog;
        }
    }

    @NonNull
    private Builder getBuilder() {
        return (Builder) getArguments().getSerializable("builder");
    }

    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.4.jar:com/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderSorter.class */
    private static class FolderSorter implements Comparator<File> {
        private FolderSorter() {
        }

        @Override // java.util.Comparator
        public int compare(File lhs, File rhs) {
            return lhs.getName().compareTo(rhs.getName());
        }
    }
}
