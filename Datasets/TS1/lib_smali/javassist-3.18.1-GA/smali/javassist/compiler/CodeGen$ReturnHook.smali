.class public abstract Ljavassist/compiler/CodeGen$ReturnHook;
.super Ljava/lang/Object;
.source "CodeGen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/compiler/CodeGen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "ReturnHook"
.end annotation


# instance fields
.field next:Ljavassist/compiler/CodeGen$ReturnHook;


# direct methods
.method protected constructor <init>(Ljavassist/compiler/CodeGen;)V
    .registers 3
    .param p1, "gen"    # Ljavassist/compiler/CodeGen;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iget-object v0, p1, Ljavassist/compiler/CodeGen;->returnHooks:Ljavassist/compiler/CodeGen$ReturnHook;

    iput-object v0, p0, Ljavassist/compiler/CodeGen$ReturnHook;->next:Ljavassist/compiler/CodeGen$ReturnHook;

    .line 66
    iput-object p0, p1, Ljavassist/compiler/CodeGen;->returnHooks:Ljavassist/compiler/CodeGen$ReturnHook;

    .line 67
    return-void
.end method


# virtual methods
.method protected abstract doit(Ljavassist/bytecode/Bytecode;I)Z
.end method

.method protected remove(Ljavassist/compiler/CodeGen;)V
    .registers 3
    .param p1, "gen"    # Ljavassist/compiler/CodeGen;

    .prologue
    .line 70
    iget-object v0, p0, Ljavassist/compiler/CodeGen$ReturnHook;->next:Ljavassist/compiler/CodeGen$ReturnHook;

    iput-object v0, p1, Ljavassist/compiler/CodeGen;->returnHooks:Ljavassist/compiler/CodeGen$ReturnHook;

    .line 71
    return-void
.end method
