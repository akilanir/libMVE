.class final Lkorex/activation/SecuritySupport$3;
.super Ljava/lang/Object;
.source "SecuritySupport.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkorex/activation/SecuritySupport;->getResources(Ljava/lang/ClassLoader;Ljava/lang/String;)[Ljava/net/URL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$cl:Ljava/lang/ClassLoader;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/ClassLoader;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 73
    iput-object p1, p0, Lkorex/activation/SecuritySupport$3;->val$cl:Ljava/lang/ClassLoader;

    iput-object p2, p0, Lkorex/activation/SecuritySupport$3;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 8

    .prologue
    .line 75
    const/4 v2, 0x0

    .line 77
    .local v2, "ret":[Ljava/net/URL;
    :try_start_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .local v4, "v":Ljava/util/List;
    iget-object v5, p0, Lkorex/activation/SecuritySupport$3;->val$cl:Ljava/lang/ClassLoader;

    iget-object v6, p0, Lkorex/activation/SecuritySupport$3;->val$name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v1

    .line 79
    .local v1, "e":Ljava/util/Enumeration;
    :cond_e
    :goto_e
    if-eqz v1, :cond_24

    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_24

    .line 80
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/URL;

    .line 81
    .local v3, "url":Ljava/net/URL;
    if-eqz v3, :cond_e

    .line 82
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 88
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v3    # "url":Ljava/net/URL;
    .end local v4    # "v":Ljava/util/List;
    :catch_22
    move-exception v5

    .line 90
    :cond_23
    :goto_23
    return-object v2

    .line 84
    .restart local v1    # "e":Ljava/util/Enumeration;
    .restart local v4    # "v":Ljava/util/List;
    :cond_24
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_23

    .line 85
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v2, v5, [Ljava/net/URL;

    .line 86
    invoke-interface {v4, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/net/URL;

    move-object v0, v5

    check-cast v0, [Ljava/net/URL;

    move-object v2, v0
    :try_end_3a
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_3a} :catch_22
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_3a} :catch_3b

    goto :goto_23

    .line 89
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v4    # "v":Ljava/util/List;
    :catch_3b
    move-exception v5

    goto :goto_23
.end method
