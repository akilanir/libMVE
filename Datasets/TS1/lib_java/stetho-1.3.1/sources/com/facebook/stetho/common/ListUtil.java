package com.facebook.stetho.common;

import com.facebook.stetho.websocket.Frame;
import java.util.AbstractList;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/ListUtil.class */
public final class ListUtil {

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/ListUtil$ImmutableList.class */
    private interface ImmutableList<E> extends List<E>, RandomAccess {
    }

    private ListUtil() {
    }

    public static <T> boolean identityEquals(List<? extends T> list1, List<? extends T> list2) {
        if (list1 == list2) {
            return true;
        }
        int size = list1.size();
        if (size != list2.size()) {
            return false;
        }
        for (int i = 0; i < size; i++) {
            if (list1.get(i) != list2.get(i)) {
                return false;
            }
        }
        return true;
    }

    public static <T> List<T> copyToImmutableList(List<T> list) {
        if (list instanceof ImmutableList) {
            return list;
        }
        int size = list.size();
        switch (size) {
            case 0:
                return Collections.emptyList();
            case 1:
                return new OneItemImmutableList(list.get(0));
            case Frame.OPCODE_BINARY_FRAME /* 2 */:
                return new TwoItemImmutableList(list.get(0), list.get(1));
            case 3:
                return new ThreeItemImmutableList(list.get(0), list.get(1), list.get(2));
            case 4:
                return new FourItemImmutableList(list.get(0), list.get(1), list.get(2), list.get(3));
            case 5:
                return new FiveItemImmutableList(list.get(0), list.get(1), list.get(2), list.get(3), list.get(4));
            default:
                Object[] array = list.toArray();
                return new ImmutableArrayList(array);
        }
    }

    public static <T> List<T> newImmutableList(T item) {
        return new OneItemImmutableList(item);
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/ListUtil$ImmutableArrayList.class */
    private static final class ImmutableArrayList<E> extends AbstractList<E> implements ImmutableList<E> {
        private final Object[] mArray;

        public ImmutableArrayList(Object[] array) {
            this.mArray = array;
        }

        @Override // java.util.AbstractList, java.util.List
        public E get(int i) {
            return (E) this.mArray[i];
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return this.mArray.length;
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/ListUtil$OneItemImmutableList.class */
    private static final class OneItemImmutableList<E> extends AbstractList<E> implements ImmutableList<E> {
        private final E mItem;

        public OneItemImmutableList(E item) {
            this.mItem = item;
        }

        @Override // java.util.AbstractList, java.util.List
        public E get(int location) {
            if (location == 0) {
                return this.mItem;
            }
            throw new IndexOutOfBoundsException();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return 1;
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/ListUtil$TwoItemImmutableList.class */
    private static final class TwoItemImmutableList<E> extends AbstractList<E> implements ImmutableList<E> {
        private final E mItem0;
        private final E mItem1;

        public TwoItemImmutableList(E item0, E item1) {
            this.mItem0 = item0;
            this.mItem1 = item1;
        }

        @Override // java.util.AbstractList, java.util.List
        public E get(int location) {
            switch (location) {
                case 0:
                    return this.mItem0;
                case 1:
                    return this.mItem1;
                default:
                    throw new IndexOutOfBoundsException();
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return 2;
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/ListUtil$ThreeItemImmutableList.class */
    private static final class ThreeItemImmutableList<E> extends AbstractList<E> implements ImmutableList<E> {
        private final E mItem0;
        private final E mItem1;
        private final E mItem2;

        public ThreeItemImmutableList(E item0, E item1, E item2) {
            this.mItem0 = item0;
            this.mItem1 = item1;
            this.mItem2 = item2;
        }

        @Override // java.util.AbstractList, java.util.List
        public E get(int location) {
            switch (location) {
                case 0:
                    return this.mItem0;
                case 1:
                    return this.mItem1;
                case Frame.OPCODE_BINARY_FRAME /* 2 */:
                    return this.mItem2;
                default:
                    throw new IndexOutOfBoundsException();
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return 3;
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/ListUtil$FourItemImmutableList.class */
    private static final class FourItemImmutableList<E> extends AbstractList<E> implements ImmutableList<E> {
        private final E mItem0;
        private final E mItem1;
        private final E mItem2;
        private final E mItem3;

        public FourItemImmutableList(E item0, E item1, E item2, E item3) {
            this.mItem0 = item0;
            this.mItem1 = item1;
            this.mItem2 = item2;
            this.mItem3 = item3;
        }

        @Override // java.util.AbstractList, java.util.List
        public E get(int location) {
            switch (location) {
                case 0:
                    return this.mItem0;
                case 1:
                    return this.mItem1;
                case Frame.OPCODE_BINARY_FRAME /* 2 */:
                    return this.mItem2;
                case 3:
                    return this.mItem3;
                default:
                    throw new IndexOutOfBoundsException();
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return 4;
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/ListUtil$FiveItemImmutableList.class */
    private static final class FiveItemImmutableList<E> extends AbstractList<E> implements ImmutableList<E> {
        private final E mItem0;
        private final E mItem1;
        private final E mItem2;
        private final E mItem3;
        private final E mItem4;

        public FiveItemImmutableList(E item0, E item1, E item2, E item3, E item4) {
            this.mItem0 = item0;
            this.mItem1 = item1;
            this.mItem2 = item2;
            this.mItem3 = item3;
            this.mItem4 = item4;
        }

        @Override // java.util.AbstractList, java.util.List
        public E get(int location) {
            switch (location) {
                case 0:
                    return this.mItem0;
                case 1:
                    return this.mItem1;
                case Frame.OPCODE_BINARY_FRAME /* 2 */:
                    return this.mItem2;
                case 3:
                    return this.mItem3;
                case 4:
                    return this.mItem4;
                default:
                    throw new IndexOutOfBoundsException();
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return 5;
        }
    }
}
