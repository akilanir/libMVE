package ch.qos.logback.classic.db.names;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/db/names/DefaultDBNameResolver.class */
public class DefaultDBNameResolver implements DBNameResolver {
    @Override // ch.qos.logback.classic.db.names.DBNameResolver
    public <N extends Enum<?>> String getTableName(N n) {
        return n.toString().toLowerCase();
    }

    @Override // ch.qos.logback.classic.db.names.DBNameResolver
    public <N extends Enum<?>> String getColumnName(N n) {
        return n.toString().toLowerCase();
    }
}
