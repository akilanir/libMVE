package com.alibaba.fastjson.serializer;

import java.util.Arrays;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/Labels.class */
public class Labels {

    /* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/Labels$DefaultLabelFilter.class */
    private static class DefaultLabelFilter implements LabelFilter {
        private String[] includes;
        private String[] excludes;

        public DefaultLabelFilter(String[] includes, String[] excludes) {
            if (includes != null) {
                this.includes = new String[includes.length];
                System.arraycopy(includes, 0, this.includes, 0, includes.length);
                Arrays.sort(this.includes);
            }
            if (excludes != null) {
                this.excludes = new String[excludes.length];
                System.arraycopy(excludes, 0, this.excludes, 0, excludes.length);
                Arrays.sort(this.excludes);
            }
        }

        @Override // com.alibaba.fastjson.serializer.LabelFilter
        public boolean apply(String label) {
            return this.excludes != null ? Arrays.binarySearch(this.excludes, label) == -1 : this.includes != null && Arrays.binarySearch(this.includes, label) >= 0;
        }
    }

    public static LabelFilter includes(String... views) {
        return new DefaultLabelFilter(views, null);
    }

    public static LabelFilter excludes(String... views) {
        return new DefaultLabelFilter(null, views);
    }
}
