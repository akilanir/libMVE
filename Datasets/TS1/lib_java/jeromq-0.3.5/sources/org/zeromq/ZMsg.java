package org.zeromq;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayDeque;
import java.util.Collection;
import java.util.Deque;
import java.util.Iterator;
import java.util.NoSuchElementException;
import org.zeromq.ZMQ;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZMsg.class */
public class ZMsg implements Iterable<ZFrame>, Deque<ZFrame> {
    private ArrayDeque<ZFrame> frames = new ArrayDeque<>();

    public void destroy() {
        if (this.frames == null) {
            return;
        }
        Iterator i$ = this.frames.iterator();
        while (i$.hasNext()) {
            ZFrame f = i$.next();
            f.destroy();
        }
        this.frames.clear();
        this.frames = null;
    }

    public long contentSize() {
        long size = 0;
        Iterator i$ = this.frames.iterator();
        while (i$.hasNext()) {
            ZFrame f = i$.next();
            size += f.size();
        }
        return size;
    }

    public void addString(String str) {
        if (this.frames == null) {
            this.frames = new ArrayDeque<>();
        }
        this.frames.add(new ZFrame(str));
    }

    public ZMsg duplicate() {
        if (this.frames != null) {
            ZMsg msg = new ZMsg();
            Iterator i$ = this.frames.iterator();
            while (i$.hasNext()) {
                ZFrame f = i$.next();
                msg.add(f.duplicate());
            }
            return msg;
        }
        return null;
    }

    public void wrap(ZFrame frame) {
        if (frame != null) {
            push(new ZFrame(""));
            push(frame);
        }
    }

    public ZFrame unwrap() {
        if (size() == 0) {
            return null;
        }
        ZFrame f = pop();
        ZFrame empty = getFirst();
        if (empty.hasData() && empty.size() == 0) {
            pop().destroy();
        }
        return f;
    }

    public boolean send(ZMQ.Socket socket) {
        return send(socket, true);
    }

    public boolean send(ZMQ.Socket socket, boolean destroy) {
        if (socket == null) {
            throw new IllegalArgumentException("socket is null");
        }
        if (this.frames == null) {
            throw new IllegalArgumentException("destroyed message");
        }
        if (this.frames.size() == 0) {
            return true;
        }
        boolean ret = true;
        Iterator<ZFrame> i = this.frames.iterator();
        while (i.hasNext()) {
            ZFrame f = i.next();
            ret = f.sendAndKeep(socket, i.hasNext() ? 2 : 0);
        }
        if (destroy) {
            destroy();
        }
        return ret;
    }

    public static ZMsg recvMsg(ZMQ.Socket socket) {
        return recvMsg(socket, 0);
    }

    public static ZMsg recvMsg(ZMQ.Socket socket, int flag) {
        if (socket == null) {
            throw new IllegalArgumentException("socket is null");
        }
        ZMsg msg = new ZMsg();
        while (true) {
            ZFrame f = ZFrame.recvFrame(socket, flag);
            if (f == null) {
                msg.destroy();
                msg = null;
                break;
            }
            msg.add(f);
            if (!f.hasMore()) {
                break;
            }
        }
        return msg;
    }

