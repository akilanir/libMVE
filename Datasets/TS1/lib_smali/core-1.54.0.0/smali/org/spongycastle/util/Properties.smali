.class public Lorg/spongycastle/util/Properties;
.super Ljava/lang/Object;
.source "Properties.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isOverrideSet(Ljava/lang/String;)Z
    .registers 4
    .param p0, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 16
    :try_start_0
    const-string v1, "true"

    new-instance v2, Lorg/spongycastle/util/Properties$1;

    invoke-direct {v2, p0}, Lorg/spongycastle/util/Properties$1;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_e
    .catch Ljava/security/AccessControlException; {:try_start_0 .. :try_end_e} :catch_10

    move-result v1

    .line 33
    :goto_f
    return v1

    .line 31
    :catch_10
    move-exception v0

    .line 33
    .local v0, "e":Ljava/security/AccessControlException;
    const/4 v1, 0x0

    goto :goto_f
.end method
