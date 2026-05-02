.class public Ljavassist/runtime/DotClass;
.super Ljava/lang/Object;
.source "DotClass.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fail(Ljava/lang/ClassNotFoundException;)Ljava/lang/NoClassDefFoundError;
    .registers 3
    .param p0, "e"    # Ljava/lang/ClassNotFoundException;

    .prologue
    .line 27
    new-instance v0, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {p0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
