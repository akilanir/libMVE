package com.mikepenz.fastadapter;

import com.mikepenz.fastadapter.IItem;

/* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/IDraggable.class */
public interface IDraggable<T, Item extends IItem> {
    boolean isDraggable();

    T withIsDraggable(boolean z);
}
