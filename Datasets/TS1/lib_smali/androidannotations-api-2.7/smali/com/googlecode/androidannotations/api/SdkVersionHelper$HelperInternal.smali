.class Lcom/googlecode/androidannotations/api/SdkVersionHelper$HelperInternal;
.super Ljava/lang/Object;
.source "SdkVersionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/androidannotations/api/SdkVersionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HelperInternal"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()I
    .registers 1

    .prologue
    .line 30
    invoke-static {}, Lcom/googlecode/androidannotations/api/SdkVersionHelper$HelperInternal;->getSdkIntInternal()I

    move-result v0

    return v0
.end method

.method private static getSdkIntInternal()I
    .registers 1

    .prologue
    .line 32
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    return v0
.end method
