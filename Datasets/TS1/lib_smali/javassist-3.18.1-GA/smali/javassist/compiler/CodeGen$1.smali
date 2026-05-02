.class Ljavassist/compiler/CodeGen$1;
.super Ljavassist/compiler/CodeGen$ReturnHook;
.source "CodeGen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljavassist/compiler/CodeGen;->atSyncStmnt(Ljavassist/compiler/ast/Stmnt;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljavassist/compiler/CodeGen;

.field final synthetic val$var:I


# direct methods
.method constructor <init>(Ljavassist/compiler/CodeGen;Ljavassist/compiler/CodeGen;I)V
    .registers 4
    .param p2, "x0"    # Ljavassist/compiler/CodeGen;

    .prologue
    .line 657
    iput-object p1, p0, Ljavassist/compiler/CodeGen$1;->this$0:Ljavassist/compiler/CodeGen;

    iput p3, p0, Ljavassist/compiler/CodeGen$1;->val$var:I

    invoke-direct {p0, p2}, Ljavassist/compiler/CodeGen$ReturnHook;-><init>(Ljavassist/compiler/CodeGen;)V

    return-void
.end method


# virtual methods
.method protected doit(Ljavassist/bytecode/Bytecode;I)Z
    .registers 4
    .param p1, "b"    # Ljavassist/bytecode/Bytecode;
    .param p2, "opcode"    # I

    .prologue
    .line 659
    iget v0, p0, Ljavassist/compiler/CodeGen$1;->val$var:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 660
    const/16 v0, 0xc3

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 661
    const/4 v0, 0x0

    return v0
.end method
