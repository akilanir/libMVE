package com.mikepenz.aboutlibraries;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.animation.LayoutAnimationController;
import com.mikepenz.aboutlibraries.Libs;
import com.mikepenz.aboutlibraries.entity.Library;
import com.mikepenz.aboutlibraries.ui.item.HeaderItem;
import com.mikepenz.aboutlibraries.ui.item.LibraryItem;

/* loaded from: com.mikepenz.aboutlibraries.5.6.5.jar:com/mikepenz/aboutlibraries/LibsConfiguration.class */
public class LibsConfiguration {
    private static LibsConfiguration SINGLETON = null;
    private LibsListener mListener = null;
    private LibsUIListener mUiListener = null;
    private LibsRecyclerViewListener mRecyclerViewListener = null;
    private LayoutAnimationController mLayoutAnimationController = null;
    private RecyclerView.ItemAnimator mItemAnimator;
    private LibTaskCallback mLibTaskCallback;

    /* loaded from: com.mikepenz.aboutlibraries.5.6.5.jar:com/mikepenz/aboutlibraries/LibsConfiguration$LibsListener.class */
    public interface LibsListener {
        void onIconClicked(View view);

        boolean onLibraryAuthorClicked(View view, Library library);

        boolean onLibraryContentClicked(View view, Library library);

        boolean onLibraryBottomClicked(View view, Library library);

        boolean onExtraClicked(View view, Libs.SpecialButton specialButton);

        boolean onIconLongClicked(View view);

        boolean onLibraryAuthorLongClicked(View view, Library library);

        boolean onLibraryContentLongClicked(View view, Library library);

        boolean onLibraryBottomLongClicked(View view, Library library);
    }

    /* loaded from: com.mikepenz.aboutlibraries.5.6.5.jar:com/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener.class */
    public interface LibsRecyclerViewListener {
        void onBindViewHolder(HeaderItem.ViewHolder viewHolder);

        void onBindViewHolder(LibraryItem.ViewHolder viewHolder);
    }

    /* loaded from: com.mikepenz.aboutlibraries.5.6.5.jar:com/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener.class */
    public interface LibsUIListener {
        View preOnCreateView(View view);

        View postOnCreateView(View view);
    }

    private LibsConfiguration() {
    }

    public static LibsConfiguration getInstance() {
        if (SINGLETON == null) {
            SINGLETON = new LibsConfiguration();
        }
        return SINGLETON;
    }

    public void setListener(LibsListener libsListener) {
        this.mListener = libsListener;
    }

    public LibsListener getListener() {
        return this.mListener;
    }

    public void removeListener() {
        this.mListener = null;
    }

    public LibsUIListener getUiListener() {
        return this.mUiListener;
    }

    public void setUiListener(LibsUIListener uiListener) {
        this.mUiListener = uiListener;
    }

    public void removeUiListener() {
        this.mUiListener = null;
    }

    public LibsRecyclerViewListener getLibsRecyclerViewListener() {
        return this.mRecyclerViewListener;
    }

    public void setLibsRecyclerViewListener(LibsRecyclerViewListener recyclerViewListener) {
        this.mRecyclerViewListener = recyclerViewListener;
    }

    public void removeLibsRecyclerViewListener() {
        this.mRecyclerViewListener = null;
    }

    public LayoutAnimationController getLayoutAnimationController() {
        return this.mLayoutAnimationController;
    }

    public void setLayoutAnimationController(LayoutAnimationController layoutAnimationController) {
        this.mLayoutAnimationController = layoutAnimationController;
    }

    public RecyclerView.ItemAnimator getItemAnimator() {
        return this.mItemAnimator;
    }

    public void setItemAnimator(RecyclerView.ItemAnimator itemAnimator) {
        this.mItemAnimator = itemAnimator;
    }

    public LibTaskCallback getLibTaskCallback() {
        return this.mLibTaskCallback;
    }

    public void setLibTaskCallback(LibTaskCallback mLibTaskCallback) {
        this.mLibTaskCallback = mLibTaskCallback;
    }

    public void reset() {
        SINGLETON = null;
    }

    /* loaded from: com.mikepenz.aboutlibraries.5.6.5.jar:com/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListenerImpl.class */
    public abstract class LibsRecyclerViewListenerImpl implements LibsRecyclerViewListener {
        public LibsRecyclerViewListenerImpl() {
        }

        @Override // com.mikepenz.aboutlibraries.LibsConfiguration.LibsRecyclerViewListener
        public void onBindViewHolder(HeaderItem.ViewHolder headerViewHolder) {
        }

        @Override // com.mikepenz.aboutlibraries.LibsConfiguration.LibsRecyclerViewListener
        public void onBindViewHolder(LibraryItem.ViewHolder holder) {
        }
    }

    /* loaded from: com.mikepenz.aboutlibraries.5.6.5.jar:com/mikepenz/aboutlibraries/LibsConfiguration$LibsListenerImpl.class */
    public abstract class LibsListenerImpl implements LibsListener {
        public LibsListenerImpl() {
        }

        @Override // com.mikepenz.aboutlibraries.LibsConfiguration.LibsListener
        public void onIconClicked(View v) {
        }

        @Override // com.mikepenz.aboutlibraries.LibsConfiguration.LibsListener
        public boolean onLibraryAuthorClicked(View v, Library library) {
            return false;
        }

        @Override // com.mikepenz.aboutlibraries.LibsConfiguration.LibsListener
        public boolean onLibraryContentClicked(View v, Library library) {
            return false;
        }

        @Override // com.mikepenz.aboutlibraries.LibsConfiguration.LibsListener
        public boolean onLibraryBottomClicked(View v, Library library) {
            return false;
        }

        @Override // com.mikepenz.aboutlibraries.LibsConfiguration.LibsListener
        public boolean onExtraClicked(View v, Libs.SpecialButton specialButton) {
            return false;
        }

        @Override // com.mikepenz.aboutlibraries.LibsConfiguration.LibsListener
        public boolean onIconLongClicked(View v) {
            return true;
        }

        @Override // com.mikepenz.aboutlibraries.LibsConfiguration.LibsListener
        public boolean onLibraryAuthorLongClicked(View v, Library library) {
            return true;
        }

        @Override // com.mikepenz.aboutlibraries.LibsConfiguration.LibsListener
        public boolean onLibraryContentLongClicked(View v, Library library) {
            return true;
        }

        @Override // com.mikepenz.aboutlibraries.LibsConfiguration.LibsListener
        public boolean onLibraryBottomLongClicked(View v, Library library) {
            return true;
        }
    }
}
