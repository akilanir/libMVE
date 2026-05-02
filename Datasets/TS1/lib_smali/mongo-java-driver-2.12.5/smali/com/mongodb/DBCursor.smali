.class public Lcom/mongodb/DBCursor;
.super Ljava/lang/Object;
.source "DBCursor.java"

# interfaces
.implements Lcom/mongodb/Cursor;
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DBCursor$CursorType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/mongodb/Cursor;",
        "Ljava/lang/Iterable",
        "<",
        "Lcom/mongodb/DBObject;",
        ">;"
    }
.end annotation

.annotation runtime Lorg/bson/util/annotations/NotThreadSafe;
.end annotation


# instance fields
.field private final _all:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation
.end field

.field private _batchSize:I

.field private final _collection:Lcom/mongodb/DBCollection;

.field private _cur:Lcom/mongodb/DBObject;

.field private _cursorType:Lcom/mongodb/DBCursor$CursorType;

.field private _decoderFact:Lcom/mongodb/DBDecoderFactory;

.field private _explain:Z

.field private _hint:Ljava/lang/String;

.field private _hintDBObj:Lcom/mongodb/DBObject;

.field private _it:Lcom/mongodb/QueryResultIterator;

.field private final _keysWanted:Lcom/mongodb/DBObject;

.field private _limit:I

.field private _maxTimeMS:J

.field private _num:I

.field private _options:I

.field private _orderBy:Lcom/mongodb/DBObject;

.field private final _query:Lcom/mongodb/DBObject;

.field private _readPref:Lcom/mongodb/ReadPreference;

.field private _skip:I

.field private _snapshot:Z

.field private _specialFields:Lcom/mongodb/DBObject;


# direct methods
.method public constructor <init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)V
    .registers 7
    .param p1, "collection"    # Lcom/mongodb/DBCollection;
    .param p2, "q"    # Lcom/mongodb/DBObject;
    .param p3, "k"    # Lcom/mongodb/DBObject;
    .param p4, "preference"    # Lcom/mongodb/ReadPreference;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 793
    iput-object v1, p0, Lcom/mongodb/DBCursor;->_orderBy:Lcom/mongodb/DBObject;

    .line 794
    iput-object v1, p0, Lcom/mongodb/DBCursor;->_hint:Ljava/lang/String;

    .line 795
    iput-object v1, p0, Lcom/mongodb/DBCursor;->_hintDBObj:Lcom/mongodb/DBObject;

    .line 796
    iput-boolean v0, p0, Lcom/mongodb/DBCursor;->_explain:Z

    .line 797
    iput v0, p0, Lcom/mongodb/DBCursor;->_limit:I

    .line 798
    iput v0, p0, Lcom/mongodb/DBCursor;->_batchSize:I

    .line 799
    iput v0, p0, Lcom/mongodb/DBCursor;->_skip:I

    .line 800
    iput-boolean v0, p0, Lcom/mongodb/DBCursor;->_snapshot:Z

    .line 801
    iput v0, p0, Lcom/mongodb/DBCursor;->_options:I

    .line 809
    iput-object v1, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    .line 811
    iput-object v1, p0, Lcom/mongodb/DBCursor;->_cursorType:Lcom/mongodb/DBCursor$CursorType;

    .line 812
    iput-object v1, p0, Lcom/mongodb/DBCursor;->_cur:Lcom/mongodb/DBObject;

    .line 813
    iput v0, p0, Lcom/mongodb/DBCursor;->_num:I

    .line 815
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/DBCursor;->_all:Ljava/util/ArrayList;

    .line 68
    if-nez p1, :cond_30

    .line 69
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "collection is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_30
    iput-object p1, p0, Lcom/mongodb/DBCursor;->_collection:Lcom/mongodb/DBCollection;

    .line 72
    if-nez p2, :cond_39

    new-instance p2, Lcom/mongodb/BasicDBObject;

    .end local p2    # "q":Lcom/mongodb/DBObject;
    invoke-direct {p2}, Lcom/mongodb/BasicDBObject;-><init>()V

    :cond_39
    iput-object p2, p0, Lcom/mongodb/DBCursor;->_query:Lcom/mongodb/DBObject;

    .line 73
    iput-object p3, p0, Lcom/mongodb/DBCursor;->_keysWanted:Lcom/mongodb/DBObject;

    .line 74
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_collection:Lcom/mongodb/DBCollection;

    invoke-virtual {v0}, Lcom/mongodb/DBCollection;->getOptions()I

    move-result v0

    iput v0, p0, Lcom/mongodb/DBCursor;->_options:I

    .line 75
    iput-object p4, p0, Lcom/mongodb/DBCursor;->_readPref:Lcom/mongodb/ReadPreference;

    .line 76
    invoke-virtual {p1}, Lcom/mongodb/DBCollection;->getDBDecoderFactory()Lcom/mongodb/DBDecoderFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBCursor;->_decoderFact:Lcom/mongodb/DBDecoderFactory;

    .line 77
    return-void
