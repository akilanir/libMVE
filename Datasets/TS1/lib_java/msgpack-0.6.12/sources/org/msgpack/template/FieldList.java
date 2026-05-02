package org.msgpack.template;

import java.util.ArrayList;
import java.util.List;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/FieldList.class */
public class FieldList {
    private ArrayList<Entry> list = new ArrayList<>();

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/template/FieldList$Entry.class */
    public static class Entry {
        private String name;
        private FieldOption option;

        public Entry() {
            this(null, FieldOption.IGNORE);
        }

        public Entry(String name, FieldOption option) {
            this.name = name;
            this.option = option;
        }

        public String getName() {
            return this.name;
        }

        public FieldOption getOption() {
            return this.option;
        }

        public boolean isAvailable() {
            return this.option != FieldOption.IGNORE;
        }
    }

    public void add(String name) {
        add(name, FieldOption.DEFAULT);
    }

    public void add(String name, FieldOption option) {
        this.list.add(new Entry(name, option));
    }

    public void put(int index, String name) {
        put(index, name, FieldOption.DEFAULT);
    }

    public void put(int index, String name, FieldOption option) {
        if (this.list.size() < index) {
            do {
                this.list.add(new Entry());
            } while (this.list.size() < index);
            this.list.add(new Entry(name, option));
            return;
        }
        this.list.set(index, new Entry(name, option));
    }

    public List<Entry> getList() {
        return this.list;
    }
}
