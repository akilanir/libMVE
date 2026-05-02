package ch.qos.logback.classic.db.names;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/db/names/DBNameResolver.class */
public interface DBNameResolver {
    <N extends Enum<?>> String getTableName(N n);

    <N extends Enum<?>> String getColumnName(N n);
}
