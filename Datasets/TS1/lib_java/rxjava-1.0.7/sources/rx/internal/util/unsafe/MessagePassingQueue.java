package rx.internal.util.unsafe;

/* loaded from: rxjava-1.0.7.jar:rx/internal/util/unsafe/MessagePassingQueue.class */
interface MessagePassingQueue<M> {
    boolean offer(M m);

    M poll();

    M peek();

    int size();

    boolean isEmpty();
}
