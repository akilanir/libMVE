package com.facebook.stetho.inspector.database;

import android.net.Uri;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/database/ContentProviderSchema.class */
public class ContentProviderSchema {
    private final String mTableName;
    private final Uri mUri;
    private final String[] mProjection;

    private ContentProviderSchema(Builder builder) {
        this.mTableName = builder.mTable.mTableName;
        this.mUri = builder.mTable.mUri;
        this.mProjection = builder.mTable.mProjection;
    }

    public String getTableName() {
        return this.mTableName;
    }

    public Uri getUri() {
        return this.mUri;
    }

    public String[] getProjection() {
        return this.mProjection;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/database/ContentProviderSchema$Builder.class */
    public static class Builder {
        private Table mTable;

        public Builder table(Table table) {
            this.mTable = table;
            return this;
        }

        public ContentProviderSchema build() {
            return new ContentProviderSchema(this);
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/database/ContentProviderSchema$Table.class */
    public static class Table {
        private Uri mUri;
        private String[] mProjection;
        private String mTableName;

        private Table(Builder builder) {
            this.mUri = builder.mUri;
            this.mProjection = builder.mProjection;
            this.mTableName = builder.mTableName;
            if (this.mTableName == null) {
                this.mTableName = this.mUri.getLastPathSegment();
            }
        }

        /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/database/ContentProviderSchema$Table$Builder.class */
        public static class Builder {
            private Uri mUri;
            private String[] mProjection;
            private String mTableName;

            public Builder uri(Uri contentUri) {
                this.mUri = contentUri;
                return this;
            }

            public Builder projection(String[] columns) {
                this.mProjection = columns;
                return this;
            }

            public Builder name(String tableName) {
                this.mTableName = tableName;
                return this;
            }

            public Table build() {
                return new Table(this);
            }
        }
    }
}
