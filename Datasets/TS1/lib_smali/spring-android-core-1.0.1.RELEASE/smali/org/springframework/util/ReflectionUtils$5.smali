.class final Lorg/springframework/util/ReflectionUtils$5;
.super Ljava/lang/Object;
.source "ReflectionUtils.java"

# interfaces
.implements Lorg/springframework/util/ReflectionUtils$MethodFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/springframework/util/ReflectionUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 657
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Ljava/lang/reflect/Method;)Z
    .registers 3
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 660
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->isBridge()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
