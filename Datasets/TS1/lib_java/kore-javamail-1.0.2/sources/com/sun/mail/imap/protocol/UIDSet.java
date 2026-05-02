package com.sun.mail.imap.protocol;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/protocol/UIDSet.class */
public class UIDSet {
    public long start;
    public long end;

    public UIDSet() {
    }

    public UIDSet(long start, long end) {
        this.start = start;
        this.end = end;
    }

    public long size() {
        return (this.end - this.start) + 1;
    }

    public static UIDSet[] createUIDSets(long[] uids) {
        if (uids == null) {
            return null;
        }
        List<UIDSet> v = new ArrayList<>();
        int i = 0;
        while (i < uids.length) {
            UIDSet ms = new UIDSet();
            ms.start = uids[i];
            int j = i + 1;
            while (j < uids.length && uids[j] == uids[j - 1] + 1) {
                j++;
            }
            ms.end = uids[j - 1];
            v.add(ms);
            int i2 = j - 1;
            i = i2 + 1;
        }
        UIDSet[] uidset = new UIDSet[v.size()];
        return (UIDSet[]) v.toArray(uidset);
    }

    public static UIDSet[] parseUIDSets(String uids) {
        if (uids == null) {
            return null;
        }
        List<UIDSet> v = new ArrayList<>();
        StringTokenizer st = new StringTokenizer(uids, ",:", true);
        UIDSet cur = null;
        while (st.hasMoreTokens()) {
            try {
                String s = st.nextToken();
                if (s.equals(",")) {
                    if (cur != null) {
                        v.add(cur);
                    }
                    cur = null;
                } else if (!s.equals(":")) {
                    long n = Long.parseLong(s);
                    if (cur != null) {
                        cur.end = n;
                    } else {
                        cur = new UIDSet(n, n);
                    }
                }
            } catch (NumberFormatException e) {
            }
        }
        if (cur != null) {
            v.add(cur);
        }
        UIDSet[] uidset = new UIDSet[v.size()];
        return (UIDSet[]) v.toArray(uidset);
    }

    public static String toString(UIDSet[] uidset) {
        if (uidset == null) {
            return null;
        }
        if (uidset.length == 0) {
            return "";
        }
        int i = 0;
        StringBuilder s = new StringBuilder();
        int size = uidset.length;
        while (true) {
            long start = uidset[i].start;
            long end = uidset[i].end;
            if (end > start) {
                s.append(start).append(':').append(end);
            } else {
                s.append(start);
            }
            i++;
            if (i < size) {
                s.append(',');
            } else {
                return s.toString();
            }
        }
    }

    public static long[] toArray(UIDSet[] uidset) {
        if (uidset == null) {
            return null;
        }
        long[] uids = new long[(int) size(uidset)];
        int i = 0;
        for (UIDSet u : uidset) {
            long j = u.start;
            while (true) {
                long n = j;
                if (n <= u.end) {
                    int i2 = i;
                    i++;
                    uids[i2] = n;
                    j = n + 1;
                }
            }
        }
        return uids;
    }

    public static long[] toArray(UIDSet[] uidset, long uidmax) {
        if (uidset == null) {
            return null;
        }
        long[] uids = new long[(int) size(uidset, uidmax)];
        int i = 0;
        for (UIDSet u : uidset) {
            long j = u.start;
            while (true) {
                long n = j;
                if (n > u.end || (uidmax >= 0 && n > uidmax)) {
                    break;
                }
                int i2 = i;
                i++;
                uids[i2] = n;
                j = n + 1;
            }
        }
        return uids;
    }

    public static long size(UIDSet[] uidset) {
        long count = 0;
        if (uidset != null) {
            for (UIDSet u : uidset) {
                count += u.size();
            }
        }
        return count;
    }

    private static long size(UIDSet[] uidset, long uidmax) {
        long count = 0;
        if (uidset != null) {
            for (UIDSet u : uidset) {
                if (uidmax < 0) {
                    count += u.size();
                } else if (u.start <= uidmax) {
                    if (u.end < uidmax) {
                        count += (u.end - u.start) + 1;
                    } else {
                        count += (uidmax - u.start) + 1;
                    }
                }
            }
        }
        return count;
    }
}
