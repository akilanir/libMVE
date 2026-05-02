.class public abstract Lorg/mozilla/javascript/ast/AstNode;
.super Lorg/mozilla/javascript/Node;
.source "AstNode.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/ast/AstNode$DebugPrintVisitor;,
        Lorg/mozilla/javascript/ast/AstNode$PositionComparator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/mozilla/javascript/Node;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/mozilla/javascript/ast/AstNode;",
        ">;"
    }
.end annotation


# static fields
.field private static operatorNames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected length:I

.field protected parent:Lorg/mozilla/javascript/ast/AstNode;

.field protected position:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 70
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    .line 74
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x34

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "in"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "typeof"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x35

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "instanceof"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x1f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "delete"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x59

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ","

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x67

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ":"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x68

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "||"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x69

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "&&"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x6a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "++"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x6b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "--"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "|"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "^"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "&"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "=="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0xd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "!="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0xe

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "<"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ">"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0xf

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "<="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x11

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ">="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "<<"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x13

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ">>"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x14

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ">>>"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x15

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "+"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x16

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "-"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x17

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "*"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x18

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "/"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x19

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "%"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x1a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "!"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x1b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "~"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x1c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "+"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x1d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "-"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x2e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "==="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x2f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "!=="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x5a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x5b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "|="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x5d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "&="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x5e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "<<="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x5f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ">>="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x60

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ">>>="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x61

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "+="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x62

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "-="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x63

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "*="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x64

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "/="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x65

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "%="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x5c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "^="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    sget-object v0, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x7e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "void"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, -0x1

    .line 136
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 66
    iput v0, p0, Lorg/mozilla/javascript/ast/AstNode;->position:I

    .line 67
    const/4 v0, 0x1

    iput v0, p0, Lorg/mozilla/javascript/ast/AstNode;->length:I

    .line 137
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "pos"    # I

    .prologue
    .line 144
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/AstNode;-><init>()V

    .line 145
    iput p1, p0, Lorg/mozilla/javascript/ast/AstNode;->position:I

    .line 146
    return-void
.end method

.method public constructor <init>(II)V
    .registers 3
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 155
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/AstNode;-><init>()V

    .line 156
    iput p1, p0, Lorg/mozilla/javascript/ast/AstNode;->position:I

    .line 157
    iput p2, p0, Lorg/mozilla/javascript/ast/AstNode;->length:I

    .line 158
    return-void
.end method

.method public static codeBug()Ljava/lang/RuntimeException;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 470
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static operatorToString(I)Ljava/lang/String;
    .registers 5
    .param p0, "op"    # I

    .prologue
    .line 331
    sget-object v1, Lorg/mozilla/javascript/ast/AstNode;->operatorNames:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 332
    .local v0, "result":Ljava/lang/String;
    if-nez v0, :cond_27

    .line 333
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid operator: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 334
    :cond_27
    return-object v0
.end method


# virtual methods
.method public addChild(Lorg/mozilla/javascript/ast/AstNode;)V
    .registers 5
    .param p1, "kid"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 260
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;->assertNotNull(Ljava/lang/Object;)V

    .line 261
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v1

    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getLength()I

    move-result v2

    add-int v0, v1, v2

    .line 262
    .local v0, "end":I
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v1

    sub-int v1, v0, v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/ast/AstNode;->setLength(I)V

    .line 263
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 264
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/AstNode;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 265
    return-void
.end method

.method protected assertNotNull(Ljava/lang/Object;)V
    .registers 4
    .param p1, "arg"    # Ljava/lang/Object;

    .prologue
    .line 441
    if-nez p1, :cond_a

    .line 442
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "arg cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 443
    :cond_a
    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 64
    check-cast p1, Lorg/mozilla/javascript/ast/AstNode;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;->compareTo(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/mozilla/javascript/ast/AstNode;)I
    .registers 9
    .param p1, "other"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    const/4 v5, 0x1

    const/4 v4, -0x1

    .line 525
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    const/4 v4, 0x0

    .line 534
    :cond_9
    :goto_9
    return v4

    .line 526
    :cond_a
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/AstNode;->getAbsolutePosition()I

    move-result v0

    .line 527
    .local v0, "abs1":I
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getAbsolutePosition()I

    move-result v1

    .line 528
    .local v1, "abs2":I
    if-lt v0, v1, :cond_9

    .line 529
    if-ge v1, v0, :cond_18

    move v4, v5

    goto :goto_9

    .line 530
    :cond_18
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/AstNode;->getLength()I

    move-result v2

    .line 531
    .local v2, "len1":I
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getLength()I

    move-result v3

    .line 532
    .local v3, "len2":I
    if-lt v2, v3, :cond_9

    .line 533
    if-ge v3, v2, :cond_26

    move v4, v5

    goto :goto_9

    .line 534
    :cond_26
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v4

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v5

    sub-int/2addr v4, v5

    goto :goto_9
.end method

