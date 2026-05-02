package org.apache.commons.net.nntp;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/nntp/Threader.class */
public class Threader {
    private ThreadContainer root;
    private HashMap<String, ThreadContainer> idTable;
    private int bogusIdCount = 0;

    public Threadable thread(List<? extends Threadable> messages) {
        return thread((Iterable<? extends Threadable>) messages);
    }

    public Threadable thread(Iterable<? extends Threadable> messages) {
        if (messages == null) {
            return null;
        }
        this.idTable = new HashMap<>();
        for (Threadable t : messages) {
            if (!t.isDummy()) {
                buildContainer(t);
            }
        }
        this.root = findRootSet();
        this.idTable.clear();
        this.idTable = null;
        pruneEmptyContainers(this.root);
        this.root.reverseChildren();
        gatherSubjects();
        if (this.root.next != null) {
            throw new RuntimeException("root node has a next:" + this.root);
        }
        ThreadContainer threadContainer = this.root.child;
        while (true) {
            ThreadContainer r = threadContainer;
            if (r == null) {
                break;
            }
            if (r.threadable == null) {
                r.threadable = r.child.threadable.makeDummy();
            }
            threadContainer = r.next;
        }
        Threadable result = this.root.child == null ? null : this.root.child.threadable;
        this.root.flush();
        this.root = null;
        return result;
    }

    private void buildContainer(Threadable threadable) {
        ThreadContainer rest;
        String id = threadable.messageThreadId();
        ThreadContainer container = this.idTable.get(id);
        if (container != null) {
            if (container.threadable != null) {
                StringBuilder append = new StringBuilder().append("<Bogus-id:");
                int i = this.bogusIdCount;
                this.bogusIdCount = i + 1;
                id = append.append(i).append(">").toString();
                container = null;
            } else {
                container.threadable = threadable;
            }
        }
        if (container == null) {
            container = new ThreadContainer();
            container.threadable = threadable;
            this.idTable.put(id, container);
        }
        ThreadContainer parentRef = null;
        String[] references = threadable.messageThreadReferences();
        for (String refString : references) {
            ThreadContainer ref = this.idTable.get(refString);
            if (ref == null) {
                ref = new ThreadContainer();
                this.idTable.put(refString, ref);
            }
            if (parentRef != null && ref.parent == null && parentRef != ref && !ref.findChild(parentRef)) {
                ref.parent = parentRef;
                ref.next = parentRef.child;
                parentRef.child = ref;
            }
            parentRef = ref;
        }
        if (parentRef != null && (parentRef == container || container.findChild(parentRef))) {
            parentRef = null;
        }
        if (container.parent != null) {
            ThreadContainer prev = null;
            ThreadContainer threadContainer = container.parent.child;
            while (true) {
                rest = threadContainer;
                if (rest == null || rest == container) {
                    break;
                }
                prev = rest;
                threadContainer = rest.next;
            }
            if (rest == null) {
                throw new RuntimeException("Didnt find " + container + " in parent" + container.parent);
            }
            if (prev == null) {
                container.parent.child = container.next;
            } else {
                prev.next = container.next;
            }
            container.next = null;
            container.parent = null;
        }
        if (parentRef != null) {
            container.parent = parentRef;
            container.next = parentRef.child;
            parentRef.child = container;
        }
    }

    private ThreadContainer findRootSet() {
        ThreadContainer root = new ThreadContainer();
        for (Object key : this.idTable.keySet()) {
            ThreadContainer c = this.idTable.get(key);
            if (c.parent == null) {
                if (c.next != null) {
                    throw new RuntimeException("c.next is " + c.next.toString());
                }
                c.next = root.child;
                root.child = c;
            }
        }
        return root;
    }

    private void pruneEmptyContainers(ThreadContainer parent) {
        ThreadContainer tail;
        ThreadContainer prev = null;
        ThreadContainer container = parent.child;
        ThreadContainer threadContainer = container.next;
        while (true) {
            ThreadContainer next = threadContainer;
            if (container != null) {
                if (container.threadable == null && container.child == null) {
                    if (prev == null) {
                        parent.child = container.next;
                    } else {
                        prev.next = container.next;
                    }
                    container = prev;
                } else if (container.threadable == null && container.child != null && (container.parent != null || container.child.next == null)) {
                    ThreadContainer kids = container.child;
                    if (prev == null) {
                        parent.child = kids;
                    } else {
                        prev.next = kids;
                    }
                    ThreadContainer threadContainer2 = kids;
                    while (true) {
                        tail = threadContainer2;
                        if (tail.next == null) {
                            break;
                        }
                        tail.parent = container.parent;
                        threadContainer2 = tail.next;
                    }
                    tail.parent = container.parent;
                    tail.next = container.next;
                    next = kids;
                    container = prev;
                } else if (container.child != null) {
                    pruneEmptyContainers(container);
                }
                prev = container;
                container = next;
                threadContainer = container == null ? null : container.next;
            } else {
                return;
            }
        }
    }

