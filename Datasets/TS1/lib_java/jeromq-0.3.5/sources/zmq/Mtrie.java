package zmq;

import java.util.HashSet;
import java.util.Set;

/* loaded from: jeromq-0.3.5.jar:zmq/Mtrie.class */
public class Mtrie {
    static final /* synthetic */ boolean $assertionsDisabled;
    private int min = 0;
    private int count = 0;
    private int liveNodes = 0;
    private Set<Pipe> pipes = null;
    private Mtrie[] next = null;

    /* loaded from: jeromq-0.3.5.jar:zmq/Mtrie$IMtrieHandler.class */
    public interface IMtrieHandler {
        void invoke(Pipe pipe, byte[] bArr, int i, Object obj);
    }

    static {
        $assertionsDisabled = !Mtrie.class.desiredAssertionStatus();
    }

    public boolean add(byte[] prefix, Pipe pipe) {
        return addHelper(prefix, 0, pipe);
    }

    public boolean add(byte[] prefix, int start, Pipe pipe) {
        return addHelper(prefix, start, pipe);
    }

    private boolean addHelper(byte[] prefix, int start, Pipe pipe) {
        if (prefix == null || prefix.length == start) {
            boolean result = this.pipes == null;
            if (this.pipes == null) {
                this.pipes = new HashSet();
            }
            this.pipes.add(pipe);
            return result;
        }
        byte c = prefix[start];
        if (c < this.min || c >= this.min + this.count) {
            if (this.count == 0) {
                this.min = c;
                this.count = 1;
                this.next = null;
            } else if (this.count == 1) {
                int oldc = this.min;
                Mtrie oldp = this.next[0];
                this.count = (this.min < c ? c - this.min : this.min - c) + 1;
                this.next = new Mtrie[this.count];
                this.min = Math.min(this.min, (int) c);
                this.next[oldc - this.min] = oldp;
            } else if (this.min < c) {
                this.count = (c - this.min) + 1;
                this.next = realloc(this.next, this.count, true);
            } else {
                this.count = (this.min + this.count) - c;
                this.next = realloc(this.next, this.count, false);
                this.min = c;
            }
        }
        if (this.count == 1) {
            if (this.next == null) {
                this.next = new Mtrie[1];
                this.next[0] = new Mtrie();
                this.liveNodes++;
            }
            return this.next[0].addHelper(prefix, start + 1, pipe);
        }
        if (this.next[c - this.min] == null) {
            this.next[c - this.min] = new Mtrie();
            this.liveNodes++;
        }
        return this.next[c - this.min].addHelper(prefix, start + 1, pipe);
    }

    private Mtrie[] realloc(Mtrie[] table, int size, boolean ended) {
        return (Mtrie[]) Utils.realloc(Mtrie.class, table, size, ended);
    }

    public boolean rm(Pipe pipe, IMtrieHandler func, Object arg) {
        return rmHelper(pipe, new byte[0], 0, 0, func, arg);
    }

    private boolean rmHelper(Pipe pipe, byte[] buff, int buffsize, int maxBuffSize, IMtrieHandler func, Object arg) {
        if (this.pipes != null && this.pipes.remove(pipe) && this.pipes.isEmpty()) {
            func.invoke(null, buff, buffsize, arg);
            this.pipes = null;
        }
        if (buffsize >= maxBuffSize) {
            maxBuffSize = buffsize + 256;
            buff = Utils.realloc(buff, maxBuffSize);
        }
        if (this.count == 0) {
            return true;
        }
        if (this.count == 1) {
            buff[buffsize] = (byte) this.min;
            this.next[0].rmHelper(pipe, buff, buffsize + 1, maxBuffSize, func, arg);
            if (this.next[0].isRedundant()) {
                this.next = null;
                this.count = 0;
                this.liveNodes--;
                if ($assertionsDisabled || this.liveNodes == 0) {
                    return true;
                }
                throw new AssertionError();
            }
            return true;
        }
        int newMin = (this.min + this.count) - 1;
        int newMax = this.min;
        for (int c = 0; c != this.count; c++) {
            buff[buffsize] = (byte) (this.min + c);
            if (this.next[c] != null) {
                this.next[c].rmHelper(pipe, buff, buffsize + 1, maxBuffSize, func, arg);
                if (this.next[c].isRedundant()) {
                    this.next[c] = null;
                    if (!$assertionsDisabled && this.liveNodes <= 0) {
                        throw new AssertionError();
                    }
                    this.liveNodes--;
                } else {
                    if (c + this.min < newMin) {
                        newMin = c + this.min;
                    }
                    if (c + this.min > newMax) {
                        newMax = c + this.min;
                    }
                }
            }
        }
        if (!$assertionsDisabled && this.count <= 1) {
            throw new AssertionError();
        }
        if (this.liveNodes == 0) {
            this.next = null;
            this.count = 0;
            return true;
        }
        if (this.liveNodes == 1) {
            if (!$assertionsDisabled && newMin != newMax) {
                throw new AssertionError();
            }
            if (!$assertionsDisabled && (newMin < this.min || newMin >= this.min + this.count)) {
                throw new AssertionError();
            }
            Mtrie node = this.next[newMin - this.min];
            if (!$assertionsDisabled && node == null) {
                throw new AssertionError();
            }
            this.next = null;
            this.next = new Mtrie[]{node};
            this.count = 1;
            this.min = newMin;
            return true;
        }
        if (newMin > this.min || newMax < (this.min + this.count) - 1) {
            if (!$assertionsDisabled && (newMax - newMin) + 1 <= 1) {
                throw new AssertionError();
            }
            Mtrie[] oldTable = this.next;
            if (!$assertionsDisabled && newMin <= this.min && newMax >= (this.min + this.count) - 1) {
                throw new AssertionError();
            }
            if (!$assertionsDisabled && newMin < this.min) {
                throw new AssertionError();
            }
            if (!$assertionsDisabled && newMax > (this.min + this.count) - 1) {
                throw new AssertionError();
            }
            if (!$assertionsDisabled && (newMax - newMin) + 1 >= this.count) {
                throw new AssertionError();
            }
            this.count = (newMax - newMin) + 1;
            this.next = new Mtrie[this.count];
            System.arraycopy(oldTable, newMin - this.min, this.next, 0, this.count);
            this.min = newMin;
            return true;
        }
        return true;
    }

