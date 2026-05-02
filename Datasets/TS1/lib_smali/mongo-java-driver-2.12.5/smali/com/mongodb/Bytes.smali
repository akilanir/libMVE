.class public Lcom/mongodb/Bytes;
.super Lorg/bson/BSON;
.source "Bytes.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/Bytes$OptionHolder;
    }
.end annotation


# static fields
.field static final BATCH_INSERT_SIZE:I = 0x800000

.field static final COLLECTION_REF_ID:Lorg/bson/types/ObjectId;

.field static final CONNECTIONS_PER_HOST:I

.field static final D:Z

.field static final LOGGER:Ljava/util/logging/Logger;

.field static final MAX_OBJECT_SIZE:I = 0x400000

.field public static final ORDER:Ljava/nio/ByteOrder;

.field public static final QUERYOPTION_AWAITDATA:I = 0x20

.field public static final QUERYOPTION_EXHAUST:I = 0x40

.field public static final QUERYOPTION_NOTIMEOUT:I = 0x10

.field public static final QUERYOPTION_OPLOGREPLAY:I = 0x8

.field public static final QUERYOPTION_PARTIAL:I = 0x80

.field public static final QUERYOPTION_SLAVEOK:I = 0x4

.field public static final QUERYOPTION_TAILABLE:I = 0x2

.field public static final RESULTFLAG_AWAITCAPABLE:I = 0x8

.field public static final RESULTFLAG_CURSORNOTFOUND:I = 0x1

.field public static final RESULTFLAG_ERRSET:I = 0x2

.field public static final RESULTFLAG_SHARDCONFIGSTALE:I = 0x4


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, -0x1

    .line 39
    const-string v0, "com.mongodb"

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/Bytes;->LOGGER:Ljava/util/logging/Logger;

    .line 41
    const-string v0, "DEBUG.MONGO"

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/mongodb/Bytes;->D:Z

    .line 44
    sget-object v0, Lcom/mongodb/Bytes;->LOGGER:Ljava/util/logging/Logger;

    invoke-virtual {v0}, Ljava/util/logging/Logger;->getLevel()Ljava/util/logging/Level;

    move-result-object v0

    if-nez v0, :cond_24

    .line 45
    sget-boolean v0, Lcom/mongodb/Bytes;->D:Z

    if-eqz v0, :cond_3e

    .line 46
    sget-object v0, Lcom/mongodb/Bytes;->LOGGER:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->ALL:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->setLevel(Ljava/util/logging/Level;)V

    .line 53
    :cond_24
    :goto_24
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    sput-object v0, Lcom/mongodb/Bytes;->ORDER:Ljava/nio/ByteOrder;

    .line 61
    const-string v0, "MONGO.POOLSIZE"

    const-string v1, "10"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/mongodb/Bytes;->CONNECTIONS_PER_HOST:I

    .line 226
    new-instance v0, Lorg/bson/types/ObjectId;

    invoke-direct {v0, v2, v2, v2}, Lorg/bson/types/ObjectId;-><init>(III)V

    sput-object v0, Lcom/mongodb/Bytes;->COLLECTION_REF_ID:Lorg/bson/types/ObjectId;

    return-void

    .line 48
    :cond_3e
    sget-object v0, Lcom/mongodb/Bytes;->LOGGER:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->setLevel(Ljava/util/logging/Level;)V

    goto :goto_24
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/bson/BSON;-><init>()V

    .line 131
    return-void
.end method

.method public static getType(Ljava/lang/Object;)B
    .registers 2
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 170
    if-nez p0, :cond_5

    .line 171
    const/16 v0, 0xa

    .line 223
    :goto_4
    return v0

    .line 173
    :cond_5
    instance-of v0, p0, Lcom/mongodb/DBPointer;

    if-eqz v0, :cond_c

    .line 174
    const/16 v0, 0xc

    goto :goto_4

    .line 176
    :cond_c
    instance-of v0, p0, Ljava/lang/Integer;

    if-nez v0, :cond_1c

    instance-of v0, p0, Ljava/lang/Short;

    if-nez v0, :cond_1c

    instance-of v0, p0, Ljava/lang/Byte;

    if-nez v0, :cond_1c

    instance-of v0, p0, Ljava/util/concurrent/atomic/AtomicInteger;

    if-eqz v0, :cond_1f

    .line 180
    :cond_1c
    const/16 v0, 0x10

    goto :goto_4

    .line 183
    :cond_1f
    instance-of v0, p0, Ljava/lang/Long;

    if-nez v0, :cond_27

    instance-of v0, p0, Ljava/util/concurrent/atomic/AtomicLong;

    if-eqz v0, :cond_2a

    .line 184
    :cond_27
    const/16 v0, 0x12

    goto :goto_4

    .line 187
    :cond_2a
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_30

    .line 188
    const/4 v0, 0x1

    goto :goto_4

    .line 190
    :cond_30
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_36

    .line 191
    const/4 v0, 0x2

    goto :goto_4

    .line 193
    :cond_36
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_3c

    .line 194
    const/4 v0, 0x4

    goto :goto_4

    .line 196
    :cond_3c
    instance-of v0, p0, [B

    if-eqz v0, :cond_42

    .line 197
    const/4 v0, 0x5

    goto :goto_4

    .line 199
    :cond_42
    instance-of v0, p0, Lorg/bson/types/ObjectId;

    if-eqz v0, :cond_48

    .line 200
    const/4 v0, 0x7

    goto :goto_4

    .line 202
    :cond_48
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_4f

    .line 203
    const/16 v0, 0x8

    goto :goto_4

    .line 205
    :cond_4f
    instance-of v0, p0, Ljava/util/Date;

    if-eqz v0, :cond_56

    .line 206
    const/16 v0, 0x9

    goto :goto_4

    .line 208
    :cond_56
    instance-of v0, p0, Lorg/bson/types/BSONTimestamp;

    if-eqz v0, :cond_5d

    .line 209
    const/16 v0, 0x11

    goto :goto_4

    .line 211
    :cond_5d
    instance-of v0, p0, Ljava/util/regex/Pattern;

    if-eqz v0, :cond_64

    .line 212
    const/16 v0, 0xb

    goto :goto_4

    .line 214
    :cond_64
    instance-of v0, p0, Lcom/mongodb/DBObject;

    if-nez v0, :cond_6c

    instance-of v0, p0, Lcom/mongodb/DBRefBase;

    if-eqz v0, :cond_6e

    .line 215
    :cond_6c
    const/4 v0, 0x3

    goto :goto_4

    .line 217
    :cond_6e
    instance-of v0, p0, Lorg/bson/types/Code;

    if-eqz v0, :cond_75

    .line 218
    const/16 v0, 0xd

    goto :goto_4

    .line 220
    :cond_75
    instance-of v0, p0, Lorg/bson/types/CodeWScope;

    if-eqz v0, :cond_7c

    .line 221
    const/16 v0, 0xf

    goto :goto_4

    .line 223
    :cond_7c
    const/4 v0, -0x1

    goto :goto_4
.end method
