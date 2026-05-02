package org.springframework.util;

import java.util.List;
import java.util.Map;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/util/MultiValueMap.class */
public interface MultiValueMap<K, V> extends Map<K, List<V>> {
    V getFirst(K k);

    void add(K k, V v);

    void set(K k, V v);

    void setAll(Map<K, V> map);

    Map<K, V> toSingleValueMap();
}
