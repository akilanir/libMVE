.class public abstract Lorg/dmfs/provider/tasks/handler/PropertyHandler;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public delete(Landroid/database/sqlite/SQLiteDatabase;JJLandroid/database/Cursor;Z)I
    .registers 11

    const-string v0, "Properties"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "property_id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public insert(Landroid/database/sqlite/SQLiteDatabase;JLandroid/content/ContentValues;Z)J
    .registers 8

    const-string v0, "Properties"

    const-string v1, ""

    invoke-virtual {p1, v0, v1, p4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    return-wide v0
.end method

.method public update(Landroid/database/sqlite/SQLiteDatabase;JJLandroid/content/ContentValues;Landroid/database/Cursor;Z)I
    .registers 12

    const-string v0, "Properties"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "property_id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, p6, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method protected updateFTSEntry(Landroid/database/sqlite/SQLiteDatabase;JJLjava/lang/String;)V
    .registers 7

    invoke-static/range {p1 .. p6}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->updatePropertyFTSEntry(Landroid/database/sqlite/SQLiteDatabase;JJLjava/lang/String;)V

    return-void
.end method

.method public abstract validateValues(Landroid/database/sqlite/SQLiteDatabase;JJZLandroid/content/ContentValues;Z)Landroid/content/ContentValues;
.end method