    public boolean rm(byte[] prefix, int start, Pipe pipe) {
        return rmHelper(prefix, start, pipe);
    }

    private boolean rmHelper(byte[] prefix, int start, Pipe pipe) {
        if (prefix == null || prefix.length == start) {
            if (this.pipes != null) {
                boolean erased = this.pipes.remove(pipe);
                if (!$assertionsDisabled && !erased) {
                    throw new AssertionError();
                }
                if (this.pipes.isEmpty()) {
                    this.pipes = null;
                }
            }
            return this.pipes == null;
        }
        byte c = prefix[start];
        if (this.count == 0 || c < this.min || c >= this.min + this.count) {
            return false;
        }
        Mtrie nextNode = this.count == 1 ? this.next[0] : this.next[c - this.min];
        if (nextNode == null) {
            return false;
        }
        boolean ret = nextNode.rmHelper(prefix, start + 1, pipe);
        if (nextNode.isRedundant()) {
            if (!$assertionsDisabled && this.count <= 0) {
                throw new AssertionError();
            }
            if (this.count == 1) {
                this.next = null;
                this.count = 0;
                this.liveNodes--;
                if (!$assertionsDisabled && this.liveNodes != 0) {
                    throw new AssertionError();
                }
            } else {
                this.next[c - this.min] = null;
                if (!$assertionsDisabled && this.liveNodes <= 1) {
                    throw new AssertionError();
                }
                this.liveNodes--;
                if (this.liveNodes == 1) {
                    int i = 0;
                    while (i < this.count && this.next[i] == null) {
                        i++;
                    }
                    if (!$assertionsDisabled && i >= this.count) {
                        throw new AssertionError();
                    }
                    this.min += i;
                    this.count = 1;
                    Mtrie old = this.next[i];
                    this.next = new Mtrie[]{old};
                } else if (c == this.min) {
                    int i2 = 1;
                    while (i2 < this.count && this.next[i2] == null) {
                        i2++;
                    }
                    if (!$assertionsDisabled && i2 >= this.count) {
                        throw new AssertionError();
                    }
                    this.min += i2;
                    this.count -= i2;
                    this.next = realloc(this.next, this.count, true);
                } else if (c == (this.min + this.count) - 1) {
                    int i3 = 1;
                    while (i3 < this.count && this.next[(this.count - 1) - i3] == null) {
                        i3++;
                    }
                    if (!$assertionsDisabled && i3 >= this.count) {
                        throw new AssertionError();
                    }
                    this.count -= i3;
                    this.next = realloc(this.next, this.count, false);
                }
            }
        }
        return ret;
    }

    public void match(byte[] data, int size, IMtrieHandler func, Object arg) {
        Mtrie current = this;
        int idx = 0;
        while (true) {
            if (current.pipes != null) {
                for (Pipe it : current.pipes) {
                    func.invoke(it, null, 0, arg);
                }
            }
            if (size != 0 && current.count != 0) {
                byte c = data[idx];
                if (current.count == 1) {
                    if (c == current.min) {
                        current = current.next[0];
                        idx++;
                        size--;
                    } else {
                        return;
                    }
                } else if (c >= current.min && c < current.min + current.count && current.next[c - current.min] != null) {
                    current = current.next[c - current.min];
                    idx++;
                    size--;
                } else {
                    return;
                }
            } else {
                return;
            }
        }
    }

    private boolean isRedundant() {
        return this.pipes == null && this.liveNodes == 0;
    }
}