.end method

.method private _check()V
    .registers 11

    .prologue
    .line 439
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-eqz v0, :cond_5

    .line 459
    :goto_4
    return-void

    .line 442
    :cond_5
    invoke-direct {p0}, Lcom/mongodb/DBCursor;->_lookForHints()V

    .line 444
    new-instance v0, Lcom/mongodb/QueryOpBuilder;

    invoke-direct {v0}, Lcom/mongodb/QueryOpBuilder;-><init>()V

    iget-object v1, p0, Lcom/mongodb/DBCursor;->_query:Lcom/mongodb/DBObject;

    invoke-virtual {v0, v1}, Lcom/mongodb/QueryOpBuilder;->addQuery(Lcom/mongodb/DBObject;)Lcom/mongodb/QueryOpBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DBCursor;->_orderBy:Lcom/mongodb/DBObject;

    invoke-virtual {v0, v1}, Lcom/mongodb/QueryOpBuilder;->addOrderBy(Lcom/mongodb/DBObject;)Lcom/mongodb/QueryOpBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DBCursor;->_hintDBObj:Lcom/mongodb/DBObject;

    invoke-virtual {v0, v1}, Lcom/mongodb/QueryOpBuilder;->addHint(Lcom/mongodb/DBObject;)Lcom/mongodb/QueryOpBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DBCursor;->_hint:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mongodb/QueryOpBuilder;->addHint(Ljava/lang/String;)Lcom/mongodb/QueryOpBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/DBCursor;->_explain:Z

    invoke-virtual {v0, v1}, Lcom/mongodb/QueryOpBuilder;->addExplain(Z)Lcom/mongodb/QueryOpBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/DBCursor;->_snapshot:Z

    invoke-virtual {v0, v1}, Lcom/mongodb/QueryOpBuilder;->addSnapshot(Z)Lcom/mongodb/QueryOpBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DBCursor;->_specialFields:Lcom/mongodb/DBObject;

    invoke-virtual {v0, v1}, Lcom/mongodb/QueryOpBuilder;->addSpecialFields(Lcom/mongodb/DBObject;)Lcom/mongodb/QueryOpBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/mongodb/DBCursor;->_maxTimeMS:J

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/QueryOpBuilder;->addMaxTimeMS(J)Lcom/mongodb/QueryOpBuilder;

    move-result-object v9

    .line 454
    .local v9, "builder":Lcom/mongodb/QueryOpBuilder;
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_collection:Lcom/mongodb/DBCollection;

    invoke-virtual {v0}, Lcom/mongodb/DBCollection;->getDB()Lcom/mongodb/DB;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/DB;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->isMongosConnection()Z

    move-result v0

    if-eqz v0, :cond_52

    .line 455
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_readPref:Lcom/mongodb/ReadPreference;

    invoke-virtual {v9, v0}, Lcom/mongodb/QueryOpBuilder;->addReadPreference(Lcom/mongodb/ReadPreference;)Lcom/mongodb/QueryOpBuilder;

    .line 458
    :cond_52
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_collection:Lcom/mongodb/DBCollection;

    invoke-virtual {v9}, Lcom/mongodb/QueryOpBuilder;->get()Lcom/mongodb/DBObject;

    move-result-object v1

    iget-object v2, p0, Lcom/mongodb/DBCursor;->_keysWanted:Lcom/mongodb/DBObject;

    iget v3, p0, Lcom/mongodb/DBCursor;->_skip:I

    iget v4, p0, Lcom/mongodb/DBCursor;->_batchSize:I

    iget v5, p0, Lcom/mongodb/DBCursor;->_limit:I

    iget v6, p0, Lcom/mongodb/DBCursor;->_options:I

    iget-object v7, p0, Lcom/mongodb/DBCursor;->_readPref:Lcom/mongodb/ReadPreference;

    invoke-direct {p0}, Lcom/mongodb/DBCursor;->getDecoder()Lcom/mongodb/DBDecoder;

    move-result-object v8

    invoke-virtual/range {v0 .. v8}, Lcom/mongodb/DBCollection;->find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;IIIILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/QueryResultIterator;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    goto :goto_4
.end method

