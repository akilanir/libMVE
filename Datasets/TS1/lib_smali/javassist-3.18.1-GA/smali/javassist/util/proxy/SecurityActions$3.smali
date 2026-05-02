.class final Ljavassist/util/proxy/SecurityActions$3;
.super Ljava/lang/Object;
.source "SecurityActions.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljavassist/util/proxy/SecurityActions;->getDeclaredMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$clazz:Ljava/lang/Class;

.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$types:[Ljava/lang/Class;


# direct methods
.method constructor <init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)V
    .registers 4

    .prologue
    .line 61
    iput-object p1, p0, Ljavassist/util/proxy/SecurityActions$3;->val$clazz:Ljava/lang/Class;

    iput-object p2, p0, Ljavassist/util/proxy/SecurityActions$3;->val$name:Ljava/lang/String;

    iput-object p3, p0, Ljavassist/util/proxy/SecurityActions$3;->val$types:[Ljava/lang/Class;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Ljavassist/util/proxy/SecurityActions$3;->val$clazz:Ljava/lang/Class;

    iget-object v1, p0, Ljavassist/util/proxy/SecurityActions$3;->val$name:Ljava/lang/String;

    iget-object v2, p0, Ljavassist/util/proxy/SecurityActions$3;->val$types:[Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method
