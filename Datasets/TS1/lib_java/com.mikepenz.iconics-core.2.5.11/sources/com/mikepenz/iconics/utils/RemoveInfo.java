package com.mikepenz.iconics.utils;

/* loaded from: com.mikepenz.iconics-core.2.5.11.jar:com/mikepenz/iconics/utils/RemoveInfo.class */
public class RemoveInfo {
    private int start;
    private int count;
    private int total;

    public RemoveInfo(int start, int count) {
        this.start = start;
        this.count = count;
    }

    public RemoveInfo(int start, int count, int total) {
        this.start = start;
        this.count = count;
        this.total = total;
    }

    public int getStart() {
        return this.start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getCount() {
        return this.count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getTotal() {
        return this.total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
