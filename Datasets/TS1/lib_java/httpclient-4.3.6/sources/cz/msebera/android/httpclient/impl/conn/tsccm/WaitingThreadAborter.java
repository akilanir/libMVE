package cz.msebera.android.httpclient.impl.conn.tsccm;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/conn/tsccm/WaitingThreadAborter.class */
public class WaitingThreadAborter {
    private WaitingThread waitingThread;
    private boolean aborted;

    public void abort() {
        this.aborted = true;
        if (this.waitingThread != null) {
            this.waitingThread.interrupt();
        }
    }

    public void setWaitingThread(WaitingThread waitingThread) {
        this.waitingThread = waitingThread;
        if (this.aborted) {
            waitingThread.interrupt();
        }
    }
}
