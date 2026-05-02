.class final Lkorex/mail/Session$5;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkorex/mail/Session;->getResources(Ljava/lang/ClassLoader;Ljava/lang/String;)[Ljava/net/URL;
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
    .line 1234
    iput-object p1, p0, Lkorex/mail/Session$5;->val$cl:Ljava/lang/ClassLoader;

    iput-object p2, p0, Lkorex/mail/Session$5;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 7

    .prologue
    .line 1236
    const/4 v1, 0x0

    .line 1238
    .local v1, "ret":[Ljava/net/URL;
    :try_start_1
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    .line 1239
    .local v3, "v":Ljava/util/Vector;
    iget-object v4, p0, Lkorex/mail/Session$5;->val$cl:Ljava/lang/ClassLoader;

    iget-object v5, p0, Lkorex/mail/Session$5;->val$name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    .line 1240
    .local v0, "e":Ljava/util/Enumeration;
    :cond_e
    :goto_e
    if-eqz v0, :cond_24

    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_24

    .line 1241
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/URL;

    .line 1242
    .local v2, "url":Ljava/net/URL;
    if-eqz v2, :cond_e

    .line 1243
    invoke-virtual {v3, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_e

    .line 1249
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v2    # "url":Ljava/net/URL;
    .end local v3    # "v":Ljava/util/Vector;
    :catch_22
    move-exception v4

    .line 1251
    :cond_23
    :goto_23
    return-object v1

    .line 1245
    .restart local v0    # "e":Ljava/util/Enumeration;
    .restart local v3    # "v":Ljava/util/Vector;
    :cond_24
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    if-lez v4, :cond_23

    .line 1246
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    new-array v1, v4, [Ljava/net/URL;

    .line 1247
    invoke-virtual {v3, v1}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_33} :catch_22
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_33} :catch_34

    goto :goto_23

    .line 1250
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v3    # "v":Ljava/util/Vector;
    :catch_34
    move-exception v4

    goto :goto_23
.end method
