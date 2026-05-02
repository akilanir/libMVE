package zmq;

/* loaded from: jeromq-0.3.5.jar:zmq/Trie.class */
public class Trie {
    static final /* synthetic */ boolean $assertionsDisabled;
    private byte min = 0;
    private int count = 0;
    private int liveNodes = 0;
    private int refcnt = 0;
    Trie[] next = null;

    /* loaded from: jeromq-0.3.5.jar:zmq/Trie$ITrieHandler.class */
    public interface ITrieHandler {
        void added(byte[] bArr, int i, Object obj);
    }

    static {
        $assertionsDisabled = !Trie.class.desiredAssertionStatus();
    }

    public boolean add(byte[] prefix) {
        return add(prefix, 0);
    }

    public boolean add(byte[] prefix, int start) {
        if (prefix == null || prefix.length == start) {
            this.refcnt++;
            return this.refcnt == 1;
        }
        byte c = prefix[start];
        if (c < this.min || c >= this.min + this.count) {
            if (this.count == 0) {
                this.min = c;
                this.count = 1;
                this.next = null;
            } else if (this.count == 1) {
                byte oldc = this.min;
                Trie oldp = this.next[0];
                this.count = (this.min < c ? c - this.min : this.min - c) + 1;
                this.next = new Trie[this.count];
                this.min = (byte) Math.min((int) this.min, (int) c);
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
                this.next = new Trie[1];
                this.next[0] = new Trie();
                this.liveNodes++;
            }
            return this.next[0].add(prefix, start + 1);
        }
        if (this.next[c - this.min] == null) {
            this.next[c - this.min] = new Trie();
            this.liveNodes++;
        }
        return this.next[c - this.min].add(prefix, start + 1);
    }

    private Trie[] realloc(Trie[] table, int size, boolean ended) {
        return (Trie[]) Utils.realloc(Trie.class, table, size, ended);
    }

    public boolean rm(byte[] prefix, int start) {
        if (prefix == null || prefix.length == start) {
            if (this.refcnt == 0) {
                return false;
            }
            this.refcnt--;
            return this.refcnt == 0;
        }
        byte c = prefix[start];
        if (this.count == 0 || c < this.min || c >= this.min + this.count) {
            return false;
        }
        Trie nextNode = this.count == 1 ? this.next[0] : this.next[c - this.min];
        if (nextNode == null) {
            return false;
        }
        boolean ret = nextNode.rm(prefix, start + 1);
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
                    Trie node = null;
                    int i = 0;
                    while (true) {
                        if (i >= this.count) {
                            break;
                        }
                        if (this.next[i] == null) {
                            i++;
                        } else {
                            node = this.next[i];
                            this.min = (byte) (i + this.min);
                            break;
                        }
                    }
                    if (!$assertionsDisabled && node == null) {
                        throw new AssertionError();
                    }
                    this.next = null;
                    this.next = new Trie[]{node};
                    this.count = 1;
                } else if (c == this.min) {
                    byte newMin = this.min;
                    int i2 = 1;
                    while (true) {
                        if (i2 >= this.count) {
                            break;
                        }
                        if (this.next[i2] == null) {
                            i2++;
                        } else {
                            newMin = (byte) (i2 + this.min);
                            break;
                        }
                    }
                    if (!$assertionsDisabled && newMin == this.min) {
                        throw new AssertionError();
                    }
                    if (!$assertionsDisabled && newMin <= this.min) {
                        throw new AssertionError();
                    }
                    if (!$assertionsDisabled && this.count <= newMin - this.min) {
                        throw new AssertionError();
                    }
                    this.count -= newMin - this.min;
                    this.next = realloc(this.next, this.count, true);
                    this.min = newMin;
                } else if (c == (this.min + this.count) - 1) {
                    int newCount = this.count;
                    int i3 = 1;
                    while (true) {
                        if (i3 >= this.count) {
                            break;
                        }
                        if (this.next[(this.count - 1) - i3] == null) {
                            i3++;
                        } else {
                            newCount = this.count - i3;
                            break;
                        }
                    }
                    if (!$assertionsDisabled && newCount == this.count) {
                        throw new AssertionError();
                    }
                    this.count = newCount;
                    this.next = realloc(this.next, this.count, false);
                }
            }
        }
        return ret;
    }

    public boolean check(byte[] data) {
        byte c;
        Trie current = this;
        int start = 0;
        while (current.refcnt <= 0) {
            if (data.length == start || (c = data[start]) < current.min || c >= current.min + current.count) {
                return false;
            }
            if (current.count == 1) {
                current = current.next[0];
            } else {
                current = current.next[c - current.min];
                if (current == null) {
                    return false;
                }
            }
            start++;
        }
        return true;
    }

    public void apply(ITrieHandler func, Object arg) {
        applyHelper(null, 0, 0, func, arg);
    }

    private void applyHelper(byte[] buff, int buffsize, int maxBuffsize, ITrieHandler func, Object arg) {
        if (this.refcnt > 0) {
            func.added(buff, buffsize, arg);
        }
        if (buffsize >= maxBuffsize) {
            maxBuffsize = buffsize + 256;
            buff = Utils.realloc(buff, maxBuffsize);
            if (!$assertionsDisabled && buff == null) {
                throw new AssertionError();
            }
        }
        if (this.count == 0) {
            return;
        }
        if (this.count == 1) {
            buff[buffsize] = this.min;
            this.next[0].applyHelper(buff, buffsize + 1, maxBuffsize, func, arg);
            return;
        }
        for (int c = 0; c != this.count; c++) {
            buff[buffsize] = (byte) (this.min + c);
            if (this.next[c] != null) {
                this.next[c].applyHelper(buff, buffsize + 1, maxBuffsize, func, arg);
            }
        }
    }

    private boolean isRedundant() {
        return this.refcnt == 0 && this.liveNodes == 0;
    }
}
