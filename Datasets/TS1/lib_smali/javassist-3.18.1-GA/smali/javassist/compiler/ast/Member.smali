.class public Ljavassist/compiler/ast/Member;
.super Ljavassist/compiler/ast/Symbol;
.source "Member.java"


# instance fields
.field private field:Ljavassist/CtField;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/compiler/ast/Member;->field:Ljavassist/CtField;

    .line 33
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
    .line 39
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atMember(Ljavassist/compiler/ast/Member;)V

    return-void
.end method

.method public getField()Ljavassist/CtField;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Ljavassist/compiler/ast/Member;->field:Ljavassist/CtField;

    return-object v0
.end method

.method public setField(Ljavassist/CtField;)V
    .registers 2
    .param p1, "f"    # Ljavassist/CtField;

    .prologue
    .line 35
    iput-object p1, p0, Ljavassist/compiler/ast/Member;->field:Ljavassist/CtField;

    return-void
.end method
