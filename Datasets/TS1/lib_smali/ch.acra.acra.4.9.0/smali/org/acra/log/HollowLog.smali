.class public final Lorg/acra/log/HollowLog;
.super Ljava/lang/Object;
.source "HollowLog.java"

# interfaces
.implements Lorg/acra/log/ACRALog;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public d(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 22
    const/4 v0, 0x0

    return v0
.end method

.method public d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .registers 5
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 27
    const/4 v0, 0x0

    return v0
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 57
    const/4 v0, 0x0

    return v0
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .registers 5
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 62
    const/4 v0, 0x0

    return v0
.end method

.method public getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 3
    .param p1, "tr"    # Ljava/lang/Throwable;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 68
    const/4 v0, 0x0

    return-object v0
.end method

.method public i(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 32
    const/4 v0, 0x0

    return v0
.end method

.method public i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .registers 5
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 37
    const/4 v0, 0x0

    return v0
.end method

.method public v(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 12
    const/4 v0, 0x0

    return v0
.end method

.method public v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .registers 5
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 17
    const/4 v0, 0x0

    return v0
.end method

.method public w(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 42
    const/4 v0, 0x0

    return v0
.end method

.method public w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .registers 5
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 47
    const/4 v0, 0x0

    return v0
.end method

.method public w(Ljava/lang/String;Ljava/lang/Throwable;)I
    .registers 4
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 52
    const/4 v0, 0x0

    return v0
.end method
