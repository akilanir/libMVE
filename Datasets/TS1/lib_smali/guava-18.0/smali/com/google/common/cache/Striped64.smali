.class abstract Lcom/google/common/cache/Striped64;
.super Ljava/lang/Number;
.source "Striped64.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/cache/Striped64$Cell;
    }
.end annotation


# static fields
.field static final NCPU:I

.field private static final UNSAFE:Lsun/misc/Unsafe;

.field private static final baseOffset:J

.field private static final busyOffset:J

.field static final rng:Ljava/util/Random;

.field static final threadHashCode:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<[I>;"
        }
    .end annotation
.end field


# instance fields
.field volatile transient base:J

.field volatile transient busy:I

.field volatile transient cells:[Lcom/google/common/cache/Striped64$Cell;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 125
    new-instance v2, Ljava/lang/ThreadLocal;

    invoke-direct {v2}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v2, Lcom/google/common/cache/Striped64;->threadHashCode:Ljava/lang/ThreadLocal;

    .line 130
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    sput-object v2, Lcom/google/common/cache/Striped64;->rng:Ljava/util/Random;

    .line 133
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v2

    sput v2, Lcom/google/common/cache/Striped64;->NCPU:I

    .line 298
    :try_start_18
    invoke-static {}, Lcom/google/common/cache/Striped64;->getUnsafe()Lsun/misc/Unsafe;

    move-result-object v2

    sput-object v2, Lcom/google/common/cache/Striped64;->UNSAFE:Lsun/misc/Unsafe;

    .line 299
    const-class v1, Lcom/google/common/cache/Striped64;

    .line 300
    .local v1, "sk":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v2, Lcom/google/common/cache/Striped64;->UNSAFE:Lsun/misc/Unsafe;

    const-string v3, "base"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v2, v3}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v2

    sput-wide v2, Lcom/google/common/cache/Striped64;->baseOffset:J

    .line 302
    sget-object v2, Lcom/google/common/cache/Striped64;->UNSAFE:Lsun/misc/Unsafe;

    const-string v3, "busy"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v2, v3}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v2

    sput-wide v2, Lcom/google/common/cache/Striped64;->busyOffset:J
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_3c} :catch_3d

    .line 307
    return-void

    .line 304
    :catch_3d
    move-exception v0

    .line 305
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/Error;

    invoke-direct {v2, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 154
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    .line 155
    return-void
.end method

.method static synthetic access$000()Lsun/misc/Unsafe;
    .registers 1

    .prologue
    .line 21
    invoke-static {}, Lcom/google/common/cache/Striped64;->getUnsafe()Lsun/misc/Unsafe;

    move-result-object v0

    return-object v0
.end method

.method private static getUnsafe()Lsun/misc/Unsafe;
    .registers 4

    .prologue
    .line 318
    :try_start_0
    invoke-static {}, Lsun/misc/Unsafe;->getUnsafe()Lsun/misc/Unsafe;
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 321
    :goto_4
    return-object v1

    .line 319
    :catch_5
    move-exception v1

    .line 321
    :try_start_6
    new-instance v1, Lcom/google/common/cache/Striped64$1;

    invoke-direct {v1}, Lcom/google/common/cache/Striped64$1;-><init>()V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsun/misc/Unsafe;
    :try_end_11
    .catch Ljava/security/PrivilegedActionException; {:try_start_6 .. :try_end_11} :catch_12

    goto :goto_4

    .line 333
    :catch_12
    move-exception v0

    .line 334
    .local v0, "e":Ljava/security/PrivilegedActionException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Could not initialize intrinsics"

    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method final casBase(JJ)Z
    .registers 13
    .param p1, "cmp"    # J
    .param p3, "val"    # J

    .prologue
    .line 161
    sget-object v0, Lcom/google/common/cache/Striped64;->UNSAFE:Lsun/misc/Unsafe;

    sget-wide v2, Lcom/google/common/cache/Striped64;->baseOffset:J

    move-object v1, p0

    move-wide v4, p1

    move-wide v6, p3

    invoke-virtual/range {v0 .. v7}, Lsun/misc/Unsafe;->compareAndSwapLong(Ljava/lang/Object;JJJ)Z

    move-result v0

    return v0
.end method

.method final casBusy()Z
    .registers 7

    .prologue
    .line 168
    sget-object v0, Lcom/google/common/cache/Striped64;->UNSAFE:Lsun/misc/Unsafe;

    sget-wide v2, Lcom/google/common/cache/Striped64;->busyOffset:J

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v1, p0

    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->compareAndSwapInt(Ljava/lang/Object;JII)Z

    move-result v0

    return v0
.end method

.method abstract fn(JJ)J
.end method

.method final internalReset(J)V
    .registers 7
    .param p1, "initialValue"    # J

    .prologue
    .line 280
    iget-object v1, p0, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;

    .line 281
    .local v1, "as":[Lcom/google/common/cache/Striped64$Cell;
    iput-wide p1, p0, Lcom/google/common/cache/Striped64;->base:J

    .line 282
    if-eqz v1, :cond_13

    .line 283
    array-length v3, v1

    .line 284
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    if-ge v2, v3, :cond_13

    .line 285
    aget-object v0, v1, v2

    .line 286
    .local v0, "a":Lcom/google/common/cache/Striped64$Cell;
    if-eqz v0, :cond_10

    .line 287
    iput-wide p1, v0, Lcom/google/common/cache/Striped64$Cell;->value:J

    .line 284
    :cond_10
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 290
    .end local v0    # "a":Lcom/google/common/cache/Striped64$Cell;
    .end local v2    # "i":I
    .end local v3    # "n":I
    :cond_13
    return-void
.end method

.method final retryUpdate(J[IZ)V
    .registers 26
    .param p1, "x"    # J
    .param p3, "hc"    # [I
    .param p4, "wasUncontended"    # Z

    .prologue
    .line 195
    if-nez p3, :cond_75

    .line 196
    sget-object v19, Lcom/google/common/cache/Striped64;->threadHashCode:Ljava/lang/ThreadLocal;

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 p3, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 197
    sget-object v19, Lcom/google/common/cache/Striped64;->rng:Ljava/util/Random;

    invoke-virtual/range {v19 .. v19}, Ljava/util/Random;->nextInt()I

    move-result v15

    .line 198
    .local v15, "r":I
    const/16 v19, 0x0

    if-nez v15, :cond_73

    const/4 v9, 0x1

    :goto_1e
    aput v9, p3, v19

    .line 202
    .end local v15    # "r":I
    .local v9, "h":I
    :goto_20
    const/4 v7, 0x0

    .line 205
    .local v7, "collide":Z
    :cond_21
    :goto_21
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;

    .local v6, "as":[Lcom/google/common/cache/Striped64$Cell;
    if-eqz v6, :cond_10e

    array-length v14, v6

    .local v14, "n":I
    if-lez v14, :cond_10e

    .line 206
    add-int/lit8 v19, v14, -0x1

    and-int v19, v19, v9

    aget-object v5, v6, v19

    .local v5, "a":Lcom/google/common/cache/Striped64$Cell;
    if-nez v5, :cond_96

    .line 207
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/common/cache/Striped64;->busy:I

    move/from16 v19, v0

    if-nez v19, :cond_84

    .line 208
    new-instance v15, Lcom/google/common/cache/Striped64$Cell;

    move-wide/from16 v0, p1

    invoke-direct {v15, v0, v1}, Lcom/google/common/cache/Striped64$Cell;-><init>(J)V

    .line 209
    .local v15, "r":Lcom/google/common/cache/Striped64$Cell;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/common/cache/Striped64;->busy:I

    move/from16 v19, v0

    if-nez v19, :cond_84

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/Striped64;->casBusy()Z

    move-result v19

    if-eqz v19, :cond_84

    .line 210
    const/4 v8, 0x0

    .line 213
    .local v8, "created":Z
    :try_start_50
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;

    move-object/from16 v16, v0

    .local v16, "rs":[Lcom/google/common/cache/Striped64$Cell;
    if-eqz v16, :cond_68

    move-object/from16 v0, v16

    array-length v13, v0

    .local v13, "m":I
    if-lez v13, :cond_68

    add-int/lit8 v19, v13, -0x1

    and-int v12, v19, v9

    .local v12, "j":I
    aget-object v19, v16, v12

    if-nez v19, :cond_68

    .line 216
    aput-object v15, v16, v12
    :try_end_67
    .catchall {:try_start_50 .. :try_end_67} :catchall_7a

    .line 217
    const/4 v8, 0x1

    .line 220
    .end local v12    # "j":I
    .end local v13    # "m":I
    :cond_68
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/Striped64;->busy:I

    .line 222
    if-eqz v8, :cond_21

    .line 274
    .end local v5    # "a":Lcom/google/common/cache/Striped64$Cell;
    .end local v8    # "created":Z
    .end local v14    # "n":I
    .end local v15    # "r":Lcom/google/common/cache/Striped64$Cell;
    .end local v16    # "rs":[Lcom/google/common/cache/Striped64$Cell;
    :cond_72
    :goto_72
    return-void

    .end local v6    # "as":[Lcom/google/common/cache/Striped64$Cell;
    .end local v7    # "collide":Z
    .end local v9    # "h":I
    .local v15, "r":I
    :cond_73
    move v9, v15

    .line 198
    goto :goto_1e

    .line 201
    .end local v15    # "r":I
    :cond_75
    const/16 v19, 0x0

    aget v9, p3, v19

    .restart local v9    # "h":I
    goto :goto_20

    .line 220
    .restart local v5    # "a":Lcom/google/common/cache/Striped64$Cell;
    .restart local v6    # "as":[Lcom/google/common/cache/Striped64$Cell;
    .restart local v7    # "collide":Z
    .restart local v8    # "created":Z
    .restart local v14    # "n":I
    .local v15, "r":Lcom/google/common/cache/Striped64$Cell;
    :catchall_7a
    move-exception v19

    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/Striped64;->busy:I

    throw v19

    .line 227
    .end local v8    # "created":Z
    .end local v15    # "r":Lcom/google/common/cache/Striped64$Cell;
    :cond_84
    const/4 v7, 0x0

    .line 251
    :cond_85
    :goto_85
    shl-int/lit8 v19, v9, 0xd

    xor-int v9, v9, v19

    .line 252
    ushr-int/lit8 v19, v9, 0x11

    xor-int v9, v9, v19

    .line 253
    shl-int/lit8 v19, v9, 0x5

    xor-int v9, v9, v19

    .line 254
    const/16 v19, 0x0

    aput v9, p3, v19

    goto :goto_21

    .line 229
    :cond_96
    if-nez p4, :cond_9b

    .line 230
    const/16 p4, 0x1

    goto :goto_85

    .line 231
    :cond_9b
    iget-wide v0, v5, Lcom/google/common/cache/Striped64$Cell;->value:J

    move-wide/from16 v17, v0

    .local v17, "v":J
    move-object/from16 v0, p0

    move-wide/from16 v1, v17

    move-wide/from16 v3, p1

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/common/cache/Striped64;->fn(JJ)J

    move-result-wide v19

    move-wide/from16 v0, v17

    move-wide/from16 v2, v19

    invoke-virtual {v5, v0, v1, v2, v3}, Lcom/google/common/cache/Striped64$Cell;->cas(JJ)Z

    move-result v19

    if-nez v19, :cond_72

    .line 233
    sget v19, Lcom/google/common/cache/Striped64;->NCPU:I

    move/from16 v0, v19

    if-ge v14, v0, :cond_c3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    if-eq v0, v6, :cond_c5

    .line 234
    :cond_c3
    const/4 v7, 0x0

    goto :goto_85

    .line 235
    :cond_c5
    if-nez v7, :cond_c9

    .line 236
    const/4 v7, 0x1

    goto :goto_85

    .line 237
    :cond_c9
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/common/cache/Striped64;->busy:I

    move/from16 v19, v0

    if-nez v19, :cond_85

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/Striped64;->casBusy()Z

    move-result v19

    if-eqz v19, :cond_85

    .line 239
    :try_start_d7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    if-ne v0, v6, :cond_f9

    .line 240
    shl-int/lit8 v19, v14, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Lcom/google/common/cache/Striped64$Cell;

    move-object/from16 v16, v0

    .line 241
    .restart local v16    # "rs":[Lcom/google/common/cache/Striped64$Cell;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_ea
    if-ge v10, v14, :cond_f3

    .line 242
    aget-object v19, v6, v10

    aput-object v19, v16, v10

    .line 241
    add-int/lit8 v10, v10, 0x1

    goto :goto_ea

    .line 243
    :cond_f3
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;
    :try_end_f9
    .catchall {:try_start_d7 .. :try_end_f9} :catchall_104

    .line 246
    .end local v10    # "i":I
    .end local v16    # "rs":[Lcom/google/common/cache/Striped64$Cell;
    :cond_f9
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/Striped64;->busy:I

    .line 248
    const/4 v7, 0x0

    .line 249
    goto/16 :goto_21

    .line 246
    :catchall_104
    move-exception v19

    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/Striped64;->busy:I

    throw v19

    .line 256
    .end local v5    # "a":Lcom/google/common/cache/Striped64$Cell;
    .end local v14    # "n":I
    .end local v17    # "v":J
    :cond_10e
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/common/cache/Striped64;->busy:I

    move/from16 v19, v0

    if-nez v19, :cond_163

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    if-ne v0, v6, :cond_163

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/Striped64;->casBusy()Z

    move-result v19

    if-eqz v19, :cond_163

    .line 257
    const/4 v11, 0x0

    .line 259
    .local v11, "init":Z
    :try_start_127
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    if-ne v0, v6, :cond_14d

    .line 260
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Lcom/google/common/cache/Striped64$Cell;

    move-object/from16 v16, v0

    .line 261
    .restart local v16    # "rs":[Lcom/google/common/cache/Striped64$Cell;
    and-int/lit8 v19, v9, 0x1

    new-instance v20, Lcom/google/common/cache/Striped64$Cell;

    move-object/from16 v0, v20

    move-wide/from16 v1, p1

    invoke-direct {v0, v1, v2}, Lcom/google/common/cache/Striped64$Cell;-><init>(J)V

    aput-object v20, v16, v19

    .line 262
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;
    :try_end_14c
    .catchall {:try_start_127 .. :try_end_14c} :catchall_159

    .line 263
    const/4 v11, 0x1

    .line 266
    .end local v16    # "rs":[Lcom/google/common/cache/Striped64$Cell;
    :cond_14d
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/Striped64;->busy:I

    .line 268
    if-eqz v11, :cond_21

    goto/16 :goto_72

    .line 266
    :catchall_159
    move-exception v19

    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/Striped64;->busy:I

    throw v19

    .line 271
    .end local v11    # "init":Z
    :cond_163
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/common/cache/Striped64;->base:J

    move-wide/from16 v17, v0

    .restart local v17    # "v":J
    move-object/from16 v0, p0

    move-wide/from16 v1, v17

    move-wide/from16 v3, p1

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/common/cache/Striped64;->fn(JJ)J

    move-result-wide v19

    move-object/from16 v0, p0

    move-wide/from16 v1, v17

    move-wide/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/common/cache/Striped64;->casBase(JJ)Z

    move-result v19

    if-eqz v19, :cond_21

    goto/16 :goto_72
.end method