.method public debugPrint()Ljava/lang/String;
    .registers 4

    .prologue
    .line 600
    new-instance v0, Lorg/mozilla/javascript/ast/AstNode$DebugPrintVisitor;

    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x3e8

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/ast/AstNode$DebugPrintVisitor;-><init>(Ljava/lang/StringBuilder;)V

    .line 601
    .local v0, "dpv":Lorg/mozilla/javascript/ast/AstNode$DebugPrintVisitor;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 602
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode$DebugPrintVisitor;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public depth()I
    .registers 2

    .prologue
    .line 543
    iget-object v0, p0, Lorg/mozilla/javascript/ast/AstNode;->parent:Lorg/mozilla/javascript/ast/AstNode;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/mozilla/javascript/ast/AstNode;->parent:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode;->depth()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_5
.end method

.method public getAbsolutePosition()I
    .registers 4

    .prologue
    .line 180
    iget v1, p0, Lorg/mozilla/javascript/ast/AstNode;->position:I

    .line 181
    .local v1, "pos":I
    iget-object v0, p0, Lorg/mozilla/javascript/ast/AstNode;->parent:Lorg/mozilla/javascript/ast/AstNode;

    .line 182
    .local v0, "parent":Lorg/mozilla/javascript/ast/AstNode;
    :goto_4
    if-eqz v0, :cond_10

    .line 183
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v2

    add-int/2addr v1, v2

    .line 184
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode;->getParent()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    goto :goto_4

    .line 186
    :cond_10
    return v1
.end method

.method public getAstRoot()Lorg/mozilla/javascript/ast/AstRoot;
    .registers 3

    .prologue
    .line 273
    move-object v0, p0

    .line 274
    .local v0, "parent":Lorg/mozilla/javascript/ast/AstNode;
    :goto_1
    if-eqz v0, :cond_c

    instance-of v1, v0, Lorg/mozilla/javascript/ast/AstRoot;

    if-nez v1, :cond_c

    .line 275
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode;->getParent()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    goto :goto_1

    .line 277
    :cond_c
    check-cast v0, Lorg/mozilla/javascript/ast/AstRoot;

    .end local v0    # "parent":Lorg/mozilla/javascript/ast/AstNode;
    return-object v0
.end method

.method public getEnclosingFunction()Lorg/mozilla/javascript/ast/FunctionNode;
    .registers 3

    .prologue
    .line 491
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/AstNode;->getParent()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .line 492
    .local v0, "parent":Lorg/mozilla/javascript/ast/AstNode;
    :goto_4
    if-eqz v0, :cond_f

    instance-of v1, v0, Lorg/mozilla/javascript/ast/FunctionNode;

    if-nez v1, :cond_f

    .line 493
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode;->getParent()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    goto :goto_4

    .line 495
    :cond_f
    check-cast v0, Lorg/mozilla/javascript/ast/FunctionNode;

    .end local v0    # "parent":Lorg/mozilla/javascript/ast/AstNode;
    return-object v0
.end method

.method public getEnclosingScope()Lorg/mozilla/javascript/ast/Scope;
    .registers 3

    .prologue
    .line 506
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/AstNode;->getParent()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .line 507
    .local v0, "parent":Lorg/mozilla/javascript/ast/AstNode;
    :goto_4
    if-eqz v0, :cond_f

    instance-of v1, v0, Lorg/mozilla/javascript/ast/Scope;

    if-nez v1, :cond_f

    .line 508
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode;->getParent()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    goto :goto_4

    .line 510
    :cond_f
    check-cast v0, Lorg/mozilla/javascript/ast/Scope;

    .end local v0    # "parent":Lorg/mozilla/javascript/ast/AstNode;
    return-object v0
.end method

.method public getLength()I
    .registers 2

    .prologue
    .line 193
    iget v0, p0, Lorg/mozilla/javascript/ast/AstNode;->length:I

    return v0
.end method

.method public getLineno()I
    .registers 3

    .prologue
    const/4 v0, -0x1

    .line 586
    iget v1, p0, Lorg/mozilla/javascript/ast/AstNode;->lineno:I

    if-eq v1, v0, :cond_8

    .line 587
    iget v0, p0, Lorg/mozilla/javascript/ast/AstNode;->lineno:I

    .line 590
    :cond_7
    :goto_7
    return v0

    .line 588
    :cond_8
    iget-object v1, p0, Lorg/mozilla/javascript/ast/AstNode;->parent:Lorg/mozilla/javascript/ast/AstNode;

    if-eqz v1, :cond_7

    .line 589
    iget-object v0, p0, Lorg/mozilla/javascript/ast/AstNode;->parent:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode;->getLineno()I

    move-result v0

    goto :goto_7
.end method

.method public getParent()Lorg/mozilla/javascript/ast/AstNode;
    .registers 2

    .prologue
    .line 227
    iget-object v0, p0, Lorg/mozilla/javascript/ast/AstNode;->parent:Lorg/mozilla/javascript/ast/AstNode;

    return-object v0
