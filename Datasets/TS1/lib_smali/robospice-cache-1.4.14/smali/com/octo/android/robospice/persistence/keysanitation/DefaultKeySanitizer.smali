.class public Lcom/octo/android/robospice/persistence/keysanitation/DefaultKeySanitizer;
.super Ljava/lang/Object;
.source "DefaultKeySanitizer.java"

# interfaces
.implements Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x8
.end annotation


# static fields
.field private static final BASE64_FLAGS:I = 0xb

.field private static final UTF8_CHARSET_NAME:Ljava/lang/String; = "UTF-8"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public desanitizeKey(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "sanitzedCacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;
        }
    .end annotation

    .prologue
    .line 44
    instance-of v1, p1, Ljava/lang/String;

    if-nez v1, :cond_23

    .line 45
    new-instance v1, Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-class v3, Lcom/octo/android/robospice/persistence/keysanitation/DefaultKeySanitizer;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " can only be used with Strings cache keys."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;-><init>(Ljava/lang/String;)V

    throw v1

    .line 48
    :cond_23
    :try_start_23
    new-instance v1, Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    .end local p1    # "sanitzedCacheKey":Ljava/lang/Object;
    const/16 v2, 0xb

    invoke-static {p1, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_32
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_23 .. :try_end_32} :catch_33

    return-object v1

    .line 49
    :catch_33
    move-exception v0

    .line 50
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;

    invoke-direct {v1, v0}, Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public sanitizeKey(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;
        }
    .end annotation

    .prologue
    .line 32
    instance-of v1, p1, Ljava/lang/String;

    if-nez v1, :cond_23

    .line 33
    new-instance v1, Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-class v3, Lcom/octo/android/robospice/persistence/keysanitation/DefaultKeySanitizer;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " can only be used with Strings cache keys."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;-><init>(Ljava/lang/String;)V

    throw v1

    .line 36
    :cond_23
    :try_start_23
    check-cast p1, Ljava/lang/String;

    .end local p1    # "cacheKey":Ljava/lang/Object;
    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    const/16 v2, 0xb

    invoke-static {v1, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;
    :try_end_30
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_23 .. :try_end_30} :catch_32

    move-result-object v1

    return-object v1

    .line 37
    :catch_32
    move-exception v0

    .line 38
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;

    invoke-direct {v1, v0}, Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
