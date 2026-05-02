package rx.observers;

import rx.Observer;
import rx.exceptions.Exceptions;

/* loaded from: rxjava-1.0.7.jar:rx/observers/SerializedObserver.class */
public class SerializedObserver<T> implements Observer<T> {
    private final Observer<? super T> actual;
    private boolean emitting = false;
    private boolean terminated = false;
    private FastList queue;
    private static final int MAX_DRAIN_ITERATION = Integer.MAX_VALUE;
    private static final Object NULL_SENTINEL = new Object();
    private static final Object COMPLETE_SENTINEL = new Object();

    /* loaded from: rxjava-1.0.7.jar:rx/observers/SerializedObserver$FastList.class */
    static final class FastList {
        Object[] array;
        int size;

        FastList() {
        }

        public void add(Object o) {
            int s = this.size;
            Object[] a = this.array;
            if (a == null) {
                a = new Object[16];
                this.array = a;
            } else if (s == a.length) {
                Object[] array2 = new Object[s + (s >> 2)];
                System.arraycopy(a, 0, array2, 0, s);
                a = array2;
                this.array = a;
            }
            a[s] = o;
            this.size = s + 1;
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/observers/SerializedObserver$ErrorSentinel.class */
    private static final class ErrorSentinel {
        final Throwable e;

        ErrorSentinel(Throwable e) {
            this.e = e;
        }
    }

    public SerializedObserver(Observer<? super T> s) {
        this.actual = s;
    }

    @Override // rx.Observer
    public void onCompleted() {
        synchronized (this) {
            if (this.terminated) {
                return;
            }
            this.terminated = true;
            if (this.emitting) {
                if (this.queue == null) {
                    this.queue = new FastList();
                }
                this.queue.add(COMPLETE_SENTINEL);
            } else {
                this.emitting = true;
                FastList list = this.queue;
                this.queue = null;
                drainQueue(list);
                this.actual.onCompleted();
            }
        }
    }

    @Override // rx.Observer
    public void onError(Throwable e) {
        Exceptions.throwIfFatal(e);
        synchronized (this) {
            if (this.terminated) {
                return;
            }
            if (this.emitting) {
                if (this.queue == null) {
                    this.queue = new FastList();
                }
                this.queue.add(new ErrorSentinel(e));
                return;
            }
            this.emitting = true;
            FastList list = this.queue;
            this.queue = null;
            drainQueue(list);
            this.actual.onError(e);
            synchronized (this) {
                this.emitting = false;
            }
        }
    }

    @Override // rx.Observer
    public void onNext(T t) {
        synchronized (this) {
            if (this.terminated) {
                return;
            }
            if (this.emitting) {
                if (this.queue == null) {
                    this.queue = new FastList();
                }
                this.queue.add(t != null ? t : NULL_SENTINEL);
                return;
            }
            this.emitting = true;
            FastList list = this.queue;
            this.queue = null;
            boolean skipFinal = false;
            int iter = MAX_DRAIN_ITERATION;
            do {
                try {
                    drainQueue(list);
                    if (iter == MAX_DRAIN_ITERATION) {
                        this.actual.onNext(t);
                    }
                    iter--;
                    if (iter > 0) {
                        synchronized (this) {
                            list = this.queue;
                            this.queue = null;
                            if (list == null) {
                                this.emitting = false;
                                skipFinal = true;
                                if (1 == 0) {
                                    synchronized (this) {
                                        if (this.terminated) {
                                            FastList fastList = this.queue;
                                            this.queue = null;
                                        } else {
                                            this.emitting = false;
                                        }
                                    }
                                    return;
                                }
                                return;
                            }
                        }
                    }
                } catch (Throwable th) {
                    if (!skipFinal) {
                        synchronized (this) {
                            if (this.terminated) {
                                FastList fastList2 = this.queue;
                                this.queue = null;
                            } else {
                                this.emitting = false;
                            }
                        }
                    }
                    throw th;
                }
            } while (iter > 0);
            if (0 == 0) {
                synchronized (this) {
                    if (this.terminated) {
                        list = this.queue;
                        this.queue = null;
                    } else {
                        this.emitting = false;
                        list = null;
                    }
                }
            }
            drainQueue(list);
        }
    }

    void drainQueue(FastList list) {
        Object v;
        if (list == null || list.size == 0) {
            return;
        }
        Object[] arr$ = list.array;
        int len$ = arr$.length;
        for (int i$ = 0; i$ < len$ && (v = arr$[i$]) != null; i$++) {
            if (v == NULL_SENTINEL) {
                this.actual.onNext(null);
            } else if (v == COMPLETE_SENTINEL) {
                this.actual.onCompleted();
            } else if (v.getClass() == ErrorSentinel.class) {
                this.actual.onError(((ErrorSentinel) v).e);
            } else {
                this.actual.onNext(v);
            }
        }
    }
}
