package com.mikepenz.aboutlibraries;

import android.view.View;
import android.view.animation.LayoutAnimationController;
import com.mikepenz.aboutlibraries.Libs;
import com.mikepenz.aboutlibraries.entity.Library;

/* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/LibsConfiguration.class */
public class LibsConfiguration {
    private static LibsConfiguration SINGLETON = null;
    private LibsListener listener = null;
    private LibsUIListener uiListener = null;
    private LayoutAnimationController layoutAnimationController = null;

    /* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/LibsConfiguration$LibsListener.class */
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

    /* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener.class */
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
        this.listener = libsListener;
    }

    public LibsListener getListener() {
        return this.listener;
    }

    public void removeListener() {
        this.listener = null;
    }

    public LibsUIListener getUiListener() {
        return this.uiListener;
    }

    public void setUiListener(LibsUIListener uiListener) {
        this.uiListener = uiListener;
    }

    public void removeUiListener() {
        this.uiListener = null;
    }

    public LayoutAnimationController getLayoutAnimationController() {
        return this.layoutAnimationController;
    }

    public void setLayoutAnimationController(LayoutAnimationController layoutAnimationController) {
        this.layoutAnimationController = layoutAnimationController;
    }

    public void reset() {
        SINGLETON = null;
    }

    /* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/LibsConfiguration$LibsListenerImpl.class */
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
