.class final Ljavassist/util/proxy/SecurityActions$1;
.super Ljava/lang/Object;
.source "SecurityActions.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljavassist/util/proxy/SecurityActions;->getDeclaredMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$clazz:Ljava/lang/Class;


# direct methods
.method constructor <init>(Ljava/lang/Class;)V
    .registers 2

    .prologue
    .line 33
    iput-object p1, p0, Ljavassist/util/proxy/SecurityActions$1;->val$clazz:Ljava/lang/Class;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Ljavassist/util/proxy/SecurityActions$1;->val$clazz:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method
