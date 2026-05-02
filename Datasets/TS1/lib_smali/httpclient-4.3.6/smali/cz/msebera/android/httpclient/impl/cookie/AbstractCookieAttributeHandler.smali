.class public abstract Lcz/msebera/android/httpclient/impl/cookie/AbstractCookieAttributeHandler;
.super Ljava/lang/Object;
.source "AbstractCookieAttributeHandler.java"

# interfaces
.implements Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public match(Lcz/msebera/android/httpclient/cookie/Cookie;Lcz/msebera/android/httpclient/cookie/CookieOrigin;)Z
    .registers 4
    .param p1, "cookie"    # Lcz/msebera/android/httpclient/cookie/Cookie;
    .param p2, "origin"    # Lcz/msebera/android/httpclient/cookie/CookieOrigin;

    .prologue
    .line 49
    const/4 v0, 0x1

    return v0
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
    .line 45
    return-void
.end method
