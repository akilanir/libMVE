.class final Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish1024Cipher;
.super Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;
.source "ThreefishEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/engines/ThreefishEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Threefish1024Cipher"
.end annotation


# static fields
.field private static final ROTATION_0_0:I = 0x18

.field private static final ROTATION_0_1:I = 0xd

.field private static final ROTATION_0_2:I = 0x8

.field private static final ROTATION_0_3:I = 0x2f

.field private static final ROTATION_0_4:I = 0x8

.field private static final ROTATION_0_5:I = 0x11

.field private static final ROTATION_0_6:I = 0x16

.field private static final ROTATION_0_7:I = 0x25

.field private static final ROTATION_1_0:I = 0x26

.field private static final ROTATION_1_1:I = 0x13

.field private static final ROTATION_1_2:I = 0xa

.field private static final ROTATION_1_3:I = 0x37

.field private static final ROTATION_1_4:I = 0x31

.field private static final ROTATION_1_5:I = 0x12

.field private static final ROTATION_1_6:I = 0x17

.field private static final ROTATION_1_7:I = 0x34

.field private static final ROTATION_2_0:I = 0x21

.field private static final ROTATION_2_1:I = 0x4

.field private static final ROTATION_2_2:I = 0x33

.field private static final ROTATION_2_3:I = 0xd

.field private static final ROTATION_2_4:I = 0x22

.field private static final ROTATION_2_5:I = 0x29

.field private static final ROTATION_2_6:I = 0x3b

.field private static final ROTATION_2_7:I = 0x11

.field private static final ROTATION_3_0:I = 0x5

.field private static final ROTATION_3_1:I = 0x14

.field private static final ROTATION_3_2:I = 0x30

.field private static final ROTATION_3_3:I = 0x29

.field private static final ROTATION_3_4:I = 0x2f

.field private static final ROTATION_3_5:I = 0x1c

.field private static final ROTATION_3_6:I = 0x10

.field private static final ROTATION_3_7:I = 0x19

.field private static final ROTATION_4_0:I = 0x29

.field private static final ROTATION_4_1:I = 0x9

.field private static final ROTATION_4_2:I = 0x25

.field private static final ROTATION_4_3:I = 0x1f

.field private static final ROTATION_4_4:I = 0xc

.field private static final ROTATION_4_5:I = 0x2f

.field private static final ROTATION_4_6:I = 0x2c

.field private static final ROTATION_4_7:I = 0x1e

.field private static final ROTATION_5_0:I = 0x10

.field private static final ROTATION_5_1:I = 0x22

.field private static final ROTATION_5_2:I = 0x38

.field private static final ROTATION_5_3:I = 0x33

.field private static final ROTATION_5_4:I = 0x4

.field private static final ROTATION_5_5:I = 0x35

.field private static final ROTATION_5_6:I = 0x2a

.field private static final ROTATION_5_7:I = 0x29

.field private static final ROTATION_6_0:I = 0x1f

.field private static final ROTATION_6_1:I = 0x2c

.field private static final ROTATION_6_2:I = 0x2f

.field private static final ROTATION_6_3:I = 0x2e

.field private static final ROTATION_6_4:I = 0x13

.field private static final ROTATION_6_5:I = 0x2a

.field private static final ROTATION_6_6:I = 0x2c

.field private static final ROTATION_6_7:I = 0x19

.field private static final ROTATION_7_0:I = 0x9

.field private static final ROTATION_7_1:I = 0x30

.field private static final ROTATION_7_2:I = 0x23

.field private static final ROTATION_7_3:I = 0x34

.field private static final ROTATION_7_4:I = 0x17

.field private static final ROTATION_7_5:I = 0x1f

.field private static final ROTATION_7_6:I = 0x25

.field private static final ROTATION_7_7:I = 0x14


