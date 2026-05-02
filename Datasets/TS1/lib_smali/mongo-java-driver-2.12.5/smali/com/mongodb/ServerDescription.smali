.class Lcom/mongodb/ServerDescription;
.super Ljava/lang/Object;
.source "ServerDescription.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/ServerDescription$Builder;
    }
.end annotation

.annotation runtime Lorg/bson/util/annotations/Immutable;
.end annotation


# static fields
.field private static final DEFAULT_MAX_DOCUMENT_SIZE:I = 0x1000000

.field private static final DEFAULT_MAX_MESSAGE_SIZE:I = 0x2000000

.field private static final DEFAULT_MAX_WRITE_BATCH_SIZE:I = 0x200

.field static final MAX_DRIVER_WIRE_VERSION:I = 0x2

.field static final MIN_DRIVER_WIRE_VERSION:I


# instance fields
.field private final address:Lcom/mongodb/ServerAddress;

.field private final arbiters:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final averageLatencyNanos:J

.field private exception:Ljava/lang/Throwable;

.field private final hosts:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final maxDocumentSize:I

.field private final maxMessageSize:I

.field private final maxWireVersion:I

.field private final maxWriteBatchSize:I

.field private final minWireVersion:I

.field private final ok:Z

.field private final passives:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final primary:Ljava/lang/String;

.field private final setName:Ljava/lang/String;

.field private final state:Lcom/mongodb/ServerConnectionState;

.field private final tags:Lcom/mongodb/Tags;

.field private final type:Lcom/mongodb/ServerType;

.field private final version:Lcom/mongodb/ServerVersion;


