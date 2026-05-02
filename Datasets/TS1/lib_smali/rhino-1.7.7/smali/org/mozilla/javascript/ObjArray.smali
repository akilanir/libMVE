.class public Lorg/mozilla/javascript/ObjArray;
.super Ljava/lang/Object;
.source "ObjArray.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final FIELDS_STORE_SIZE:I = 0x5

.field static final serialVersionUID:J = 0x39f02f75d6f74578L


# instance fields
.field private transient data:[Ljava/lang/Object;

.field private transient f0:Ljava/lang/Object;

.field private transient f1:Ljava/lang/Object;

.field private transient f2:Ljava/lang/Object;

.field private transient f3:Ljava/lang/Object;

.field private transient f4:Ljava/lang/Object;

.field private sealed:Z

.field private size:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private ensureCapacity(I)V
    .registers 8
    .param p1, "minimalCapacity"    # I

    .prologue
    const/4 v4, 0x5

    const/4 v5, 0x0

    .line 278
    add-int/lit8 v1, p1, -0x5

    .line 279
    .local v1, "required":I
    if-gtz v1, :cond_c

    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 280
    :cond_c
    iget-object v3, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    if-nez v3, :cond_1a

    .line 281
    const/16 v0, 0xa

    .line 282
    .local v0, "alloc":I
    if-ge v0, v1, :cond_15

    .line 283
    move v0, v1

    .line 285
    :cond_15
    new-array v3, v0, [Ljava/lang/Object;

    iput-object v3, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    .line 305
    :cond_19
    :goto_19
    return-void

    .line 287
    .end local v0    # "alloc":I
    :cond_1a
    iget-object v3, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    array-length v0, v3

    .line 288
    .restart local v0    # "alloc":I
    if-ge v0, v1, :cond_19

    .line 289
    if-gt v0, v4, :cond_38

    .line 290
    const/16 v0, 0xa

    .line 294
    :goto_23
    if-ge v0, v1, :cond_26

    .line 295
    move v0, v1

    .line 297
    :cond_26
    new-array v2, v0, [Ljava/lang/Object;

    .line 298
    .local v2, "tmp":[Ljava/lang/Object;
    iget v3, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    if-le v3, v4, :cond_35

    .line 299
    iget-object v3, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    iget v4, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    add-int/lit8 v4, v4, -0x5

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 302
    :cond_35
    iput-object v2, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    goto :goto_19

    .line 292
    .end local v2    # "tmp":[Ljava/lang/Object;
    :cond_38
    mul-int/lit8 v0, v0, 0x2

    goto :goto_23
.end method

.method private getImpl(I)Ljava/lang/Object;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 76
    packed-switch p1, :pswitch_data_1a

    .line 83
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v1, p1, -0x5

    aget-object v0, v0, v1

    :goto_9
    return-object v0

    .line 77
    :pswitch_a
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    goto :goto_9

    .line 78
    :pswitch_d
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_9

    .line 79
    :pswitch_10
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_9

    .line 80
    :pswitch_13
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_9

    .line 81
    :pswitch_16
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_9

    .line 76
    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_a
        :pswitch_d
        :pswitch_10
        :pswitch_13
        :pswitch_16
    .end packed-switch
.end method

.method private static onEmptyStackTopRead()Ljava/lang/RuntimeException;
    .registers 2

    .prologue
    .line 316
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Empty stack"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static onInvalidIndex(II)Ljava/lang/RuntimeException;
    .registers 5
    .param p0, "index"    # I
    .param p1, "upperBound"    # I

    .prologue
    .line 310
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u2209 [0, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 311
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static onSeledMutation()Ljava/lang/RuntimeException;
    .registers 2

    .prologue
    .line 321
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Attempt to modify sealed array"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 6
    .param p1, "is"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 337
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 338
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 339
    .local v0, "N":I
    const/4 v3, 0x5

    if-le v0, v3, :cond_e

    .line 340
    add-int/lit8 v3, v0, -0x5

    new-array v3, v3, [Ljava/lang/Object;

    iput-object v3, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    .line 342
    :cond_e
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    if-eq v1, v0, :cond_1b

    .line 343
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    .line 344
    .local v2, "obj":Ljava/lang/Object;
    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 342
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 346
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_1b
    return-void
.end method

.method private setImpl(ILjava/lang/Object;)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 88
    packed-switch p1, :pswitch_data_1a

    .line 94
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v1, p1, -0x5

    aput-object p2, v0, v1

    .line 97
    :goto_9
    return-void

    .line 89
    :pswitch_a
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    goto :goto_9

    .line 90
    :pswitch_d
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_9

    .line 91
    :pswitch_10
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_9

    .line 92
    :pswitch_13
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_9

    .line 93
    :pswitch_16
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_9

    .line 88
    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_a
        :pswitch_d
        :pswitch_10
        :pswitch_13
        :pswitch_16
    .end packed-switch
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 5
    .param p1, "os"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 326
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 327
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 328
    .local v0, "N":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    if-eq v1, v0, :cond_12

    .line 329
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v2

    .line 330
    .local v2, "obj":Ljava/lang/Object;
    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 328
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 332
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_12
    return-void
.end method


# virtual methods
.method public final add(ILjava/lang/Object;)V
    .registers 10
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 169
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 170
    .local v0, "N":I
    if-ltz p1, :cond_6

    if-le p1, v0, :cond_d

    :cond_6
    add-int/lit8 v2, v0, 0x1

    invoke-static {p1, v2}, Lorg/mozilla/javascript/ObjArray;->onInvalidIndex(II)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 171
    :cond_d
    iget-boolean v2, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v2, :cond_16

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 173
    :cond_16
    packed-switch p1, :pswitch_data_72

    .line 192
    :goto_19
    add-int/lit8 v2, v0, 0x1

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/ObjArray;->ensureCapacity(I)V

    .line 193
    if-eq p1, v0, :cond_2f

    .line 194
    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v3, p1, -0x5

    iget-object v4, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v5, p1, -0x5

    add-int/lit8 v5, v5, 0x1

    sub-int v6, v0, p1

    invoke-static {v2, v3, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 198
    :cond_2f
    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v3, p1, -0x5

    aput-object p2, v2, v3

    .line 200
    :goto_35
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 201
    return-void

    .line 175
    :pswitch_3a
    if-nez v0, :cond_3f

    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    goto :goto_35

    .line 176
    :cond_3f
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    .local v1, "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    move-object p2, v1

    .line 178
    .end local v1    # "tmp":Ljava/lang/Object;
    :pswitch_44
    const/4 v2, 0x1

    if-ne v0, v2, :cond_4a

    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_35

    .line 179
    :cond_4a
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    .restart local v1    # "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    move-object p2, v1

    .line 181
    .end local v1    # "tmp":Ljava/lang/Object;
    :pswitch_4f
    const/4 v2, 0x2

    if-ne v0, v2, :cond_55

    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_35

    .line 182
    :cond_55
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    .restart local v1    # "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    move-object p2, v1

    .line 184
    .end local v1    # "tmp":Ljava/lang/Object;
    :pswitch_5a
    const/4 v2, 0x3

    if-ne v0, v2, :cond_60

    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_35

    .line 185
    :cond_60
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    .restart local v1    # "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    move-object p2, v1

    .line 187
    .end local v1    # "tmp":Ljava/lang/Object;
    :pswitch_65
    const/4 v2, 0x4

    if-ne v0, v2, :cond_6b

    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_35

    .line 188
    :cond_6b
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    .restart local v1    # "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    move-object p2, v1

    .line 190
    const/4 p1, 0x5

    goto :goto_19

    .line 173
    :pswitch_data_72
    .packed-switch 0x0
        :pswitch_3a
        :pswitch_44
        :pswitch_4f
        :pswitch_5a
        :pswitch_65
    .end packed-switch
.end method

.method public final add(Ljava/lang/Object;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 158
    iget-boolean v1, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v1, :cond_9

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 159
    :cond_9
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 160
    .local v0, "N":I
    const/4 v1, 0x5

    if-lt v0, v1, :cond_13

    .line 161
    add-int/lit8 v1, v0, 0x1

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/ObjArray;->ensureCapacity(I)V

    .line 163
    :cond_13
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 164
    invoke-direct {p0, v0, p1}, Lorg/mozilla/javascript/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 165
    return-void
.end method

.method public final clear()V
    .registers 4

    .prologue
    .line 240
    iget-boolean v2, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v2, :cond_9

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 241
    :cond_9
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 242
    .local v0, "N":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-eq v1, v0, :cond_15

    .line 243
    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 242
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 245
    :cond_15
    const/4 v2, 0x0

    iput v2, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 246
    return-void
.end method

.method public final get(I)Ljava/lang/Object;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 63
    if-ltz p1, :cond_6

    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    if-lt p1, v0, :cond_d

    :cond_6
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    invoke-static {p1, v0}, Lorg/mozilla/javascript/ObjArray;->onInvalidIndex(II)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 64
    :cond_d
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 101
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 102
    .local v0, "N":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    if-eq v2, v0, :cond_17

    .line 103
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v1

    .line 104
    .local v1, "current":Ljava/lang/Object;
    if-eq v1, p1, :cond_13

    if-eqz v1, :cond_14

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 108
    .end local v1    # "current":Ljava/lang/Object;
    .end local v2    # "i":I
    :cond_13
    :goto_13
    return v2

    .line 102
    .restart local v1    # "current":Ljava/lang/Object;
    .restart local v2    # "i":I
    :cond_14
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 108
    .end local v1    # "current":Ljava/lang/Object;
    :cond_17
    const/4 v2, -0x1

    goto :goto_13
.end method

.method public final isEmpty()Z
    .registers 2

    .prologue
    .line 36
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public final isSealed()Z
    .registers 2

    .prologue
    .line 26
    iget-boolean v0, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    return v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 113
    iget v1, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .local v1, "i":I
    :cond_2
    if-eqz v1, :cond_16

    .line 114
    add-int/lit8 v1, v1, -0x1

    .line 115
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v0

    .line 116
    .local v0, "current":Ljava/lang/Object;
    if-eq v0, p1, :cond_14

    if-eqz v0, :cond_2

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_14
    move v2, v1

    .line 120
    .end local v0    # "current":Ljava/lang/Object;
    :goto_15
    return v2

    :cond_16
    const/4 v2, -0x1

    goto :goto_15
.end method

.method public final peek()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 125
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 126
    .local v0, "N":I
    if-nez v0, :cond_9

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onEmptyStackTopRead()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 127
    :cond_9
    add-int/lit8 v1, v0, -0x1

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public final pop()Ljava/lang/Object;
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 132
    iget-boolean v2, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v2, :cond_a

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 133
    :cond_a
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 134
    .local v0, "N":I
    add-int/lit8 v0, v0, -0x1

    .line 136
    packed-switch v0, :pswitch_data_3e

    .line 144
    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v3, v0, -0x5

    aget-object v1, v2, v3

    .line 145
    .local v1, "top":Ljava/lang/Object;
    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v3, v0, -0x5

    aput-object v4, v2, v3

    .line 147
    :goto_1d
    iput v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 148
    return-object v1

    .line 137
    .end local v1    # "top":Ljava/lang/Object;
    :pswitch_20
    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onEmptyStackTopRead()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 138
    :pswitch_25
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    .restart local v1    # "top":Ljava/lang/Object;
    iput-object v4, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    goto :goto_1d

    .line 139
    .end local v1    # "top":Ljava/lang/Object;
    :pswitch_2a
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    .restart local v1    # "top":Ljava/lang/Object;
    iput-object v4, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_1d

    .line 140
    .end local v1    # "top":Ljava/lang/Object;
    :pswitch_2f
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    .restart local v1    # "top":Ljava/lang/Object;
    iput-object v4, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_1d

    .line 141
    .end local v1    # "top":Ljava/lang/Object;
    :pswitch_34
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    .restart local v1    # "top":Ljava/lang/Object;
    iput-object v4, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_1d

    .line 142
    .end local v1    # "top":Ljava/lang/Object;
    :pswitch_39
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    .restart local v1    # "top":Ljava/lang/Object;
    iput-object v4, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_1d

    .line 136
    :pswitch_data_3e
    .packed-switch -0x1
        :pswitch_20
        :pswitch_25
        :pswitch_2a
        :pswitch_2f
        :pswitch_34
        :pswitch_39
    .end packed-switch
.end method

.method public final push(Ljava/lang/Object;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 153
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 154
    return-void
.end method

.method public final remove(I)V
    .registers 9
    .param p1, "index"    # I

    .prologue
    const/4 v6, 0x0

    .line 205
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 206
    .local v0, "N":I
    if-ltz p1, :cond_7

    if-lt p1, v0, :cond_c

    :cond_7
    invoke-static {p1, v0}, Lorg/mozilla/javascript/ObjArray;->onInvalidIndex(II)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 207
    :cond_c
    iget-boolean v1, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v1, :cond_15

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 208
    :cond_15
    add-int/lit8 v0, v0, -0x1

    .line 209
    packed-switch p1, :pswitch_data_6a

    .line 228
    :goto_1a
    if-eq p1, v0, :cond_2b

    .line 229
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v2, p1, -0x5

    add-int/lit8 v2, v2, 0x1

    iget-object v3, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v4, p1, -0x5

    sub-int v5, v0, p1

    invoke-static {v1, v2, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 233
    :cond_2b
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v2, v0, -0x5

    aput-object v6, v1, v2

    .line 235
    :goto_31
    iput v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 236
    return-void

    .line 211
    :pswitch_34
    if-nez v0, :cond_39

    iput-object v6, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    goto :goto_31

    .line 212
    :cond_39
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    iput-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    .line 214
    :pswitch_3d
    const/4 v1, 0x1

    if-ne v0, v1, :cond_43

    iput-object v6, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_31

    .line 215
    :cond_43
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    iput-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    .line 217
    :pswitch_47
    const/4 v1, 0x2

    if-ne v0, v1, :cond_4d

    iput-object v6, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_31

    .line 218
    :cond_4d
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    iput-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    .line 220
    :pswitch_51
    const/4 v1, 0x3

    if-ne v0, v1, :cond_57

    iput-object v6, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_31

    .line 221
    :cond_57
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    iput-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    .line 223
    :pswitch_5b
    const/4 v1, 0x4

    if-ne v0, v1, :cond_61

    iput-object v6, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_31

    .line 224
    :cond_61
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iput-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    .line 226
    const/4 p1, 0x5

    goto :goto_1a

    .line 209
    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_34
        :pswitch_3d
        :pswitch_47
        :pswitch_51
        :pswitch_5b
    .end packed-switch
.end method

.method public final seal()V
    .registers 2

    .prologue
    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    .line 32
    return-void
.end method

.method public final set(ILjava/lang/Object;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 69
    if-ltz p1, :cond_6

    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    if-lt p1, v0, :cond_d

    :cond_6
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    invoke-static {p1, v0}, Lorg/mozilla/javascript/ObjArray;->onInvalidIndex(II)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 70
    :cond_d
    iget-boolean v0, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v0, :cond_16

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 71
    :cond_16
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 72
    return-void
.end method

.method public final setSize(I)V
    .registers 5
    .param p1, "newSize"    # I

    .prologue
    .line 46
    if-gez p1, :cond_8

    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v2

    .line 47
    :cond_8
    iget-boolean v2, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v2, :cond_11

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 48
    :cond_11
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 49
    .local v0, "N":I
    if-ge p1, v0, :cond_1f

    .line 50
    move v1, p1

    .local v1, "i":I
    :goto_16
    if-eq v1, v0, :cond_27

    .line 51
    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 50
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 53
    .end local v1    # "i":I
    :cond_1f
    if-le p1, v0, :cond_27

    .line 54
    const/4 v2, 0x5

    if-le p1, v2, :cond_27

    .line 55
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ObjArray;->ensureCapacity(I)V

    .line 58
    :cond_27
    iput p1, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 59
    return-void
.end method

.method public final size()I
    .registers 2

    .prologue
    .line 41
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    return v0
.end method

.method public final toArray([Ljava/lang/Object;)V
    .registers 3
    .param p1, "array"    # [Ljava/lang/Object;

    .prologue
    .line 257
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/mozilla/javascript/ObjArray;->toArray([Ljava/lang/Object;I)V

    .line 258
    return-void
.end method

.method public final toArray([Ljava/lang/Object;I)V
    .registers 8
    .param p1, "array"    # [Ljava/lang/Object;
    .param p2, "offset"    # I

    .prologue
    .line 262
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 263
    .local v0, "N":I
    packed-switch v0, :pswitch_data_2e

    .line 265
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    const/4 v2, 0x0

    add-int/lit8 v3, p2, 0x5

    add-int/lit8 v4, v0, -0x5

    invoke-static {v1, v2, p1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 267
    :pswitch_f
    add-int/lit8 v1, p2, 0x4

    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 268
    :pswitch_15
    add-int/lit8 v1, p2, 0x3

    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 269
    :pswitch_1b
    add-int/lit8 v1, p2, 0x2

    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 270
    :pswitch_21
    add-int/lit8 v1, p2, 0x1

    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 271
    :pswitch_27
    add-int/lit8 v1, p2, 0x0

    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 274
    :pswitch_2d
    return-void

    .line 263
    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_2d
        :pswitch_27
        :pswitch_21
        :pswitch_1b
        :pswitch_15
        :pswitch_f
    .end packed-switch
.end method

.method public final toArray()[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 250
    iget v1, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    new-array v0, v1, [Ljava/lang/Object;

    .line 251
    .local v0, "array":[Ljava/lang/Object;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/javascript/ObjArray;->toArray([Ljava/lang/Object;I)V

    .line 252
    return-object v0
.end method
