package org.acra.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.android.internal.util.Predicate;
import java.io.BufferedReader;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.List;
import org.acra.ACRAConstants;
import org.acra.collections.BoundedLinkedList;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/util/IOUtils.class */
public final class IOUtils {
    private static final Predicate<String> DEFAULT_FILTER = new Predicate<String>() { // from class: org.acra.util.IOUtils.1
        public boolean apply(String s) {
            return true;
        }
    };
    private static final int NO_LIMIT = -1;

    private IOUtils() {
    }

    public static void safeClose(@Nullable Closeable closeable) {
        if (closeable == null) {
            return;
        }
        try {
            closeable.close();
        } catch (IOException e) {
        }
    }

    @NonNull
    public static String streamToString(@NonNull InputStream input) throws IOException {
        return streamToString(input, DEFAULT_FILTER, NO_LIMIT);
    }

    @NonNull
    public static String streamToString(@NonNull InputStream input, Predicate<String> filter) throws IOException {
        return streamToString(input, filter, NO_LIMIT);
    }

    @NonNull
    public static String streamToString(@NonNull InputStream input, int limit) throws IOException {
        return streamToString(input, DEFAULT_FILTER, limit);
    }

    @NonNull
    public static String streamToString(@NonNull InputStream input, Predicate<String> filter, int limit) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(input), ACRAConstants.DEFAULT_BUFFER_SIZE_IN_BYTES);
        try {
            List<String> buffer = limit == NO_LIMIT ? new LinkedList<>() : new BoundedLinkedList<>(limit);
            while (true) {
                String line = reader.readLine();
                if (line != null) {
                    if (filter.apply(line)) {
                        buffer.add(line);
                    }
                } else {
                    String join = TextUtils.join("\n", buffer);
                    safeClose(reader);
                    return join;
                }
            }
        } catch (Throwable th) {
            safeClose(reader);
            throw th;
        }
    }
}