    private void gatherSubjects() {
        ThreadContainer old;
        ThreadContainer tail;
        ThreadContainer old2;
        int count = 0;
        ThreadContainer threadContainer = this.root.child;
        while (true) {
            ThreadContainer c = threadContainer;
            if (c == null) {
                break;
            }
            count++;
            threadContainer = c.next;
        }
        HashMap<String, ThreadContainer> subjectTable = new HashMap<>((int) (count * 1.2d), 0.9f);
        int count2 = 0;
        ThreadContainer threadContainer2 = this.root.child;
        while (true) {
            ThreadContainer c2 = threadContainer2;
            if (c2 == null) {
                break;
            }
            Threadable threadable = c2.threadable;
            if (threadable == null) {
                threadable = c2.child.threadable;
            }
            String subj = threadable.simplifiedSubject();
            if (subj != null && subj.length() != 0 && ((old2 = subjectTable.get(subj)) == null || ((c2.threadable == null && old2.threadable != null) || (old2.threadable != null && old2.threadable.subjectIsReply() && c2.threadable != null && !c2.threadable.subjectIsReply())))) {
                subjectTable.put(subj, c2);
                count2++;
            }
            threadContainer2 = c2.next;
        }
        if (count2 == 0) {
            return;
        }
        ThreadContainer prev = null;
        ThreadContainer c3 = this.root.child;
        ThreadContainer threadContainer3 = c3.next;
        while (true) {
            ThreadContainer rest = threadContainer3;
            if (c3 != null) {
                Threadable threadable2 = c3.threadable;
                if (threadable2 == null) {
                    threadable2 = c3.child.threadable;
                }
                String subj2 = threadable2.simplifiedSubject();
                if (subj2 != null && subj2.length() != 0 && (old = subjectTable.get(subj2)) != c3) {
                    if (prev == null) {
                        this.root.child = c3.next;
                    } else {
                        prev.next = c3.next;
                    }
                    c3.next = null;
                    if (old.threadable == null && c3.threadable == null) {
                        ThreadContainer threadContainer4 = old.child;
                        while (true) {
                            tail = threadContainer4;
                            if (tail == null || tail.next == null) {
                                break;
                            } else {
                                threadContainer4 = tail.next;
                            }
                        }
                        if (tail != null) {
                            tail.next = c3.child;
                        }
                        ThreadContainer threadContainer5 = c3.child;
                        while (true) {
                            ThreadContainer tail2 = threadContainer5;
                            if (tail2 == null) {
                                break;
                            }
                            tail2.parent = old;
                            threadContainer5 = tail2.next;
                        }
                        c3.child = null;
                    } else if (old.threadable == null || (c3.threadable != null && c3.threadable.subjectIsReply() && !old.threadable.subjectIsReply())) {
                        c3.parent = old;
                        c3.next = old.child;
                        old.child = c3;
                    } else {
                        ThreadContainer newc = new ThreadContainer();
                        newc.threadable = old.threadable;
                        newc.child = old.child;
                        ThreadContainer threadContainer6 = newc.child;
                        while (true) {
                            ThreadContainer tail3 = threadContainer6;
                            if (tail3 == null) {
                                break;
                            }
                            tail3.parent = newc;
                            threadContainer6 = tail3.next;
                        }
                        old.threadable = null;
                        old.child = null;
                        c3.parent = old;
                        newc.parent = old;
                        old.child = c3;
                        c3.next = newc;
                    }
                    c3 = prev;
                }
                prev = c3;
                c3 = rest;
                threadContainer3 = rest == null ? null : rest.next;
            } else {
                subjectTable.clear();
                return;
            }
        }
    }

    @Deprecated
    public Threadable thread(Threadable[] messages) {
        return thread(Arrays.asList(messages));
    }
}
