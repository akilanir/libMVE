package org.acra.file;

import android.support.annotation.NonNull;
import java.io.File;
import java.util.Comparator;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/file/LastModifiedComparator.class */
final class LastModifiedComparator implements Comparator<File> {
    LastModifiedComparator() {
    }

    @Override // java.util.Comparator
    public int compare(@NonNull File lhs, @NonNull File rhs) {
        return (int) (lhs.lastModified() - rhs.lastModified());
    }
}
