.class public Lorg/apache/commons/digester/CallMethodRule;
.super Lorg/apache/commons/digester/Rule;
.source "CallMethodRule.java"


# static fields
.field static class$java$lang$String:Ljava/lang/Class;


# instance fields
.field protected bodyText:Ljava/lang/String;

.field protected methodName:Ljava/lang/String;

.field private paramClassNames:[Ljava/lang/String;

.field protected paramCount:I

.field protected paramTypes:[Ljava/lang/Class;

.field private targetOffset:I

.field protected useExactMatch:Z


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .registers 5
    .param p1, "targetOffset"    # I
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 234
    const/4 v1, 0x0

    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Class;

    invoke-direct {p0, p1, p2, v1, v0}, Lorg/apache/commons/digester/CallMethodRule;-><init>(ILjava/lang/String;I[Ljava/lang/Class;)V

    .line 236
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;I)V
    .registers 8
    .param p1, "targetOffset"    # I
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramCount"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 193
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 377
    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->bodyText:Ljava/lang/String;

    .line 385
    iput v3, p0, Lorg/apache/commons/digester/CallMethodRule;->targetOffset:I

    .line 390
    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->methodName:Ljava/lang/String;

    .line 398
    iput v3, p0, Lorg/apache/commons/digester/CallMethodRule;->paramCount:I

    .line 404
    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    .line 410
    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramClassNames:[Ljava/lang/String;

    .line 415
    iput-boolean v3, p0, Lorg/apache/commons/digester/CallMethodRule;->useExactMatch:Z

    .line 195
    iput p1, p0, Lorg/apache/commons/digester/CallMethodRule;->targetOffset:I

    .line 196
    iput-object p2, p0, Lorg/apache/commons/digester/CallMethodRule;->methodName:Ljava/lang/String;

    .line 197
    iput p3, p0, Lorg/apache/commons/digester/CallMethodRule;->paramCount:I

    .line 198
    if-nez p3, :cond_32

    .line 199
    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    sget-object v1, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_2f

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/digester/CallMethodRule;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    :goto_2a
    aput-object v1, v2, v3

    iput-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    .line 207
    :cond_2e
    return-void

    .line 199
    :cond_2f
    sget-object v1, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_2a

    .line 201
    :cond_32
    new-array v1, p3, [Ljava/lang/Class;

    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    .line 202
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_37
    iget-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    array-length v1, v1

    if-ge v0, v1, :cond_2e

    .line 203
    iget-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    sget-object v1, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_4f

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/digester/CallMethodRule;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    :goto_4a
    aput-object v1, v2, v0

    .line 202
    add-int/lit8 v0, v0, 0x1

    goto :goto_37

    .line 203
    :cond_4f
    sget-object v1, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_4a
.end method

.method public constructor <init>(ILjava/lang/String;I[Ljava/lang/Class;)V
    .registers 8
    .param p1, "targetOffset"    # I
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramCount"    # I
    .param p4, "paramTypes"    # [Ljava/lang/Class;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 351
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 377
    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->bodyText:Ljava/lang/String;

    .line 385
    iput v2, p0, Lorg/apache/commons/digester/CallMethodRule;->targetOffset:I

    .line 390
    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->methodName:Ljava/lang/String;

    .line 398
    iput v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramCount:I

    .line 404
    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    .line 410
    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramClassNames:[Ljava/lang/String;

    .line 415
    iput-boolean v2, p0, Lorg/apache/commons/digester/CallMethodRule;->useExactMatch:Z

    .line 353
    iput p1, p0, Lorg/apache/commons/digester/CallMethodRule;->targetOffset:I

    .line 354
    iput-object p2, p0, Lorg/apache/commons/digester/CallMethodRule;->methodName:Ljava/lang/String;

    .line 355
    iput p3, p0, Lorg/apache/commons/digester/CallMethodRule;->paramCount:I

    .line 356
    if-nez p4, :cond_3c

    .line 357
    new-array v1, p3, [Ljava/lang/Class;

    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    .line 358
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_20
    iget-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    array-length v1, v1

    if-lt v0, v1, :cond_26

    .line 368
    :cond_25
    return-void

    .line 359
    :cond_26
    iget-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    sget-object v1, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_39

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/digester/CallMethodRule;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    :goto_34
    aput-object v1, v2, v0

    .line 358
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 359
    :cond_39
    sget-object v1, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_34

    .line 362
    .end local v0    # "i":I
    :cond_3c
    array-length v1, p4

    new-array v1, v1, [Ljava/lang/Class;

    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    .line 363
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_42
    iget-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    array-length v1, v1

    if-ge v0, v1, :cond_25

    .line 364
    iget-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    aget-object v2, p4, v0

    aput-object v2, v1, v0

    .line 363
    add-int/lit8 v0, v0, 0x1

    goto :goto_42
.end method

.method public constructor <init>(ILjava/lang/String;I[Ljava/lang/String;)V
    .registers 8
    .param p1, "targetOffset"    # I
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramCount"    # I
    .param p4, "paramTypes"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 283
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 377
    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->bodyText:Ljava/lang/String;

    .line 385
    iput v2, p0, Lorg/apache/commons/digester/CallMethodRule;->targetOffset:I

    .line 390
    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->methodName:Ljava/lang/String;

    .line 398
    iput v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramCount:I

    .line 404
    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    .line 410
    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramClassNames:[Ljava/lang/String;

    .line 415
    iput-boolean v2, p0, Lorg/apache/commons/digester/CallMethodRule;->useExactMatch:Z

    .line 285
    iput p1, p0, Lorg/apache/commons/digester/CallMethodRule;->targetOffset:I

    .line 286
    iput-object p2, p0, Lorg/apache/commons/digester/CallMethodRule;->methodName:Ljava/lang/String;

    .line 287
    iput p3, p0, Lorg/apache/commons/digester/CallMethodRule;->paramCount:I

    .line 288
    if-nez p4, :cond_3c

    .line 289
    new-array v1, p3, [Ljava/lang/Class;

    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    .line 290
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_20
    iget-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    array-length v1, v1

    if-lt v0, v1, :cond_26

    .line 302
    :cond_25
    return-void

    .line 291
    :cond_26
    iget-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    sget-object v1, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_39

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/digester/CallMethodRule;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    :goto_34
    aput-object v1, v2, v0

    .line 290
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 291
    :cond_39
    sget-object v1, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_34

    .line 296
    .end local v0    # "i":I
    :cond_3c
    array-length v1, p4

    new-array v1, v1, [Ljava/lang/String;

    iput-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramClassNames:[Ljava/lang/String;

    .line 297
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_42
    iget-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramClassNames:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_25

    .line 298
    iget-object v1, p0, Lorg/apache/commons/digester/CallMethodRule;->paramClassNames:[Ljava/lang/String;

    aget-object v2, p4, v0

    aput-object v2, v1, v0

    .line 297
    add-int/lit8 v0, v0, 0x1

    goto :goto_42
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 217
    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Class;

    invoke-direct {p0, v1, p1, v1, v0}, Lorg/apache/commons/digester/CallMethodRule;-><init>(ILjava/lang/String;I[Ljava/lang/Class;)V

    .line 219
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "paramCount"    # I

    .prologue
    .line 176
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/commons/digester/CallMethodRule;-><init>(ILjava/lang/String;I)V

    .line 177
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I[Ljava/lang/Class;)V
    .registers 5
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "paramCount"    # I
    .param p3, "paramTypes"    # [Ljava/lang/Class;

    .prologue
    .line 325
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/apache/commons/digester/CallMethodRule;-><init>(ILjava/lang/String;I[Ljava/lang/Class;)V

    .line 326
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I[Ljava/lang/String;)V
    .registers 5
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "paramCount"    # I
    .param p3, "paramTypes"    # [Ljava/lang/String;

    .prologue
    .line 258
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/apache/commons/digester/CallMethodRule;-><init>(ILjava/lang/String;I[Ljava/lang/String;)V

    .line 259
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;I)V
    .registers 4
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramCount"    # I

    .prologue
    .line 115
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/digester/CallMethodRule;-><init>(Ljava/lang/String;I)V

    .line 117
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;I[Ljava/lang/Class;)V
    .registers 5
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramCount"    # I
    .param p4, "paramTypes"    # [Ljava/lang/Class;

    .prologue
    .line 162
    invoke-direct {p0, p2, p3, p4}, Lorg/apache/commons/digester/CallMethodRule;-><init>(Ljava/lang/String;I[Ljava/lang/Class;)V

    .line 163
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;I[Ljava/lang/String;)V
    .registers 5
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramCount"    # I
    .param p4, "paramTypes"    # [Ljava/lang/String;

    .prologue
    .line 138
    invoke-direct {p0, p2, p3, p4}, Lorg/apache/commons/digester/CallMethodRule;-><init>(Ljava/lang/String;I[Ljava/lang/String;)V

    .line 140
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 95
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


# virtual methods
.method public begin(Lorg/xml/sax/Attributes;)V
    .registers 5
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 468
    iget v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramCount:I

    if-lez v2, :cond_11

    .line 469
    iget v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramCount:I

    new-array v1, v2, [Ljava/lang/Object;

    .line 470
    .local v1, "parameters":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    array-length v2, v1

    if-lt v0, v2, :cond_12

    .line 473
    iget-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v2, v1}, Lorg/apache/commons/digester/Digester;->pushParams(Ljava/lang/Object;)V

    .line 476
    .end local v0    # "i":I
    .end local v1    # "parameters":[Ljava/lang/Object;
    :cond_11
    return-void

    .line 471
    .restart local v0    # "i":I
    .restart local v1    # "parameters":[Ljava/lang/Object;
    :cond_12
    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 470
    add-int/lit8 v0, v0, 0x1

    goto :goto_9
.end method

.method public body(Ljava/lang/String;)V
    .registers 3
    .param p1, "bodyText"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 486
    iget v0, p0, Lorg/apache/commons/digester/CallMethodRule;->paramCount:I

    if-nez v0, :cond_a

    .line 487
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/CallMethodRule;->bodyText:Ljava/lang/String;

    .line 490
    :cond_a
    return-void
.end method

.method public end()V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 499
    const/4 v2, 0x0

    .line 500
    .local v2, "parameters":[Ljava/lang/Object;
    iget v7, p0, Lorg/apache/commons/digester/CallMethodRule;->paramCount:I

    if-lez v7, :cond_4f

    .line 502
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v7}, Lorg/apache/commons/digester/Digester;->popParams()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "parameters":[Ljava/lang/Object;
    check-cast v2, [Ljava/lang/Object;

    .line 504
    .restart local v2    # "parameters":[Ljava/lang/Object;
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v7, v7, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v7}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v7

    if-eqz v7, :cond_1d

    .line 505
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v5, v2

    .local v5, "size":I
    :goto_1b
    if-lt v0, v5, :cond_26

    .line 520
    .end local v0    # "i":I
    .end local v5    # "size":I
    :cond_1d
    iget v7, p0, Lorg/apache/commons/digester/CallMethodRule;->paramCount:I

    if-ne v7, v11, :cond_7b

    aget-object v7, v2, v10

    if-nez v7, :cond_7b

    .line 631
    :cond_25
    :goto_25
    return-void

    .line 506
    .restart local v0    # "i":I
    .restart local v5    # "size":I
    :cond_26
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v7, v7, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "[CallMethodRule]("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    aget-object v9, v2, v0

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 505
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 524
    .end local v0    # "i":I
    .end local v5    # "size":I
    :cond_4f
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    if-eqz v7, :cond_7b

    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    array-length v7, v7

    if-eqz v7, :cond_7b

    .line 531
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->bodyText:Ljava/lang/String;

    if-eqz v7, :cond_25

    .line 535
    new-array v2, v11, [Ljava/lang/Object;

    .line 536
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->bodyText:Ljava/lang/String;

    aput-object v7, v2, v10

    .line 537
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    array-length v7, v7

    if-nez v7, :cond_7b

    .line 538
    new-array v7, v11, [Ljava/lang/Class;

    iput-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    .line 539
    iget-object v8, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    sget-object v7, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    if-nez v7, :cond_d1

    const-string v7, "java.lang.String"

    invoke-static {v7}, Lorg/apache/commons/digester/CallMethodRule;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    :goto_79
    aput-object v7, v8, v10

    .line 552
    :cond_7b
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    array-length v7, v7

    new-array v1, v7, [Ljava/lang/Object;

    .line 553
    .local v1, "paramValues":[Ljava/lang/Object;
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_81
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    array-length v7, v7

    if-lt v0, v7, :cond_d4

    .line 570
    iget v7, p0, Lorg/apache/commons/digester/CallMethodRule;->targetOffset:I

    if-ltz v7, :cond_10e

    .line 571
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->digester:Lorg/apache/commons/digester/Digester;

    iget v8, p0, Lorg/apache/commons/digester/CallMethodRule;->targetOffset:I

    invoke-virtual {v7, v8}, Lorg/apache/commons/digester/Digester;->peek(I)Ljava/lang/Object;

    move-result-object v6

    .line 576
    .local v6, "target":Ljava/lang/Object;
    :goto_92
    if-nez v6, :cond_11f

    .line 577
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 578
    .local v4, "sb":Ljava/lang/StringBuffer;
    const-string v7, "[CallMethodRule]{"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 579
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v7, v7, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 580
    const-string v7, "} Call target is null ("

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 581
    const-string v7, "targetOffset="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 582
    iget v7, p0, Lorg/apache/commons/digester/CallMethodRule;->targetOffset:I

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 583
    const-string v7, ",stackdepth="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 584
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v7}, Lorg/apache/commons/digester/Digester;->getCount()I

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 585
    const-string v7, ")"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 586
    new-instance v7, Lorg/xml/sax/SAXException;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 539
    .end local v0    # "i":I
    .end local v1    # "paramValues":[Ljava/lang/Object;
    .end local v4    # "sb":Ljava/lang/StringBuffer;
    .end local v6    # "target":Ljava/lang/Object;
    :cond_d1
    sget-object v7, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_79

    .line 556
    .restart local v0    # "i":I
    .restart local v1    # "paramValues":[Ljava/lang/Object;
    :cond_d4
    aget-object v7, v2, v0

    if-eqz v7, :cond_f4

    aget-object v7, v2, v0

    instance-of v7, v7, Ljava/lang/String;

    if-eqz v7, :cond_109

    sget-object v7, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    if-nez v7, :cond_106

    const-string v7, "java.lang.String"

    invoke-static {v7}, Lorg/apache/commons/digester/CallMethodRule;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    :goto_ea
    iget-object v8, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    aget-object v8, v8, v0

    invoke-virtual {v7, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-nez v7, :cond_109

    .line 561
    :cond_f4
    aget-object v7, v2, v0

    check-cast v7, Ljava/lang/String;

    iget-object v8, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    aget-object v8, v8, v0

    invoke-static {v7, v8}, Lorg/apache/commons/beanutils/ConvertUtils;->convert(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    aput-object v7, v1, v0

    .line 553
    :goto_102
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_81

    .line 556
    :cond_106
    sget-object v7, Lorg/apache/commons/digester/CallMethodRule;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_ea

    .line 564
    :cond_109
    aget-object v7, v2, v0

    aput-object v7, v1, v0

    goto :goto_102

    .line 573
    :cond_10e
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v8, p0, Lorg/apache/commons/digester/CallMethodRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v8}, Lorg/apache/commons/digester/Digester;->getCount()I

    move-result v8

    iget v9, p0, Lorg/apache/commons/digester/CallMethodRule;->targetOffset:I

    add-int/2addr v8, v9

    invoke-virtual {v7, v8}, Lorg/apache/commons/digester/Digester;->peek(I)Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "target":Ljava/lang/Object;
    goto/16 :goto_92

    .line 590
    :cond_11f
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v7, v7, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v7}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v7

    if-eqz v7, :cond_16a

    .line 591
    new-instance v4, Ljava/lang/StringBuffer;

    const-string v7, "[CallMethodRule]{"

    invoke-direct {v4, v7}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 592
    .restart local v4    # "sb":Ljava/lang/StringBuffer;
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v7, v7, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 593
    const-string v7, "} Call "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 594
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 595
    const-string v7, "."

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 596
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->methodName:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 597
    const-string v7, "("

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 598
    const/4 v0, 0x0

    :goto_157
    array-length v7, v1

    if-lt v0, v7, :cond_17c

    .line 614
    const-string v7, ")"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 615
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v7, v7, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 618
    .end local v4    # "sb":Ljava/lang/StringBuffer;
    :cond_16a
    const/4 v3, 0x0

    .line 619
    .local v3, "result":Ljava/lang/Object;
    iget-boolean v7, p0, Lorg/apache/commons/digester/CallMethodRule;->useExactMatch:Z

    if-eqz v7, :cond_1b5

    .line 621
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->methodName:Ljava/lang/String;

    iget-object v8, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    invoke-static {v6, v7, v1, v8}, Lorg/apache/commons/beanutils/MethodUtils;->invokeExactMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    .line 630
    :goto_177
    invoke-virtual {p0, v3}, Lorg/apache/commons/digester/CallMethodRule;->processMethodCallResult(Ljava/lang/Object;)V

    goto/16 :goto_25

    .line 599
    .end local v3    # "result":Ljava/lang/Object;
    .restart local v4    # "sb":Ljava/lang/StringBuffer;
    :cond_17c
    if-lez v0, :cond_183

    .line 600
    const-string v7, ","

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 602
    :cond_183
    aget-object v7, v1, v0

    if-nez v7, :cond_19f

    .line 603
    const-string v7, "null"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 607
    :goto_18c
    const-string v7, "/"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 608
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    aget-object v7, v7, v0

    if-nez v7, :cond_1a9

    .line 609
    const-string v7, "null"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 598
    :goto_19c
    add-int/lit8 v0, v0, 0x1

    goto :goto_157

    .line 605
    :cond_19f
    aget-object v7, v1, v0

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_18c

    .line 611
    :cond_1a9
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    aget-object v7, v7, v0

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_19c

    .line 626
    .end local v4    # "sb":Ljava/lang/StringBuffer;
    .restart local v3    # "result":Ljava/lang/Object;
    :cond_1b5
    iget-object v7, p0, Lorg/apache/commons/digester/CallMethodRule;->methodName:Ljava/lang/String;

    iget-object v8, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    invoke-static {v6, v7, v1, v8}, Lorg/apache/commons/beanutils/MethodUtils;->invokeMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_177
.end method

.method public finish()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 639
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/CallMethodRule;->bodyText:Ljava/lang/String;

    .line 641
    return-void
.end method

.method public getUseExactMatch()Z
    .registers 2

    .prologue
    .line 424
    iget-boolean v0, p0, Lorg/apache/commons/digester/CallMethodRule;->useExactMatch:Z

    return v0
.end method

.method protected processMethodCallResult(Ljava/lang/Object;)V
    .registers 2
    .param p1, "result"    # Ljava/lang/Object;

    .prologue
    .line 651
    return-void
.end method

.method public setDigester(Lorg/apache/commons/digester/Digester;)V
    .registers 7
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 443
    invoke-super {p0, p1}, Lorg/apache/commons/digester/Rule;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 445
    iget-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramClassNames:[Ljava/lang/String;

    if-eqz v2, :cond_14

    .line 446
    iget-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramClassNames:[Ljava/lang/String;

    array-length v2, v2

    new-array v2, v2, [Ljava/lang/Class;

    iput-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    .line 447
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    iget-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramClassNames:[Ljava/lang/String;

    array-length v2, v2

    if-lt v1, v2, :cond_15

    .line 458
    .end local v1    # "i":I
    :cond_14
    return-void

    .line 449
    .restart local v1    # "i":I
    :cond_15
    :try_start_15
    iget-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    invoke-virtual {p1}, Lorg/apache/commons/digester/Digester;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/digester/CallMethodRule;->paramClassNames:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v2, v1
    :try_end_25
    .catch Ljava/lang/ClassNotFoundException; {:try_start_15 .. :try_end_25} :catch_28

    .line 447
    :goto_25
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 453
    :catch_28
    move-exception v0

    .local v0, "e":Ljava/lang/ClassNotFoundException;
    invoke-virtual {p1}, Lorg/apache/commons/digester/Digester;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "(CallMethodRule) Cannot load class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/digester/CallMethodRule;->paramClassNames:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 454
    iget-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object v3, v2, v1

    goto :goto_25
.end method

.method public setUseExactMatch(Z)V
    .registers 2
    .param p1, "useExactMatch"    # Z

    .prologue
    .line 433
    iput-boolean p1, p0, Lorg/apache/commons/digester/CallMethodRule;->useExactMatch:Z

    .line 434
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 658
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "CallMethodRule["

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 659
    .local v1, "sb":Ljava/lang/StringBuffer;
    const-string v2, "methodName="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 660
    iget-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->methodName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 661
    const-string v2, ", paramCount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 662
    iget v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 663
    const-string v2, ", paramTypes={"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 664
    iget-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    if-eqz v2, :cond_2a

    .line 665
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_25
    iget-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    array-length v2, v2

    if-lt v0, v2, :cond_39

    .line 672
    .end local v0    # "i":I
    :cond_2a
    const-string v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 673
    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 674
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 666
    .restart local v0    # "i":I
    :cond_39
    if-lez v0, :cond_40

    .line 667
    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 669
    :cond_40
    iget-object v2, p0, Lorg/apache/commons/digester/CallMethodRule;->paramTypes:[Ljava/lang/Class;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 665
    add-int/lit8 v0, v0, 0x1

    goto :goto_25
.end method
