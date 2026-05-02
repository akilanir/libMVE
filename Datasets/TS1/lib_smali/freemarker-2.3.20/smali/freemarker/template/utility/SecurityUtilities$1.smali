.class final Lfreemarker/template/utility/SecurityUtilities$1;
.super Ljava/lang/Object;
.source "SecurityUtilities.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# instance fields
.field private final val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/template/utility/SecurityUtilities$1;->val$key:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lfreemarker/template/utility/SecurityUtilities$1;->val$key:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
