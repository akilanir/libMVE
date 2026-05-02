.class public abstract Ljunit/framework/TestCase;
.super Ljunit/framework/Assert;
.source "TestCase.java"

# interfaces
.implements Ljunit/framework/Test;


# instance fields
.field private fName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 86
    invoke-direct {p0}, Ljunit/framework/Assert;-><init>()V

    .line 87
    const/4 v0, 0x0

    iput-object v0, p0, Ljunit/framework/TestCase;->fName:Ljava/lang/String;

    .line 88
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 93
    invoke-direct {p0}, Ljunit/framework/Assert;-><init>()V

    .line 94
    iput-object p1, p0, Ljunit/framework/TestCase;->fName:Ljava/lang/String;

    .line 95
    return-void
.end method

.method public static assertEquals(BB)V
    .registers 2
    .param p0, "expected"    # B
    .param p1, "actual"    # B

    .prologue
    .line 358
    invoke-static {p0, p1}, Ljunit/framework/Assert;->assertEquals(BB)V

    .line 359
    return-void
.end method

.method public static assertEquals(CC)V
    .registers 2
    .param p0, "expected"    # C
    .param p1, "actual"    # C

    .prologue
    .line 375
    invoke-static {p0, p1}, Ljunit/framework/Assert;->assertEquals(CC)V

    .line 376
    return-void
.end method

.method public static assertEquals(DDD)V
    .registers 6
    .param p0, "expected"    # D
    .param p2, "actual"    # D
    .param p4, "delta"    # D

    .prologue
    .line 288
    invoke-static/range {p0 .. p5}, Ljunit/framework/Assert;->assertEquals(DDD)V

    .line 289
    return-void
.end method

.method public static assertEquals(FFF)V
    .registers 3
    .param p0, "expected"    # F
    .param p1, "actual"    # F
    .param p2, "delta"    # F

    .prologue
    .line 307
    invoke-static {p0, p1, p2}, Ljunit/framework/Assert;->assertEquals(FFF)V

    .line 308
    return-void
.end method

.method public static assertEquals(II)V
    .registers 2
    .param p0, "expected"    # I
    .param p1, "actual"    # I

    .prologue
    .line 409
    invoke-static {p0, p1}, Ljunit/framework/Assert;->assertEquals(II)V

    .line 410
    return-void
.end method

.method public static assertEquals(JJ)V
    .registers 4
    .param p0, "expected"    # J
    .param p2, "actual"    # J

    .prologue
    .line 324
    invoke-static {p0, p1, p2, p3}, Ljunit/framework/Assert;->assertEquals(JJ)V

    .line 325
    return-void
.end method

