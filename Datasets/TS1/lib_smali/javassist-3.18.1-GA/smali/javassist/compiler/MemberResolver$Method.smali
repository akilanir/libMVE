.class public Ljavassist/compiler/MemberResolver$Method;
.super Ljava/lang/Object;
.source "MemberResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/compiler/MemberResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Method"
.end annotation


# instance fields
.field public declaring:Ljavassist/CtClass;

.field public info:Ljavassist/bytecode/MethodInfo;

.field public notmatch:I


# direct methods
.method public constructor <init>(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;I)V
    .registers 4
    .param p1, "c"    # Ljavassist/CtClass;
    .param p2, "i"    # Ljavassist/bytecode/MethodInfo;
    .param p3, "n"    # I

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Ljavassist/compiler/MemberResolver$Method;->declaring:Ljavassist/CtClass;

    .line 50
    iput-object p2, p0, Ljavassist/compiler/MemberResolver$Method;->info:Ljavassist/bytecode/MethodInfo;

    .line 51
    iput p3, p0, Ljavassist/compiler/MemberResolver$Method;->notmatch:I

    .line 52
    return-void
.end method


# virtual methods
.method public isStatic()Z
    .registers 3

    .prologue
    .line 58
    iget-object v1, p0, Ljavassist/compiler/MemberResolver$Method;->info:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v1}, Ljavassist/bytecode/MethodInfo;->getAccessFlags()I

    move-result v0

    .line 59
    .local v0, "acc":I
    and-int/lit8 v1, v0, 0x8

    if-eqz v1, :cond_c

    const/4 v1, 0x1

    :goto_b
    return v1

    :cond_c
    const/4 v1, 0x0

    goto :goto_b
.end method
