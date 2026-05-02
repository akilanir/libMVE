.class final Ljavassist/util/proxy/SecurityActions$6;
.super Ljava/lang/Object;
.source "SecurityActions.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljavassist/util/proxy/SecurityActions;->set(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$fld:Ljava/lang/reflect/Field;

.field final synthetic val$target:Ljava/lang/Object;

.field final synthetic val$value:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .prologue
    .line 121
    iput-object p1, p0, Ljavassist/util/proxy/SecurityActions$6;->val$fld:Ljava/lang/reflect/Field;

    iput-object p2, p0, Ljavassist/util/proxy/SecurityActions$6;->val$target:Ljava/lang/Object;

    iput-object p3, p0, Ljavassist/util/proxy/SecurityActions$6;->val$value:Ljava/lang/Object;

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
    .line 123
    iget-object v0, p0, Ljavassist/util/proxy/SecurityActions$6;->val$fld:Ljava/lang/reflect/Field;

    iget-object v1, p0, Ljavassist/util/proxy/SecurityActions$6;->val$target:Ljava/lang/Object;

    iget-object v2, p0, Ljavassist/util/proxy/SecurityActions$6;->val$value:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 124
    const/4 v0, 0x0

    return-object v0
.end method
