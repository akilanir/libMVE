.class public Lorg/dmfs/provider/tasks/FTSDatabaseHelper;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/provider/tasks/FTSDatabaseHelper$SearchableTypes;,
        Lorg/dmfs/provider/tasks/FTSDatabaseHelper$NGramColumns;,
        Lorg/dmfs/provider/tasks/FTSDatabaseHelper$FTSContentColumns;
    }
.end annotation


# static fields
.field public static final FTS_CONTENT_TABLE:Ljava/lang/String; = "FTS_Content"

.field public static final FTS_NGRAM_TABLE:Ljava/lang/String; = "FTS_Ngram"

.field public static final FTS_TASK_PROPERTY_VIEW:Ljava/lang/String; = "FTS_Task_Property_View"

.field public static final FTS_TASK_VIEW:Ljava/lang/String; = "FTS_Task_View"

.field private static final SEARCH_RESULTS_MIN_SCORE:F = 0.4f

.field private static final SQL_CREATE_NGRAM_TABLE:Ljava/lang/String; = "CREATE TABLE FTS_Ngram( ngram_id Integer PRIMARY KEY AUTOINCREMENT, ngram_text Text)"

.field private static final SQL_CREATE_SEARCH_CONTENT_TABLE:Ljava/lang/String; = "CREATE TABLE FTS_Content( fts_task_id Integer, fts_ngram_id Integer, fts_property_id Integer, fts_type Integer, FOREIGN KEY(fts_task_id) REFERENCES Tasks(_id),FOREIGN KEY(fts_task_id) REFERENCES Tasks(_id) UNIQUE (fts_task_id, fts_type, fts_property_id) ON CONFLICT IGNORE )"

.field private static final SQL_CREATE_SEARCH_TASK_DELETE_PROPERTY_TRIGGER:Ljava/lang/String; = "CREATE TRIGGER search_task_delete_property_trigger AFTER DELETE ON Properties BEGIN  DELETE FROM FTS_Content WHERE fts_task_id =  old.task_id AND fts_property_id = old.property_id; END"

.field private static final SQL_CREATE_SEARCH_TASK_DELETE_TRIGGER:Ljava/lang/String; = "CREATE TRIGGER search_task_delete_trigger AFTER DELETE ON Tasks BEGIN  DELETE FROM FTS_Content WHERE fts_task_id =  old._id; END"

.field private static final SQL_RAW_QUERY_SEARCH_TASK:Ljava/lang/String; = "SELECT %s , min(1.0*count(*)/?, 1.0) as score from FTS_Ngram join FTS_Content on (FTS_Ngram.ngram_id=FTS_Content.fts_ngram_id) join Instance_View on (Instance_View._id = FTS_Content.fts_task_id) where %s group by _id having score >= 0.4 order by %s;"

.field private static final SQL_RAW_QUERY_SEARCH_TASK_DEFAULT_PROJECTION:Ljava/lang/String; = "Instance_View.* ,FTS_Ngram.ngram_text"

.field private static final TETRAGRAM_GENERATOR:Lorg/dmfs/ngrams/NGramGenerator;

