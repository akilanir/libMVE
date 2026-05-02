package rx.internal.operators;

import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Producer;
import rx.Subscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeRange.class */
public final class OnSubscribeRange implements Observable.OnSubscribe<Integer> {
    private final int start;
    private final int end;

    public OnSubscribeRange(int start, int end) {
        this.start = start;
        this.end = end;
    }

    @Override // rx.functions.Action1
    public void call(Subscriber<? super Integer> o) {
        o.setProducer(new RangeProducer(o, this.start, this.end));
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeRange$RangeProducer.class */
    private static final class RangeProducer implements Producer {
        private final Subscriber<? super Integer> o;
        private volatile long requested;
        private static final AtomicLongFieldUpdater<RangeProducer> REQUESTED_UPDATER = AtomicLongFieldUpdater.newUpdater(RangeProducer.class, "requested");
        private long index;
        private final int end;

        private RangeProducer(Subscriber<? super Integer> o, int start, int end) {
            this.o = o;
            this.index = start;
            this.end = end;
        }

        /* JADX WARN: Code restructure failed: missing block: B:32:0x00d9, code lost:
        
            r5.index = r0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:33:0x00e1, code lost:
        
            if (r18 == false) goto L36;
         */
        /* JADX WARN: Code restructure failed: missing block: B:34:0x00e4, code lost:
        
            r5.o.onCompleted();
         */
        /* JADX WARN: Code restructure failed: missing block: B:35:0x00eb, code lost:
        
            return;
         */
        @Override // rx.Producer
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void request(long r6) {
            /*
                Method dump skipped, instructions count: 256
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: rx.internal.operators.OnSubscribeRange.RangeProducer.request(long):void");
        }
    }
}
