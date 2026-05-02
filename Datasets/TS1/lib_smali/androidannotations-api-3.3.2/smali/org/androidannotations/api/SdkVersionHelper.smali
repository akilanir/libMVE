.class public Lorg/androidannotations/api/SdkVersionHelper;
.super Ljava/lang/Object;
.source "SdkVersionHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/androidannotations/api/SdkVersionHelper$HelperInternal;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method public static getSdkInt()I
    .registers 2

    .prologue
    .line 27
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    const-string v1, "1.5"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 28
    const/4 v0, 0x3

    .line 31
    :goto_b
    return v0

    :cond_c
    # invokes: Lorg/androidannotations/api/SdkVersionHelper$HelperInternal;->getSdkIntInternal()I
    invoke-static {}, Lorg/androidannotations/api/SdkVersionHelper$HelperInternal;->access$000()I

    move-result v0

    goto :goto_b
.end method
