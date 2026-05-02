.class public Ljavassist/bytecode/analysis/Subroutine;
.super Ljava/lang/Object;
.source "Subroutine.java"


# instance fields
.field private access:Ljava/util/Set;

.field private callers:Ljava/util/List;

.field private start:I


# direct methods
.method public constructor <init>(II)V
    .registers 5
    .param p1, "start"    # I
    .param p2, "caller"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/analysis/Subroutine;->callers:Ljava/util/List;

    .line 32
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/analysis/Subroutine;->access:Ljava/util/Set;

    .line 36
    iput p1, p0, Ljavassist/bytecode/analysis/Subroutine;->start:I

    .line 37
    iget-object v0, p0, Ljavassist/bytecode/analysis/Subroutine;->callers:Ljava/util/List;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p2}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    return-void
.end method


# virtual methods
.method public access(I)V
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 49
    iget-object v0, p0, Ljavassist/bytecode/analysis/Subroutine;->access:Ljava/util/Set;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 50
    return-void
.end method

.method public accessed()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Ljavassist/bytecode/analysis/Subroutine;->access:Ljava/util/Set;

    return-object v0
.end method

.method public addCaller(I)V
    .registers 4
    .param p1, "caller"    # I

    .prologue
    .line 41
    iget-object v0, p0, Ljavassist/bytecode/analysis/Subroutine;->callers:Ljava/util/List;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    return-void
.end method

.method public callers()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Ljavassist/bytecode/analysis/Subroutine;->callers:Ljava/util/List;

    return-object v0
.end method

.method public isAccessed(I)Z
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 53
    iget-object v0, p0, Ljavassist/bytecode/analysis/Subroutine;->access:Ljava/util/Set;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public start()I
    .registers 2

    .prologue
    .line 45
    iget v0, p0, Ljavassist/bytecode/analysis/Subroutine;->start:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "start = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ljavassist/bytecode/analysis/Subroutine;->start:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " callers = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ljavassist/bytecode/analysis/Subroutine;->callers:Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
