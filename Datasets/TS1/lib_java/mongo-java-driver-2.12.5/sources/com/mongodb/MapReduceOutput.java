package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/MapReduceOutput.class */
public class MapReduceOutput {
    final CommandResult _commandResult;
    final String _collname;
    String _dbname;
    final Iterable<DBObject> _resultSet;
    final DBCollection _coll;
    final BasicDBObject _counts;
    final DBObject _cmd;

    @Deprecated
    public MapReduceOutput(DBCollection from, DBObject cmd, CommandResult raw) {
        this._dbname = null;
        this._commandResult = raw;
        this._cmd = cmd;
        if (raw.containsField("results")) {
            this._coll = null;
            this._collname = null;
            this._resultSet = (Iterable) raw.get("results");
        } else {
            Object res = raw.get("result");
            if (res instanceof String) {
                this._collname = (String) res;
            } else {
                BasicDBObject output = (BasicDBObject) res;
                this._collname = output.getString("collection");
                this._dbname = output.getString("db");
            }
            DB db = from._db;
            this._coll = (this._dbname != null ? db.getSisterDB(this._dbname) : db).getCollection(this._collname);
            this._coll.setOptions(this._coll.getOptions() & (-5));
            this._resultSet = this._coll.find();
        }
        this._counts = (BasicDBObject) raw.get("counts");
    }

    public Iterable<DBObject> results() {
        return this._resultSet;
    }

    public void drop() {
        if (this._coll != null) {
            this._coll.drop();
        }
    }

    public DBCollection getOutputCollection() {
        return this._coll;
    }

    @Deprecated
    public BasicDBObject getRaw() {
        return this._commandResult;
    }

    @Deprecated
    public CommandResult getCommandResult() {
        return this._commandResult;
    }

    public DBObject getCommand() {
        return this._cmd;
    }

    public ServerAddress getServerUsed() {
        return this._commandResult.getServerUsed();
    }

    public String toString() {
        return this._commandResult.toString();
    }

    public final String getCollectionName() {
        return this._collname;
    }

    public String getDatabaseName() {
        return this._dbname;
    }

    public int getDuration() {
        return this._commandResult.getInt("timeMillis");
    }

    public int getInputCount() {
        return this._counts.getInt("input");
    }

    public int getOutputCount() {
        return this._counts.getInt("output");
    }

    public int getEmitCount() {
        return this._counts.getInt("emit");
    }
}
