.class public Lcz/msebera/android/httpclient/impl/client/BasicCookieStore;
.super Ljava/lang/Object;
.source "BasicCookieStore.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/CookieStore;
.implements Ljava/io/Serializable;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x69357431db388559L


# instance fields
.field private final cookies:Ljava/util/TreeSet;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeSet",
            "<",
            "Lcz/msebera/android/httpclient/cookie/Cookie;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/TreeSet;

    new-instance v1, Lcz/msebera/android/httpclient/cookie/CookieIdentityComparator;

    invoke-direct {v1}, Lcz/msebera/android/httpclient/cookie/CookieIdentityComparator;-><init>()V

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    .line 59
    return-void
.end method


# virtual methods
.method public declared-synchronized addCookie(Lcz/msebera/android/httpclient/cookie/Cookie;)V
    .registers 3
    .param p1, "cookie"    # Lcz/msebera/android/httpclient/cookie/Cookie;

    .prologue
    .line 72
    monitor-enter p0

    if-eqz p1, :cond_18

    .line 74
    :try_start_3
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    invoke-virtual {v0, p1}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    .line 75
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/cookie/Cookie;->isExpired(Ljava/util/Date;)Z

    move-result v0

    if-nez v0, :cond_18

    .line 76
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    invoke-virtual {v0, p1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_1a

    .line 79
    :cond_18
    monitor-exit p0

    return-void

    .line 72
    :catchall_1a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addCookies([Lcz/msebera/android/httpclient/cookie/Cookie;)V
    .registers 5
    .param p1, "cookies"    # [Lcz/msebera/android/httpclient/cookie/Cookie;

    .prologue
    .line 92
    monitor-enter p0

    if-eqz p1, :cond_f

    .line 93
    :try_start_3
    array-length v2, p1

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v2, :cond_f

    aget-object v0, p1, v1

    .line 94
    .local v0, "cooky":Lcz/msebera/android/httpclient/cookie/Cookie;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/client/BasicCookieStore;->addCookie(Lcz/msebera/android/httpclient/cookie/Cookie;)V
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_11

    .line 93
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 97
    .end local v0    # "cooky":Lcz/msebera/android/httpclient/cookie/Cookie;
    :cond_f
    monitor-exit p0

    return-void

    .line 92
    :catchall_11
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized clear()V
    .registers 2

    .prologue
    .line 136
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->clear()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 137
    monitor-exit p0

    return-void

    .line 136
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearExpired(Ljava/util/Date;)Z
    .registers 5
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 119
    monitor-enter p0

    if-nez p1, :cond_6

    .line 120
    const/4 v1, 0x0

    .line 129
    :cond_4
    monitor-exit p0

    return v1

    .line 122
    :cond_6
    const/4 v1, 0x0

    .line 123
    .local v1, "removed":Z
    :try_start_7
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    invoke-virtual {v2}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/cookie/Cookie;>;"
    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 124
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcz/msebera/android/httpclient/cookie/Cookie;

    invoke-interface {v2, p1}, Lcz/msebera/android/httpclient/cookie/Cookie;->isExpired(Ljava/util/Date;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 125
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V
    :try_end_22
    .catchall {:try_start_7 .. :try_end_22} :catchall_24

    .line 126
    const/4 v1, 0x1

    goto :goto_d

    .line 119
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/cookie/Cookie;>;"
    :catchall_24
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getCookies()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcz/msebera/android/httpclient/cookie/Cookie;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    monitor-exit p0

    return-object v0

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 141
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->toString()Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method