.field private static final TRIGRAM_GENERATOR:Lorg/dmfs/ngrams/NGramGenerator;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const/4 v3, 0x3

    const/4 v2, 0x1

    new-instance v0, Lorg/dmfs/ngrams/NGramGenerator;

    invoke-direct {v0, v3, v2}, Lorg/dmfs/ngrams/NGramGenerator;-><init>(II)V

    invoke-virtual {v0, v2}, Lorg/dmfs/ngrams/NGramGenerator;->setAddSpaceInFront(Z)Lorg/dmfs/ngrams/NGramGenerator;

    move-result-object v0

    sput-object v0, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->TRIGRAM_GENERATOR:Lorg/dmfs/ngrams/NGramGenerator;

    new-instance v0, Lorg/dmfs/ngrams/NGramGenerator;

    const/4 v1, 0x4

    invoke-direct {v0, v1, v3}, Lorg/dmfs/ngrams/NGramGenerator;-><init>(II)V

    invoke-virtual {v0, v2}, Lorg/dmfs/ngrams/NGramGenerator;->setAddSpaceInFront(Z)Lorg/dmfs/ngrams/NGramGenerator;

    move-result-object v0

    sput-object v0, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->TETRAGRAM_GENERATOR:Lorg/dmfs/ngrams/NGramGenerator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static deleteNGramRelations(Landroid/database/sqlite/SQLiteDatabase;JJI)I
    .registers 9

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "fts_task_id"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "fts_type"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/4 v1, 0x4

    if-ne p5, v1, :cond_3e

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "fts_property_id"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    :cond_3e
    const-string v1, "FTS_Content"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getTaskSearchCursor(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 16

    const/4 v9, 0x0

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v2, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v0, 0x400

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_51

    const-string v0, " ("

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ") AND ("

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1e
    sget-object v0, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->TRIGRAM_GENERATOR:Lorg/dmfs/ngrams/NGramGenerator;

    invoke-virtual {v0, p1}, Lorg/dmfs/ngrams/NGramGenerator;->getNgrams(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v4

    sget-object v0, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->TETRAGRAM_GENERATOR:Lorg/dmfs/ngrams/NGramGenerator;

    invoke-virtual {v0, v4, p1}, Lorg/dmfs/ngrams/NGramGenerator;->getNgrams(Ljava/util/Set;Ljava/lang/String;)Ljava/util/Set;

    if-eqz p1, :cond_db

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v7, :cond_db

    const-string v0, "ngram_text"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " in ("

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v1

    move v0, v2

    :goto_40
    if-ge v0, v1, :cond_57

    if-lez v0, :cond_49

    const-string v5, ","

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_49
    const-string v5, "?"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_40

    :cond_51
    const-string v0, " ("

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1e

    :cond_57
    if-eqz p4, :cond_ba

    array-length v0, p4

    if-lez v0, :cond_ba

    array-length v0, p4

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v2

    array-length v0, p4

    invoke-static {p4, v2, v1, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v4, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    array-length v4, p4

    add-int/lit8 v4, v4, 0x1

    array-length v5, v0

    invoke-static {v0, v2, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v0, v1

    :goto_88
    const-string v1, " ) "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_8d
    const-string v1, ") AND "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_deleted"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " = 0"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p5, :cond_146

    const-string v1, "score desc"

    :goto_a0
    const-string v4, "SELECT %s , min(1.0*count(*)/?, 1.0) as score from FTS_Ngram join FTS_Content on (FTS_Ngram.ngram_id=FTS_Content.fts_ngram_id) join Instance_View on (Instance_View._id = FTS_Content.fts_task_id) where %s group by _id having score >= 0.4 order by %s;"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "Instance_View.* ,FTS_Ngram.ngram_text"

    aput-object v6, v5, v2

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v7

    aput-object v1, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v9, v1, v0, v9}, Landroid/database/sqlite/SQLiteDatabase;->rawQueryWithFactory(Landroid/database/sqlite/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0

    :cond_ba
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v4, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    array-length v1, v0

    add-int/lit8 v1, v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    array-length v4, v0

    invoke-static {v0, v2, v1, v7, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v0, v1

    goto :goto_88

    :cond_db
    const-string v0, "ngram_text"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " like ?"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p4, :cond_11d

    array-length v0, p4

    if-lez v0, :cond_11d

    array-length v0, p4

    add-int/lit8 v0, v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    array-length v1, p4

    invoke-static {p4, v2, v0, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "%"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v1

    goto/16 :goto_8d

    :cond_11d
    new-array v0, v8, [Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "%"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v7

    goto/16 :goto_8d

    :cond_146
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "score desc, "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_a0
.end method

.method private static initializeFTS(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 8

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x0

    const/4 v3, 0x1

    const-string v0, "CREATE TABLE FTS_Content( fts_task_id Integer, fts_ngram_id Integer, fts_property_id Integer, fts_type Integer, FOREIGN KEY(fts_task_id) REFERENCES Tasks(_id),FOREIGN KEY(fts_task_id) REFERENCES Tasks(_id) UNIQUE (fts_task_id, fts_type, fts_property_id) ON CONFLICT IGNORE )"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE FTS_Ngram( ngram_id Integer PRIMARY KEY AUTOINCREMENT, ngram_text Text)"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER search_task_delete_trigger AFTER DELETE ON Tasks BEGIN  DELETE FROM FTS_Content WHERE fts_task_id =  old._id; END"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER search_task_delete_property_trigger AFTER DELETE ON Properties BEGIN  DELETE FROM FTS_Content WHERE fts_task_id =  old.task_id AND fts_property_id = old.property_id; END"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "FTS_Ngram"

    new-array v1, v3, [Ljava/lang/String;

    const-string v2, "ngram_text"

    aput-object v2, v1, v4

    invoke-static {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "FTS_Content"

    new-array v1, v3, [Ljava/lang/String;

    const-string v2, "fts_ngram_id"

    aput-object v2, v1, v4

    invoke-static {v0, v4, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "FTS_Content"

    new-array v1, v3, [Ljava/lang/String;

    const-string v2, "fts_task_id"

    aput-object v2, v1, v4

    invoke-static {v0, v4, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "FTS_Content"

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "fts_property_id"

    aput-object v2, v1, v4

    const-string v2, "fts_task_id"

    aput-object v2, v1, v3

    const-string v2, "fts_ngram_id"

    aput-object v2, v1, v5

    invoke-static {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "FTS_Content"

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "fts_type"

    aput-object v2, v1, v4

    const-string v2, "fts_task_id"

    aput-object v2, v1, v3

    const-string v2, "fts_property_id"

    aput-object v2, v1, v5

    invoke-static {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method private static initializeFTSContent(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 13

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v0, 0x4

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v8

    const-string v0, "title"

    aput-object v0, v2, v9

    const-string v0, "description"

    aput-object v0, v2, v10

    const-string v0, "location"

    aput-object v0, v2, v11

    const-string v1, "Task_Property_View"

    move-object v0, p0

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    :goto_23
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-interface {v6, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-interface {v6, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v6, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v6, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->insertTaskFTSEntries(Landroid/database/sqlite/SQLiteDatabase;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_23

    :cond_3e
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    return-void
.end method

.method private static insertNGramRelations(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/Set;JLjava/lang/Long;I)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;J",
            "Ljava/lang/Long;",
            "I)V"
        }
    .end annotation

    const/4 v5, 0x4

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1, v5}, Landroid/content/ContentValues;-><init>(I)V

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_41

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    const-string v3, "fts_task_id"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v3, "fts_ngram_id"

    invoke-virtual {v1, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "fts_type"

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    if-ne p5, v5, :cond_3b

    const-string v0, "fts_property_id"

    invoke-virtual {v1, v0, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :goto_34
    const-string v0, "FTS_Content"

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v3, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    goto :goto_a

    :cond_3b
    const-string v0, "fts_property_id"

    invoke-virtual {v1, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto :goto_34

    :cond_41
    return-void
.end method

.method private static insertNGrams(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/Set;)Ljava/util/Set;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    new-instance v10, Ljava/util/HashSet;

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v0

    invoke-direct {v10, v0}, Ljava/util/HashSet;-><init>(I)V

    new-instance v11, Landroid/content/ContentValues;

    const/4 v0, 0x1

    invoke-direct {v11, v0}, Landroid/content/ContentValues;-><init>(I)V

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_13
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_67

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "ngram_text"

    invoke-virtual {v11, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "FTS_Ngram"

    const/4 v2, 0x0

    const/4 v3, 0x4

    invoke-virtual {p0, v1, v2, v11, v3}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v8

    const-wide/16 v1, -0x1

    cmp-long v1, v8, v1

    if-nez v1, :cond_6a

    const-string v1, "FTS_Ngram"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "ngram_id"

    aput-object v4, v2, v3

    const-string v3, "ngram_text=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    :try_start_4c
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_68

    const/4 v0, 0x0

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_56
    .catchall {:try_start_4c .. :try_end_56} :catchall_62

    move-result-wide v0

    :goto_57
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :goto_5a
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v10, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_13

    :catchall_62
    move-exception v0

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    throw v0

    :cond_67
    return-object v10

    :cond_68
    move-wide v0, v8

    goto :goto_57

    :cond_6a
    move-wide v0, v8

    goto :goto_5a
.end method

.method private static insertTaskFTSEntries(Landroid/database/sqlite/SQLiteDatabase;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13

    const-wide/16 v3, -0x1

    if-eqz p3, :cond_11

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_11

    const/4 v5, 0x1

    move-object v0, p0

    move-wide v1, p1

    move-object v6, p3

    invoke-static/range {v0 .. v6}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->updateEntry(Landroid/database/sqlite/SQLiteDatabase;JJILjava/lang/String;)V

    :cond_11
    if-eqz p5, :cond_20

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_20

    const/4 v5, 0x3

    move-object v0, p0

    move-wide v1, p1

    move-object v6, p5

    invoke-static/range {v0 .. v6}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->updateEntry(Landroid/database/sqlite/SQLiteDatabase;JJILjava/lang/String;)V

    :cond_20
    if-eqz p4, :cond_2f

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_2f

    const/4 v5, 0x2

    move-object v0, p0

    move-wide v1, p1

    move-object v6, p4

    invoke-static/range {v0 .. v6}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->updateEntry(Landroid/database/sqlite/SQLiteDatabase;JJILjava/lang/String;)V

    :cond_2f
    return-void
.end method

.method public static onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 1

    invoke-static {p0}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->initializeFTS(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method

.method public static onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 8

    const/4 v4, 0x1

    const/16 v0, 0x8

    if-ge p1, v0, :cond_b

    invoke-static {p0}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->initializeFTS(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-static {p0}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->initializeFTSContent(Landroid/database/sqlite/SQLiteDatabase;)V

    :cond_b
    const/16 v0, 0x10

    if-ge p1, v0, :cond_29

    const-string v0, "FTS_Content"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "fts_type"

    aput-object v3, v1, v2

    const-string v2, "fts_task_id"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "fts_property_id"

    aput-object v3, v1, v2

    invoke-static {v0, v4, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_29
    return-void
.end method

.method private static updateEntry(Landroid/database/sqlite/SQLiteDatabase;JJILjava/lang/String;)V
    .registers 13

    invoke-static/range {p0 .. p5}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->deleteNGramRelations(Landroid/database/sqlite/SQLiteDatabase;JJI)I

    if-eqz p6, :cond_24

    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_24

    sget-object v0, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->TRIGRAM_GENERATOR:Lorg/dmfs/ngrams/NGramGenerator;

    invoke-virtual {v0, p6}, Lorg/dmfs/ngrams/NGramGenerator;->getNgrams(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->TETRAGRAM_GENERATOR:Lorg/dmfs/ngrams/NGramGenerator;

    invoke-virtual {v1, v0, p6}, Lorg/dmfs/ngrams/NGramGenerator;->getNgrams(Ljava/util/Set;Ljava/lang/String;)Ljava/util/Set;

    invoke-static {p0, v0}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->insertNGrams(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    move-object v0, p0

    move-wide v2, p1

    move v5, p5

    invoke-static/range {v0 .. v5}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->insertNGramRelations(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/Set;JLjava/lang/Long;I)V

    :cond_24
    return-void
.end method

.method public static updatePropertyFTSEntry(Landroid/database/sqlite/SQLiteDatabase;JJLjava/lang/String;)V
    .registers 13

    const/4 v5, 0x4

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    move-object v6, p5

    invoke-static/range {v0 .. v6}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->updateEntry(Landroid/database/sqlite/SQLiteDatabase;JJILjava/lang/String;)V

    return-void
.end method

.method public static updateTaskFTSEntries(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;)V
    .registers 9

    const-wide/16 v3, -0x1

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->TITLE:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-interface {p1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v1

    const/4 v5, 0x1

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->TITLE:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->updateEntry(Landroid/database/sqlite/SQLiteDatabase;JJILjava/lang/String;)V

    :cond_1b
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LOCATION:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-interface {p1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v1

    const/4 v5, 0x3

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LOCATION:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->updateEntry(Landroid/database/sqlite/SQLiteDatabase;JJILjava/lang/String;)V

    :cond_34
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->DESCRIPTION:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_4d

    invoke-interface {p1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v1

    const/4 v5, 0x2

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->DESCRIPTION:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->updateEntry(Landroid/database/sqlite/SQLiteDatabase;JJILjava/lang/String;)V

    :cond_4d
    return-void
.end method