.method private _hasNext()Z
    .registers 3

    .prologue
    .line 546
    invoke-direct {p0}, Lcom/mongodb/DBCursor;->_check()V

    .line 548
    iget v0, p0, Lcom/mongodb/DBCursor;->_limit:I

    if-lez v0, :cond_f

    iget v0, p0, Lcom/mongodb/DBCursor;->_num:I

    iget v1, p0, Lcom/mongodb/DBCursor;->_limit:I

    if-lt v0, v1, :cond_f

    .line 549
    const/4 v0, 0x0

    .line 551
    :goto_e
    return v0

    :cond_f
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    invoke-virtual {v0}, Lcom/mongodb/QueryResultIterator;->hasNext()Z

    move-result v0

    goto :goto_e
.end method

.method private _lookForHints()V
    .registers 6

    .prologue
    .line 472
    iget-object v4, p0, Lcom/mongodb/DBCursor;->_hint:Ljava/lang/String;

    if-eqz v4, :cond_5

    .line 490
    :cond_4
    :goto_4
    return-void

    .line 475
    :cond_5
    iget-object v4, p0, Lcom/mongodb/DBCursor;->_collection:Lcom/mongodb/DBCollection;

    iget-object v4, v4, Lcom/mongodb/DBCollection;->_hintFields:Ljava/util/List;

    if-eqz v4, :cond_4

    .line 478
    iget-object v4, p0, Lcom/mongodb/DBCursor;->_query:Lcom/mongodb/DBObject;

    invoke-interface {v4}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 480
    .local v2, "mykeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/mongodb/DBCursor;->_collection:Lcom/mongodb/DBCollection;

    iget-object v4, v4, Lcom/mongodb/DBCollection;->_hintFields:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mongodb/DBObject;

    .line 482
    .local v3, "o":Lcom/mongodb/DBObject;
    invoke-interface {v3}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 484
    .local v0, "hintKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v2, v0}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v4

    if-eqz v4, :cond_19

    .line 487
    invoke-virtual {p0, v3}, Lcom/mongodb/DBCursor;->hint(Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;

    goto :goto_4
.end method

.method private _next()Lcom/mongodb/DBObject;
    .registers 3

    .prologue
    .line 505
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_cursorType:Lcom/mongodb/DBCursor$CursorType;

    if-nez v0, :cond_9

    .line 506
    sget-object v0, Lcom/mongodb/DBCursor$CursorType;->ITERATOR:Lcom/mongodb/DBCursor$CursorType;

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCursor;->_checkType(Lcom/mongodb/DBCursor$CursorType;)V

    .line 508
    :cond_9
    invoke-direct {p0}, Lcom/mongodb/DBCursor;->_check()V

    .line 510
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    invoke-virtual {v0}, Lcom/mongodb/QueryResultIterator;->next()Lcom/mongodb/DBObject;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBCursor;->_cur:Lcom/mongodb/DBObject;

    .line 511
    iget v0, p0, Lcom/mongodb/DBCursor;->_num:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mongodb/DBCursor;->_num:I

    .line 513
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_keysWanted:Lcom/mongodb/DBObject;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lcom/mongodb/DBCursor;->_keysWanted:Lcom/mongodb/DBObject;

    invoke-interface {v0}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-lez v0, :cond_2f

    .line 514
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_cur:Lcom/mongodb/DBObject;

    invoke-interface {v0}, Lcom/mongodb/DBObject;->markAsPartialObject()V

    .line 518
    :cond_2f
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_cursorType:Lcom/mongodb/DBCursor$CursorType;

    sget-object v1, Lcom/mongodb/DBCursor$CursorType;->ARRAY:Lcom/mongodb/DBCursor$CursorType;

    if-ne v0, v1, :cond_3c

    .line 519
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_all:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/mongodb/DBCursor;->_cur:Lcom/mongodb/DBObject;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 522
    :cond_3c
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_cur:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method private getDecoder()Lcom/mongodb/DBDecoder;
    .registers 2

    .prologue
    .line 464
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_decoderFact:Lcom/mongodb/DBDecoderFactory;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/mongodb/DBCursor;->_decoderFact:Lcom/mongodb/DBDecoderFactory;

    invoke-interface {v0}, Lcom/mongodb/DBDecoderFactory;->create()Lcom/mongodb/DBDecoder;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method


# virtual methods
.method _checkType(Lcom/mongodb/DBCursor$CursorType;)V
    .registers 4
    .param p1, "type"    # Lcom/mongodb/DBCursor$CursorType;

    .prologue
    .line 493
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_cursorType:Lcom/mongodb/DBCursor$CursorType;

    if-nez v0, :cond_7

    .line 494
    iput-object p1, p0, Lcom/mongodb/DBCursor;->_cursorType:Lcom/mongodb/DBCursor$CursorType;

    .line 499
    :cond_6
    return-void

    .line 498
    :cond_7
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_cursorType:Lcom/mongodb/DBCursor$CursorType;

    if-eq p1, v0, :cond_6

    .line 501
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "can\'t switch cursor access methods"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method _fill(I)V
    .registers 3
    .param p1, "n"    # I

    .prologue
    .line 604
    sget-object v0, Lcom/mongodb/DBCursor$CursorType;->ARRAY:Lcom/mongodb/DBCursor$CursorType;

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCursor;->_checkType(Lcom/mongodb/DBCursor$CursorType;)V

    .line 605
    :goto_5
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_all:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_17

    invoke-direct {p0}, Lcom/mongodb/DBCursor;->_hasNext()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 606
    invoke-direct {p0}, Lcom/mongodb/DBCursor;->_next()Lcom/mongodb/DBObject;

    goto :goto_5

    .line 607
    :cond_17
    return-void
.end method

.method public addOption(I)Lcom/mongodb/DBCursor;
    .registers 3
    .param p1, "option"    # I

    .prologue
    .line 397
    iget v0, p0, Lcom/mongodb/DBCursor;->_options:I

    or-int/2addr v0, p1

    iput v0, p0, Lcom/mongodb/DBCursor;->_options:I

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCursor;->setOptions(I)Lcom/mongodb/DBCursor;

    .line 399
    return-object p0
.end method

.method public addSpecial(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/DBCursor;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "o"    # Ljava/lang/Object;

    .prologue
    .line 212
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_specialFields:Lcom/mongodb/DBObject;

    if-nez v0, :cond_b

    .line 213
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    iput-object v0, p0, Lcom/mongodb/DBCursor;->_specialFields:Lcom/mongodb/DBObject;

    .line 214
    :cond_b
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_specialFields:Lcom/mongodb/DBObject;

    invoke-interface {v0, p1, p2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    return-object p0
.end method

.method public batchSize(I)Lcom/mongodb/DBCursor;
    .registers 3
    .param p1, "n"    # I

    .prologue
    .line 338
    const/4 v0, 0x1

    if-ne p1, v0, :cond_4

    .line 339
    const/4 p1, 0x2

    .line 341
    :cond_4
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-eqz v0, :cond_d

    .line 342
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    invoke-virtual {v0, p1}, Lcom/mongodb/QueryResultIterator;->setBatchSize(I)V

    .line 345
    :cond_d
    iput p1, p0, Lcom/mongodb/DBCursor;->_batchSize:I

    .line 346
    return-object p0
.end method

.method public close()V
    .registers 2

    .prologue
    .line 374
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-eqz v0, :cond_9

    .line 375
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    invoke-virtual {v0}, Lcom/mongodb/QueryResultIterator;->close()V

    .line 376
    :cond_9
    return-void
.end method

.method public comment(Ljava/lang/String;)Lcom/mongodb/DBCursor;
    .registers 3
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 86
    const-string v0, "$comment"

    invoke-virtual {p0, v0, p1}, Lcom/mongodb/DBCursor;->addSpecial(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/DBCursor;

    .line 87
    return-object p0
.end method

.method public copy()Lcom/mongodb/DBCursor;
    .registers 6

    .prologue
    .line 158
    new-instance v0, Lcom/mongodb/DBCursor;

    iget-object v1, p0, Lcom/mongodb/DBCursor;->_collection:Lcom/mongodb/DBCollection;

    iget-object v2, p0, Lcom/mongodb/DBCursor;->_query:Lcom/mongodb/DBObject;

    iget-object v3, p0, Lcom/mongodb/DBCursor;->_keysWanted:Lcom/mongodb/DBObject;

    iget-object v4, p0, Lcom/mongodb/DBCursor;->_readPref:Lcom/mongodb/ReadPreference;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mongodb/DBCursor;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)V

    .line 159
    .local v0, "c":Lcom/mongodb/DBCursor;
    iget-object v1, p0, Lcom/mongodb/DBCursor;->_orderBy:Lcom/mongodb/DBObject;

    iput-object v1, v0, Lcom/mongodb/DBCursor;->_orderBy:Lcom/mongodb/DBObject;

    .line 160
    iget-object v1, p0, Lcom/mongodb/DBCursor;->_hint:Ljava/lang/String;

    iput-object v1, v0, Lcom/mongodb/DBCursor;->_hint:Ljava/lang/String;

    .line 161
    iget-object v1, p0, Lcom/mongodb/DBCursor;->_hintDBObj:Lcom/mongodb/DBObject;

    iput-object v1, v0, Lcom/mongodb/DBCursor;->_hintDBObj:Lcom/mongodb/DBObject;

    .line 162
    iget v1, p0, Lcom/mongodb/DBCursor;->_limit:I

    iput v1, v0, Lcom/mongodb/DBCursor;->_limit:I

    .line 163
    iget v1, p0, Lcom/mongodb/DBCursor;->_skip:I

    iput v1, v0, Lcom/mongodb/DBCursor;->_skip:I

    .line 164
    iget v1, p0, Lcom/mongodb/DBCursor;->_options:I

    iput v1, v0, Lcom/mongodb/DBCursor;->_options:I

    .line 165
    iget v1, p0, Lcom/mongodb/DBCursor;->_batchSize:I

    iput v1, v0, Lcom/mongodb/DBCursor;->_batchSize:I

    .line 166
    iget-boolean v1, p0, Lcom/mongodb/DBCursor;->_snapshot:Z

    iput-boolean v1, v0, Lcom/mongodb/DBCursor;->_snapshot:Z

    .line 167
    iget-boolean v1, p0, Lcom/mongodb/DBCursor;->_explain:Z

    iput-boolean v1, v0, Lcom/mongodb/DBCursor;->_explain:Z

    .line 168
    iget-wide v1, p0, Lcom/mongodb/DBCursor;->_maxTimeMS:J

    iput-wide v1, v0, Lcom/mongodb/DBCursor;->_maxTimeMS:J

    .line 169
    iget-object v1, p0, Lcom/mongodb/DBCursor;->_specialFields:Lcom/mongodb/DBObject;

    if-eqz v1, :cond_46

    .line 170
    new-instance v1, Lcom/mongodb/BasicDBObject;

    iget-object v2, p0, Lcom/mongodb/DBCursor;->_specialFields:Lcom/mongodb/DBObject;

    invoke-interface {v2}, Lcom/mongodb/DBObject;->toMap()Ljava/util/Map;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/util/Map;)V

    iput-object v1, v0, Lcom/mongodb/DBCursor;->_specialFields:Lcom/mongodb/DBObject;

    .line 171
    :cond_46
    return-object v0
.end method

.method public count()I
    .registers 12

    .prologue
    const-wide/16 v3, 0x0

    .line 668
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_collection:Lcom/mongodb/DBCollection;

    iget-object v1, p0, Lcom/mongodb/DBCursor;->_query:Lcom/mongodb/DBObject;

    iget-object v2, p0, Lcom/mongodb/DBCursor;->_keysWanted:Lcom/mongodb/DBObject;

    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v7

    iget-wide v8, p0, Lcom/mongodb/DBCursor;->_maxTimeMS:J

    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide v5, v3

    invoke-virtual/range {v0 .. v10}, Lcom/mongodb/DBCollection;->getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;JJLcom/mongodb/ReadPreference;JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public curr()Lcom/mongodb/DBObject;
    .registers 2

    .prologue
    .line 589
    sget-object v0, Lcom/mongodb/DBCursor$CursorType;->ITERATOR:Lcom/mongodb/DBCursor$CursorType;

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCursor;->_checkType(Lcom/mongodb/DBCursor$CursorType;)V

    .line 590
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_cur:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public explain()Lcom/mongodb/DBObject;
    .registers 3

    .prologue
    .line 291
    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->copy()Lcom/mongodb/DBCursor;

    move-result-object v0

    .line 292
    .local v0, "c":Lcom/mongodb/DBCursor;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/mongodb/DBCursor;->_explain:Z

    .line 293
    iget v1, v0, Lcom/mongodb/DBCursor;->_limit:I

    if-lez v1, :cond_14

    .line 295
    iget v1, v0, Lcom/mongodb/DBCursor;->_limit:I

    mul-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/mongodb/DBCursor;->_batchSize:I

    .line 296
    const/4 v1, 0x0

    iput v1, v0, Lcom/mongodb/DBCursor;->_limit:I

    .line 298
    :cond_14
    invoke-virtual {v0}, Lcom/mongodb/DBCursor;->next()Lcom/mongodb/DBObject;

    move-result-object v1

    return-object v1
.end method

.method public getCollection()Lcom/mongodb/DBCollection;
    .registers 2

    .prologue
    .line 715
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_collection:Lcom/mongodb/DBCollection;

    return-object v0
.end method

.method public getCursorId()J
    .registers 3

    .prologue
    .line 367
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-nez v0, :cond_7

    const-wide/16 v0, 0x0

    :goto_6
    return-wide v0

    :cond_7
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    invoke-virtual {v0}, Lcom/mongodb/QueryResultIterator;->getCursorId()J

    move-result-wide v0

    goto :goto_6
.end method

.method public getDecoderFactory()Lcom/mongodb/DBDecoderFactory;
    .registers 2

    .prologue
    .line 753
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_decoderFact:Lcom/mongodb/DBDecoderFactory;

    return-object v0
.end method

.method public getKeysWanted()Lcom/mongodb/DBObject;
    .registers 2

    .prologue
    .line 699
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_keysWanted:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getOptions()I
    .registers 2

    .prologue
    .line 433
    iget v0, p0, Lcom/mongodb/DBCursor;->_options:I

    return v0
.end method

.method public getQuery()Lcom/mongodb/DBObject;
    .registers 2

    .prologue
    .line 707
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_query:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getReadPreference()Lcom/mongodb/ReadPreference;
    .registers 2

    .prologue
    .line 744
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_readPref:Lcom/mongodb/ReadPreference;

    return-object v0
.end method

.method public getServerAddress()Lcom/mongodb/ServerAddress;
    .registers 2

    .prologue
    .line 724
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    invoke-virtual {v0}, Lcom/mongodb/QueryResultIterator;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    goto :goto_5
.end method

.method public getSizes()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 542
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-nez v0, :cond_9

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    invoke-virtual {v0}, Lcom/mongodb/QueryResultIterator;->getSizes()Ljava/util/List;

    move-result-object v0

    goto :goto_8
.end method

.method hasFinalizer()Z
    .registers 2

    .prologue
    .line 782
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-nez v0, :cond_6

    .line 783
    const/4 v0, 0x0

    .line 785
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    invoke-virtual {v0}, Lcom/mongodb/QueryResultIterator;->hasFinalizer()Z

    move-result v0

    goto :goto_5
.end method

.method public hasNext()Z
    .registers 2

    .prologue
    .line 570
    sget-object v0, Lcom/mongodb/DBCursor$CursorType;->ITERATOR:Lcom/mongodb/DBCursor$CursorType;

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCursor;->_checkType(Lcom/mongodb/DBCursor$CursorType;)V

    .line 571
    invoke-direct {p0}, Lcom/mongodb/DBCursor;->_hasNext()Z

    move-result v0

    return v0
.end method

.method public hint(Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;
    .registers 4
    .param p1, "indexKeys"    # Lcom/mongodb/DBObject;

    .prologue
    .line 224
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-eqz v0, :cond_c

    .line 225
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "can\'t hint after executing query"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 227
    :cond_c
    iput-object p1, p0, Lcom/mongodb/DBCursor;->_hintDBObj:Lcom/mongodb/DBObject;

    .line 228
    return-object p0
.end method

.method public hint(Ljava/lang/String;)Lcom/mongodb/DBCursor;
    .registers 4
    .param p1, "indexName"    # Ljava/lang/String;

    .prologue
    .line 237
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-eqz v0, :cond_c

    .line 238
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "can\'t hint after executing query"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 240
    :cond_c
    iput-object p1, p0, Lcom/mongodb/DBCursor;->_hint:Ljava/lang/String;

    .line 241
    return-object p0
.end method

.method public itcount()I
    .registers 3

    .prologue
    .line 652
    const/4 v0, 0x0

    .line 653
    .local v0, "n":I
    :goto_1
    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 654
    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->next()Lcom/mongodb/DBObject;

    .line 655
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 657
    :cond_d
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 183
    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->copy()Lcom/mongodb/DBCursor;

    move-result-object v0

    return-object v0
.end method

.method public length()I
    .registers 2

    .prologue
    .line 618
    sget-object v0, Lcom/mongodb/DBCursor$CursorType;->ARRAY:Lcom/mongodb/DBCursor$CursorType;

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCursor;->_checkType(Lcom/mongodb/DBCursor$CursorType;)V

    .line 619
    const v0, 0x7fffffff

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCursor;->_fill(I)V

    .line 620
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_all:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public limit(I)Lcom/mongodb/DBCursor;
    .registers 4
    .param p1, "n"    # I

    .prologue
    .line 310
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-eqz v0, :cond_c

    .line 311
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "can\'t set limit after executing query"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 313
    :cond_c
    if-lez p1, :cond_11

    .line 314
    iput p1, p0, Lcom/mongodb/DBCursor;->_limit:I

    .line 317
    :cond_10
    :goto_10
    return-object p0

    .line 315
    :cond_11
    if-gez p1, :cond_10

    .line 316
    invoke-virtual {p0, p1}, Lcom/mongodb/DBCursor;->batchSize(I)Lcom/mongodb/DBCursor;

    goto :goto_10
.end method

.method public max(Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;
    .registers 3
    .param p1, "max"    # Lcom/mongodb/DBObject;

    .prologue
    .line 109
    const-string v0, "$max"

    invoke-virtual {p0, v0, p1}, Lcom/mongodb/DBCursor;->addSpecial(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/DBCursor;

    .line 110
    return-object p0
.end method

.method public maxScan(I)Lcom/mongodb/DBCursor;
    .registers 4
    .param p1, "max"    # I

    .prologue
    .line 98
    const-string v0, "$maxScan"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/DBCursor;->addSpecial(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/DBCursor;

    .line 99
    return-object p0
.end method

.method public maxTime(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/DBCursor;
    .registers 6
    .param p1, "maxTime"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 256
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/DBCursor;->_maxTimeMS:J

    .line 257
    return-object p0
.end method

.method public min(Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;
    .registers 3
    .param p1, "min"    # Lcom/mongodb/DBObject;

    .prologue
    .line 120
    const-string v0, "$min"

    invoke-virtual {p0, v0, p1}, Lcom/mongodb/DBCursor;->addSpecial(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/DBCursor;

    .line 121
    return-object p0
.end method

.method public next()Lcom/mongodb/DBObject;
    .registers 2

    .prologue
    .line 580
    sget-object v0, Lcom/mongodb/DBCursor$CursorType;->ITERATOR:Lcom/mongodb/DBCursor$CursorType;

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCursor;->_checkType(Lcom/mongodb/DBCursor$CursorType;)V

    .line 581
    invoke-direct {p0}, Lcom/mongodb/DBCursor;->_next()Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->next()Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public numGetMores()I
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 532
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    invoke-virtual {v0}, Lcom/mongodb/QueryResultIterator;->numGetMores()I

    move-result v0

    goto :goto_5
.end method

.method public numSeen()I
    .registers 2

    .prologue
    .line 559
    iget v0, p0, Lcom/mongodb/DBCursor;->_num:I

    return v0
.end method

.method public one()Lcom/mongodb/DBObject;
    .registers 9

    .prologue
    .line 677
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_collection:Lcom/mongodb/DBCollection;

    iget-object v1, p0, Lcom/mongodb/DBCursor;->_query:Lcom/mongodb/DBObject;

    iget-object v2, p0, Lcom/mongodb/DBCursor;->_keysWanted:Lcom/mongodb/DBObject;

    iget-object v3, p0, Lcom/mongodb/DBCursor;->_orderBy:Lcom/mongodb/DBObject;

    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v4

    iget-wide v5, p0, Lcom/mongodb/DBCursor;->_maxTimeMS:J

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v7}, Lcom/mongodb/DBCollection;->findOne(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .registers 3

    .prologue
    .line 597
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "can\'t remove from a cursor"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public resetOptions()Lcom/mongodb/DBCursor;
    .registers 2

    .prologue
    .line 424
    const/4 v0, 0x0

    iput v0, p0, Lcom/mongodb/DBCursor;->_options:I

    .line 425
    return-object p0
.end method

.method public returnKey()Lcom/mongodb/DBCursor;
    .registers 3

    .prologue
    .line 130
    const-string v0, "$returnKey"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/DBCursor;->addSpecial(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/DBCursor;

    .line 131
    return-object p0
.end method

.method public setDecoderFactory(Lcom/mongodb/DBDecoderFactory;)Lcom/mongodb/DBCursor;
    .registers 2
    .param p1, "fact"    # Lcom/mongodb/DBDecoderFactory;

    .prologue
    .line 748
    iput-object p1, p0, Lcom/mongodb/DBCursor;->_decoderFact:Lcom/mongodb/DBDecoderFactory;

    .line 749
    return-object p0
.end method

.method public setOptions(I)Lcom/mongodb/DBCursor;
    .registers 4
    .param p1, "options"    # I

    .prologue
    .line 407
    and-int/lit8 v0, p1, 0x40

    if-eqz v0, :cond_c

    .line 408
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The exhaust option is not user settable."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 412
    :cond_c
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_12

    .line 413
    or-int/lit8 p1, p1, 0x20

    .line 416
    :cond_12
    iput p1, p0, Lcom/mongodb/DBCursor;->_options:I

    .line 417
    return-object p0
.end method

.method public setReadPreference(Lcom/mongodb/ReadPreference;)Lcom/mongodb/DBCursor;
    .registers 2
    .param p1, "preference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 735
    iput-object p1, p0, Lcom/mongodb/DBCursor;->_readPref:Lcom/mongodb/ReadPreference;

    .line 736
    return-object p0
.end method

.method public showDiskLoc()Lcom/mongodb/DBCursor;
    .registers 3

    .prologue
    .line 141
    const-string v0, "$showDiskLoc"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/DBCursor;->addSpecial(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/DBCursor;

    .line 142
    return-object p0
.end method

.method public size()I
    .registers 12

    .prologue
    .line 689
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_collection:Lcom/mongodb/DBCollection;

    iget-object v1, p0, Lcom/mongodb/DBCursor;->_query:Lcom/mongodb/DBObject;

    iget-object v2, p0, Lcom/mongodb/DBCursor;->_keysWanted:Lcom/mongodb/DBObject;

    iget v3, p0, Lcom/mongodb/DBCursor;->_limit:I

    int-to-long v3, v3

    iget v5, p0, Lcom/mongodb/DBCursor;->_skip:I

    int-to-long v5, v5

    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v7

    iget-wide v8, p0, Lcom/mongodb/DBCursor;->_maxTimeMS:J

    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v10}, Lcom/mongodb/DBCollection;->getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;JJLcom/mongodb/ReadPreference;JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public skip(I)Lcom/mongodb/DBCursor;
    .registers 4
    .param p1, "n"    # I

    .prologue
    .line 356
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-eqz v0, :cond_c

    .line 357
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "can\'t set skip after executing query"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 358
    :cond_c
    iput p1, p0, Lcom/mongodb/DBCursor;->_skip:I

    .line 359
    return-object p0
.end method

.method public slaveOk()Lcom/mongodb/DBCursor;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 388
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCursor;->addOption(I)Lcom/mongodb/DBCursor;

    move-result-object v0

    return-object v0
.end method

.method public snapshot()Lcom/mongodb/DBCursor;
    .registers 3

    .prologue
    .line 270
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-eqz v0, :cond_c

    .line 271
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "can\'t snapshot after executing the query"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 273
    :cond_c
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/DBCursor;->_snapshot:Z

    .line 275
    return-object p0
.end method

.method public sort(Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;
    .registers 4
    .param p1, "orderBy"    # Lcom/mongodb/DBObject;

    .prologue
    .line 195
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_it:Lcom/mongodb/QueryResultIterator;

    if-eqz v0, :cond_c

    .line 196
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "can\'t sort after executing query"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 198
    :cond_c
    iput-object p1, p0, Lcom/mongodb/DBCursor;->_orderBy:Lcom/mongodb/DBObject;

    .line 199
    return-object p0
.end method

.method public toArray()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 629
    const v0, 0x7fffffff

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCursor;->toArray(I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public toArray(I)Ljava/util/List;
    .registers 3
    .param p1, "max"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 639
    sget-object v0, Lcom/mongodb/DBCursor$CursorType;->ARRAY:Lcom/mongodb/DBCursor$CursorType;

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCursor;->_checkType(Lcom/mongodb/DBCursor$CursorType;)V

    .line 640
    add-int/lit8 v0, p1, -0x1

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCursor;->_fill(I)V

    .line 641
    iget-object v0, p0, Lcom/mongodb/DBCursor;->_all:Ljava/util/ArrayList;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 758
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 759
    .local v1, "sb":Ljava/lang/StringBuilder;
    const-string v2, "Cursor id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->getCursorId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 760
    const-string v2, ", ns="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->getCollection()Lcom/mongodb/DBCollection;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/DBCollection;->getFullName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 761
    const-string v2, ", query="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->getQuery()Lcom/mongodb/DBObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 762
    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->getKeysWanted()Lcom/mongodb/DBObject;

    move-result-object v2

    if-eqz v2, :cond_43

    .line 763
    const-string v2, ", fields="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->getKeysWanted()Lcom/mongodb/DBObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 764
    :cond_43
    const-string v2, ", numIterated="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mongodb/DBCursor;->_num:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 765
    iget v2, p0, Lcom/mongodb/DBCursor;->_skip:I

    if-eqz v2, :cond_5d

    .line 766
    const-string v2, ", skip="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mongodb/DBCursor;->_skip:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 767
    :cond_5d
    iget v2, p0, Lcom/mongodb/DBCursor;->_limit:I

    if-eqz v2, :cond_6c

    .line 768
    const-string v2, ", limit="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mongodb/DBCursor;->_limit:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 769
    :cond_6c
    iget v2, p0, Lcom/mongodb/DBCursor;->_batchSize:I

    if-eqz v2, :cond_7b

    .line 770
    const-string v2, ", batchSize="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mongodb/DBCursor;->_batchSize:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 772
    :cond_7b
    invoke-virtual {p0}, Lcom/mongodb/DBCursor;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    .line 773
    .local v0, "addr":Lcom/mongodb/ServerAddress;
    if-eqz v0, :cond_8a

    .line 774
    const-string v2, ", addr="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 776
    :cond_8a
    iget-object v2, p0, Lcom/mongodb/DBCursor;->_readPref:Lcom/mongodb/ReadPreference;

    if-eqz v2, :cond_9d

    .line 777
    const-string v2, ", readPreference="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBCursor;->_readPref:Lcom/mongodb/ReadPreference;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 778
    :cond_9d
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
