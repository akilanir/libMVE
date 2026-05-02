.class public Lcz/msebera/android/httpclient/impl/cookie/BasicMaxAgeHandler;
.super Lcz/msebera/android/httpclient/impl/cookie/AbstractCookieAttributeHandler;
.source "BasicMaxAgeHandler.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/cookie/AbstractCookieAttributeHandler;-><init>()V

    .line 45
    return-void
.end method


# virtual methods
.method public parse(Lcz/msebera/android/httpclient/cookie/SetCookie;Ljava/lang/String;)V
    .registers 12
    .param p1, "cookie"    # Lcz/msebera/android/httpclient/cookie/SetCookie;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 49
    const-string v2, "Cookie"

    invoke-static {p1, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 50
    if-nez p2, :cond_f

    .line 51
    new-instance v2, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;

    const-string v3, "Missing value for max-age attribute"

    invoke-direct {v2, v3}, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 55
    :cond_f
    :try_start_f
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_12
    .catch Ljava/lang/NumberFormatException; {:try_start_f .. :try_end_12} :catch_2e

    move-result v0

    .line 60
    .local v0, "age":I
    if-gez v0, :cond_48

    .line 61
    new-instance v2, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Negative max-age attribute: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 56
    .end local v0    # "age":I
    :catch_2e
    move-exception v1

    .line 57
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v2, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid max-age attribute: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 64
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .restart local v0    # "age":I
    :cond_48
    new-instance v2, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    int-to-long v5, v0

    const-wide/16 v7, 0x3e8

    mul-long/2addr v5, v7

    add-long/2addr v3, v5

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-interface {p1, v2}, Lcz/msebera/android/httpclient/cookie/SetCookie;->setExpiryDate(Ljava/util/Date;)V

    .line 65
    return-void
.end method
