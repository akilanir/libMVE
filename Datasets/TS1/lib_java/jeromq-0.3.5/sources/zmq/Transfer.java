package zmq;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.WritableByteChannel;

/* loaded from: jeromq-0.3.5.jar:zmq/Transfer.class */
public interface Transfer {
    int transferTo(WritableByteChannel writableByteChannel) throws IOException;

    int remaining();

    /* loaded from: jeromq-0.3.5.jar:zmq/Transfer$ByteBufferTransfer.class */
    public static class ByteBufferTransfer implements Transfer {
        private ByteBuffer buf;

        public ByteBufferTransfer(ByteBuffer buf) {
            this.buf = buf;
        }

        @Override // zmq.Transfer
        public final int transferTo(WritableByteChannel s) throws IOException {
            return s.write(this.buf);
        }

        @Override // zmq.Transfer
        public final int remaining() {
            return this.buf.remaining();
        }
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/Transfer$FileChannelTransfer.class */
    public static class FileChannelTransfer implements Transfer {
        private Transfer parent;
        private FileChannel channel;
        private long position;
        private long count;
        private int remaining;

        public FileChannelTransfer(ByteBuffer buf, FileChannel channel, long position, long count) {
            this.parent = new ByteBufferTransfer(buf);
            this.channel = channel;
            this.position = position;
            this.count = count;
            this.remaining = this.parent.remaining() + ((int) this.count);
        }

        @Override // zmq.Transfer
        public final int transferTo(WritableByteChannel s) throws IOException {
            int sent = 0;
            if (this.parent.remaining() > 0) {
                sent = this.parent.transferTo(s);
            }
            if (this.parent.remaining() == 0) {
                long fileSent = this.channel.transferTo(this.position, this.count, s);
                this.position += fileSent;
                this.count -= fileSent;
                sent = (int) (sent + fileSent);
            }
            this.remaining -= sent;
            if (this.remaining == 0) {
                this.channel.close();
            }
            return sent;
        }

        @Override // zmq.Transfer
        public final int remaining() {
            return this.remaining;
        }
    }
}
