.class public Lcz/msebera/android/httpclient/impl/cookie/RFC2965CommentUrlAttributeHandler;
.super Ljava/lang/Object;
.source "RFC2965CommentUrlAttributeHandler.java"

# interfaces
.implements Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method


# virtual methods
.method public match(Lcz/msebera/android/httpclient/cookie/Cookie;Lcz/msebera/android/httpclient/cookie/CookieOrigin;)Z
    .registers 4
    .param p1, "cookie"    # Lcz/msebera/android/httpclient/cookie/Cookie;
    .param p2, "origin"    # Lcz/msebera/android/httpclient/cookie/CookieOrigin;

    .prologue
    .line 63
    const/4 v0, 0x1

    return v0
.end method

.method public parse(Lcz/msebera/android/httpclient/cookie/SetCookie;Ljava/lang/String;)V
    .registers 5
    .param p1, "cookie"    # Lcz/msebera/android/httpclient/cookie/SetCookie;
    .param p2, "commenturl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 52
    instance-of v1, p1, Lcz/msebera/android/httpclient/cookie/SetCookie2;

    if-eqz v1, :cond_a

    move-object v0, p1

    .line 53
    check-cast v0, Lcz/msebera/android/httpclient/cookie/SetCookie2;

    .line 54
    .local v0, "cookie2":Lcz/msebera/android/httpclient/cookie/SetCookie2;
    invoke-interface {v0, p2}, Lcz/msebera/android/httpclient/cookie/SetCookie2;->setCommentURL(Ljava/lang/String;)V

    .line 56
    .end local v0    # "cookie2":Lcz/msebera/android/httpclient/cookie/SetCookie2;
    :cond_a
    return-void
.end method

.method public validate(Lcz/msebera/android/httpclient/cookie/Cookie;Lcz/msebera/android/httpclient/cookie/CookieOrigin;)V
    .registers 3
    .param p1, "cookie"    # Lcz/msebera/android/httpclient/cookie/Cookie;
    .param p2, "origin"    # Lcz/msebera/android/httpclient/cookie/CookieOrigin;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 60
    return-void
.end method
