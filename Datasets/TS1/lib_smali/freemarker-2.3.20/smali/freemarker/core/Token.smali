.class Lfreemarker/core/Token;
.super Ljava/lang/Object;
.source "Token.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public beginColumn:I

.field public beginLine:I

.field public endColumn:I

.field public endLine:I

.field public image:Ljava/lang/String;

.field public kind:I

.field public next:Lfreemarker/core/Token;

.field public specialToken:Lfreemarker/core/Token;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final newToken(I)Lfreemarker/core/Token;
    .registers 2
    .param p0, "ofKind"    # I

    .prologue
    .line 75
    .line 77
    new-instance v0, Lfreemarker/core/Token;

    invoke-direct {v0}, Lfreemarker/core/Token;-><init>()V

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lfreemarker/core/Token;->image:Ljava/lang/String;

    return-object v0
.end method
