.class public Ljunit/framework/AssertionFailedError;
.super Ljava/lang/AssertionError;
.source "AssertionFailedError.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-static {p1}, Ljunit/framework/AssertionFailedError;->defaultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 24
    return-void
.end method

.method private static defaultString(Ljava/lang/String;)Ljava/lang/String;
    .registers 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 27
    if-nez p0, :cond_4

    const-string p0, ""

    .end local p0    # "message":Ljava/lang/String;
    :cond_4
    return-object p0
.end method