    public static boolean save(ZMsg msg, DataOutputStream file) {
        if (msg == null) {
            return false;
        }
        try {
            file.writeInt(msg.size());
            if (msg.size() > 0) {
                Iterator i$ = msg.iterator();
                while (i$.hasNext()) {
                    ZFrame f = i$.next();
                    file.writeInt(f.size());
                    file.write(f.getData());
                }
                return true;
            }
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    public static ZMsg load(DataInputStream file) {
        if (file == null) {
            return null;
        }
        ZMsg rcvMsg = new ZMsg();
        try {
            int msgSize = file.readInt();
            if (msgSize > 0) {
                int msgNbr = 0;
                while (true) {
                    msgNbr++;
                    if (msgNbr > msgSize) {
                        break;
                    }
                    int frameSize = file.readInt();
                    byte[] data = new byte[frameSize];
                    file.read(data);
                    rcvMsg.add(new ZFrame(data));
                }
            }
            return rcvMsg;
        } catch (IOException e) {
            return null;
        }
    }

    public static ZMsg newStringMsg(String... strings) {
        ZMsg msg = new ZMsg();
        for (String data : strings) {
            msg.addString(data);
        }
        return msg;
    }

    @Override // java.util.Collection
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ZMsg zMsg = (ZMsg) o;
        if (this.frames == null || zMsg.frames == null) {
            return false;
        }
        Iterator<ZFrame> e1 = this.frames.iterator();
        Iterator<ZFrame> e2 = zMsg.frames.iterator();
        while (e1.hasNext() && e2.hasNext()) {
            ZFrame o1 = e1.next();
            ZFrame o2 = e2.next();
            if (o1 == null) {
                if (o2 != null) {
                    return false;
                }
            } else if (!o1.equals(o2)) {
                return false;
            }
        }
        return (e1.hasNext() || e2.hasNext()) ? false : true;
    }

    @Override // java.util.Collection
    public int hashCode() {
        if (this.frames == null || this.frames.size() == 0) {
            return 0;
        }
        int result = 1;
        Iterator i$ = this.frames.iterator();
        while (i$.hasNext()) {
            ZFrame frame = i$.next();
            result = (31 * result) + (frame == null ? 0 : frame.hashCode());
        }
        return result;
    }

    public void dump(Appendable out) {
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            pw.printf("--------------------------------------\n", new Object[0]);
            Iterator i$ = this.frames.iterator();
            while (i$.hasNext()) {
                ZFrame frame = i$.next();
                pw.printf("[%03d] %s\n", Integer.valueOf(frame.size()), frame.toString());
            }
            out.append(sw.getBuffer());
            sw.close();
        } catch (IOException e) {
            throw new RuntimeException("Message dump exception " + super.toString(), e);
        }
    }

    public void dump() {
        dump(System.out);
    }

    public void addFirst(String stringValue) {
        addFirst(new ZFrame(stringValue));
    }

    public void addFirst(byte[] data) {
        addFirst(new ZFrame(data));
    }

    public void addLast(String stringValue) {
        addLast(new ZFrame(stringValue));
    }

    public void addLast(byte[] data) {
        addLast(new ZFrame(data));
    }

    public void push(String str) {
        push(new ZFrame(str));
    }

    public void push(byte[] data) {
        push(new ZFrame(data));
    }

    public boolean add(String stringValue) {
        return add(new ZFrame(stringValue));
    }

    public boolean add(byte[] data) {
        return add(new ZFrame(data));
    }

    @Override // java.lang.Iterable, java.util.Deque, java.util.Collection
    public Iterator<ZFrame> iterator() {
        return this.frames.iterator();
    }

    @Override // java.util.Deque, java.util.Collection
    public boolean addAll(Collection<? extends ZFrame> arg0) {
        return this.frames.addAll(arg0);
    }

    @Override // java.util.Collection
    public void clear() {
        this.frames.clear();
    }

    @Override // java.util.Collection
    public boolean containsAll(Collection<?> arg0) {
        return this.frames.containsAll(arg0);
    }

    @Override // java.util.Collection
    public boolean isEmpty() {
        return this.frames.isEmpty();
    }

    @Override // java.util.Collection
    public boolean removeAll(Collection<?> arg0) {
        return this.frames.removeAll(arg0);
    }

    @Override // java.util.Collection
    public boolean retainAll(Collection<?> arg0) {
        return this.frames.retainAll(arg0);
    }

    @Override // java.util.Collection
    public Object[] toArray() {
        return this.frames.toArray();
    }

    @Override // java.util.Collection
    public <T> T[] toArray(T[] tArr) {
        return (T[]) this.frames.toArray(tArr);
    }

    @Override // java.util.Deque, java.util.Queue, java.util.Collection
    public boolean add(ZFrame e) {
        if (this.frames == null) {
            this.frames = new ArrayDeque<>();
        }
        return this.frames.add(e);
    }

    @Override // java.util.Deque
    public void addFirst(ZFrame e) {
        if (this.frames == null) {
            this.frames = new ArrayDeque<>();
        }
        this.frames.addFirst(e);
    }

