.class final Ljavassist/util/proxy/SecurityActions$5;
.super Ljava/lang/Object;
.source "SecurityActions.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljavassist/util/proxy/SecurityActions;->setAccessible(Ljava/lang/reflect/AccessibleObject;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$accessible:Z

.field final synthetic val$ao:Ljava/lang/reflect/AccessibleObject;


# direct methods
.method constructor <init>(Ljava/lang/reflect/AccessibleObject;Z)V
    .registers 3

    .prologue
    .line 105
    iput-object p1, p0, Ljavassist/util/proxy/SecurityActions$5;->val$ao:Ljava/lang/reflect/AccessibleObject;

    iput-boolean p2, p0, Ljavassist/util/proxy/SecurityActions$5;->val$accessible:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 107
    iget-object v0, p0, Ljavassist/util/proxy/SecurityActions$5;->val$ao:Ljava/lang/reflect/AccessibleObject;

    iget-boolean v1, p0, Ljavassist/util/proxy/SecurityActions$5;->val$accessible:Z

    invoke-virtual {v0, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 108
    const/4 v0, 0x0

    return-object v0
.end method
