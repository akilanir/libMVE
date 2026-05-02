package com.mongodb;

import java.io.Serializable;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBRefBase.class */
public class DBRefBase implements Serializable {
    private static final long serialVersionUID = 3031885741395465814L;
    final Object _id;
    final String _ns;
    final transient DB _db;
    private boolean _loadedPointedTo;
    private DBObject _pointedTo;

    public DBRefBase(DB db, String ns, Object id) {
        this._loadedPointedTo = false;
        this._db = db;
        this._ns = ns.intern();
        this._id = id;
    }

    protected DBRefBase() {
        this._loadedPointedTo = false;
        this._id = null;
        this._ns = null;
        this._db = null;
    }

    public DBObject fetch() throws MongoException {
        if (this._loadedPointedTo) {
            return this._pointedTo;
        }
        if (this._db == null) {
            throw new MongoInternalException("no db");
        }
        DBCollection coll = this._db.getCollectionFromString(this._ns);
        this._pointedTo = coll.findOne(this._id);
        this._loadedPointedTo = true;
        return this._pointedTo;
    }

    public String toString() {
        return "{ \"$ref\" : \"" + this._ns + "\", \"$id\" : \"" + this._id + "\" }";
    }

    public Object getId() {
        return this._id;
    }

    public String getRef() {
        return this._ns;
    }

    public DB getDB() {
        return this._db;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        DBRefBase dbRefBase = (DBRefBase) o;
        if (this._id != null) {
            if (!this._id.equals(dbRefBase._id)) {
                return false;
            }
        } else if (dbRefBase._id != null) {
            return false;
        }
        return this._ns != null ? this._ns.equals(dbRefBase._ns) : dbRefBase._ns == null;
    }

    public int hashCode() {
        int result = this._id != null ? this._id.hashCode() : 0;
        return (31 * result) + (this._ns != null ? this._ns.hashCode() : 0);
    }
}
