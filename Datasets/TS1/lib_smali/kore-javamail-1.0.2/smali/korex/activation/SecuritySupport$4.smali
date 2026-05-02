.class final Lkorex/activation/SecuritySupport$4;
.super Ljava/lang/Object;
.source "SecuritySupport.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkorex/activation/SecuritySupport;->getSystemResources(Ljava/lang/String;)[Ljava/net/URL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 97
    iput-object p1, p0, Lkorex/activation/SecuritySupport$4;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 7

    .prologue
    .line 99
    const/4 v2, 0x0

    .line 101
    .local v2, "ret":[Ljava/net/URL;
    :try_start_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .local v4, "v":Ljava/util/List;
    iget-object v5, p0, Lkorex/activation/SecuritySupport$4;->val$name:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/ClassLoader;->getSystemResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v1

    .line 103
    .local v1, "e":Ljava/util/Enumeration;
    :cond_c
    :goto_c
    if-eqz v1, :cond_22

    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_22

    .line 104
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/URL;

    .line 105
    .local v3, "url":Ljava/net/URL;
    if-eqz v3, :cond_c

    .line 106
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_c

    .line 112
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v3    # "url":Ljava/net/URL;
    .end local v4    # "v":Ljava/util/List;
    :catch_20
    move-exception v5

    .line 114
    :cond_21
    :goto_21
    return-object v2

    .line 108
    .restart local v1    # "e":Ljava/util/Enumeration;
    .restart local v4    # "v":Ljava/util/List;
    :cond_22
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_21

    .line 109
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v2, v5, [Ljava/net/URL;

    .line 110
    invoke-interface {v4, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/net/URL;

    move-object v0, v5

    check-cast v0, [Ljava/net/URL;

    move-object v2, v0
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_38} :catch_20
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_38} :catch_39

    goto :goto_21

    .line 113
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v4    # "v":Ljava/util/List;
    :catch_39
    move-exception v5

    goto :goto_21
.end method
