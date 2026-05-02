.class final Lcom/google/common/reflect/Types$TypeVariableImpl;
.super Ljava/lang/Object;
.source "Types.java"

# interfaces
.implements Ljava/lang/reflect/TypeVariable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/reflect/Types;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TypeVariableImpl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D::",
        "Ljava/lang/reflect/GenericDeclaration;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/reflect/TypeVariable",
        "<TD;>;"
    }
.end annotation


# instance fields
.field private final bounds:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation
.end field

.field private final genericDeclaration:Ljava/lang/reflect/GenericDeclaration;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TD;"
        }
    .end annotation
.end field

.field private final name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/reflect/GenericDeclaration;Ljava/lang/String;[Ljava/lang/reflect/Type;)V
    .registers 5
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "bounds"    # [Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/reflect/Type;",
            ")V"
        }
    .end annotation

    .prologue
    .line 324
    .local p0, "this":Lcom/google/common/reflect/Types$TypeVariableImpl;, "Lcom/google/common/reflect/Types$TypeVariableImpl<TD;>;"
    .local p1, "genericDeclaration":Ljava/lang/reflect/GenericDeclaration;, "TD;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 325
    const-string v0, "bound for type variable"

    # invokes: Lcom/google/common/reflect/Types;->disallowPrimitiveType([Ljava/lang/reflect/Type;Ljava/lang/String;)V
    invoke-static {p3, v0}, Lcom/google/common/reflect/Types;->access$200([Ljava/lang/reflect/Type;Ljava/lang/String;)V

    .line 326
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/GenericDeclaration;

    iput-object v0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->genericDeclaration:Ljava/lang/reflect/GenericDeclaration;

    .line 327
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->name:Ljava/lang/String;

    .line 328
    invoke-static {p3}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->bounds:Lcom/google/common/collect/ImmutableList;

    .line 329
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/google/common/reflect/Types$TypeVariableImpl;, "Lcom/google/common/reflect/Types$TypeVariableImpl<TD;>;"
    const/4 v1, 0x0

    .line 352
    instance-of v2, p1, Ljava/lang/reflect/TypeVariable;

    if-eqz v2, :cond_21

    move-object v0, p1

    .line 353
    check-cast v0, Ljava/lang/reflect/TypeVariable;

    .line 354
    .local v0, "that":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    iget-object v2, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->name:Ljava/lang/String;

    invoke-interface {v0}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    iget-object v2, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->genericDeclaration:Ljava/lang/reflect/GenericDeclaration;

    invoke-interface {v0}, Ljava/lang/reflect/TypeVariable;->getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    const/4 v1, 0x1

    .line 357
    .end local v0    # "that":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :cond_21
    return v1
.end method

.method public getBounds()[Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    .line 332
    .local p0, "this":Lcom/google/common/reflect/Types$TypeVariableImpl;, "Lcom/google/common/reflect/Types$TypeVariableImpl<TD;>;"
    iget-object v0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->bounds:Lcom/google/common/collect/ImmutableList;

    # invokes: Lcom/google/common/reflect/Types;->toArray(Ljava/util/Collection;)[Ljava/lang/reflect/Type;
    invoke-static {v0}, Lcom/google/common/reflect/Types;->access$300(Ljava/util/Collection;)[Ljava/lang/reflect/Type;

    move-result-object v0

    return-object v0
.end method

.method public getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TD;"
        }
    .end annotation

    .prologue
    .line 336
    .local p0, "this":Lcom/google/common/reflect/Types$TypeVariableImpl;, "Lcom/google/common/reflect/Types$TypeVariableImpl<TD;>;"
    iget-object v0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->genericDeclaration:Ljava/lang/reflect/GenericDeclaration;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 340
    .local p0, "this":Lcom/google/common/reflect/Types$TypeVariableImpl;, "Lcom/google/common/reflect/Types$TypeVariableImpl<TD;>;"
    iget-object v0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 348
    .local p0, "this":Lcom/google/common/reflect/Types$TypeVariableImpl;, "Lcom/google/common/reflect/Types$TypeVariableImpl<TD;>;"
    iget-object v0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->genericDeclaration:Ljava/lang/reflect/GenericDeclaration;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 344
    .local p0, "this":Lcom/google/common/reflect/Types$TypeVariableImpl;, "Lcom/google/common/reflect/Types$TypeVariableImpl<TD;>;"
    iget-object v0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->name:Ljava/lang/String;

    return-object v0
.end method
