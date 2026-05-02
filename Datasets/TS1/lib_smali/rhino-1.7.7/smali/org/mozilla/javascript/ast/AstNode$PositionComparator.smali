.class public Lorg/mozilla/javascript/ast/AstNode$PositionComparator;
.super Ljava/lang/Object;
.source "AstNode.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/ast/AstNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PositionComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/mozilla/javascript/ast/AstNode;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 122
    check-cast p1, Lorg/mozilla/javascript/ast/AstNode;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/mozilla/javascript/ast/AstNode;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/ast/AstNode$PositionComparator;->compare(Lorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;)I
    .registers 5
    .param p1, "n1"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p2, "n2"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 131
    iget v0, p1, Lorg/mozilla/javascript/ast/AstNode;->position:I

    iget v1, p2, Lorg/mozilla/javascript/ast/AstNode;->position:I

    sub-int/2addr v0, v1

    return v0
.end method