.method public static assertEquals(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 2
    .param p0, "expected"    # Ljava/lang/Object;
    .param p1, "actual"    # Ljava/lang/Object;

    .prologue
    .line 253
    invoke-static {p0, p1}, Ljunit/framework/Assert;->assertEquals(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 254
    return-void
.end method

.method public static assertEquals(Ljava/lang/String;BB)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # B
    .param p2, "actual"    # B

    .prologue
    .line 350
    invoke-static {p0, p1, p2}, Ljunit/framework/Assert;->assertEquals(Ljava/lang/String;BB)V

    .line 351
    return-void
.end method

.method public static assertEquals(Ljava/lang/String;CC)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # C
    .param p2, "actual"    # C

    .prologue
    .line 367
    invoke-static {p0, p1, p2}, Ljunit/framework/Assert;->assertEquals(Ljava/lang/String;CC)V

    .line 368
    return-void
.end method

.method public static assertEquals(Ljava/lang/String;DDD)V
    .registers 7
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # D
    .param p3, "actual"    # D
    .param p5, "delta"    # D

    .prologue
    .line 279
    invoke-static/range {p0 .. p6}, Ljunit/framework/Assert;->assertEquals(Ljava/lang/String;DDD)V

    .line 280
    return-void
.end method

.method public static assertEquals(Ljava/lang/String;FFF)V
    .registers 4
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # F
    .param p2, "actual"    # F
    .param p3, "delta"    # F

    .prologue
    .line 298
    invoke-static {p0, p1, p2, p3}, Ljunit/framework/Assert;->assertEquals(Ljava/lang/String;FFF)V

    .line 299
    return-void
.end method

.method public static assertEquals(Ljava/lang/String;II)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # I
    .param p2, "actual"    # I

    .prologue
    .line 401
    invoke-static {p0, p1, p2}, Ljunit/framework/Assert;->assertEquals(Ljava/lang/String;II)V

    .line 402
    return-void
.end method

.method public static assertEquals(Ljava/lang/String;JJ)V
    .registers 5
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # J
    .param p3, "actual"    # J

    .prologue
    .line 316
    invoke-static {p0, p1, p2, p3, p4}, Ljunit/framework/Assert;->assertEquals(Ljava/lang/String;JJ)V

    .line 317
    return-void
.end method

.method public static assertEquals(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # Ljava/lang/Object;
    .param p2, "actual"    # Ljava/lang/Object;

    .prologue
    .line 244
    invoke-static {p0, p1, p2}, Ljunit/framework/Assert;->assertEquals(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 245
    return-void
.end method

.method public static assertEquals(Ljava/lang/String;Ljava/lang/String;)V
    .registers 2
    .param p0, "expected"    # Ljava/lang/String;
    .param p1, "actual"    # Ljava/lang/String;

    .prologue
    .line 269
    invoke-static {p0, p1}, Ljunit/framework/Assert;->assertEquals(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    return-void
.end method

.method public static assertEquals(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # Ljava/lang/String;
    .param p2, "actual"    # Ljava/lang/String;

    .prologue
    .line 261
    invoke-static {p0, p1, p2}, Ljunit/framework/Assert;->assertEquals(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    return-void
.end method

.method public static assertEquals(Ljava/lang/String;SS)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # S
    .param p2, "actual"    # S

    .prologue
    .line 384
    invoke-static {p0, p1, p2}, Ljunit/framework/Assert;->assertEquals(Ljava/lang/String;SS)V

    .line 385
    return-void
.end method

.method public static assertEquals(Ljava/lang/String;ZZ)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # Z
    .param p2, "actual"    # Z

    .prologue
    .line 333
    invoke-static {p0, p1, p2}, Ljunit/framework/Assert;->assertEquals(Ljava/lang/String;ZZ)V

    .line 334
    return-void
.end method

.method public static assertEquals(SS)V
    .registers 2
    .param p0, "expected"    # S
    .param p1, "actual"    # S

    .prologue
    .line 392
    invoke-static {p0, p1}, Ljunit/framework/Assert;->assertEquals(SS)V

    .line 393
    return-void
.end method

.method public static assertEquals(ZZ)V
    .registers 2
    .param p0, "expected"    # Z
    .param p1, "actual"    # Z

    .prologue
    .line 341
    invoke-static {p0, p1}, Ljunit/framework/Assert;->assertEquals(ZZ)V

    .line 342
    return-void
.end method

.method public static assertFalse(Ljava/lang/String;Z)V
    .registers 2
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "condition"    # Z

    .prologue
    .line 210
    invoke-static {p0, p1}, Ljunit/framework/Assert;->assertFalse(Ljava/lang/String;Z)V

    .line 211
    return-void
.end method

.method public static assertFalse(Z)V
    .registers 1
    .param p0, "condition"    # Z

    .prologue
    .line 219
    invoke-static {p0}, Ljunit/framework/Assert;->assertFalse(Z)V

    .line 220
    return-void
.end method

.method public static assertNotNull(Ljava/lang/Object;)V
    .registers 1
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 417
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 418
    return-void
.end method

.method public static assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 2
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 426
    invoke-static {p0, p1}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 427
    return-void
.end method

.method public static assertNotSame(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 2
    .param p0, "expected"    # Ljava/lang/Object;
    .param p1, "actual"    # Ljava/lang/Object;

    .prologue
    .line 484
    invoke-static {p0, p1}, Ljunit/framework/Assert;->assertNotSame(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 485
    return-void
.end method

.method public static assertNotSame(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # Ljava/lang/Object;
    .param p2, "actual"    # Ljava/lang/Object;

    .prologue
    .line 475
    invoke-static {p0, p1, p2}, Ljunit/framework/Assert;->assertNotSame(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 476
    return-void
.end method

.method public static assertNull(Ljava/lang/Object;)V
    .registers 1
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 438
    invoke-static {p0}, Ljunit/framework/Assert;->assertNull(Ljava/lang/Object;)V

    .line 439
    return-void
.end method

.method public static assertNull(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 2
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 447
    invoke-static {p0, p1}, Ljunit/framework/Assert;->assertNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 448
    return-void
.end method

.method public static assertSame(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 2
    .param p0, "expected"    # Ljava/lang/Object;
    .param p1, "actual"    # Ljava/lang/Object;

    .prologue
    .line 465
    invoke-static {p0, p1}, Ljunit/framework/Assert;->assertSame(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 466
    return-void
.end method

.method public static assertSame(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # Ljava/lang/Object;
    .param p2, "actual"    # Ljava/lang/Object;

    .prologue
    .line 456
    invoke-static {p0, p1, p2}, Ljunit/framework/Assert;->assertSame(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 457
    return-void
.end method

.method public static assertTrue(Ljava/lang/String;Z)V
    .registers 2
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "condition"    # Z

    .prologue
    .line 192
    invoke-static {p0, p1}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 193
    return-void
.end method

.method public static assertTrue(Z)V
    .registers 1
    .param p0, "condition"    # Z

    .prologue
    .line 201
    invoke-static {p0}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 202
    return-void
.end method

.method public static fail()V
    .registers 0

    .prologue
    .line 235
    invoke-static {}, Ljunit/framework/Assert;->fail()V

    .line 236
    return-void
.end method

.method public static fail(Ljava/lang/String;)V
    .registers 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 227
    invoke-static {p0}, Ljunit/framework/Assert;->fail(Ljava/lang/String;)V

    .line 228
    return-void
.end method

.method public static failNotEquals(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # Ljava/lang/Object;
    .param p2, "actual"    # Ljava/lang/Object;

    .prologue
    .line 499
    invoke-static {p0, p1, p2}, Ljunit/framework/Assert;->failNotEquals(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 500
    return-void
.end method

.method public static failNotSame(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # Ljava/lang/Object;
    .param p2, "actual"    # Ljava/lang/Object;

    .prologue
    .line 494
    invoke-static {p0, p1, p2}, Ljunit/framework/Assert;->failNotSame(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 495
    return-void
.end method

.method public static failSame(Ljava/lang/String;)V
    .registers 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 489
    invoke-static {p0}, Ljunit/framework/Assert;->failSame(Ljava/lang/String;)V

    .line 490
    return-void
.end method

.method public static format(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "expected"    # Ljava/lang/Object;
    .param p2, "actual"    # Ljava/lang/Object;

    .prologue
    .line 504
    invoke-static {p0, p1, p2}, Ljunit/framework/Assert;->format(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public countTestCases()I
    .registers 2

    .prologue
    .line 101
    const/4 v0, 0x1

    return v0
.end method

.method protected createResult()Ljunit/framework/TestResult;
    .registers 2

    .prologue
    .line 110
    new-instance v0, Ljunit/framework/TestResult;

    invoke-direct {v0}, Ljunit/framework/TestResult;-><init>()V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 535
    iget-object v0, p0, Ljunit/framework/TestCase;->fName:Ljava/lang/String;

    return-object v0
.end method

.method public run()Ljunit/framework/TestResult;
    .registers 2

    .prologue
    .line 120
    invoke-virtual {p0}, Ljunit/framework/TestCase;->createResult()Ljunit/framework/TestResult;

    move-result-object v0

    .line 121
    .local v0, "result":Ljunit/framework/TestResult;
    invoke-virtual {p0, v0}, Ljunit/framework/TestCase;->run(Ljunit/framework/TestResult;)V

    .line 122
    return-object v0
.end method

.method public run(Ljunit/framework/TestResult;)V
    .registers 2
    .param p1, "result"    # Ljunit/framework/TestResult;

    .prologue
    .line 129
    invoke-virtual {p1, p0}, Ljunit/framework/TestResult;->run(Ljunit/framework/TestCase;)V

    .line 130
    return-void
.end method

.method public runBare()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 138
    const/4 v0, 0x0

    .line 139
    .local v0, "exception":Ljava/lang/Throwable;
    invoke-virtual {p0}, Ljunit/framework/TestCase;->setUp()V

    .line 141
    :try_start_4
    invoke-virtual {p0}, Ljunit/framework/TestCase;->runTest()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_7} :catch_12
    .catchall {:try_start_4 .. :try_end_7} :catchall_1d

    .line 146
    :try_start_7
    invoke-virtual {p0}, Ljunit/framework/TestCase;->tearDown()V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_a} :catch_d

    .line 151
    :cond_a
    :goto_a
    if-eqz v0, :cond_27

    throw v0

    .line 147
    :catch_d
    move-exception v2

    .line 148
    .local v2, "tearingDown":Ljava/lang/Throwable;
    if-nez v0, :cond_a

    move-object v0, v2

    goto :goto_a

    .line 142
    .end local v2    # "tearingDown":Ljava/lang/Throwable;
    :catch_12
    move-exception v1

    .line 143
    .local v1, "running":Ljava/lang/Throwable;
    move-object v0, v1

    .line 146
    :try_start_14
    invoke-virtual {p0}, Ljunit/framework/TestCase;->tearDown()V
    :try_end_17
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_17} :catch_18

    goto :goto_a

    .line 147
    :catch_18
    move-exception v2

    .line 148
    .restart local v2    # "tearingDown":Ljava/lang/Throwable;
    if-nez v0, :cond_a

    move-object v0, v2

    goto :goto_a

    .line 145
    .end local v1    # "running":Ljava/lang/Throwable;
    .end local v2    # "tearingDown":Ljava/lang/Throwable;
    :catchall_1d
    move-exception v3

    .line 146
    :try_start_1e
    invoke-virtual {p0}, Ljunit/framework/TestCase;->tearDown()V
    :try_end_21
    .catch Ljava/lang/Throwable; {:try_start_1e .. :try_end_21} :catch_22

    .line 149
    :cond_21
    :goto_21
    throw v3

    .line 147
    :catch_22
    move-exception v2

    .line 148
    .restart local v2    # "tearingDown":Ljava/lang/Throwable;
    if-nez v0, :cond_21

    move-object v0, v2

    goto :goto_21

    .line 152
    .end local v2    # "tearingDown":Ljava/lang/Throwable;
    :cond_27
    return-void
.end method

.method protected runTest()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 160
    const-string v2, "TestCase.fName cannot be null"

    iget-object v3, p0, Ljunit/framework/TestCase;->fName:Ljava/lang/String;

    invoke-static {v2, v3}, Ljunit/framework/TestCase;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 161
    const/4 v1, 0x0

    .line 167
    .local v1, "runMethod":Ljava/lang/reflect/Method;
    :try_start_8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    iget-object v4, p0, Ljunit/framework/TestCase;->fName:Ljava/lang/String;

    const/4 v2, 0x0

    check-cast v2, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_14
    .catch Ljava/lang/NoSuchMethodException; {:try_start_8 .. :try_end_14} :catch_44

    move-result-object v1

    .line 171
    :goto_15
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v2

    if-nez v2, :cond_3d

    .line 172
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Method \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Ljunit/framework/TestCase;->fName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\" should be public"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljunit/framework/TestCase;->fail(Ljava/lang/String;)V

    .line 176
    :cond_3d
    const/4 v2, 0x0

    :try_start_3e
    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_43
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3e .. :try_end_43} :catch_64
    .catch Ljava/lang/IllegalAccessException; {:try_start_3e .. :try_end_43} :catch_6d

    .line 184
    return-void

    .line 168
    :catch_44
    move-exception v0

    .line 169
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Method \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Ljunit/framework/TestCase;->fName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\" not found"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljunit/framework/TestCase;->fail(Ljava/lang/String;)V

    goto :goto_15

    .line 177
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_64
    move-exception v0

    .line 178
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->fillInStackTrace()Ljava/lang/Throwable;

    .line 179
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v2

    throw v2

    .line 180
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_6d
    move-exception v0

    .line 181
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->fillInStackTrace()Ljava/lang/Throwable;

    .line 182
    throw v0
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 544
    iput-object p1, p0, Ljunit/framework/TestCase;->fName:Ljava/lang/String;

    .line 545
    return-void
.end method

.method protected setUp()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 512
    return-void
.end method

.method protected tearDown()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 519
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 526
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljunit/framework/TestCase;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
