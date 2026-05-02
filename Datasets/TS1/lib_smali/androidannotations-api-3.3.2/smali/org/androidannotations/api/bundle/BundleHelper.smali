.class public Lorg/androidannotations/api/bundle/BundleHelper;
.super Ljava/lang/Object;
.source "BundleHelper.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public static getParcelableArray(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)[Landroid/os/Parcelable;
    .registers 8
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">(",
            "Landroid/os/Bundle;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<[TT;>;)[TT;"
        }
    .end annotation

    .prologue
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<[TT;>;"
    const/4 v4, 0x0

    .line 59
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v1

    .line 60
    .local v1, "value":[Landroid/os/Parcelable;
    if-nez v1, :cond_9

    .line 61
    const/4 v0, 0x0

    .line 65
    :goto_8
    return-object v0

    .line 63
    :cond_9
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    array-length v3, v1

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    .line 64
    .local v0, "copy":Ljava/lang/Object;
    array-length v2, v1

    invoke-static {v1, v4, v0, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    check-cast v0, [Landroid/os/Parcelable;

    .end local v0    # "copy":Ljava/lang/Object;
    check-cast v0, [Landroid/os/Parcelable;

    goto :goto_8
.end method
