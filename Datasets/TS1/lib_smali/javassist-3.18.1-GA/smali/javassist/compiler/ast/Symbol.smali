.class public Ljavassist/compiler/ast/Symbol;
.super Ljavassist/compiler/ast/ASTree;
.source "Symbol.java"


# instance fields
.field protected identifier:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "sym"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-direct {p0}, Ljavassist/compiler/ast/ASTree;-><init>()V

    .line 28
    iput-object p1, p0, Ljavassist/compiler/ast/Symbol;->identifier:Ljava/lang/String;

    .line 29
    return-void
.end method


# virtual methods
.method public accept(Ljavassist/compiler/ast/Visitor;)V
    .registers 2
    .param p1, "v"    # Ljavassist/compiler/ast/Visitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 35
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atSymbol(Ljavassist/compiler/ast/Symbol;)V

    return-void
.end method

.method public get()Ljava/lang/String;
    .registers 2

    .prologue
    .line 31
    iget-object v0, p0, Ljavassist/compiler/ast/Symbol;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 33
    iget-object v0, p0, Ljavassist/compiler/ast/Symbol;->identifier:Ljava/lang/String;

    return-object v0
.end method