# direct methods
.method constructor <init>(Lcom/mongodb/ServerDescription$Builder;)V
    .registers 4
    .param p1, "builder"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 525
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 526
    const-string v0, "address"

    # getter for: Lcom/mongodb/ServerDescription$Builder;->address:Lcom/mongodb/ServerAddress;
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$000(Lcom/mongodb/ServerDescription$Builder;)Lcom/mongodb/ServerAddress;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerAddress;

    iput-object v0, p0, Lcom/mongodb/ServerDescription;->address:Lcom/mongodb/ServerAddress;

    .line 527
    const-string v0, "type"

    # getter for: Lcom/mongodb/ServerDescription$Builder;->type:Lcom/mongodb/ServerType;
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$100(Lcom/mongodb/ServerDescription$Builder;)Lcom/mongodb/ServerType;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerType;

    iput-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    .line 528
    const-string v0, "state"

    # getter for: Lcom/mongodb/ServerDescription$Builder;->state:Lcom/mongodb/ServerConnectionState;
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$200(Lcom/mongodb/ServerDescription$Builder;)Lcom/mongodb/ServerConnectionState;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerConnectionState;

    iput-object v0, p0, Lcom/mongodb/ServerDescription;->state:Lcom/mongodb/ServerConnectionState;

    .line 529
    const-string v0, "version"

    # getter for: Lcom/mongodb/ServerDescription$Builder;->version:Lcom/mongodb/ServerVersion;
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$300(Lcom/mongodb/ServerDescription$Builder;)Lcom/mongodb/ServerVersion;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerVersion;

    iput-object v0, p0, Lcom/mongodb/ServerDescription;->version:Lcom/mongodb/ServerVersion;

    .line 530
    # getter for: Lcom/mongodb/ServerDescription$Builder;->hosts:Ljava/util/Set;
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$400(Lcom/mongodb/ServerDescription$Builder;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerDescription;->hosts:Ljava/util/Set;

    .line 531
    # getter for: Lcom/mongodb/ServerDescription$Builder;->passives:Ljava/util/Set;
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$500(Lcom/mongodb/ServerDescription$Builder;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerDescription;->passives:Ljava/util/Set;

    .line 532
    # getter for: Lcom/mongodb/ServerDescription$Builder;->arbiters:Ljava/util/Set;
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$600(Lcom/mongodb/ServerDescription$Builder;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerDescription;->arbiters:Ljava/util/Set;

    .line 533
    # getter for: Lcom/mongodb/ServerDescription$Builder;->primary:Ljava/lang/String;
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$700(Lcom/mongodb/ServerDescription$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerDescription;->primary:Ljava/lang/String;

    .line 534
    # getter for: Lcom/mongodb/ServerDescription$Builder;->maxDocumentSize:I
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$800(Lcom/mongodb/ServerDescription$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/ServerDescription;->maxDocumentSize:I

    .line 535
    # getter for: Lcom/mongodb/ServerDescription$Builder;->maxMessageSize:I
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$900(Lcom/mongodb/ServerDescription$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/ServerDescription;->maxMessageSize:I

    .line 536
    # getter for: Lcom/mongodb/ServerDescription$Builder;->maxWriteBatchSize:I
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$1000(Lcom/mongodb/ServerDescription$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/ServerDescription;->maxWriteBatchSize:I

    .line 537
    # getter for: Lcom/mongodb/ServerDescription$Builder;->tags:Lcom/mongodb/Tags;
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$1100(Lcom/mongodb/ServerDescription$Builder;)Lcom/mongodb/Tags;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerDescription;->tags:Lcom/mongodb/Tags;

    .line 538
    # getter for: Lcom/mongodb/ServerDescription$Builder;->setName:Ljava/lang/String;
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$1200(Lcom/mongodb/ServerDescription$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerDescription;->setName:Ljava/lang/String;

    .line 539
    # getter for: Lcom/mongodb/ServerDescription$Builder;->averageLatency:J
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$1300(Lcom/mongodb/ServerDescription$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ServerDescription;->averageLatencyNanos:J

    .line 540
    # getter for: Lcom/mongodb/ServerDescription$Builder;->ok:Z
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$1400(Lcom/mongodb/ServerDescription$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mongodb/ServerDescription;->ok:Z

    .line 541
    # getter for: Lcom/mongodb/ServerDescription$Builder;->minWireVersion:I
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$1500(Lcom/mongodb/ServerDescription$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/ServerDescription;->minWireVersion:I

    .line 542
    # getter for: Lcom/mongodb/ServerDescription$Builder;->maxWireVersion:I
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$1600(Lcom/mongodb/ServerDescription$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/ServerDescription;->maxWireVersion:I

    .line 543
    # getter for: Lcom/mongodb/ServerDescription$Builder;->exception:Ljava/lang/Throwable;
    invoke-static {p1}, Lcom/mongodb/ServerDescription$Builder;->access$1700(Lcom/mongodb/ServerDescription$Builder;)Ljava/lang/Throwable;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    .line 544
    return-void
.end method

.method public static builder()Lcom/mongodb/ServerDescription$Builder;
    .registers 1

    .prologue
    .line 238
    new-instance v0, Lcom/mongodb/ServerDescription$Builder;

    invoke-direct {v0}, Lcom/mongodb/ServerDescription$Builder;-><init>()V

    return-object v0
.end method

.method private getAverageLatencyFormattedInMilliseconds()Ljava/lang/String;
    .registers 6

    .prologue
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 522
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "#0.0"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lcom/mongodb/ServerDescription;->averageLatencyNanos:J

    long-to-double v1, v1

    div-double/2addr v1, v3

    div-double/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDefaultMaxDocumentSize()I
    .registers 1

    .prologue
    .line 218
    const/high16 v0, 0x1000000

    return v0
.end method

.method public static getDefaultMaxMessageSize()I
    .registers 1

    .prologue
    .line 222
    const/high16 v0, 0x2000000

    return v0
.end method

.method public static getDefaultMaxWireVersion()I
    .registers 1

    .prologue
    .line 230
    const/4 v0, 0x0

    return v0
.end method

.method public static getDefaultMaxWriteBatchSize()I
    .registers 1

    .prologue
    .line 234
    const/16 v0, 0x200

    return v0
.end method

.method public static getDefaultMinWireVersion()I
    .registers 1

    .prologue
    .line 226
    const/4 v0, 0x0

    return v0
.end method

.method private translateExceptionToString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 505
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 506
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v2, "{"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 507
    iget-object v2, p0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 508
    const-string v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 509
    iget-object v2, p0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 510
    .local v1, "cur":Ljava/lang/Throwable;
    :goto_1a
    if-eqz v1, :cond_33

    .line 511
    const-string v2, ", caused by "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 512
    const-string v2, "{"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 513
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 514
    const-string v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 515
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    goto :goto_1a

    .line 518
    :cond_33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 12
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v7, 0x0

    .line 372
    if-ne p0, p1, :cond_7

    move v5, v6

    .line 443
    :goto_6
    return v5

    .line 375
    :cond_7
    if-eqz p1, :cond_13

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    if-eq v8, v9, :cond_15

    :cond_13
    move v5, v7

    .line 376
    goto :goto_6

    :cond_15
    move-object v0, p1

    .line 379
    check-cast v0, Lcom/mongodb/ServerDescription;

    .line 381
    .local v0, "that":Lcom/mongodb/ServerDescription;
    iget v8, p0, Lcom/mongodb/ServerDescription;->maxDocumentSize:I

    iget v9, v0, Lcom/mongodb/ServerDescription;->maxDocumentSize:I

    if-eq v8, v9, :cond_20

    move v5, v7

    .line 382
    goto :goto_6

    .line 384
    :cond_20
    iget v8, p0, Lcom/mongodb/ServerDescription;->maxMessageSize:I

    iget v9, v0, Lcom/mongodb/ServerDescription;->maxMessageSize:I

    if-eq v8, v9, :cond_28

    move v5, v7

    .line 385
    goto :goto_6

    .line 387
    :cond_28
    iget v8, p0, Lcom/mongodb/ServerDescription;->maxWriteBatchSize:I

    iget v9, v0, Lcom/mongodb/ServerDescription;->maxWriteBatchSize:I

    if-eq v8, v9, :cond_30

    move v5, v7

    .line 388
    goto :goto_6

    .line 390
    :cond_30
    iget-boolean v8, p0, Lcom/mongodb/ServerDescription;->ok:Z

    iget-boolean v9, v0, Lcom/mongodb/ServerDescription;->ok:Z

    if-eq v8, v9, :cond_38

    move v5, v7

    .line 391
    goto :goto_6

    .line 393
    :cond_38
    iget-object v8, p0, Lcom/mongodb/ServerDescription;->address:Lcom/mongodb/ServerAddress;

    iget-object v9, v0, Lcom/mongodb/ServerDescription;->address:Lcom/mongodb/ServerAddress;

    invoke-virtual {v8, v9}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_44

    move v5, v7

    .line 394
    goto :goto_6

    .line 396
    :cond_44
    iget-object v8, p0, Lcom/mongodb/ServerDescription;->arbiters:Ljava/util/Set;

    iget-object v9, v0, Lcom/mongodb/ServerDescription;->arbiters:Ljava/util/Set;

    invoke-interface {v8, v9}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_50

    move v5, v7

    .line 397
    goto :goto_6

    .line 399
    :cond_50
    iget-object v8, p0, Lcom/mongodb/ServerDescription;->hosts:Ljava/util/Set;

    iget-object v9, v0, Lcom/mongodb/ServerDescription;->hosts:Ljava/util/Set;

    invoke-interface {v8, v9}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5c

    move v5, v7

    .line 400
    goto :goto_6

    .line 402
    :cond_5c
    iget-object v8, p0, Lcom/mongodb/ServerDescription;->passives:Ljava/util/Set;

    iget-object v9, v0, Lcom/mongodb/ServerDescription;->passives:Ljava/util/Set;

    invoke-interface {v8, v9}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_68

    move v5, v7

    .line 403
    goto :goto_6

    .line 405
    :cond_68
    iget-object v8, p0, Lcom/mongodb/ServerDescription;->primary:Ljava/lang/String;

    if-eqz v8, :cond_78

    iget-object v8, p0, Lcom/mongodb/ServerDescription;->primary:Ljava/lang/String;

    iget-object v9, v0, Lcom/mongodb/ServerDescription;->primary:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7c

    :cond_76
    move v5, v7

    .line 406
    goto :goto_6

    .line 405
    :cond_78
    iget-object v8, v0, Lcom/mongodb/ServerDescription;->primary:Ljava/lang/String;

    if-nez v8, :cond_76

    .line 408
    :cond_7c
    iget-object v8, p0, Lcom/mongodb/ServerDescription;->setName:Ljava/lang/String;

    if-eqz v8, :cond_8d

    iget-object v8, p0, Lcom/mongodb/ServerDescription;->setName:Ljava/lang/String;

    iget-object v9, v0, Lcom/mongodb/ServerDescription;->setName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_91

    :cond_8a
    move v5, v7

    .line 409
    goto/16 :goto_6

    .line 408
    :cond_8d
    iget-object v8, v0, Lcom/mongodb/ServerDescription;->setName:Ljava/lang/String;

    if-nez v8, :cond_8a

    .line 411
    :cond_91
    iget-object v8, p0, Lcom/mongodb/ServerDescription;->state:Lcom/mongodb/ServerConnectionState;

    iget-object v9, v0, Lcom/mongodb/ServerDescription;->state:Lcom/mongodb/ServerConnectionState;

    if-eq v8, v9, :cond_9a

    move v5, v7

    .line 412
    goto/16 :goto_6

    .line 414
    :cond_9a
    iget-object v8, p0, Lcom/mongodb/ServerDescription;->tags:Lcom/mongodb/Tags;

    iget-object v9, v0, Lcom/mongodb/ServerDescription;->tags:Lcom/mongodb/Tags;

    invoke-virtual {v8, v9}, Lcom/mongodb/Tags;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_a7

    move v5, v7

    .line 415
    goto/16 :goto_6

    .line 417
    :cond_a7
    iget-object v8, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    iget-object v9, v0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    if-eq v8, v9, :cond_b0

    move v5, v7

    .line 418
    goto/16 :goto_6

    .line 420
    :cond_b0
    iget-object v8, p0, Lcom/mongodb/ServerDescription;->version:Lcom/mongodb/ServerVersion;

    iget-object v9, v0, Lcom/mongodb/ServerDescription;->version:Lcom/mongodb/ServerVersion;

    invoke-virtual {v8, v9}, Lcom/mongodb/ServerVersion;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_bd

    move v5, v7

    .line 421
    goto/16 :goto_6

    .line 423
    :cond_bd
    iget v8, p0, Lcom/mongodb/ServerDescription;->minWireVersion:I

    iget v9, v0, Lcom/mongodb/ServerDescription;->minWireVersion:I

    if-eq v8, v9, :cond_c6

    move v5, v7

    .line 424
    goto/16 :goto_6

    .line 426
    :cond_c6
    iget v8, p0, Lcom/mongodb/ServerDescription;->maxWireVersion:I

    iget v9, v0, Lcom/mongodb/ServerDescription;->maxWireVersion:I

    if-eq v8, v9, :cond_cf

    move v5, v7

    .line 427
    goto/16 :goto_6

    .line 431
    :cond_cf
    iget-object v8, p0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    if-eqz v8, :cond_ee

    iget-object v8, p0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 432
    .local v3, "thisExceptionClass":Ljava/lang/Class;
    :goto_d9
    iget-object v8, v0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    if-eqz v8, :cond_f0

    iget-object v8, v0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 433
    .local v1, "thatExceptionClass":Ljava/lang/Class;
    :goto_e3
    if-eqz v3, :cond_f2

    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_f4

    :cond_eb
    move v5, v7

    .line 434
    goto/16 :goto_6

    .end local v1    # "thatExceptionClass":Ljava/lang/Class;
    .end local v3    # "thisExceptionClass":Ljava/lang/Class;
    :cond_ee
    move-object v3, v5

    .line 431
    goto :goto_d9

    .restart local v3    # "thisExceptionClass":Ljava/lang/Class;
    :cond_f0
    move-object v1, v5

    .line 432
    goto :goto_e3

    .line 433
    .restart local v1    # "thatExceptionClass":Ljava/lang/Class;
    :cond_f2
    if-nez v1, :cond_eb

    .line 437
    :cond_f4
    iget-object v8, p0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    if-eqz v8, :cond_113

    iget-object v8, p0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    invoke-virtual {v8}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    .line 438
    .local v4, "thisExceptionMessage":Ljava/lang/String;
    :goto_fe
    iget-object v8, v0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    if-eqz v8, :cond_115

    iget-object v5, v0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    .line 439
    .local v2, "thatExceptionMessage":Ljava/lang/String;
    :goto_108
    if-eqz v4, :cond_117

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_119

    :cond_110
    move v5, v7

    .line 440
    goto/16 :goto_6

    .end local v2    # "thatExceptionMessage":Ljava/lang/String;
    .end local v4    # "thisExceptionMessage":Ljava/lang/String;
    :cond_113
    move-object v4, v5

    .line 437
    goto :goto_fe

    .restart local v4    # "thisExceptionMessage":Ljava/lang/String;
    :cond_115
    move-object v2, v5

    .line 438
    goto :goto_108

    .line 439
    .restart local v2    # "thatExceptionMessage":Ljava/lang/String;
    :cond_117
    if-nez v2, :cond_110

    :cond_119
    move v5, v6

    .line 443
    goto/16 :goto_6
.end method

.method public getAddress()Lcom/mongodb/ServerAddress;
    .registers 2

    .prologue
    .line 242
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->address:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method public getArbiters()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 275
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->arbiters:Ljava/util/Set;

    return-object v0
.end method

.method public getAverageLatencyNanos()J
    .registers 3

    .prologue
    .line 357
    iget-wide v0, p0, Lcom/mongodb/ServerDescription;->averageLatencyNanos:J

    return-wide v0
.end method

.method public getClusterType()Lcom/mongodb/ClusterType;
    .registers 2

    .prologue
    .line 349
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    invoke-virtual {v0}, Lcom/mongodb/ServerType;->getClusterType()Lcom/mongodb/ClusterType;

    move-result-object v0

    return-object v0
.end method

.method public getException()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 361
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getHosts()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 267
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->hosts:Ljava/util/Set;

    return-object v0
.end method

.method public getMaxDocumentSize()I
    .registers 2

    .prologue
    .line 283
    iget v0, p0, Lcom/mongodb/ServerDescription;->maxDocumentSize:I

    return v0
.end method

.method public getMaxMessageSize()I
    .registers 2

    .prologue
    .line 287
    iget v0, p0, Lcom/mongodb/ServerDescription;->maxMessageSize:I

    return v0
.end method

.method public getMaxWireVersion()I
    .registers 2

    .prologue
    .line 303
    iget v0, p0, Lcom/mongodb/ServerDescription;->maxWireVersion:I

    return v0
.end method

.method public getMaxWriteBatchSize()I
    .registers 2

    .prologue
    .line 291
    iget v0, p0, Lcom/mongodb/ServerDescription;->maxWriteBatchSize:I

    return v0
.end method

.method public getMinWireVersion()I
    .registers 2

    .prologue
    .line 299
    iget v0, p0, Lcom/mongodb/ServerDescription;->minWireVersion:I

    return v0
.end method

.method public getPassives()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 271
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->passives:Ljava/util/Set;

    return-object v0
.end method

.method public getPrimary()Ljava/lang/String;
    .registers 2

    .prologue
    .line 279
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->primary:Ljava/lang/String;

    return-object v0
.end method

.method public getSetName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 333
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->setName:Ljava/lang/String;

    return-object v0
.end method

.method public getShortDescription()Ljava/lang/String;
    .registers 4

    .prologue
    .line 494
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{address="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->address:Lcom/mongodb/ServerAddress;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/mongodb/ServerDescription;->tags:Lcom/mongodb/Tags;

    invoke-virtual {v0}, Lcom/mongodb/Tags;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_73

    const-string v0, ""

    :goto_27
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/mongodb/ServerDescription;->state:Lcom/mongodb/ServerConnectionState;

    sget-object v2, Lcom/mongodb/ServerConnectionState;->Connected:Lcom/mongodb/ServerConnectionState;

    if-ne v0, v2, :cond_89

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", averageLatency="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/mongodb/ServerDescription;->getAverageLatencyFormattedInMilliseconds()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " ms"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_4e
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->state:Lcom/mongodb/ServerConnectionState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    if-nez v0, :cond_8c

    const-string v0, ""

    :goto_64
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/mongodb/ServerDescription;->tags:Lcom/mongodb/Tags;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_27

    :cond_89
    const-string v0, ""

    goto :goto_4e

    :cond_8c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", exception="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/mongodb/ServerDescription;->translateExceptionToString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_64
.end method

.method public getState()Lcom/mongodb/ServerConnectionState;
    .registers 2

    .prologue
    .line 341
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->state:Lcom/mongodb/ServerConnectionState;

    return-object v0
.end method

.method public getTags()Lcom/mongodb/Tags;
    .registers 2

    .prologue
    .line 295
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->tags:Lcom/mongodb/Tags;

    return-object v0
.end method

.method public getType()Lcom/mongodb/ServerType;
    .registers 2

    .prologue
    .line 345
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    return-object v0
.end method

.method public getVersion()Lcom/mongodb/ServerVersion;
    .registers 2

    .prologue
    .line 353
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->version:Lcom/mongodb/ServerVersion;

    return-object v0
.end method

.method public hasTags(Lcom/mongodb/Tags;)Z
    .registers 9
    .param p1, "desiredTags"    # Lcom/mongodb/Tags;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 315
    iget-boolean v2, p0, Lcom/mongodb/ServerDescription;->ok:Z

    if-nez v2, :cond_8

    move v2, v3

    .line 328
    :goto_7
    return v2

    .line 319
    :cond_8
    iget-object v2, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v5, Lcom/mongodb/ServerType;->StandAlone:Lcom/mongodb/ServerType;

    if-eq v2, v5, :cond_14

    iget-object v2, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v5, Lcom/mongodb/ServerType;->ShardRouter:Lcom/mongodb/ServerType;

    if-ne v2, v5, :cond_16

    :cond_14
    move v2, v4

    .line 320
    goto :goto_7

    .line 323
    :cond_16
    invoke-virtual {p1}, Lcom/mongodb/Tags;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_44

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 324
    .local v1, "tag":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mongodb/ServerDescription;->getTags()Lcom/mongodb/Tags;

    move-result-object v5

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/mongodb/Tags;->get(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1e

    move v2, v3

    .line 325
    goto :goto_7

    .end local v1    # "tag":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_44
    move v2, v4

    .line 328
    goto :goto_7
.end method

.method public hashCode()I
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 449
    iget-object v1, p0, Lcom/mongodb/ServerDescription;->address:Lcom/mongodb/ServerAddress;

    invoke-virtual {v1}, Lcom/mongodb/ServerAddress;->hashCode()I

    move-result v0

    .line 450
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    invoke-virtual {v3}, Lcom/mongodb/ServerType;->hashCode()I

    move-result v3

    add-int v0, v1, v3

    .line 451
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lcom/mongodb/ServerDescription;->hosts:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->hashCode()I

    move-result v3

    add-int v0, v1, v3

    .line 452
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lcom/mongodb/ServerDescription;->passives:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->hashCode()I

    move-result v3

    add-int v0, v1, v3

    .line 453
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lcom/mongodb/ServerDescription;->arbiters:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->hashCode()I

    move-result v3

    add-int v0, v1, v3

    .line 454
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->primary:Ljava/lang/String;

    if-eqz v1, :cond_a2

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->primary:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_3b
    add-int v0, v3, v1

    .line 455
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lcom/mongodb/ServerDescription;->maxDocumentSize:I

    add-int v0, v1, v3

    .line 456
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lcom/mongodb/ServerDescription;->maxMessageSize:I

    add-int v0, v1, v3

    .line 457
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lcom/mongodb/ServerDescription;->maxWriteBatchSize:I

    add-int v0, v1, v3

    .line 458
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lcom/mongodb/ServerDescription;->tags:Lcom/mongodb/Tags;

    invoke-virtual {v3}, Lcom/mongodb/Tags;->hashCode()I

    move-result v3

    add-int v0, v1, v3

    .line 459
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->setName:Ljava/lang/String;

    if-eqz v1, :cond_a4

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->setName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_65
    add-int v0, v3, v1

    .line 460
    mul-int/lit8 v3, v0, 0x1f

    iget-boolean v1, p0, Lcom/mongodb/ServerDescription;->ok:Z

    if-eqz v1, :cond_a6

    const/4 v1, 0x1

    :goto_6e
    add-int v0, v3, v1

    .line 461
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lcom/mongodb/ServerDescription;->state:Lcom/mongodb/ServerConnectionState;

    invoke-virtual {v3}, Lcom/mongodb/ServerConnectionState;->hashCode()I

    move-result v3

    add-int v0, v1, v3

    .line 462
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lcom/mongodb/ServerDescription;->version:Lcom/mongodb/ServerVersion;

    invoke-virtual {v3}, Lcom/mongodb/ServerVersion;->hashCode()I

    move-result v3

    add-int v0, v1, v3

    .line 463
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lcom/mongodb/ServerDescription;->minWireVersion:I

    add-int v0, v1, v3

    .line 464
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lcom/mongodb/ServerDescription;->maxWireVersion:I

    add-int v0, v1, v3

    .line 465
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    if-nez v1, :cond_a8

    move v1, v2

    :goto_97
    add-int v0, v3, v1

    .line 466
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    if-nez v3, :cond_b3

    :goto_9f
    add-int v0, v1, v2

    .line 467
    return v0

    :cond_a2
    move v1, v2

    .line 454
    goto :goto_3b

    :cond_a4
    move v1, v2

    .line 459
    goto :goto_65

    :cond_a6
    move v1, v2

    .line 460
    goto :goto_6e

    .line 465
    :cond_a8
    iget-object v1, p0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_97

    .line 466
    :cond_b3
    iget-object v2, p0, Lcom/mongodb/ServerDescription;->exception:Ljava/lang/Throwable;

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_9f
.end method

.method public isCompatibleWithDriver()Z
    .registers 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 202
    iget-boolean v2, p0, Lcom/mongodb/ServerDescription;->ok:Z

    if-nez v2, :cond_7

    .line 214
    :cond_6
    :goto_6
    return v0

    .line 206
    :cond_7
    iget v2, p0, Lcom/mongodb/ServerDescription;->minWireVersion:I

    const/4 v3, 0x2

    if-le v2, v3, :cond_e

    move v0, v1

    .line 207
    goto :goto_6

    .line 210
    :cond_e
    iget v2, p0, Lcom/mongodb/ServerDescription;->maxWireVersion:I

    if-gez v2, :cond_6

    move v0, v1

    .line 211
    goto :goto_6
.end method

.method public isOk()Z
    .registers 2

    .prologue
    .line 337
    iget-boolean v0, p0, Lcom/mongodb/ServerDescription;->ok:Z

    return v0
.end method

.method public isPrimary()Z
    .registers 3

    .prologue
    .line 259
    iget-boolean v0, p0, Lcom/mongodb/ServerDescription;->ok:Z

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->ReplicaSetPrimary:Lcom/mongodb/ServerType;

    if-eq v0, v1, :cond_16

    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->ShardRouter:Lcom/mongodb/ServerType;

    if-eq v0, v1, :cond_16

    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->StandAlone:Lcom/mongodb/ServerType;

    if-ne v0, v1, :cond_18

    :cond_16
    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public isReplicaSetMember()Z
    .registers 3

    .prologue
    .line 246
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->ReplicaSetPrimary:Lcom/mongodb/ServerType;

    if-eq v0, v1, :cond_1e

    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->ReplicaSetSecondary:Lcom/mongodb/ServerType;

    if-eq v0, v1, :cond_1e

    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->ReplicaSetArbiter:Lcom/mongodb/ServerType;

    if-eq v0, v1, :cond_1e

    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->ReplicaSetOther:Lcom/mongodb/ServerType;

    if-eq v0, v1, :cond_1e

    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->ReplicaSetGhost:Lcom/mongodb/ServerType;

    if-ne v0, v1, :cond_20

    :cond_1e
    const/4 v0, 0x1

    :goto_1f
    return v0

    :cond_20
    const/4 v0, 0x0

    goto :goto_1f
.end method

.method public isSecondary()Z
    .registers 3

    .prologue
    .line 263
    iget-boolean v0, p0, Lcom/mongodb/ServerDescription;->ok:Z

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->ReplicaSetSecondary:Lcom/mongodb/ServerType;

    if-eq v0, v1, :cond_16

    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->ShardRouter:Lcom/mongodb/ServerType;

    if-eq v0, v1, :cond_16

    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->StandAlone:Lcom/mongodb/ServerType;

    if-ne v0, v1, :cond_18

    :cond_16
    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public isShardRouter()Z
    .registers 3

    .prologue
    .line 251
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->ShardRouter:Lcom/mongodb/ServerType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isStandAlone()Z
    .registers 3

    .prologue
    .line 255
    iget-object v0, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->StandAlone:Lcom/mongodb/ServerType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    const/16 v2, 0x27

    .line 472
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ServerDescription{address="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->address:Lcom/mongodb/ServerAddress;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->type:Lcom/mongodb/ServerType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", hosts="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->hosts:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", passives="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->passives:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", arbiters="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->arbiters:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", primary=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->primary:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", maxDocumentSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/ServerDescription;->maxDocumentSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", maxMessageSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/ServerDescription;->maxMessageSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", maxWriteBatchSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/ServerDescription;->maxWriteBatchSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", tags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->tags:Lcom/mongodb/Tags;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", setName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->setName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", averageLatencyNanos="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/mongodb/ServerDescription;->averageLatencyNanos:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", ok="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/ServerDescription;->ok:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->state:Lcom/mongodb/ServerConnectionState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", version="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerDescription;->version:Lcom/mongodb/ServerVersion;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", minWireVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/ServerDescription;->minWireVersion:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", maxWireVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/ServerDescription;->maxWireVersion:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
