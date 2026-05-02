package org.ini4j;

import java.util.Map;

/* loaded from: ini4j-0.5.4.jar:org/ini4j/CommentedMap.class */
public interface CommentedMap<K, V> extends Map<K, V> {
    String getComment(Object obj);

    String putComment(K k, String str);

    String removeComment(Object obj);
}
