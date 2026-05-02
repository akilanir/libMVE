.class Ljavassist/util/proxy/RuntimeSupport$DefaultMethodHandler;
.super Ljava/lang/Object;
.source "RuntimeSupport.java"

# interfaces
.implements Ljavassist/util/proxy/MethodHandler;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/util/proxy/RuntimeSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DefaultMethodHandler"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "self"    # Ljava/lang/Object;
    .param p2, "m"    # Ljava/lang/reflect/Method;
    .param p3, "proceed"    # Ljava/lang/reflect/Method;
    .param p4, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 38
    invoke-virtual {p3, p1, p4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
