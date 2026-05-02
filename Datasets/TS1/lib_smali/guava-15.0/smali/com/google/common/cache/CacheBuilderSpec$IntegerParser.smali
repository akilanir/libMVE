.class abstract Lcom/google/common/cache/CacheBuilderSpec$IntegerParser;
.super Ljava/lang/Object;
.source "CacheBuilderSpec.java"

# interfaces
.implements Lcom/google/common/cache/CacheBuilderSpec$ValueParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/CacheBuilderSpec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "IntegerParser"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lcom/google/common/cache/CacheBuilderSpec;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "spec"    # Lcom/google/common/cache/CacheBuilderSpec;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 292
    if-eqz p3, :cond_1c

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1c

    move v1, v2

    :goto_b
    const-string v4, "value of key %s omitted"

    new-array v5, v2, [Ljava/lang/Object;

    aput-object p2, v5, v3

    invoke-static {v1, v4, v5}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 294
    :try_start_14
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, p1, v1}, Lcom/google/common/cache/CacheBuilderSpec$IntegerParser;->parseInteger(Lcom/google/common/cache/CacheBuilderSpec;I)V
    :try_end_1b
    .catch Ljava/lang/NumberFormatException; {:try_start_14 .. :try_end_1b} :catch_1e

    .line 299
    return-void

    :cond_1c
    move v1, v3

    .line 292
    goto :goto_b

    .line 295
    :catch_1e
    move-exception v0

    .line 296
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v4, "key %s value set to %s, must be integer"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p2, v5, v3

    aput-object p3, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected abstract parseInteger(Lcom/google/common/cache/CacheBuilderSpec;I)V
.end method
