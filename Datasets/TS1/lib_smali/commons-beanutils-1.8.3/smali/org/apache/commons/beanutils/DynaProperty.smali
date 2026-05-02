.class public Lorg/apache/commons/beanutils/DynaProperty;
.super Ljava/lang/Object;
.source "DynaProperty.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final BOOLEAN_TYPE:I = 0x1

.field private static final BYTE_TYPE:I = 0x2

.field private static final CHAR_TYPE:I = 0x3

.field private static final DOUBLE_TYPE:I = 0x4

.field private static final FLOAT_TYPE:I = 0x5

.field private static final INT_TYPE:I = 0x6

.field private static final LONG_TYPE:I = 0x7

.field private static final SHORT_TYPE:I = 0x8

.field static class$java$lang$Object:Ljava/lang/Class;

.field static class$java$util$List:Ljava/lang/Class;

.field static class$java$util$Map:Ljava/lang/Class;


# instance fields
.field protected transient contentType:Ljava/lang/Class;

.field protected name:Ljava/lang/String;

.field protected transient type:Ljava/lang/Class;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 77
    sget-object v0, Lorg/apache/commons/beanutils/DynaProperty;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v0, :cond_10

    const-string v0, "java.lang.Object"

    invoke-static {v0}, Lorg/apache/commons/beanutils/DynaProperty;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/DynaProperty;->class$java$lang$Object:Ljava/lang/Class;

    :goto_c
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/DynaProperty;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 79
    return-void

    .line 77
    :cond_10
    sget-object v0, Lorg/apache/commons/beanutils/DynaProperty;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_c
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    const/4 v0, 0x0

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    iput-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->name:Ljava/lang/String;

    .line 129
    iput-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    .line 91
    iput-object p1, p0, Lorg/apache/commons/beanutils/DynaProperty;->name:Ljava/lang/String;

    .line 92
    iput-object p2, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    .line 93
    if-eqz p2, :cond_1a

    invoke-virtual {p2}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 94
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->contentType:Ljava/lang/Class;

    .line 97
    :cond_1a
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;
    .param p3, "contentType"    # Ljava/lang/Class;

    .prologue
    const/4 v0, 0x0

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    iput-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->name:Ljava/lang/String;

    .line 129
    iput-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    .line 110
    iput-object p1, p0, Lorg/apache/commons/beanutils/DynaProperty;->name:Ljava/lang/String;

    .line 111
    iput-object p2, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    .line 112
    iput-object p3, p0, Lorg/apache/commons/beanutils/DynaProperty;->contentType:Ljava/lang/Class;

    .line 114
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 77
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private readAnyClass(Ljava/io/ObjectInputStream;)Ljava/lang/Class;
    .registers 4
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 344
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 346
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    packed-switch v0, :pswitch_data_34

    .line 358
    new-instance v0, Ljava/io/StreamCorruptedException;

    const-string v1, "Invalid primitive type. Check version of beanutils used to serialize is compatible."

    invoke-direct {v0, v1}, Ljava/io/StreamCorruptedException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 348
    :pswitch_15
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 366
    :goto_17
    return-object v0

    .line 349
    :pswitch_18
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    goto :goto_17

    .line 350
    :pswitch_1b
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    goto :goto_17

    .line 351
    :pswitch_1e
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    goto :goto_17

    .line 352
    :pswitch_21
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    goto :goto_17

    .line 353
    :pswitch_24
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    goto :goto_17

    .line 354
    :pswitch_27
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    goto :goto_17

    .line 355
    :pswitch_2a
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    goto :goto_17

    .line 366
    :cond_2d
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    goto :goto_17

    .line 346
    :pswitch_data_34
    .packed-switch 0x1
        :pswitch_15
        :pswitch_18
        :pswitch_1b
        :pswitch_1e
        :pswitch_21
        :pswitch_24
        :pswitch_27
        :pswitch_2a
    .end packed-switch
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 328
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/DynaProperty;->readAnyClass(Ljava/io/ObjectInputStream;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    .line 330
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaProperty;->isMapped()Z

    move-result v0

    if-nez v0, :cond_12

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaProperty;->isIndexed()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 331
    :cond_12
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/DynaProperty;->readAnyClass(Ljava/io/ObjectInputStream;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->contentType:Ljava/lang/Class;

    .line 335
    :cond_18
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 336
    return-void
.end method

.method private writeAnyClass(Ljava/lang/Class;Ljava/io/ObjectOutputStream;)V
    .registers 5
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 288
    const/4 v0, 0x0

    .line 289
    .local v0, "primitiveType":I
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 290
    const/4 v0, 0x1

    .line 307
    :cond_a
    :goto_a
    if-nez v0, :cond_5b

    .line 309
    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 310
    invoke-virtual {p2, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 316
    :goto_13
    return-void

    .line 291
    :cond_14
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 292
    const/4 v0, 0x2

    goto :goto_a

    .line 293
    :cond_1e
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 294
    const/4 v0, 0x3

    goto :goto_a

    .line 295
    :cond_28
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_32

    .line 296
    const/4 v0, 0x4

    goto :goto_a

    .line 297
    :cond_32
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3c

    .line 298
    const/4 v0, 0x5

    goto :goto_a

    .line 299
    :cond_3c
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 300
    const/4 v0, 0x6

    goto :goto_a

    .line 301
    :cond_46
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_50

    .line 302
    const/4 v0, 0x7

    goto :goto_a

    .line 303
    :cond_50
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 304
    const/16 v0, 0x8

    goto :goto_a

    .line 313
    :cond_5b
    const/4 v1, 0x1

    invoke-virtual {p2, v1}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 314
    invoke-virtual {p2, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    goto :goto_13
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 273
    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/beanutils/DynaProperty;->writeAnyClass(Ljava/lang/Class;Ljava/io/ObjectOutputStream;)V

    .line 275
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaProperty;->isMapped()Z

    move-result v0

    if-nez v0, :cond_11

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaProperty;->isIndexed()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 276
    :cond_11
    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->contentType:Ljava/lang/Class;

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/beanutils/DynaProperty;->writeAnyClass(Ljava/lang/Class;Ljava/io/ObjectOutputStream;)V

    .line 280
    :cond_16
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 281
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 214
    const/4 v0, 0x0

    .line 216
    .local v0, "result":Z
    if-ne p1, p0, :cond_29

    move v0, v2

    .line 218
    :goto_6
    if-nez v0, :cond_28

    instance-of v4, p1, Lorg/apache/commons/beanutils/DynaProperty;

    if-eqz v4, :cond_28

    move-object v1, p1

    .line 219
    check-cast v1, Lorg/apache/commons/beanutils/DynaProperty;

    .line 220
    .local v1, "that":Lorg/apache/commons/beanutils/DynaProperty;
    iget-object v4, p0, Lorg/apache/commons/beanutils/DynaProperty;->name:Ljava/lang/String;

    if-nez v4, :cond_2b

    iget-object v4, v1, Lorg/apache/commons/beanutils/DynaProperty;->name:Ljava/lang/String;

    if-nez v4, :cond_35

    :cond_17
    iget-object v4, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    if-nez v4, :cond_37

    iget-object v4, v1, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    if-nez v4, :cond_35

    :goto_1f
    iget-object v4, p0, Lorg/apache/commons/beanutils/DynaProperty;->contentType:Ljava/lang/Class;

    if-nez v4, :cond_42

    iget-object v4, v1, Lorg/apache/commons/beanutils/DynaProperty;->contentType:Ljava/lang/Class;

    if-nez v4, :cond_35

    :goto_27
    move v0, v2

    .line 226
    .end local v1    # "that":Lorg/apache/commons/beanutils/DynaProperty;
    :cond_28
    :goto_28
    return v0

    :cond_29
    move v0, v3

    .line 216
    goto :goto_6

    .line 220
    .restart local v1    # "that":Lorg/apache/commons/beanutils/DynaProperty;
    :cond_2b
    iget-object v4, p0, Lorg/apache/commons/beanutils/DynaProperty;->name:Ljava/lang/String;

    iget-object v5, v1, Lorg/apache/commons/beanutils/DynaProperty;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_17

    :cond_35
    move v0, v3

    goto :goto_28

    :cond_37
    iget-object v4, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    iget-object v5, v1, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_35

    goto :goto_1f

    :cond_42
    iget-object v4, p0, Lorg/apache/commons/beanutils/DynaProperty;->contentType:Ljava/lang/Class;

    iget-object v5, v1, Lorg/apache/commons/beanutils/DynaProperty;->contentType:Ljava/lang/Class;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_35

    goto :goto_27
.end method

.method public getContentType()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->contentType:Ljava/lang/Class;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 236
    const/4 v0, 0x1

    .line 238
    .local v0, "result":I
    iget-object v1, p0, Lorg/apache/commons/beanutils/DynaProperty;->name:Ljava/lang/String;

    if-nez v1, :cond_1b

    move v1, v2

    :goto_7
    add-int/lit8 v0, v1, 0x1f

    .line 239
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    if-nez v1, :cond_22

    move v1, v2

    :goto_10
    add-int v0, v3, v1

    .line 240
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lorg/apache/commons/beanutils/DynaProperty;->contentType:Ljava/lang/Class;

    if-nez v3, :cond_29

    :goto_18
    add-int v0, v1, v2

    .line 242
    return v0

    .line 238
    :cond_1b
    iget-object v1, p0, Lorg/apache/commons/beanutils/DynaProperty;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_7

    .line 239
    :cond_22
    iget-object v1, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_10

    .line 240
    :cond_29
    iget-object v2, p0, Lorg/apache/commons/beanutils/DynaProperty;->contentType:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_18
.end method

.method public isIndexed()Z
    .registers 5

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 175
    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    if-nez v0, :cond_8

    move v0, v1

    .line 182
    :goto_7
    return v0

    .line 177
    :cond_8
    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_12

    move v0, v2

    .line 178
    goto :goto_7

    .line 179
    :cond_12
    sget-object v0, Lorg/apache/commons/beanutils/DynaProperty;->class$java$util$List:Ljava/lang/Class;

    if-nez v0, :cond_28

    const-string v0, "java.util.List"

    invoke-static {v0}, Lorg/apache/commons/beanutils/DynaProperty;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/DynaProperty;->class$java$util$List:Ljava/lang/Class;

    :goto_1e
    iget-object v3, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    invoke-virtual {v0, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2b

    move v0, v2

    .line 180
    goto :goto_7

    .line 179
    :cond_28
    sget-object v0, Lorg/apache/commons/beanutils/DynaProperty;->class$java$util$List:Ljava/lang/Class;

    goto :goto_1e

    :cond_2b
    move v0, v1

    .line 182
    goto :goto_7
.end method

.method public isMapped()Z
    .registers 3

    .prologue
    .line 196
    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    if-nez v0, :cond_6

    .line 197
    const/4 v0, 0x0

    .line 199
    :goto_5
    return v0

    :cond_6
    sget-object v0, Lorg/apache/commons/beanutils/DynaProperty;->class$java$util$Map:Ljava/lang/Class;

    if-nez v0, :cond_19

    const-string v0, "java.util.Map"

    invoke-static {v0}, Lorg/apache/commons/beanutils/DynaProperty;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/DynaProperty;->class$java$util$Map:Ljava/lang/Class;

    :goto_12
    iget-object v1, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    goto :goto_5

    :cond_19
    sget-object v0, Lorg/apache/commons/beanutils/DynaProperty;->class$java$util$Map:Ljava/lang/Class;

    goto :goto_12
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 251
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "DynaProperty[name="

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 252
    .local v0, "sb":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/commons/beanutils/DynaProperty;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 253
    const-string v1, ",type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 254
    iget-object v1, p0, Lorg/apache/commons/beanutils/DynaProperty;->type:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 255
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaProperty;->isMapped()Z

    move-result v1

    if-nez v1, :cond_22

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaProperty;->isIndexed()Z

    move-result v1

    if-eqz v1, :cond_33

    .line 256
    :cond_22
    const-string v1, " <"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/beanutils/DynaProperty;->contentType:Ljava/lang/Class;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 258
    :cond_33
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 259
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