    @Override // java.util.Deque
    public void addLast(ZFrame e) {
        if (this.frames == null) {
            this.frames = new ArrayDeque<>();
        }
        this.frames.addLast(e);
    }

    @Override // java.util.Deque, java.util.Collection
    public boolean contains(Object o) {
        return this.frames.contains(o);
    }

    @Override // java.util.Deque
    public Iterator<ZFrame> descendingIterator() {
        return this.frames.descendingIterator();
    }

    @Override // java.util.Deque, java.util.Queue
    public ZFrame element() {
        return this.frames.element();
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Deque
    public ZFrame getFirst() {
        try {
            return this.frames.getFirst();
        } catch (NoSuchElementException e) {
            return null;
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Deque
    public ZFrame getLast() {
        try {
            return this.frames.getLast();
        } catch (NoSuchElementException e) {
            return null;
        }
    }

    @Override // java.util.Deque, java.util.Queue
    public boolean offer(ZFrame e) {
        if (this.frames == null) {
            this.frames = new ArrayDeque<>();
        }
        return this.frames.offer(e);
    }

    @Override // java.util.Deque
    public boolean offerFirst(ZFrame e) {
        if (this.frames == null) {
            this.frames = new ArrayDeque<>();
        }
        return this.frames.offerFirst(e);
    }

    @Override // java.util.Deque
    public boolean offerLast(ZFrame e) {
        if (this.frames == null) {
            this.frames = new ArrayDeque<>();
        }
        return this.frames.offerLast(e);
    }

    @Override // java.util.Deque, java.util.Queue
    public ZFrame peek() {
        return this.frames.peek();
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Deque
    public ZFrame peekFirst() {
        try {
            return this.frames.peekFirst();
        } catch (NoSuchElementException e) {
            return null;
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Deque
    public ZFrame peekLast() {
        try {
            return this.frames.peekLast();
        } catch (NoSuchElementException e) {
            return null;
        }
    }

    @Override // java.util.Deque, java.util.Queue
    public ZFrame poll() {
        return this.frames.poll();
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Deque
    public ZFrame pollFirst() {
        return this.frames.pollFirst();
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Deque
    public ZFrame pollLast() {
        return this.frames.pollLast();
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Deque
    public ZFrame pop() {
        if (this.frames == null) {
            this.frames = new ArrayDeque<>();
        }
        try {
            return this.frames.pop();
        } catch (NoSuchElementException e) {
            return null;
        }
    }

    public String popString() {
        ZFrame frame = pop();
        if (frame == null) {
            return null;
        }
        return frame.toString();
    }

    @Override // java.util.Deque
    public void push(ZFrame e) {
        if (this.frames == null) {
            this.frames = new ArrayDeque<>();
        }
        this.frames.push(e);
    }

    @Override // java.util.Deque, java.util.Queue
    public ZFrame remove() {
        return this.frames.remove();
    }

    @Override // java.util.Deque, java.util.Collection
    public boolean remove(Object o) {
        return this.frames.remove(o);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Deque
    public ZFrame removeFirst() {
        try {
            return this.frames.removeFirst();
        } catch (NoSuchElementException e) {
            return null;
        }
    }

    @Override // java.util.Deque
    public boolean removeFirstOccurrence(Object o) {
        return this.frames.removeFirstOccurrence(o);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Deque
    public ZFrame removeLast() {
        try {
            return this.frames.removeLast();
        } catch (NoSuchElementException e) {
            return null;
        }
    }

    @Override // java.util.Deque
    public boolean removeLastOccurrence(Object o) {
        return this.frames.removeLastOccurrence(o);
    }

    @Override // java.util.Deque, java.util.Collection
    public int size() {
        return this.frames.size();
    }

    public String toString() {
        StringBuilder out = new StringBuilder("[ ");
        Iterator<ZFrame> frameIterator = this.frames.iterator();
        while (frameIterator.hasNext()) {
            out.append(frameIterator.next());
            if (frameIterator.hasNext()) {
                out.append(", ");
            }
        }
        out.append(" ]");
        return out.toString();
    }
}
