package nl.qbusict.cupboard;

import android.database.Cursor;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import nl.qbusict.cupboard.convert.EntityConverter;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/QueryResultIterable.class */
public class QueryResultIterable<T> implements Iterable<T> {
    private final Cursor mCursor;
    private final EntityConverter<T> mTranslator;
    private final int mPosition;

    QueryResultIterable(Cursor cursor, EntityConverter<T> translator) {
        if (cursor.getPosition() > -1) {
            this.mPosition = cursor.getPosition();
        } else {
            this.mPosition = -1;
        }
        this.mCursor = cursor;
        this.mTranslator = translator;
    }

    @Override // java.lang.Iterable
    public Iterator<T> iterator() {
        this.mCursor.moveToPosition(this.mPosition);
        return new QueryResultIterator(this.mCursor, this.mTranslator);
    }

    public void close() {
        if (!this.mCursor.isClosed()) {
            this.mCursor.close();
        }
    }

    public Cursor getCursor() {
        return this.mCursor;
    }

    public T get() {
        return get(true);
    }

    public T get(boolean close) {
        try {
            Iterator<T> itr = iterator();
            if (itr.hasNext()) {
                T next = itr.next();
                if (close) {
                    close();
                }
                return next;
            }
            return null;
        } finally {
            if (close) {
                close();
            }
        }
    }

    public List<T> list() {
        return list(true);
    }

    public List<T> list(boolean close) {
        List<T> result = new ArrayList<>(this.mCursor.getCount());
        try {
            Iterator i$ = iterator();
            while (i$.hasNext()) {
                T obj = i$.next();
                result.add(obj);
            }
            return result;
        } finally {
            if (close) {
                close();
            }
        }
    }

    /* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/QueryResultIterable$QueryResultIterator.class */
    static class QueryResultIterator<E> implements Iterator<E> {
        private final Cursor mCursor;
        private final EntityConverter<E> mTranslator;
        private boolean mHasNext;

        public QueryResultIterator(Cursor cursor, EntityConverter<E> translator) {
            this.mCursor = new PreferredColumnOrderCursorWrapper(cursor, translator.getColumns());
            this.mTranslator = translator;
            if (cursor.getPosition() == -1) {
                this.mHasNext = cursor.moveToNext();
            } else {
                this.mHasNext = cursor.getPosition() < cursor.getCount();
            }
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.mHasNext;
        }

        @Override // java.util.Iterator
        public E next() {
            if (!this.mHasNext) {
                throw new NoSuchElementException();
            }
            E elem = this.mTranslator.fromCursor(this.mCursor);
            this.mHasNext = this.mCursor.moveToNext();
            return elem;
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException();
        }
    }
}
