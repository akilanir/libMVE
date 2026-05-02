.class final Lfreemarker/template/utility/SecurityUtilities$2;
.super Ljava/lang/Object;
.source "SecurityUtilities.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# instance fields
.field private final val$defValue:Ljava/lang/String;

.field private final val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/template/utility/SecurityUtilities$2;->val$key:Ljava/lang/String;

    iput-object p2, p0, Lfreemarker/template/utility/SecurityUtilities$2;->val$defValue:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 92
    iget-object v0, p0, Lfreemarker/template/utility/SecurityUtilities$2;->val$key:Ljava/lang/String;

    iget-object v1, p0, Lfreemarker/template/utility/SecurityUtilities$2;->val$defValue:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
