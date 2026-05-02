.class final Ljavassist/util/proxy/SecurityActions$2;
.super Ljava/lang/Object;
.source "SecurityActions.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljavassist/util/proxy/SecurityActions;->getDeclaredConstructors(Ljava/lang/Class;)[Ljava/lang/reflect/Constructor;
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
    .line 46
    iput-object p1, p0, Ljavassist/util/proxy/SecurityActions$2;->val$clazz:Ljava/lang/Class;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Ljavassist/util/proxy/SecurityActions$2;->val$clazz:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v0

    return-object v0
.end method
