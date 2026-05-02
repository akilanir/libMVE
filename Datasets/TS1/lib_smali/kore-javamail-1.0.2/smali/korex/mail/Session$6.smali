.class final Lkorex/mail/Session$6;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkorex/mail/Session;->getSystemResources(Ljava/lang/String;)[Ljava/net/URL;
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
    .line 1258
    iput-object p1, p0, Lkorex/mail/Session$6;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 6

    .prologue
    .line 1260
    const/4 v1, 0x0

    .line 1262
    .local v1, "ret":[Ljava/net/URL;
    :try_start_1
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    .line 1263
    .local v3, "v":Ljava/util/Vector;
    iget-object v4, p0, Lkorex/mail/Session$6;->val$name:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/ClassLoader;->getSystemResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    .line 1264
    .local v0, "e":Ljava/util/Enumeration;
    :cond_c
    :goto_c
    if-eqz v0, :cond_22

    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_22

    .line 1265
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/URL;

    .line 1266
    .local v2, "url":Ljava/net/URL;
    if-eqz v2, :cond_c

    .line 1267
    invoke-virtual {v3, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_c

    .line 1273
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v2    # "url":Ljava/net/URL;
    .end local v3    # "v":Ljava/util/Vector;
    :catch_20
    move-exception v4

    .line 1275
    :cond_21
    :goto_21
    return-object v1

    .line 1269
    .restart local v0    # "e":Ljava/util/Enumeration;
    .restart local v3    # "v":Ljava/util/Vector;
    :cond_22
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    if-lez v4, :cond_21

    .line 1270
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    new-array v1, v4, [Ljava/net/URL;

    .line 1271
    invoke-virtual {v3, v1}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_31} :catch_20
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_31} :catch_32

    goto :goto_21

    .line 1274
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v3    # "v":Ljava/util/Vector;
    :catch_32
    move-exception v4

    goto :goto_21
.end method