.end method

.method public getPosition()I
    .registers 2

    .prologue
    .line 164
    iget v0, p0, Lorg/mozilla/javascript/ast/AstNode;->position:I

    return v0
.end method

.method public hasSideEffects()Z
    .registers 2

    .prologue
    .line 360
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/AstNode;->getType()I

    move-result v0

    packed-switch v0, :pswitch_data_c

    .line 431
    :pswitch_7
    const/4 v0, 0x0

    :goto_8
    return v0

    .line 428
    :pswitch_9
    const/4 v0, 0x1

    goto :goto_8

    .line 360
    nop

    :pswitch_data_c
    .packed-switch -0x1
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
    .end packed-switch
.end method

.method public makeIndent(I)Ljava/lang/String;
    .registers 5
    .param p1, "indent"    # I

    .prologue
    .line 308
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 309
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    if-ge v0, p1, :cond_10

    .line 310
    const-string v2, "  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 312
    :cond_10
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method protected printList(Ljava/util/List;Ljava/lang/StringBuilder;)V
    .registers 9
    .param p2, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/mozilla/javascript/ast/AstNode;",
            ">(",
            "Ljava/util/List",
            "<TT;>;",
            "Ljava/lang/StringBuilder;",
            ")V"
        }
    .end annotation

    .prologue
    .line 452
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    .line 453
    .local v4, "max":I
    const/4 v0, 0x0

    .line 454
    .local v0, "count":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_34

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/mozilla/javascript/ast/AstNode;

    .line 455
    .local v3, "item":Lorg/mozilla/javascript/ast/AstNode;
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 456
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "count":I
    .local v1, "count":I
    add-int/lit8 v5, v4, -0x1

    if-ge v0, v5, :cond_2a

    .line 457
    const-string v5, ", "

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_28
    :goto_28
    move v0, v1

    .line 461
    .end local v1    # "count":I
    .restart local v0    # "count":I
    goto :goto_9

    .line 458
    .end local v0    # "count":I
    .restart local v1    # "count":I
    :cond_2a
    instance-of v5, v3, Lorg/mozilla/javascript/ast/EmptyExpression;

    if-eqz v5, :cond_28

    .line 459
    const-string v5, ","

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 462
    .end local v1    # "count":I
    .end local v3    # "item":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v0    # "count":I
    :cond_34
    return-void
.end method

.method public setBounds(II)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "end"    # I

    .prologue
    .line 208
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;->setPosition(I)V

    .line 209
    sub-int v0, p2, p1

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/AstNode;->setLength(I)V

    .line 210
    return-void
.end method

.method public setLength(I)V
    .registers 2
    .param p1, "length"    # I

    .prologue
    .line 200
    iput p1, p0, Lorg/mozilla/javascript/ast/AstNode;->length:I

    .line 201
    return-void
.end method

.method public setParent(Lorg/mozilla/javascript/ast/AstNode;)V
    .registers 3
    .param p1, "parent"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 236
    iget-object v0, p0, Lorg/mozilla/javascript/ast/AstNode;->parent:Lorg/mozilla/javascript/ast/AstNode;

    if-ne p1, v0, :cond_5

    .line 249
    :cond_4
    :goto_4
    return-void

    .line 241
    :cond_5
    iget-object v0, p0, Lorg/mozilla/javascript/ast/AstNode;->parent:Lorg/mozilla/javascript/ast/AstNode;

    if-eqz v0, :cond_13

    .line 242
    iget-object v0, p0, Lorg/mozilla/javascript/ast/AstNode;->parent:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v0

    neg-int v0, v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/AstNode;->setRelative(I)V

    .line 245
    :cond_13
    iput-object p1, p0, Lorg/mozilla/javascript/ast/AstNode;->parent:Lorg/mozilla/javascript/ast/AstNode;

    .line 246
    if-eqz p1, :cond_4

    .line 247
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/AstNode;->setRelative(I)V

    goto :goto_4
.end method

.method public setPosition(I)V
    .registers 2
    .param p1, "position"    # I

    .prologue
    .line 171
    iput p1, p0, Lorg/mozilla/javascript/ast/AstNode;->position:I

    .line 172
    return-void
.end method

.method public setRelative(I)V
    .registers 3
    .param p1, "parentPosition"    # I

    .prologue
    .line 220
    iget v0, p0, Lorg/mozilla/javascript/ast/AstNode;->position:I

    sub-int/2addr v0, p1

    iput v0, p0, Lorg/mozilla/javascript/ast/AstNode;->position:I

    .line 221
    return-void
.end method

.method public shortName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 320
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 321
    .local v0, "classname":Ljava/lang/String;
    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 322
    .local v1, "last":I
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public toSource()Ljava/lang/String;
    .registers 2

    .prologue
    .line 300
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract toSource(I)Ljava/lang/String;
.end method

.method public abstract visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
.end method