# direct methods
.method public constructor <init>([J[J)V
    .registers 3
    .param p1, "kw"    # [J
    .param p2, "t"    # [J

    .prologue
    .line 1017
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;-><init>([J[J)V

    .line 1018
    return-void
.end method


# virtual methods
.method decryptBlock([J[J)V
    .registers 51
    .param p1, "block"    # [J
    .param p2, "state"    # [J

    .prologue
    .line 1239
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish1024Cipher;->kw:[J

    move-object/from16 v40, v0

    .line 1240
    .local v40, "kw":[J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish1024Cipher;->t:[J

    move-object/from16 v43, v0

    .line 1241
    .local v43, "t":[J
    # getter for: Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD17:[I
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$300()[I

    move-result-object v41

    .line 1242
    .local v41, "mod17":[I
    # getter for: Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD3:[I
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$100()[I

    move-result-object v42

    .line 1245
    .local v42, "mod3":[I
    move-object/from16 v0, v40

    array-length v0, v0

    move/from16 v44, v0

    const/16 v45, 0x21

    move/from16 v0, v44

    move/from16 v1, v45

    if-eq v0, v1, :cond_27

    .line 1247
    new-instance v44, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v44 .. v44}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v44

    .line 1249
    :cond_27
    move-object/from16 v0, v43

    array-length v0, v0

    move/from16 v44, v0

    const/16 v45, 0x5

    move/from16 v0, v44

    move/from16 v1, v45

    if-eq v0, v1, :cond_3a

    .line 1251
    new-instance v44, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v44 .. v44}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v44

    .line 1254
    :cond_3a
    const/16 v44, 0x0

    aget-wide v5, p1, v44

    .line 1255
    .local v5, "b0":J
    const/16 v44, 0x1

    aget-wide v7, p1, v44

    .line 1256
    .local v7, "b1":J
    const/16 v44, 0x2

    aget-wide v21, p1, v44

    .line 1257
    .local v21, "b2":J
    const/16 v44, 0x3

    aget-wide v23, p1, v44

    .line 1258
    .local v23, "b3":J
    const/16 v44, 0x4

    aget-wide v25, p1, v44

    .line 1259
    .local v25, "b4":J
    const/16 v44, 0x5

    aget-wide v27, p1, v44

    .line 1260
    .local v27, "b5":J
    const/16 v44, 0x6

    aget-wide v29, p1, v44

    .line 1261
    .local v29, "b6":J
    const/16 v44, 0x7

    aget-wide v31, p1, v44

    .line 1262
    .local v31, "b7":J
    const/16 v44, 0x8

    aget-wide v33, p1, v44

    .line 1263
    .local v33, "b8":J
    const/16 v44, 0x9

    aget-wide v35, p1, v44

    .line 1264
    .local v35, "b9":J
    const/16 v44, 0xa

    aget-wide v9, p1, v44

    .line 1265
    .local v9, "b10":J
    const/16 v44, 0xb

    aget-wide v11, p1, v44

    .line 1266
    .local v11, "b11":J
    const/16 v44, 0xc

    aget-wide v13, p1, v44

    .line 1267
    .local v13, "b12":J
    const/16 v44, 0xd

    aget-wide v15, p1, v44

    .line 1268
    .local v15, "b13":J
    const/16 v44, 0xe

    aget-wide v17, p1, v44

    .line 1269
    .local v17, "b14":J
    const/16 v44, 0xf

    aget-wide v19, p1, v44

    .line 1271
    .local v19, "b15":J
    const/16 v37, 0x13

    .local v37, "d":I
    :goto_7c
    const/16 v44, 0x1

    move/from16 v0, v37

    move/from16 v1, v44

    if-lt v0, v1, :cond_494

    .line 1273
    aget v38, v41, v37

    .line 1274
    .local v38, "dm17":I
    aget v39, v42, v37

    .line 1277
    .local v39, "dm3":I
    add-int/lit8 v44, v38, 0x1

    aget-wide v44, v40, v44

    sub-long v5, v5, v44

    .line 1278
    add-int/lit8 v44, v38, 0x2

    aget-wide v44, v40, v44

    sub-long v7, v7, v44

    .line 1279
    add-int/lit8 v44, v38, 0x3

    aget-wide v44, v40, v44

    sub-long v21, v21, v44

    .line 1280
    add-int/lit8 v44, v38, 0x4

    aget-wide v44, v40, v44

    sub-long v23, v23, v44

    .line 1281
    add-int/lit8 v44, v38, 0x5

    aget-wide v44, v40, v44

    sub-long v25, v25, v44

    .line 1282
    add-int/lit8 v44, v38, 0x6

    aget-wide v44, v40, v44

    sub-long v27, v27, v44

    .line 1283
    add-int/lit8 v44, v38, 0x7

    aget-wide v44, v40, v44

    sub-long v29, v29, v44

    .line 1284
    add-int/lit8 v44, v38, 0x8

    aget-wide v44, v40, v44

    sub-long v31, v31, v44

    .line 1285
    add-int/lit8 v44, v38, 0x9

    aget-wide v44, v40, v44

    sub-long v33, v33, v44

    .line 1286
    add-int/lit8 v44, v38, 0xa

    aget-wide v44, v40, v44

    sub-long v35, v35, v44

    .line 1287
    add-int/lit8 v44, v38, 0xb

    aget-wide v44, v40, v44

    sub-long v9, v9, v44

    .line 1288
    add-int/lit8 v44, v38, 0xc

    aget-wide v44, v40, v44

    sub-long v11, v11, v44

    .line 1289
    add-int/lit8 v44, v38, 0xd

    aget-wide v44, v40, v44

    sub-long v13, v13, v44

    .line 1290
    add-int/lit8 v44, v38, 0xe

    aget-wide v44, v40, v44

    add-int/lit8 v46, v39, 0x1

    aget-wide v46, v43, v46

    add-long v44, v44, v46

    sub-long v15, v15, v44

    .line 1291
    add-int/lit8 v44, v38, 0xf

    aget-wide v44, v40, v44

    add-int/lit8 v46, v39, 0x2

    aget-wide v46, v43, v46

    add-long v44, v44, v46

    sub-long v17, v17, v44

    .line 1292
    add-int/lit8 v44, v38, 0x10

    aget-wide v44, v40, v44

    move/from16 v0, v37

    int-to-long v0, v0

    move-wide/from16 v46, v0

    add-long v44, v44, v46

    const-wide/16 v46, 0x1

    add-long v44, v44, v46

    sub-long v19, v19, v44

    .line 1295
    const/16 v44, 0x9

    move-wide/from16 v0, v19

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 1296
    sub-long v5, v5, v19

    .line 1297
    const/16 v44, 0x30

    move/from16 v0, v44

    move-wide/from16 v1, v21

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 1298
    sub-long v21, v21, v11

    .line 1299
    const/16 v44, 0x23

    move-wide v0, v15

    move/from16 v2, v44

    move-wide/from16 v3, v29

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 1300
    sub-long v29, v29, v15

    .line 1301
    const/16 v44, 0x34

    move-wide/from16 v0, v35

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v35

    .line 1302
    sub-long v25, v25, v35

    .line 1303
    const/16 v44, 0x17

    move/from16 v0, v44

    move-wide/from16 v1, v17

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 1304
    sub-long v17, v17, v7

    .line 1305
    const/16 v44, 0x1f

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v33

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v27

    .line 1306
    sub-long v33, v33, v27

    .line 1307
    const/16 v44, 0x25

    move-wide/from16 v0, v23

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v23

    .line 1308
    sub-long v9, v9, v23

    .line 1309
    const/16 v44, 0x14

    move-wide/from16 v0, v31

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v31

    .line 1310
    sub-long v13, v13, v31

    .line 1312
    const/16 v44, 0x1f

    move-wide/from16 v0, v31

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v31

    .line 1313
    sub-long v5, v5, v31

    .line 1314
    const/16 v44, 0x2c

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v21

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v27

    .line 1315
    sub-long v21, v21, v27

    .line 1316
    const/16 v44, 0x2f

    move-wide/from16 v0, v23

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v23

    .line 1317
    sub-long v25, v25, v23

    .line 1318
    const/16 v44, 0x2e

    move/from16 v0, v44

    move-wide/from16 v1, v29

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 1319
    sub-long v29, v29, v7

    .line 1320
    const/16 v44, 0x13

    move-wide/from16 v0, v19

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 1321
    sub-long v13, v13, v19

    .line 1322
    const/16 v44, 0x2a

    move-wide v0, v15

    move/from16 v2, v44

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 1323
    sub-long v17, v17, v15

    .line 1324
    const/16 v44, 0x2c

    move/from16 v0, v44

    move-wide/from16 v1, v33

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 1325
    sub-long v33, v33, v11

    .line 1326
    const/16 v44, 0x19

    move-wide/from16 v0, v35

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v35

    .line 1327
    sub-long v9, v9, v35

    .line 1329
    const/16 v44, 0x10

    move-wide/from16 v0, v35

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v35

    .line 1330
    sub-long v5, v5, v35

    .line 1331
    const/16 v44, 0x22

    move-wide v0, v15

    move/from16 v2, v44

    move-wide/from16 v3, v21

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 1332
    sub-long v21, v21, v15

    .line 1333
    const/16 v44, 0x38

    move/from16 v0, v44

    move-wide/from16 v1, v29

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 1334
    sub-long v29, v29, v11

    .line 1335
    const/16 v44, 0x33

    move-wide/from16 v0, v19

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 1336
    sub-long v25, v25, v19

    .line 1337
    const/16 v44, 0x4

    move-wide/from16 v0, v31

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v31

    .line 1338
    sub-long v9, v9, v31

    .line 1339
    const/16 v44, 0x35

    move-wide/from16 v0, v23

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v23

    .line 1340
    sub-long v13, v13, v23

    .line 1341
    const/16 v44, 0x2a

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v27

    .line 1342
    sub-long v17, v17, v27

    .line 1343
    const/16 v44, 0x29

    move/from16 v0, v44

    move-wide/from16 v1, v33

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 1344
    sub-long v33, v33, v7

    .line 1346
    const/16 v44, 0x29

    move/from16 v0, v44

    invoke-static {v7, v8, v0, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 1347
    sub-long/2addr v5, v7

    .line 1348
    const/16 v44, 0x9

    move-wide/from16 v0, v23

    move/from16 v2, v44

    move-wide/from16 v3, v21

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v23

    .line 1349
    sub-long v21, v21, v23

    .line 1350
    const/16 v44, 0x25

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v27

    .line 1351
    sub-long v25, v25, v27

    .line 1352
    const/16 v44, 0x1f

    move-wide/from16 v0, v31

    move/from16 v2, v44

    move-wide/from16 v3, v29

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v31

    .line 1353
    sub-long v29, v29, v31

    .line 1354
    const/16 v44, 0xc

    move-wide/from16 v0, v35

    move/from16 v2, v44

    move-wide/from16 v3, v33

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v35

    .line 1355
    sub-long v33, v33, v35

    .line 1356
    const/16 v44, 0x2f

    move/from16 v0, v44

    invoke-static {v11, v12, v0, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 1357
    sub-long/2addr v9, v11

    .line 1358
    const/16 v44, 0x2c

    move-wide v0, v15

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 1359
    sub-long/2addr v13, v15

    .line 1360
    const/16 v44, 0x1e

    move-wide/from16 v0, v19

    move/from16 v2, v44

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 1361
    sub-long v17, v17, v19

    .line 1364
    aget-wide v44, v40, v38

    sub-long v5, v5, v44

    .line 1365
    add-int/lit8 v44, v38, 0x1

    aget-wide v44, v40, v44

    sub-long v7, v7, v44

    .line 1366
    add-int/lit8 v44, v38, 0x2

    aget-wide v44, v40, v44

    sub-long v21, v21, v44

    .line 1367
    add-int/lit8 v44, v38, 0x3

    aget-wide v44, v40, v44

    sub-long v23, v23, v44

    .line 1368
    add-int/lit8 v44, v38, 0x4

    aget-wide v44, v40, v44

    sub-long v25, v25, v44

    .line 1369
    add-int/lit8 v44, v38, 0x5

    aget-wide v44, v40, v44

    sub-long v27, v27, v44

    .line 1370
    add-int/lit8 v44, v38, 0x6

    aget-wide v44, v40, v44

    sub-long v29, v29, v44

    .line 1371
    add-int/lit8 v44, v38, 0x7

    aget-wide v44, v40, v44

    sub-long v31, v31, v44

    .line 1372
    add-int/lit8 v44, v38, 0x8

    aget-wide v44, v40, v44

    sub-long v33, v33, v44

    .line 1373
    add-int/lit8 v44, v38, 0x9

    aget-wide v44, v40, v44

    sub-long v35, v35, v44

    .line 1374
    add-int/lit8 v44, v38, 0xa

    aget-wide v44, v40, v44

    sub-long v9, v9, v44

    .line 1375
    add-int/lit8 v44, v38, 0xb

    aget-wide v44, v40, v44

    sub-long v11, v11, v44

    .line 1376
    add-int/lit8 v44, v38, 0xc

    aget-wide v44, v40, v44

    sub-long v13, v13, v44

    .line 1377
    add-int/lit8 v44, v38, 0xd

    aget-wide v44, v40, v44

    aget-wide v46, v43, v39

    add-long v44, v44, v46

    sub-long v15, v15, v44

    .line 1378
    add-int/lit8 v44, v38, 0xe

    aget-wide v44, v40, v44

    add-int/lit8 v46, v39, 0x1

    aget-wide v46, v43, v46

    add-long v44, v44, v46

    sub-long v17, v17, v44

    .line 1379
    add-int/lit8 v44, v38, 0xf

    aget-wide v44, v40, v44

    move/from16 v0, v37

    int-to-long v0, v0

    move-wide/from16 v46, v0

    add-long v44, v44, v46

    sub-long v19, v19, v44

    .line 1382
    const/16 v44, 0x5

    move-wide/from16 v0, v19

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 1383
    sub-long v5, v5, v19

    .line 1384
    const/16 v44, 0x14

    move/from16 v0, v44

    move-wide/from16 v1, v21

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 1385
    sub-long v21, v21, v11

    .line 1386
    const/16 v44, 0x30

    move-wide v0, v15

    move/from16 v2, v44

    move-wide/from16 v3, v29

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 1387
    sub-long v29, v29, v15

    .line 1388
    const/16 v44, 0x29

    move-wide/from16 v0, v35

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v35

    .line 1389
    sub-long v25, v25, v35

    .line 1390
    const/16 v44, 0x2f

    move/from16 v0, v44

    move-wide/from16 v1, v17

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 1391
    sub-long v17, v17, v7

    .line 1392
    const/16 v44, 0x1c

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v33

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v27

    .line 1393
    sub-long v33, v33, v27

    .line 1394
    const/16 v44, 0x10

    move-wide/from16 v0, v23

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v23

    .line 1395
    sub-long v9, v9, v23

    .line 1396
    const/16 v44, 0x19

    move-wide/from16 v0, v31

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v31

    .line 1397
    sub-long v13, v13, v31

    .line 1399
    const/16 v44, 0x21

    move-wide/from16 v0, v31

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v31

    .line 1400
    sub-long v5, v5, v31

    .line 1401
    const/16 v44, 0x4

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v21

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v27

    .line 1402
    sub-long v21, v21, v27

    .line 1403
    const/16 v44, 0x33

    move-wide/from16 v0, v23

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v23

    .line 1404
    sub-long v25, v25, v23

    .line 1405
    const/16 v44, 0xd

    move/from16 v0, v44

    move-wide/from16 v1, v29

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 1406
    sub-long v29, v29, v7

    .line 1407
    const/16 v44, 0x22

    move-wide/from16 v0, v19

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 1408
    sub-long v13, v13, v19

    .line 1409
    const/16 v44, 0x29

    move-wide v0, v15

    move/from16 v2, v44

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 1410
    sub-long v17, v17, v15

    .line 1411
    const/16 v44, 0x3b

    move/from16 v0, v44

    move-wide/from16 v1, v33

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 1412
    sub-long v33, v33, v11

    .line 1413
    const/16 v44, 0x11

    move-wide/from16 v0, v35

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v35

    .line 1414
    sub-long v9, v9, v35

    .line 1416
    const/16 v44, 0x26

    move-wide/from16 v0, v35

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v35

    .line 1417
    sub-long v5, v5, v35

    .line 1418
    const/16 v44, 0x13

    move-wide v0, v15

    move/from16 v2, v44

    move-wide/from16 v3, v21

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 1419
    sub-long v21, v21, v15

    .line 1420
    const/16 v44, 0xa

    move/from16 v0, v44

    move-wide/from16 v1, v29

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 1421
    sub-long v29, v29, v11

    .line 1422
    const/16 v44, 0x37

    move-wide/from16 v0, v19

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 1423
    sub-long v25, v25, v19

    .line 1424
    const/16 v44, 0x31

    move-wide/from16 v0, v31

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v31

    .line 1425
    sub-long v9, v9, v31

    .line 1426
    const/16 v44, 0x12

    move-wide/from16 v0, v23

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v23

    .line 1427
    sub-long v13, v13, v23

    .line 1428
    const/16 v44, 0x17

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v27

    .line 1429
    sub-long v17, v17, v27

    .line 1430
    const/16 v44, 0x34

    move/from16 v0, v44

    move-wide/from16 v1, v33

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 1431
    sub-long v33, v33, v7

    .line 1433
    const/16 v44, 0x18

    move/from16 v0, v44

    invoke-static {v7, v8, v0, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 1434
    sub-long/2addr v5, v7

    .line 1435
    const/16 v44, 0xd

    move-wide/from16 v0, v23

    move/from16 v2, v44

    move-wide/from16 v3, v21

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v23

    .line 1436
    sub-long v21, v21, v23

    .line 1437
    const/16 v44, 0x8

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v27

    .line 1438
    sub-long v25, v25, v27

    .line 1439
    const/16 v44, 0x2f

    move-wide/from16 v0, v31

    move/from16 v2, v44

    move-wide/from16 v3, v29

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v31

    .line 1440
    sub-long v29, v29, v31

    .line 1441
    const/16 v44, 0x8

    move-wide/from16 v0, v35

    move/from16 v2, v44

    move-wide/from16 v3, v33

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v35

    .line 1442
    sub-long v33, v33, v35

    .line 1443
    const/16 v44, 0x11

    move/from16 v0, v44

    invoke-static {v11, v12, v0, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 1444
    sub-long/2addr v9, v11

    .line 1445
    const/16 v44, 0x16

    move-wide v0, v15

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 1446
    sub-long/2addr v13, v15

    .line 1447
    const/16 v44, 0x25

    move-wide/from16 v0, v19

    move/from16 v2, v44

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 1448
    sub-long v17, v17, v19

    .line 1271
    add-int/lit8 v37, v37, -0x2

    goto/16 :goto_7c

    .line 1454
    .end local v38    # "dm17":I
    .end local v39    # "dm3":I
    :cond_494
    const/16 v44, 0x0

    aget-wide v44, v40, v44

    sub-long v5, v5, v44

    .line 1455
    const/16 v44, 0x1

    aget-wide v44, v40, v44

    sub-long v7, v7, v44

    .line 1456
    const/16 v44, 0x2

    aget-wide v44, v40, v44

    sub-long v21, v21, v44

    .line 1457
    const/16 v44, 0x3

    aget-wide v44, v40, v44

    sub-long v23, v23, v44

    .line 1458
    const/16 v44, 0x4

    aget-wide v44, v40, v44

    sub-long v25, v25, v44

    .line 1459
    const/16 v44, 0x5

    aget-wide v44, v40, v44

    sub-long v27, v27, v44

    .line 1460
    const/16 v44, 0x6

    aget-wide v44, v40, v44

    sub-long v29, v29, v44

    .line 1461
    const/16 v44, 0x7

    aget-wide v44, v40, v44

    sub-long v31, v31, v44

    .line 1462
    const/16 v44, 0x8

    aget-wide v44, v40, v44

    sub-long v33, v33, v44

    .line 1463
    const/16 v44, 0x9

    aget-wide v44, v40, v44

    sub-long v35, v35, v44

    .line 1464
    const/16 v44, 0xa

    aget-wide v44, v40, v44

    sub-long v9, v9, v44

    .line 1465
    const/16 v44, 0xb

    aget-wide v44, v40, v44

    sub-long v11, v11, v44

    .line 1466
    const/16 v44, 0xc

    aget-wide v44, v40, v44

    sub-long v13, v13, v44

    .line 1467
    const/16 v44, 0xd

    aget-wide v44, v40, v44

    const/16 v46, 0x0

    aget-wide v46, v43, v46

    add-long v44, v44, v46

    sub-long v15, v15, v44

    .line 1468
    const/16 v44, 0xe

    aget-wide v44, v40, v44

    const/16 v46, 0x1

    aget-wide v46, v43, v46

    add-long v44, v44, v46

    sub-long v17, v17, v44

    .line 1469
    const/16 v44, 0xf

    aget-wide v44, v40, v44

    sub-long v19, v19, v44

    .line 1474
    const/16 v44, 0x0

    aput-wide v5, p2, v44

    .line 1475
    const/16 v44, 0x1

    aput-wide v7, p2, v44

    .line 1476
    const/16 v44, 0x2

    aput-wide v21, p2, v44

    .line 1477
    const/16 v44, 0x3

    aput-wide v23, p2, v44

    .line 1478
    const/16 v44, 0x4

    aput-wide v25, p2, v44

    .line 1479
    const/16 v44, 0x5

    aput-wide v27, p2, v44

    .line 1480
    const/16 v44, 0x6

    aput-wide v29, p2, v44

    .line 1481
    const/16 v44, 0x7

    aput-wide v31, p2, v44

    .line 1482
    const/16 v44, 0x8

    aput-wide v33, p2, v44

    .line 1483
    const/16 v44, 0x9

    aput-wide v35, p2, v44

    .line 1484
    const/16 v44, 0xa

    aput-wide v9, p2, v44

    .line 1485
    const/16 v44, 0xb

    aput-wide v11, p2, v44

    .line 1486
    const/16 v44, 0xc

    aput-wide v13, p2, v44

    .line 1487
    const/16 v44, 0xd

    aput-wide v15, p2, v44

    .line 1488
    const/16 v44, 0xe

    aput-wide v17, p2, v44

    .line 1489
    const/16 v44, 0xf

    aput-wide v19, p2, v44

    .line 1490
    return-void
.end method

.method encryptBlock([J[J)V
    .registers 51
    .param p1, "block"    # [J
    .param p2, "out"    # [J

    .prologue
    .line 1022
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish1024Cipher;->kw:[J

    move-object/from16 v40, v0

    .line 1023
    .local v40, "kw":[J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish1024Cipher;->t:[J

    move-object/from16 v43, v0

    .line 1024
    .local v43, "t":[J
    # getter for: Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD17:[I
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$300()[I

    move-result-object v41

    .line 1025
    .local v41, "mod17":[I
    # getter for: Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD3:[I
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$100()[I

    move-result-object v42

    .line 1028
    .local v42, "mod3":[I
    move-object/from16 v0, v40

    array-length v0, v0

    move/from16 v44, v0

    const/16 v45, 0x21

    move/from16 v0, v44

    move/from16 v1, v45

    if-eq v0, v1, :cond_27

    .line 1030
    new-instance v44, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v44 .. v44}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v44

    .line 1032
    :cond_27
    move-object/from16 v0, v43

    array-length v0, v0

    move/from16 v44, v0

    const/16 v45, 0x5

    move/from16 v0, v44

    move/from16 v1, v45

    if-eq v0, v1, :cond_3a

    .line 1034
    new-instance v44, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v44 .. v44}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v44

    .line 1040
    :cond_3a
    const/16 v44, 0x0

    aget-wide v5, p1, v44

    .line 1041
    .local v5, "b0":J
    const/16 v44, 0x1

    aget-wide v7, p1, v44

    .line 1042
    .local v7, "b1":J
    const/16 v44, 0x2

    aget-wide v21, p1, v44

    .line 1043
    .local v21, "b2":J
    const/16 v44, 0x3

    aget-wide v23, p1, v44

    .line 1044
    .local v23, "b3":J
    const/16 v44, 0x4

    aget-wide v25, p1, v44

    .line 1045
    .local v25, "b4":J
    const/16 v44, 0x5

    aget-wide v27, p1, v44

    .line 1046
    .local v27, "b5":J
    const/16 v44, 0x6

    aget-wide v29, p1, v44

    .line 1047
    .local v29, "b6":J
    const/16 v44, 0x7

    aget-wide v31, p1, v44

    .line 1048
    .local v31, "b7":J
    const/16 v44, 0x8

    aget-wide v33, p1, v44

    .line 1049
    .local v33, "b8":J
    const/16 v44, 0x9

    aget-wide v35, p1, v44

    .line 1050
    .local v35, "b9":J
    const/16 v44, 0xa

    aget-wide v9, p1, v44

    .line 1051
    .local v9, "b10":J
    const/16 v44, 0xb

    aget-wide v11, p1, v44

    .line 1052
    .local v11, "b11":J
    const/16 v44, 0xc

    aget-wide v13, p1, v44

    .line 1053
    .local v13, "b12":J
    const/16 v44, 0xd

    aget-wide v15, p1, v44

    .line 1054
    .local v15, "b13":J
    const/16 v44, 0xe

    aget-wide v17, p1, v44

    .line 1055
    .local v17, "b14":J
    const/16 v44, 0xf

    aget-wide v19, p1, v44

    .line 1060
    .local v19, "b15":J
    const/16 v44, 0x0

    aget-wide v44, v40, v44

    add-long v5, v5, v44

    .line 1061
    const/16 v44, 0x1

    aget-wide v44, v40, v44

    add-long v7, v7, v44

    .line 1062
    const/16 v44, 0x2

    aget-wide v44, v40, v44

    add-long v21, v21, v44

    .line 1063
    const/16 v44, 0x3

    aget-wide v44, v40, v44

    add-long v23, v23, v44

    .line 1064
    const/16 v44, 0x4

    aget-wide v44, v40, v44

    add-long v25, v25, v44

    .line 1065
    const/16 v44, 0x5

    aget-wide v44, v40, v44

    add-long v27, v27, v44

    .line 1066
    const/16 v44, 0x6

    aget-wide v44, v40, v44

    add-long v29, v29, v44

    .line 1067
    const/16 v44, 0x7

    aget-wide v44, v40, v44

    add-long v31, v31, v44

    .line 1068
    const/16 v44, 0x8

    aget-wide v44, v40, v44

    add-long v33, v33, v44

    .line 1069
    const/16 v44, 0x9

    aget-wide v44, v40, v44

    add-long v35, v35, v44

    .line 1070
    const/16 v44, 0xa

    aget-wide v44, v40, v44

    add-long v9, v9, v44

    .line 1071
    const/16 v44, 0xb

    aget-wide v44, v40, v44

    add-long v11, v11, v44

    .line 1072
    const/16 v44, 0xc

    aget-wide v44, v40, v44

    add-long v13, v13, v44

    .line 1073
    const/16 v44, 0xd

    aget-wide v44, v40, v44

    const/16 v46, 0x0

    aget-wide v46, v43, v46

    add-long v44, v44, v46

    add-long v15, v15, v44

    .line 1074
    const/16 v44, 0xe

    aget-wide v44, v40, v44

    const/16 v46, 0x1

    aget-wide v46, v43, v46

    add-long v44, v44, v46

    add-long v17, v17, v44

    .line 1075
    const/16 v44, 0xf

    aget-wide v44, v40, v44

    add-long v19, v19, v44

    .line 1088
    const/16 v37, 0x1

    .local v37, "d":I
    :goto_e8
    const/16 v44, 0x14

    move/from16 v0, v37

    move/from16 v1, v44

    if-ge v0, v1, :cond_500

    .line 1090
    aget v38, v41, v37

    .line 1091
    .local v38, "dm17":I
    aget v39, v42, v37

    .line 1099
    .local v39, "dm3":I
    const/16 v44, 0x18

    add-long/2addr v5, v7

    move/from16 v0, v44

    invoke-static {v7, v8, v0, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 1100
    const/16 v44, 0xd

    add-long v21, v21, v23

    move-wide/from16 v0, v23

    move/from16 v2, v44

    move-wide/from16 v3, v21

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v23

    .line 1101
    const/16 v44, 0x8

    add-long v25, v25, v27

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v27

    .line 1102
    const/16 v44, 0x2f

    add-long v29, v29, v31

    move-wide/from16 v0, v31

    move/from16 v2, v44

    move-wide/from16 v3, v29

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v31

    .line 1103
    const/16 v44, 0x8

    add-long v33, v33, v35

    move-wide/from16 v0, v35

    move/from16 v2, v44

    move-wide/from16 v3, v33

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v35

    .line 1104
    const/16 v44, 0x11

    add-long/2addr v9, v11

    move/from16 v0, v44

    invoke-static {v11, v12, v0, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 1105
    const/16 v44, 0x16

    add-long/2addr v13, v15

    move-wide v0, v15

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 1106
    const/16 v44, 0x25

    add-long v17, v17, v19

    move-wide/from16 v0, v19

    move/from16 v2, v44

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 1108
    const/16 v44, 0x26

    add-long v5, v5, v35

    move-wide/from16 v0, v35

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v35

    .line 1109
    const/16 v44, 0x13

    add-long v21, v21, v15

    move-wide v0, v15

    move/from16 v2, v44

    move-wide/from16 v3, v21

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 1110
    const/16 v44, 0xa

    add-long v29, v29, v11

    move/from16 v0, v44

    move-wide/from16 v1, v29

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 1111
    const/16 v44, 0x37

    add-long v25, v25, v19

    move-wide/from16 v0, v19

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 1112
    const/16 v44, 0x31

    add-long v9, v9, v31

    move-wide/from16 v0, v31

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v31

    .line 1113
    const/16 v44, 0x12

    add-long v13, v13, v23

    move-wide/from16 v0, v23

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v23

    .line 1114
    const/16 v44, 0x17

    add-long v17, v17, v27

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v27

    .line 1115
    const/16 v44, 0x34

    add-long v33, v33, v7

    move/from16 v0, v44

    move-wide/from16 v1, v33

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 1117
    const/16 v44, 0x21

    add-long v5, v5, v31

    move-wide/from16 v0, v31

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v31

    .line 1118
    const/16 v44, 0x4

    add-long v21, v21, v27

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v21

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v27

    .line 1119
    const/16 v44, 0x33

    add-long v25, v25, v23

    move-wide/from16 v0, v23

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v23

    .line 1120
    const/16 v44, 0xd

    add-long v29, v29, v7

    move/from16 v0, v44

    move-wide/from16 v1, v29

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 1121
    const/16 v44, 0x22

    add-long v13, v13, v19

    move-wide/from16 v0, v19

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 1122
    const/16 v44, 0x29

    add-long v17, v17, v15

    move-wide v0, v15

    move/from16 v2, v44

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 1123
    const/16 v44, 0x3b

    add-long v33, v33, v11

    move/from16 v0, v44

    move-wide/from16 v1, v33

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 1124
    const/16 v44, 0x11

    add-long v9, v9, v35

    move-wide/from16 v0, v35

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v35

    .line 1126
    const/16 v44, 0x5

    add-long v5, v5, v19

    move-wide/from16 v0, v19

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 1127
    const/16 v44, 0x14

    add-long v21, v21, v11

    move/from16 v0, v44

    move-wide/from16 v1, v21

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 1128
    const/16 v44, 0x30

    add-long v29, v29, v15

    move-wide v0, v15

    move/from16 v2, v44

    move-wide/from16 v3, v29

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 1129
    const/16 v44, 0x29

    add-long v25, v25, v35

    move-wide/from16 v0, v35

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v35

    .line 1130
    const/16 v44, 0x2f

    add-long v17, v17, v7

    move/from16 v0, v44

    move-wide/from16 v1, v17

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 1131
    const/16 v44, 0x1c

    add-long v33, v33, v27

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v33

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v27

    .line 1132
    const/16 v44, 0x10

    add-long v9, v9, v23

    move-wide/from16 v0, v23

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v23

    .line 1133
    const/16 v44, 0x19

    add-long v13, v13, v31

    move-wide/from16 v0, v31

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v31

    .line 1138
    aget-wide v44, v40, v38

    add-long v5, v5, v44

    .line 1139
    add-int/lit8 v44, v38, 0x1

    aget-wide v44, v40, v44

    add-long v7, v7, v44

    .line 1140
    add-int/lit8 v44, v38, 0x2

    aget-wide v44, v40, v44

    add-long v21, v21, v44

    .line 1141
    add-int/lit8 v44, v38, 0x3

    aget-wide v44, v40, v44

    add-long v23, v23, v44

    .line 1142
    add-int/lit8 v44, v38, 0x4

    aget-wide v44, v40, v44

    add-long v25, v25, v44

    .line 1143
    add-int/lit8 v44, v38, 0x5

    aget-wide v44, v40, v44

    add-long v27, v27, v44

    .line 1144
    add-int/lit8 v44, v38, 0x6

    aget-wide v44, v40, v44

    add-long v29, v29, v44

    .line 1145
    add-int/lit8 v44, v38, 0x7

    aget-wide v44, v40, v44

    add-long v31, v31, v44

    .line 1146
    add-int/lit8 v44, v38, 0x8

    aget-wide v44, v40, v44

    add-long v33, v33, v44

    .line 1147
    add-int/lit8 v44, v38, 0x9

    aget-wide v44, v40, v44

    add-long v35, v35, v44

    .line 1148
    add-int/lit8 v44, v38, 0xa

    aget-wide v44, v40, v44

    add-long v9, v9, v44

    .line 1149
    add-int/lit8 v44, v38, 0xb

    aget-wide v44, v40, v44

    add-long v11, v11, v44

    .line 1150
    add-int/lit8 v44, v38, 0xc

    aget-wide v44, v40, v44

    add-long v13, v13, v44

    .line 1151
    add-int/lit8 v44, v38, 0xd

    aget-wide v44, v40, v44

    aget-wide v46, v43, v39

    add-long v44, v44, v46

    add-long v15, v15, v44

    .line 1152
    add-int/lit8 v44, v38, 0xe

    aget-wide v44, v40, v44

    add-int/lit8 v46, v39, 0x1

    aget-wide v46, v43, v46

    add-long v44, v44, v46

    add-long v17, v17, v44

    .line 1153
    add-int/lit8 v44, v38, 0xf

    aget-wide v44, v40, v44

    move/from16 v0, v37

    int-to-long v0, v0

    move-wide/from16 v46, v0

    add-long v44, v44, v46

    add-long v19, v19, v44

    .line 1158
    const/16 v44, 0x29

    add-long/2addr v5, v7

    move/from16 v0, v44

    invoke-static {v7, v8, v0, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 1159
    const/16 v44, 0x9

    add-long v21, v21, v23

    move-wide/from16 v0, v23

    move/from16 v2, v44

    move-wide/from16 v3, v21

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v23

    .line 1160
    const/16 v44, 0x25

    add-long v25, v25, v27

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v27

    .line 1161
    const/16 v44, 0x1f

    add-long v29, v29, v31

    move-wide/from16 v0, v31

    move/from16 v2, v44

    move-wide/from16 v3, v29

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v31

    .line 1162
    const/16 v44, 0xc

    add-long v33, v33, v35

    move-wide/from16 v0, v35

    move/from16 v2, v44

    move-wide/from16 v3, v33

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v35

    .line 1163
    const/16 v44, 0x2f

    add-long/2addr v9, v11

    move/from16 v0, v44

    invoke-static {v11, v12, v0, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 1164
    const/16 v44, 0x2c

    add-long/2addr v13, v15

    move-wide v0, v15

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 1165
    const/16 v44, 0x1e

    add-long v17, v17, v19

    move-wide/from16 v0, v19

    move/from16 v2, v44

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 1167
    const/16 v44, 0x10

    add-long v5, v5, v35

    move-wide/from16 v0, v35

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v35

    .line 1168
    const/16 v44, 0x22

    add-long v21, v21, v15

    move-wide v0, v15

    move/from16 v2, v44

    move-wide/from16 v3, v21

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 1169
    const/16 v44, 0x38

    add-long v29, v29, v11

    move/from16 v0, v44

    move-wide/from16 v1, v29

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 1170
    const/16 v44, 0x33

    add-long v25, v25, v19

    move-wide/from16 v0, v19

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 1171
    const/16 v44, 0x4

    add-long v9, v9, v31

    move-wide/from16 v0, v31

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v31

    .line 1172
    const/16 v44, 0x35

    add-long v13, v13, v23

    move-wide/from16 v0, v23

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v23

    .line 1173
    const/16 v44, 0x2a

    add-long v17, v17, v27

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v27

    .line 1174
    const/16 v44, 0x29

    add-long v33, v33, v7

    move/from16 v0, v44

    move-wide/from16 v1, v33

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 1176
    const/16 v44, 0x1f

    add-long v5, v5, v31

    move-wide/from16 v0, v31

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v31

    .line 1177
    const/16 v44, 0x2c

    add-long v21, v21, v27

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v21

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v27

    .line 1178
    const/16 v44, 0x2f

    add-long v25, v25, v23

    move-wide/from16 v0, v23

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v23

    .line 1179
    const/16 v44, 0x2e

    add-long v29, v29, v7

    move/from16 v0, v44

    move-wide/from16 v1, v29

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 1180
    const/16 v44, 0x13

    add-long v13, v13, v19

    move-wide/from16 v0, v19

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 1181
    const/16 v44, 0x2a

    add-long v17, v17, v15

    move-wide v0, v15

    move/from16 v2, v44

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 1182
    const/16 v44, 0x2c

    add-long v33, v33, v11

    move/from16 v0, v44

    move-wide/from16 v1, v33

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 1183
    const/16 v44, 0x19

    add-long v9, v9, v35

    move-wide/from16 v0, v35

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v35

    .line 1185
    const/16 v44, 0x9

    add-long v5, v5, v19

    move-wide/from16 v0, v19

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 1186
    const/16 v44, 0x30

    add-long v21, v21, v11

    move/from16 v0, v44

    move-wide/from16 v1, v21

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 1187
    const/16 v44, 0x23

    add-long v29, v29, v15

    move-wide v0, v15

    move/from16 v2, v44

    move-wide/from16 v3, v29

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 1188
    const/16 v44, 0x34

    add-long v25, v25, v35

    move-wide/from16 v0, v35

    move/from16 v2, v44

    move-wide/from16 v3, v25

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v35

    .line 1189
    const/16 v44, 0x17

    add-long v17, v17, v7

    move/from16 v0, v44

    move-wide/from16 v1, v17

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 1190
    const/16 v44, 0x1f

    add-long v33, v33, v27

    move-wide/from16 v0, v27

    move/from16 v2, v44

    move-wide/from16 v3, v33

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v27

    .line 1191
    const/16 v44, 0x25

    add-long v9, v9, v23

    move-wide/from16 v0, v23

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v23

    .line 1192
    const/16 v44, 0x14

    add-long v13, v13, v31

    move-wide/from16 v0, v31

    move/from16 v2, v44

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v31

    .line 1197
    add-int/lit8 v44, v38, 0x1

    aget-wide v44, v40, v44

    add-long v5, v5, v44

    .line 1198
    add-int/lit8 v44, v38, 0x2

    aget-wide v44, v40, v44

    add-long v7, v7, v44

    .line 1199
    add-int/lit8 v44, v38, 0x3

    aget-wide v44, v40, v44

    add-long v21, v21, v44

    .line 1200
    add-int/lit8 v44, v38, 0x4

    aget-wide v44, v40, v44

    add-long v23, v23, v44

    .line 1201
    add-int/lit8 v44, v38, 0x5

    aget-wide v44, v40, v44

    add-long v25, v25, v44

    .line 1202
    add-int/lit8 v44, v38, 0x6

    aget-wide v44, v40, v44

    add-long v27, v27, v44

    .line 1203
    add-int/lit8 v44, v38, 0x7

    aget-wide v44, v40, v44

    add-long v29, v29, v44

    .line 1204
    add-int/lit8 v44, v38, 0x8

    aget-wide v44, v40, v44

    add-long v31, v31, v44

    .line 1205
    add-int/lit8 v44, v38, 0x9

    aget-wide v44, v40, v44

    add-long v33, v33, v44

    .line 1206
    add-int/lit8 v44, v38, 0xa

    aget-wide v44, v40, v44

    add-long v35, v35, v44

    .line 1207
    add-int/lit8 v44, v38, 0xb

    aget-wide v44, v40, v44

    add-long v9, v9, v44

    .line 1208
    add-int/lit8 v44, v38, 0xc

    aget-wide v44, v40, v44

    add-long v11, v11, v44

    .line 1209
    add-int/lit8 v44, v38, 0xd

    aget-wide v44, v40, v44

    add-long v13, v13, v44

    .line 1210
    add-int/lit8 v44, v38, 0xe

    aget-wide v44, v40, v44

    add-int/lit8 v46, v39, 0x1

    aget-wide v46, v43, v46

    add-long v44, v44, v46

    add-long v15, v15, v44

    .line 1211
    add-int/lit8 v44, v38, 0xf

    aget-wide v44, v40, v44

    add-int/lit8 v46, v39, 0x2

    aget-wide v46, v43, v46

    add-long v44, v44, v46

    add-long v17, v17, v44

    .line 1212
    add-int/lit8 v44, v38, 0x10

    aget-wide v44, v40, v44

    move/from16 v0, v37

    int-to-long v0, v0

    move-wide/from16 v46, v0

    add-long v44, v44, v46

    const-wide/16 v46, 0x1

    add-long v44, v44, v46

    add-long v19, v19, v44

    .line 1088
    add-int/lit8 v37, v37, 0x2

    goto/16 :goto_e8

    .line 1219
    .end local v38    # "dm17":I
    .end local v39    # "dm3":I
    :cond_500
    const/16 v44, 0x0

    aput-wide v5, p2, v44

    .line 1220
    const/16 v44, 0x1

    aput-wide v7, p2, v44

    .line 1221
    const/16 v44, 0x2

    aput-wide v21, p2, v44

    .line 1222
    const/16 v44, 0x3

    aput-wide v23, p2, v44

    .line 1223
    const/16 v44, 0x4

    aput-wide v25, p2, v44

    .line 1224
    const/16 v44, 0x5

    aput-wide v27, p2, v44

    .line 1225
    const/16 v44, 0x6

    aput-wide v29, p2, v44

    .line 1226
    const/16 v44, 0x7

    aput-wide v31, p2, v44

    .line 1227
    const/16 v44, 0x8

    aput-wide v33, p2, v44

    .line 1228
    const/16 v44, 0x9

    aput-wide v35, p2, v44

    .line 1229
    const/16 v44, 0xa

    aput-wide v9, p2, v44

    .line 1230
    const/16 v44, 0xb

    aput-wide v11, p2, v44

    .line 1231
    const/16 v44, 0xc

    aput-wide v13, p2, v44

    .line 1232
    const/16 v44, 0xd

    aput-wide v15, p2, v44

    .line 1233
    const/16 v44, 0xe

    aput-wide v17, p2, v44

    .line 1234
    const/16 v44, 0xf

    aput-wide v19, p2, v44

    .line 1235
    return-void
.end method
