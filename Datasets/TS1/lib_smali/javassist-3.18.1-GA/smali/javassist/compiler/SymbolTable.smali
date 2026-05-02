.class public final Ljavassist/compiler/SymbolTable;
.super Ljava/util/HashMap;
.source "SymbolTable.java"


# instance fields
.field private parent:Ljavassist/compiler/SymbolTable;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 25
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljavassist/compiler/SymbolTable;-><init>(Ljavassist/compiler/SymbolTable;)V

    return-void
.end method

.method public constructor <init>(Ljavassist/compiler/SymbolTable;)V
    .registers 2
    .param p1, "p"    # Ljavassist/compiler/SymbolTable;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 29
    iput-object p1, p0, Ljavassist/compiler/SymbolTable;->parent:Ljavassist/compiler/SymbolTable;

    .line 30
    return-void
.end method


# virtual methods
.method public append(Ljava/lang/String;Ljavassist/compiler/ast/Declarator;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljavassist/compiler/ast/Declarator;

    .prologue
    .line 43
    invoke-virtual {p0, p1, p2}, Ljavassist/compiler/SymbolTable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    return-void
.end method

.method public getParent()Ljavassist/compiler/SymbolTable;
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Ljavassist/compiler/SymbolTable;->parent:Ljavassist/compiler/SymbolTable;

    return-object v0
.end method

.method public lookup(Ljava/lang/String;)Ljavassist/compiler/ast/Declarator;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-virtual {p0, p1}, Ljavassist/compiler/SymbolTable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/Declarator;

    .line 36
    .local v0, "found":Ljavassist/compiler/ast/Declarator;
    if-nez v0, :cond_12

    iget-object v1, p0, Ljavassist/compiler/SymbolTable;->parent:Ljavassist/compiler/SymbolTable;

    if-eqz v1, :cond_12

    .line 37
    iget-object v1, p0, Ljavassist/compiler/SymbolTable;->parent:Ljavassist/compiler/SymbolTable;

    invoke-virtual {v1, p1}, Ljavassist/compiler/SymbolTable;->lookup(Ljava/lang/String;)Ljavassist/compiler/ast/Declarator;

    move-result-object v0

    .line 39
    .end local v0    # "found":Ljavassist/compiler/ast/Declarator;
    :cond_12
    return-object v0
.end method
