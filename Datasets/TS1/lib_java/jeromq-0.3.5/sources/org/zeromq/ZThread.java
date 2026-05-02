package org.zeromq;

import org.zeromq.ZMQ;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZThread.class */
public class ZThread {

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZThread$IAttachedRunnable.class */
    public interface IAttachedRunnable {
        void run(Object[] objArr, ZContext zContext, ZMQ.Socket socket);
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZThread$IDetachedRunnable.class */
    public interface IDetachedRunnable {
        void run(Object[] objArr);
    }

    private ZThread() {
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZThread$ShimThread.class */
    private static class ShimThread extends Thread {
        private ZContext ctx;
        private IAttachedRunnable attachedRunnable;
        private IDetachedRunnable detachedRunnable;
        private Object[] args;
        private ZMQ.Socket pipe;
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !ZThread.class.desiredAssertionStatus();
        }

        protected ShimThread(ZContext ctx, IAttachedRunnable runnable, Object[] args, ZMQ.Socket pipe) {
            if (!$assertionsDisabled && ctx == null) {
                throw new AssertionError();
            }
            if (!$assertionsDisabled && pipe == null) {
                throw new AssertionError();
            }
            if (!$assertionsDisabled && runnable == null) {
                throw new AssertionError();
            }
            this.ctx = ctx;
            this.attachedRunnable = runnable;
            this.args = args;
            this.pipe = pipe;
        }

        public ShimThread(IDetachedRunnable runnable, Object[] args) {
            if (!$assertionsDisabled && runnable == null) {
                throw new AssertionError();
            }
            this.detachedRunnable = runnable;
            this.args = args;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            if (this.attachedRunnable != null) {
                this.attachedRunnable.run(this.args, this.ctx, this.pipe);
                this.ctx.destroy();
            } else {
                this.detachedRunnable.run(this.args);
            }
        }
    }

    public static void start(IDetachedRunnable runnable, Object... args) {
        Thread shim = new ShimThread(runnable, args);
        shim.setDaemon(true);
        shim.start();
    }

    public static ZMQ.Socket fork(ZContext ctx, IAttachedRunnable runnable, Object... args) {
        ZMQ.Socket pipe = ctx.createSocket(0);
        if (pipe != null) {
            pipe.bind(String.format("inproc://zctx-pipe-%d", Integer.valueOf(pipe.hashCode())));
            ZContext ccontext = ZContext.shadow(ctx);
            ZMQ.Socket cpipe = ccontext.createSocket(0);
            if (cpipe == null) {
                return null;
            }
            cpipe.connect(String.format("inproc://zctx-pipe-%d", Integer.valueOf(pipe.hashCode())));
            Thread shim = new ShimThread(ccontext, runnable, args, cpipe);
            shim.start();
            return pipe;
        }
        return null;
    }
}
