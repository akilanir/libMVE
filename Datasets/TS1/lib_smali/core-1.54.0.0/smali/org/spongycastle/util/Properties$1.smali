.class final Lorg/spongycastle/util/Properties$1;
.super Ljava/lang/Object;
.source "Properties.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/spongycastle/util/Properties;->isOverrideSet(Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$propertyName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 17
    iput-object p1, p0, Lorg/spongycastle/util/Properties$1;->val$propertyName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 21
    iget-object v1, p0, Lorg/spongycastle/util/Properties$1;->val$propertyName:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 22
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_a

    .line 24
    const/4 v1, 0x0

    .line 27
    :goto_9
    return-object v1

    :cond_a
    invoke-static {v0}, Lorg/spongycastle/util/Strings;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method
