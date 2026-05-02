.class public Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;
.super Ljava/lang/Object;
.source "BootstrapMethodsAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/BootstrapMethodsAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BootstrapMethod"
.end annotation


# instance fields
.field public arguments:[I

.field public methodRef:I


# direct methods
.method public constructor <init>(I[I)V
    .registers 3
    .param p1, "method"    # I
    .param p2, "args"    # [I

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput p1, p0, Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;->methodRef:I

    .line 25
    iput-object p2, p0, Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;->arguments:[I

    .line 26
    return-void
.end method
