package ch.qos.logback.core.spi;

import ch.qos.logback.core.helpers.CyclicBuffer;
import java.util.ArrayList;
import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/spi/CyclicBufferTracker.class */
public class CyclicBufferTracker<E> extends AbstractComponentTracker<CyclicBuffer<E>> {
    static final int DEFAULT_NUMBER_OF_BUFFERS = 64;
    static final int DEFAULT_BUFFER_SIZE = 256;
    int bufferSize = 256;

    public CyclicBufferTracker() {
        setMaxComponents(64);
    }

    public int getBufferSize() {
        return this.bufferSize;
    }

    public void setBufferSize(int i) {
        this.bufferSize = i;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ch.qos.logback.core.spi.AbstractComponentTracker
    public void processPriorToRemoval(CyclicBuffer<E> cyclicBuffer) {
        cyclicBuffer.clear();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ch.qos.logback.core.spi.AbstractComponentTracker
    public CyclicBuffer<E> buildComponent(String str) {
        return new CyclicBuffer<>(this.bufferSize);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ch.qos.logback.core.spi.AbstractComponentTracker
    public boolean isComponentStale(CyclicBuffer<E> cyclicBuffer) {
        return false;
    }

    List<String> liveKeysAsOrderedList() {
        return new ArrayList(this.liveMap.keySet());
    }

    List<String> lingererKeysAsOrderedList() {
        return new ArrayList(this.lingerersMap.keySet());
    }
}
