.class public Lcz/msebera/android/httpclient/impl/cookie/BasicExpiresHandler;
.super Lcz/msebera/android/httpclient/impl/cookie/AbstractCookieAttributeHandler;
.source "BasicExpiresHandler.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field private final datepatterns:[Ljava/lang/String;


# direct methods
.method public constructor <init>([Ljava/lang/String;)V
    .registers 3
    .param p1, "datepatterns"    # [Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/cookie/AbstractCookieAttributeHandler;-><init>()V

    .line 48
    const-string v0, "Array of date patterns"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 49
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/cookie/BasicExpiresHandler;->datepatterns:[Ljava/lang/String;

    .line 50
    return-void
.end method


# virtual methods
.method public parse(Lcz/msebera/android/httpclient/cookie/SetCookie;Ljava/lang/String;)V
    .registers 7
    .param p1, "cookie"    # Lcz/msebera/android/httpclient/cookie/SetCookie;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 54
    const-string v1, "Cookie"

    invoke-static {p1, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 55
    if-nez p2, :cond_f

    .line 56
    new-instance v1, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;

    const-string v2, "Missing value for expires attribute"

    invoke-direct {v1, v2}, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 58
    :cond_f
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/cookie/BasicExpiresHandler;->datepatterns:[Ljava/lang/String;

    invoke-static {p2, v1}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 59
    .local v0, "expiry":Ljava/util/Date;
    if-nez v0, :cond_30

    .line 60
    new-instance v1, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to parse expires attribute: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 63
    :cond_30
    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/cookie/SetCookie;->setExpiryDate(Ljava/util/Date;)V

    .line 64
    return-void
.end method
